#!/bin/env bash
COMPOSE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
BASENAME="$( basename $COMPOSE_DIR )"

# Start on a known base dir
cd "$COMPOSE_DIR"

# Default backup folder. Can be overriden on the .env file
BACKUP_FOLDER="./backup"
if [ -f .env ]
then
  export $(cat .env | grep BACKUP_FOLDER | xargs)
fi

# Derive a destination folder
echo "Prepare for backup..."
DEST="."
DATE=$( date -I'date' )
mkdir "$BACKUP_FOLDER/" 2> /dev/null
mkdir "$BACKUP_FOLDER/$DATE" 2> /dev/null

docker compose down

# Loop through volumes a backup each of them
VOLUMES=$( docker volume ls --format "{{lower .Name}}" | grep "$BASENAME_" )
for VOLUME in $VOLUMES;
do
  echo "Backing up [$VOLUME]..."
  # Foreach volume, backup using busybox
  docker run --rm \
    --mount source=$VOLUME,target=/mnt/source \
    -v "$BACKUP_FOLDER/$DATE":/mnt/destination \
    busybox \
    tar -czvf /mnt/destination/$VOLUME.tar.gz -C /mnt/source . 
done

docker compose up -d
