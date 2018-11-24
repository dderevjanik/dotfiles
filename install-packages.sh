#!/bin/bash

if ! [ -x "$(command -v fish)" ]; then
  echo 'installing fish shell'
  sudo apt-add-repository ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get install fish
else
  echo 'fish shell is already installed'
fi

if ! [ -x "$(command -v omf)"]; then
  echo 'installing omf - oh my fish'
  curl -L https://get.oh-my.fish | fish
else
  echo 'omf is already installed'
fi

if ! [ -x "$(command -v docker)"]; then
  echo 'installing docker'
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  sudo apt-get update
  sudo apt-get install docker-ce
else
  echo 'docker is already installed'
fi

if ! [ -x "$(command -v docker-compose)"]; then
  echo 'installing docker-compose'
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
else
  echo 'docker-compose is already installed'
fi
