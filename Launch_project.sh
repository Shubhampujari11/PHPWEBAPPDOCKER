#!/bin/bash

#Webhook try#
echo -e "############## Installing Docker.... ############"
yum update -y
yum install docker -y
systemctl enable docker
systemctl start docker

echo -e "############## Installing Docker-compose.... ############"

## THIS IS THE OLD WAY
## Nowadays, simply follow the Compose installation instructions in the official documentation:
## https://docs.docker.com/compose/install/


# get latest docker compose released tag
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)

# Install docker-compose
sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
chmod +x /usr/local/bin/docker-compose
sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Output compose version
docker-compose -v

#sudo su - root


echo -e "######## DOCKER STARTUP COMPLETED !!!! ###### "
echo -e "\n\n########### Starting docker compose and build with in #######\n\n"
sleep 5
echo -e "Running docker compose..."
docker-compose -f dockercompose.yml up -d

echo -e "####### Application startup completed !!! ######"
echo -e "\nPHPADMIN: port 8001\n APPLICATION: port: 80\n"
echo -e "############## Initialization completed!! on: `curl ifconfig.me`.... Enjoy app"
