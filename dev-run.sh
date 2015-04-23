#!/bin/bash

docker run -d -it -p 80:80 -e "CRAFT_DB_HOST=192.168.59.3" -e "CRAFT_DB_USER=root" -e "CRAFT_DB_NAME=plazm-craft-dev" -v $(pwd)/src/craft:/var/www/craft -v $(pwd)/src/public:/var/www/html michaelorionmcmanus/plazm-craft