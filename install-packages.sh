#!/bin/bash

if ! [ -x "$(command -v fish)" ]; then
  echo -e '\e[95mInstalling fish shell'
  echo -e "\e[39mDefault"
  sudo apt-add-repository ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get install fish
else
  echo -e 'fish shell is already installed'
fi

if ! [ -x "$(command -v omf)" ]; then
  echo -e '\e[95mInstalling omf - oh my fish'
  echo -e "\e[39m"
  curl -L https://get.oh-my.fish | fish
else
  echo 'omf is already installed'
fi

if ! [ -x "$(command -v deborphan)" ]; then
  echo -e '\e[95mInstalling deborphan - removing orphaned libraries'
  echo -e "\e[39m"
  sudo apt-get install -y deborphan
else
  echo 'omf is already installed'
fi

if ! [ -x "$(command -v docker)" ]; then
  echo -e '\e[95mInstalling docker'
  echo -e "\e[39m"
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
  echo -e 'docker is already installed'
fi

if ! [ -x "$(command -v docker-compose)" ]; then
  echo -e '\e[95mInstalling docker-compose'
  echo -e "\e[39mDefault"
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
else
  echo -e 'docker-compose is already installed'
fi

if ! [ -x "$(command -v mc)" ]; then
  echo -e '\e[95mInstalling mc - midnight commander'
  echo -e "\e[39mDefault"
  sudo apt-get install mc
else
  echo -e 'mc is already installed'
fi

if ! [ -x "$(command -v unrar)" ]; then
  echo -e '\e[95mInstalling unrar'
  echo -e "\e[39mDefault"
  sudo apt-get install unrar
else
  echo -e 'unrar is already installed'
fi

if ! [ -x "$(command -v htop)" ]; then
  echo -e '\e[95mInstalling htop'
  echo -e "\e[39mDefault"
  sudo apt-get install htop
else
  echo -e 'htop is already installed'
fi

if ! [ -x "$(command -v powertop)" ]; then
  echo -e '\e[95mInstalling powertop'
  echo -e "\e[39mDefault"
  sudo apt-get install powertop
else
  echo -e 'powertop is already installed'
fi
