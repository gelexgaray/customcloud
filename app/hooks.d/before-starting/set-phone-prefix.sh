#!/bin/bash
. /_/shlib/occ.sh


if [ ! -z "$DEFAULT_PHONE_REGION" ];
then
   echo "occ config:system:set default_phone_region --value=$DEFAULT_PHONE_REGION"
fi
