<?php

/**
 * @file
 *   Explicitly apply all our features.
 *   Before this anything that features provided
 *   is not yet around.
 */

function hubs_profile_apply_features_task() {

  drupal_static_reset();

  // Views statically caches plugins
  if (function_exists('views_fetch_plugin_data')) {
    views_include_handlers(TRUE);
    views_fetch_plugin_data(NULL, NULL, TRUE);
    views_fetch_data(NULL, TRUE, TRUE);
  }

  if (module_exists('features')) {
    features_get_modules(NULL, TRUE);
    //features_revert();
  }

  // Force all our blocks into the database now
  if (!function_exists('block_flush_caches')) {
    module_load_include('module', 'block', 'block');
  }
  block_flush_caches();

  // This may well need lots more horrible horrible code.
  // Whatever is needed to make sure our features darn well apply.
}
