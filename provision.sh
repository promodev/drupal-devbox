#!/bin/bash
set -e

# Install Ajenti:
wget -O- https://raw.githubusercontent.com/ajenti/ajenti/1.2.22/scripts/install-debian.sh | sh
sed -i 's/ctx = SSLContext(ssl_version)$/ctx = __ssl__\.SSLContext(ssl_version)/' /usr/lib/python2.7/dist-packages/gevent/ssl.py

# Install Ajenti V:
DEBIAN_FRONTEND=noninteractive apt-get install -y ajenti-v ajenti-v-nginx ajenti-v-mysql ajenti-v-php-fpm php5-mysql php5-gd
service ajenti restart

# Take care of permissions:
usermod -aG dialout www-data
grep -qF 'session optional pam_umask.so' /etc/pam.d/common-session || echo 'session optional pam_umask.so' >> /etc/pam.d/common-session
sed -i 's/^UMASK[[:space:]].*$/UMASK 0002/' /etc/login.defs
sed -i 's/^# Author/umask 0002 # Author/' /etc/init.d/php5-fpm
service php5-fpm restart

# Install Composer:
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.0.0-alpha10

# Install Drush:
composer global require drush/drush:7.*
ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush
