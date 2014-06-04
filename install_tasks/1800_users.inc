<?php

/**
 * @file user configuration.
 */

function hubs_profile_users_task() {
  // Don't allow public registration of user accounts.
  variable_set('user_register', 0);
}
