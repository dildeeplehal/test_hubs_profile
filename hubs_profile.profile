<?php


/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function hubs_profile_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = 'ExpressWeb';

  // Set the default country to be the UK.
  $form['server_settings']['site_default_country']['#default_value'] = 'GB';

  if (defined('SITE_ENVIRONMENT') && SITE_ENVIRONMENT == 'DEV') {
    $form['site_information']['site_mail']['#default_value']    = 'admin@example.com';
    $form['admin_account']['account']['name']['#default_value'] = 'admin';
    $form['admin_account']['account']['mail']['#default_value'] = 'admin@example.com';
    $form['admin_account']['account']['pass'] = array(
      '#type' => 'value',
      '#value' => 'admin'
    );
    $form['update_notifications']['update_status_module']['#default_value'] = array(0, 0);
  }
}

/**
 * Implements hook_install_tasks().
 */
function hubs_profile_install_tasks() {
  $tasks = array();

  $tasks['hubs_profile_misc_task'] = array(
    'display_name' => st('Misc Install Tasks'),
    'type' => 'batch',
  );

  return $tasks;
}

/**
 * Our only 'install task' per se - this runs all install_tasks
 * in a batch process.
 *
 * @return array
 */
function hubs_profile_misc_task() {

  $tasks_path = dirname(__FILE__) . '/install_tasks';

  $operations = hubs_profile_platform_batch_operations($tasks_path);

  $batch = array(
    'title' => st('Configuring site'),
    'operations' => $operations,
    'error_message' => st('The installation has encountered an error.'),
  );

  return $batch;
}

/**
 * Searches a path for all install profile tasks and converts these into
 * a Batch API operations array.
 *
 * This function searches inside the PHP code of each discovered task and
 * attempts to discover the task callback and Batch API message.
 *
 * NOTE: The concept of extracting metadata directly from task files is experimental.
 *       It may well be this isn't a scalable endevour.
 */
function hubs_profile_platform_batch_operations($tasks_path) {
  $operations = array();

  foreach (glob($tasks_path . '/*.inc') as $file) {
    $contents = file_get_contents($file);

    // Find first function name, assume this is the callback
    $matches = array();
    preg_match('/function[\s]+([A-Za-z0-9_]+)\(/', $contents, $matches);
    $callback = (isset($matches[1]) && strlen($matches[1]) > 0) ? $matches[1] : FALSE;

    // Find DOxygen @file description, assume this is the task title
    $matches = array();
    preg_match('/\/\*\*[\s]+\*[\s]+\@file[\s]+([A-Za-z0-9-_\.]+)[\s]+\*[\s]+([^\r\n]+)/m', $contents, $matches);
    $message = (isset($matches[2]) && strlen($matches[2]) > 0) ? $matches[2] : NULL;

    if ($callback) {
      $operations[] = array(
        'hubs_profile_platform_batch_delegator',
        array(
          $callback,
          $file,
          $message,
          array(), // TODO: Implement argument passing
        )
      );
    }
    else {
      drupal_set_message(st('Could not discover callback in install task file: %file', array('%file' => $file)), 'error');
    }
  }

  return $operations;
}

/**
 * Platform installer Batch API delegator
 */
function hubs_profile_platform_batch_delegator($function, $file, $message, $args, &$context) {

  require_once dirname(__FILE__) . '/hubs_profile.profile.inc';

  if ($file) {
    require_once $file;
  }

  $args[] = &$context;

  $result = call_user_func_array($function, ($args) ? $args : array(&$context));

  if ($result) {
    $context['results'][] = $result;
  }
  if ($message) {
    $context['message'] = $message;
  }
}