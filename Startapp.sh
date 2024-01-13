#!/bin/bash

#TEST for webhook#
echo -e "\n\n########### Starting docker compose and build with in #######\n\n"
sleep 5
echo -e "Running docker compose..."
sudo docker-compose -f dockercompose.yml up -d

echo -e "####### Application startup completed !!! ######"
echo -e "\nPHPADMIN: port 8001\n APPLICATION: port: 80\n"
echo -e "############## Initialization completed!! on: `curl ifconfig.me`.... Enjoy app"
