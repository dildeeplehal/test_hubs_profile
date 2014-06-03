core = 7.x
api = 2

; Drupal core.
projects[drupal][type] = core
projects[drupal][version] = "7.28"

; Fix duplicated terms being created in certain cases with term ref fields.
projects[drupal][patch][] = http://drupal.org/files/D7-autocreate-1343822-9-notests-do-not-test.patch
; Output IE edge / chrome frame trigger (http://drupal.org/node/1203112#comment-6972468)
projects[drupal][patch][] = "http://drupal.org/files/add-x-ua-compatible-1203112-26.patch"
; Highlight incorrectly completed form fields
projects[drupal][patch][] = "http://drupal.org/files/fapi-radio-checkbox-error-highlighting-222380-30.patch"
; path_load and drupal_lookup_path are inconsistent when choosing the 'current' path of an entity
; projects[drupal][patch][] = "http://drupal.org/files/drupal-1934086-path_load_order-1.patch"


projects[hubs_profile][type] = profile
projects[hubs_profile][download][type] = git
projects[hubs_profile][download][url] = git@github.com:PracticeWEB/hubs.git
projects[hubs_profile][download][branch] = dev
