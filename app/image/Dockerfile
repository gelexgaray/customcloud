ARG NEXTCLOUD_VERSION

FROM nextcloud:${NEXTCLOUD_VERSION}-fpm

RUN apt-get update \
    && apt-get -y install imagemagick ffmpeg \
    && apt-get clean
