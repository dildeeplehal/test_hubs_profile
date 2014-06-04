<?php

/**
 * @file Generate content at install time.
 *
 * This is placed after the 'apply_features' task, since our field configuration
 * will not be around before everything in features is everything.
 **/
function hubs_profile_content_task() {
  // Allow different entities to be kept in different files. Nice and organized.
  $files = file_scan_directory(DRUPAL_ROOT . '/profiles/hubs_profile/content', '/\.inc$/');
  asort($files);
  foreach ($files as $file) {
    include_once($file->uri);
  }
}

/**
 * Helper function for our individual include files to be able to grab the
 * loaded file object for an item of stock media by filename.
 */
function hubs_profile_stock_file($filename) {
  static $cache = array();
  if (!isset($cache[$filename])) {
    $cache[$filename] = FALSE;
    $stock_media_destination = 'public://stock_media';
    if ($files = file_load_multiple(array(), array('uri' => $stock_media_destination . '/' . $filename))) {
      $cache[$filename] = reset($files);
    }
  }
  return $cache[$filename];
}
