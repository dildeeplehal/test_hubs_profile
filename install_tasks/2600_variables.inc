<?php

/**
 * @file set some variables at install time.
 **/
function hubs_profile_variables_task() {
  variable_set('site_name', 'ExpressWeb Hub');
  variable_set('site_slogan', 'This is the default install slogan');

  //Webform node settings
  variable_set('node_submitted_webform',FALSE);
  variable_set('comment_webform', 0);

  // Logging & Errors.
  variable_set('error_level', 0);
  variable_set('dblog_row_limit', '1000000');

  // Dummy pathauto
  //variable_set('pathauto_node_dummy_pattern','dummy/[node:title]');

}
