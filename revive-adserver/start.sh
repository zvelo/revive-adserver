#!/bin/bash

DATA_DIRS="/var/www/var /var/www/plugins /var/www/www/admin/plugins /var/www/www/images"
for dir in $DATA_DIRS; do
  mkdir -p "/data$dir"
  chown www-data:www-data "/data$dir"
  rm -rf "$dir"
  ln -s "/data$dir" "$dir"
done

VAR_DIRS="cache plugins plugins/DataObjects templates_compiled"
for dir in $VAR_DIRS; do
  mkdir -p "/var/www/var/$dir"
  chown www-data:www-data "/var/www/var/$dir"
done

if [ ! -r /var/www/var/INSTALLED ]; then
  touch /var/www/var/UPGRADE
  chown www-data:www-data /var/www/var/UPGRADE
fi

echo -ne "# Deny all users web access to this directory\nDeny from all" > /var/www/var/.htaccess
chown www-data:www-data /var/www/var/.htaccess

exec nginx "$@"
