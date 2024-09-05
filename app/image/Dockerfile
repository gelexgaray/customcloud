ARG NEXTCLOUD_VERSION=stable

FROM nextcloud:${NEXTCLOUD_VERSION}-fpm

RUN apt-get update \
    && apt-get -y install imagemagick ffmpeg \
    && apt-get -y install clamav clamav-daemon \
    && apt-get clean

RUN freshclam
