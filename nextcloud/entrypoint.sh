#!/bin/sh

# Preinstall customizations
if [ -e "/scripts.custom/preinstall.always.sh" ]; then
  echo "Running custom.preinstall.always.sh ..."
  /scripts.custom/preinstall.always.sh
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

# Post-install customizations
if [ -e "/scripts.custom/postinstall.always.sh" ]; then
  echo "Running custom.postinstall.always.sh ..."
  /scripts.custom/postinstall.always.sh
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
