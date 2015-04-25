#!/bin/bash
set -e

drush dl drupal --drupal-project-rename=$1
cd $1 && drush -y si minimal --db-url=mysql://$1:$1@localhost/$1 --account-pass=$1
cd ../
