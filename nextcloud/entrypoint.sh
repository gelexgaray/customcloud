#!/bin/sh
# Globallly export $OCC to use as an alias of occ command
# When running occ with sudo, -E must be used to pass PHP_MEMORY_LIMIT 
# and the rest of the main environament into www-data environment
# and avoid out of memory errors
export OCC="sudo -E -u www-data /var/www/html/occ"

# Preinstall customizations
if [ -e "/custom.preinstall.allways.sh" ]; then
  echo "Running custom.preinstall.allways.sh ..."
  /custom.preinstall.allways.sh
fi
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  if [ -e "/custom.preinstall.once.sh" ]; then
    echo "Running custom.preinstall.once.sh ..."
    /custom.preinstall.once.sh  
  fi
fi


# Call to standard entrypoint, but defer server startup passing a mock binary
# to standard exec
/entrypoint.std.sh /bin/date

# Copy customizations over nextcloud data volume (ONLY ONCE)
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  echo "Copy customizations over nextcloud data volume"
  cp -R /tmp/customizations/* /var/www/html/
  chown -R www-data /var/www/html/*
  chmod 755 /var/www/html/*
fi

# Post-install customizations
if [ -e "/custom.postinstall.allways.sh" ]; then
  echo "Running custom.postinstall.allways.sh ..."
  /custom.postinstall.allways.sh
fi
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  if [ -e "/custom.postinstall.once.sh" ]; then
    echo "Running custom.postinstall.once.sh ..."
    /custom.postinstall.once.sh
  fi
fi

# Set customized mark
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  touch /var/www/html/config/CUSTOMIZED
fi

# Finally, here goes the real exec of the server
exec "$@" 
