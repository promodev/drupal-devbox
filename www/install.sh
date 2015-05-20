#!/bin/bash
set -e

drush dl drupal --drupal-project-rename=$1
cd $1
drush -y si minimal --db-url=mysql://$1:$1@localhost/$1 --account-pass=$1
drush vset admin_theme seven
drush vset node_admin_theme 1
drush dl admin_menu
drush -y en admin_menu_toolbar
cd ../
