# GLPI

Inspired by [Linuxserver.io](https://www.linuxserver.io/).
Modified from the following sources to package the gratis release of the [GLPI software](https://glpi-project.org/)
* https://github.com/linuxserver/docker-baseimage-alpine-nginx/tree/3.14
* https://github.com/linuxserver/docker-snipe-it
* https://github.com/linuxserver/docker-phpmyadmin

## FEATURES

* GRATIS release of [GLPI software](https://glpi-project.org/)
* Easy access to runtime data through the "/config" directory within the container
  * Map a host system directory onto "/config"
* You can manually provide plugins for use in GLPI
  * Copy your plugin folders into "/config/glpi/marketplace" and restart the container

## USAGE

Check the sidebar for a packaged docker image to deploy! Or use [this link](https://github.com/orgs/europowergenerators/packages?repo_name=docker-glpi)

## Plug-ins

We use the following plugins on our installation;

* (Additional) Fields
  * Use the marketplace to reinstall
  * SOURCE; https://github.com/pluginsGLPI/fields
* Single Sign-On
  * Our own fork, push all files (not dot-files) to [volume]/glpi/marketplace/singlesignon
  * SOURCE; https://github.com/europowergenerators/glpi-singlesignon
