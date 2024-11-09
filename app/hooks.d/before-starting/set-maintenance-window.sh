#!/bin/bash
. /_/shlib/occ.sh

if [ ! -z "$NEXTCLOUD_MAINTENANCE_WINDOW_START" ];
then
  occ config:system:set maintenance_window_start --type=integer --value=$NEXTCLOUD_MAINTENANCE_WINDOW_START
fi
if [ ! -z "$NEXTCLOUD_MAINTENANCE_WINDOW_STOP" ];
then
  occ config:system:set maintenance_window_start --type=integer --value=$NEXTCLOUD_MAINTENANCE_WINDOW_STOP
fi
