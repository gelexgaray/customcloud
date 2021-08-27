#!/bin/sh
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

# Finally, here goes the real exec of the server
exec "$@" 
