#!/bin/bash
set -e

chown -R vagrant:www-data /srv/www/$1
find /srv/www/$1 -type d -exec chmod 755 {} +
find /srv/www/$1 -type f -exec chmod 644 {} +
find /srv/www/$1/sites/default/files -type d -exec chmod 775 {} +
find /srv/www/$1/sites/default/files -type f -exec chmod 664 {} +
