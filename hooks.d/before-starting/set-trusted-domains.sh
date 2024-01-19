#!/bin/bash
. /_shlib/occ.sh

if [ ! -z "$NEXTCLOUD_DOMAIN" ];
then
  occ config:system:set trusted_domains 2 --value=$NEXTCLOUD_DOMAIN
fi
