# Non-PHP-8 version is used because required dependencies are not yet packaged and tested
FROM ghcr.io/linuxserver/baseimage-alpine-nginx:3.14

ARG BUILD_DATE
ARG VERSION
ARG GLPI_RELEASE
LABEL maintainer="E-Power International"

RUN \
  echo "**** install runtime packages ****"; \
  apk add --no-cache \
    curl \
    tar \
    unzip \
    mariadb-client \
    php7-curl \
    php7-fileinfo \
    php7-gd \
    php7-json \
    php7-mbstring \
    php7-mysqli \
    php7-session \
    php7-zlib \
    php7-simplexml \
    php7-xml \
    php7-dom \
    php7-intl \
    php7-xmlrpc \
    php7-cli \
    php7-openssl \
    php7-opcache \
    php7-zip \
    php7-exif \
    php7-bz2 \
    php7-ctype \
    php7-iconv \
    php7-sodium \
    php7-mbstring; \
  echo "**** install glpi ****"; \
  mkdir -p \
    /var/www/html/; \
  if [ -z ${GLPI_RELEASE+x} ]; then \
    GLPI_RELEASE=$(curl -sX GET "https://api.github.com/repos/glpi-project/glpi/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]'); \
  fi; \
  curl -o \
    /tmp/glpi.tgz -L \
    "https://github.com/glpi-project/glpi/releases/download/${GLPI_RELEASE}/glpi-${GLPI_RELEASE}.tgz"; \
  tar zxf \
    /tmp/glpi.tgz -C \
    /var/www/html/ --strip-components=1; \
  echo "**** move directories to defaults ****" && \
  mv \
    "/var/www/html/config" \
    "/var/www/html/files" \
  /defaults/ && \
  echo "**** cleanup ****"; \
  rm -rf \
    /root/.composer \
    /tmp/*

COPY root/ /

EXPOSE 80 443
