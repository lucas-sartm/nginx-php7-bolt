#!/bin/bash

for dir in /var/www/html/app/cache/ /var/www/html/app/database/ /var/www/html/public/thumbs/ ; do
    find $dir -type d -print0 | xargs -0 chmod u+rwx,g+rwxs,o+rx-w
    find $dir -type f -print0 | xargs -0 chmod u+rw-x,g+rw-x,o+r-wx > /dev/null 2>&1
done

for dir in /var/www/html/app/config/ /var/www/html/extensions/ /var/www/html/public/extensions/ /var/www/html/public/files/ /var/www/html/public/theme/ ; do
    find $dir -type d -print0 | xargs -0 chmod u+rwx,g+rwxs,o+rx-w
    find $dir -type f -print0 | xargs -0 chmod u+rw-x,g+rw-x,o+r-wx > /dev/null 2>&1
done

php-fpm7
exec nginx -g 'daemon off;'
