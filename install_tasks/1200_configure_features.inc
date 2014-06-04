<?php

/**
 * @file Configure features.
 */
function hubs_profile_configure_features_task() {

  // Prevent features rebuilding the entire world on every single cache clear.
  // This is made possible by the patch we have on the features module, see:
  //   http://drupal.org/node/658772#comment-7255072
  variable_set('features_rebuild_on_flush', FALSE);

  // Make UI exports more convenient.
  variable_set('features_default_export_path', 'profiles/hubs_profile/modules/custom');
}
