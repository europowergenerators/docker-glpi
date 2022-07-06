# GLPI

Inspired by [Linuxserver.io](https://www.linuxserver.io/).
Modified from the following sources to package the gratis release of the [GLPI software](https://glpi-project.org/)
* https://github.com/linuxserver/docker-nginx
* https://github.com/linuxserver/docker-snipe-it
* https://github.com/linuxserver/docker-phpmyadmin

## FEATURES

* GRATIS release of [GLPI software](https://glpi-project.org/)
* Easy access to runtime data through the "/config" directory within the container
  * Map a host system directory onto "/config"
* You can manually provide plugins for use in GLPI
  * Copy your plugin folders into "/config/glpi-marketplace" and restart the container

## USAGE

Check the sidebar for a packaged docker image to deploy! Or use [this link](https://github.com/orgs/europowergenerators/packages?repo_name=docker-glpi)

### Local development

See [docker-compose-local.yml](docker-compose-local.yml)

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
        # ERROR; Make sure to use THE LATEST AND MOST SECURE GLPI version!
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
