core = 7.x
api = 2

; Contrib projects (alphabetical order)
; ==============================================================================

projects[admin_menu][subdir] = "contrib"
projects[admin_menu][version] = "3.0-rc4"

projects[backup_migrate][subdir] = "contrib"
projects[backup_migrate][version] = "2.8"

projects[backup_migrate_files][subdir] = "contrib"
projects[backup_migrate_files][version] = "1.x-dev"


; Themes - Contrib projects (alphabetical order)
; ==============================================================================

projects[adminimal_theme][subdir] = "contrib"
projects[adminimal_theme][version] = "1.4"
projects[adminimal_theme][type] = "theme"
projects[adminimal_theme][download][type] = get
projects[adminimal_theme][download][url] = "http://ftp.drupal.org/files/projects/adminimal_theme-7.x-1.4.tar.gz"

projects[bootstrap][subdir] = "contrib"
projects[bootstrap][version] = "3.0"
projects[bootstrap][type] = "theme"
projects[bootstrap][download][type] = get
projects[bootstrap][download][url] = "http://ftp.drupal.org/files/projects/bootstrap-7.x-3.0.tar.gz"


; Other Libraries (alphabetical order please)
; ==============================================================================

libraries[Jcrop][download][type] = "get"
libraries[Jcrop][download][url] = "https://github.com/tapmodo/Jcrop/archive/v0.9.12.zip"
libraries[Jcrop][directory_name] = "Jcrop"