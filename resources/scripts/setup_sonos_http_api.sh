#!/usr/bin/env bash

. /tmp/resources/scripts/common.sh --source-only

# Installing helper tools
echo -e "\e[96mInstalling helper tools ...\e[90m"
apt-get update
apt-get --yes install \
        curl \
        wget \
        git \
        vim \
        htop

# Installing necessary libraries
echo -e "\e[96mInstalling necessary libraries ...\e[90m"
apt-get --yes install \
        libgtk2.0-0 \
        libxss1 \
        libgconf-2-4 \
        libnss3 \
        libasound2 \
        libgtk-3-dev \
        xinput-calibrator

echo -e "\e[96mInstalling Node.js ...\e[90m"

NODE_STABLE_BRANCH="6.x"
curl -sL https://deb.nodesource.com/setup_$NODE_STABLE_BRANCH | bash -
apt-get install -y nodejs
apt-get clean
echo -e "\e[92mNode.js installation Done!\e[0m"

git clone https://github.com/plumcraft/node-sonos-http-api.git ~/node-sonos-http-api
cd ~/node-sonos-http-api

npm install --production
 
