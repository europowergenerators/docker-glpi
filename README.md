# GLPI

Inspired by [Linuxserver.io](https://www.linuxserver.io/).
Modified from the following sources to package the gratis release of the [GLPI software](https://glpi-project.org/)
* https://github.com/linuxserver/docker-nginx
* https://github.com/linuxserver/docker-snipe-it
* https://github.com/linuxserver/docker-phpmyadmin

## USAGE

Create a docker-compose file similar to the one below. The docker image _is not_ published to any repository!

```yaml
version: "3.2"

services:
  mariadb:
    image: lscr.io/linuxserver/mariadb:latest
    container_name: mariadb-glpi
    hostname: mariadb-glpi
    volumes:
      - ./.volume/mysql:/config
    environment:
      - PUID=1000
      - PGID=1000
      - MYSQL_ROOT_PASSWORD=unsafepassword$$
      - TZ=Europe/Brussels
      - MYSQL_DATABASE=glpi
      - MYSQL_USER=glpi_user
      - MYSQL_PASSWORD=glpi
    restart: unless-stopped

  glpi:
    build:
      context: ./
      dockerfile: Dockerfile
      args:
        BUILD_DATE: 2022-06-21
        VERSION: 0.1
        GLPI_RELEASE: 10.0.1
    container_name: glpi-custom
    environment:
      - PUID=1000
      - PGID=1000
      - APP_URL=http://localhost:8080
      - TZ=Europe/Brussels
    volumes:
      - ./.volume/glpi:/config
    ports:
      - 8080:80
    restart: unless-stopped
```
