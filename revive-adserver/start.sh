#!/bin/bash

DATA_DIRS="/var/www/var /var/www/plugins /var/www/www/admin/plugins /var/www/www/images"
for dir in $DATA_DIRS; do
  rm -rf "$dir"
  ln -s "/data$dir" "$dir"
done

exec nginx "$@"
