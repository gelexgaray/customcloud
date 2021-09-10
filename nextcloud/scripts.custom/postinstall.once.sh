#!/bin/sh
. /functions/occ.sh

echo "Enable breezedark theme"
occ app:enable breezedark
occ config:app:set breezedark theme_enabled --value 1

echo "Disable unused tabs"
occ app:disable firstrunwizard
occ app:disable activity

echo "Disable status notification"
occ app:disable user_status

echo "Download and enable SAML integration app"
occ app:install user_saml