#!/bin/sh

# Preinstall customizations
if [ -e "/scripts.custom/preinstall.allways.sh" ]; then
  echo "Running custom.preinstall.allways.sh ..."
  /scripts.custom/preinstall.allways.sh
fi
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  if [ -e "/scripts.custom/preinstall.once.sh" ]; then
    echo "Running custom.preinstall.once.sh ..."
    /scripts.custom/preinstall.once.sh  
  fi
fi


# Call to standard entrypoint, but defer server startup passing a mock binary
# to standard exec
/entrypoint.std.sh /bin/date

# Copy customizations over nextcloud data volume (ONLY ONCE)
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  echo "Copy customizations over nextcloud data volume"
  cp -R /customizations/* /var/www/html/
  chown -R www-data /var/www/html/*
  chmod 755 /var/www/html/*
fi

# Post-install customizations
if [ -e "/scripts.custom/postinstall.allways.sh" ]; then
  echo "Running custom.postinstall.allways.sh ..."
  /scripts.custom/postinstall.allways.sh
fi
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  if [ -e "/scripts.custom/postinstall.once.sh" ]; then
    echo "Running custom.postinstall.once.sh ..."
    /scripts.custom/postinstall.once.sh
  fi
fi

# Set customized mark
if [ ! -e "/var/www/html/config/CUSTOMIZED" ]; then
  touch /var/www/html/config/CUSTOMIZED
fi

# Finally, here goes the real exec of the server
exec "$@" 
