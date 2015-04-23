#!/bin/bash
echo "SETTING UP ENV"
echo 'export DOCKER_HOST_IP='$(echo $DOCKER_HOST_IP) >> /etc/apache2/envvars
echo 'export CRAFT_DB_HOST='$(echo $CRAFT_DB_HOST) >> /etc/apache2/envvars
echo 'export CRAFT_DB_PASS='$(echo $CRAFT_DB_PASS) >> /etc/apache2/envvars
echo 'export CRAFT_DB_USER='$(echo $CRAFT_DB_USER) >> /etc/apache2/envvars