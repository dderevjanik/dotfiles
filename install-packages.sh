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
