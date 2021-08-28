#!/bin/sh
# Globallly export $OCC to use as an alias of occ command
export OCC="sudo -E -u www-data /var/www/html/occ"

# Put here code to run before nextcloud installation/upgrade
echo "Before nextcloud installation customizations"

# Call to standard entrypoint, but defer server startup passing a mock binary
# to standard exec
/entrypoint.std.sh /bin/date

# Put here code to run after nextcloud installation/upgrade
echo "After nextcloud installation customizations"
echo "Copy customizations over nextcloud data volume"
cp -R /tmp/customizations/* /var/www/html/
chown -R www-data /var/www/html/*
chmod 755 /var/www/html/*

echo "Enable breezedark theme"
# When running occ with sudo, -E must be used to pass PHP_MEMORY_LIMIT 
# and the rest of the main environament into www-data environment
# and avoid out of memory errors
$OCC app:enable breezedark
$OCC config:app:set breezedark theme_enabled --value 1

# Finally, here goes the real exec of the server
exec "$@" 
