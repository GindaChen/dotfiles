#!/bin/bash

apt-get update 
apt-get install -y curl wget git tmux tree less

git clone https://github.com/GindaChen/dotfiles.git ~/dotfiles

cd ~/dotfiles/runpod && bash ./runpod-setup.sh && cd -
