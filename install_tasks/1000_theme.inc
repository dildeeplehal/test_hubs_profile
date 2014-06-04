<?php

/**
 * @file Configure the theme.
 */

function microgen_profile_theme_task() {

  // Set default themes
  $enable = array(
    'theme_default' => 'expressweb',
    'admin_theme' => 'adminimal',
    'node_admin_theme' => TRUE,
  );

  theme_enable($enable);

  foreach ($enable as $var => $theme) {
    if (!is_numeric($var)) {
      variable_set($var, $theme);
    }
  }

  // Disable the default Bartik theme
  theme_disable(array('bartik'));

  // Setup jquery update settings
  variable_set('jquery_update_jquery_version', '1.10');
  variable_set('jquery_update_jquery_admin_version', 'default');
}
