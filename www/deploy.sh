#!/bin/bash
set -e

drush @$1-dev vset --exact maintenance_mode 1
drush @$1-dev cc all
drush @$1-live vset --exact maintenance_mode 1
drush @$1-live cc all
drush @$1-live arb
drush rsync @$1-dev @$1-live --mode=rltD --delete --chmod=ugo=rwX
drush sql-sync @$1-dev @$1-live
drush @$1-live vset --exact maintenance_mode 0
