usermod -a -G dialout www-user
usermod -a -G www-data vagrant
echo 'session optional pam_umask.so' >> /etc/pam.d/common-session
sed -i 's/^UMASK[[:space:]].*$/UMASK 0002/' /etc/login.defs
sed -i 's/^PATH=/umask 0002\nPATH=/' /etc/init.d/php5-fpm
