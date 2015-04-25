#!/bin/bash
set -e

drush @$1-live vset --exact site_readonly 1
drush @$1-live cc all
drush -y rsync @$1-live @$1-dev --mode=rlptD --delete
drush -y sql-sync @$1-live @$1-dev
drush @$1-dev vset --exact site_readonly 0
