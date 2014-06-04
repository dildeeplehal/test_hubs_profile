<?php

/**
 * @file Development install tasks.
 *
 * Opt into these tasks by placing the following in settings.php:
 *
 *   define('SITE_ENVIRONMENT', 'DEV');
 */
function hubs_profile_dev_task() {

  // Only run these things on a DEV site environment.
  if (!defined('SITE_ENVIRONMENT') || (SITE_ENVIRONMENT !== 'DEV')) {
    return;
  }

  // Install some handy modules
  module_enable(array('devel', 'diff'));


  // Show errors & warnings to the screen
  variable_set('error_level', 2);
}
