#!/bin/bash
. /_/shlib/occ.sh

if [ ! -z "$NEXTCLOUD_DOMAIN" ];
then
  occ config:system:set trusted_domains 2 --value=$NEXTCLOUD_DOMAIN
fi
if [ ! -z "$NEXTCLOUD_DOMAIN_ALT" ];
then
  occ config:system:set trusted_domains 3 --value=$NEXTCLOUD_DOMAIN_ALT
fi
