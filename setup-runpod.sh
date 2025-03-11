#!/bin/bash

set -x

echo -e "\033[32m   _____ _           _        _____ _                 \033[0m
\033[32m  / ____(_)         | |      / ____| |                \033[0m
\033[32m | |  __ _ _ __   __| | __ _| |    | |__   ___ _ __  \033[0m
\033[33m | | |_ | | '_ \ / _\` |/ _\` | |    | '_ \ / _ \ '_ \ \033[0m
\033[31m | |__| | | | | | (_| | (_| | |____| | | |  __/ | | |\033[0m
\033[31m  \_____|_|_| |_|\__,_|\__,_|\_____|_| |_|\___|_| |_|\033[0m"



apt-get update 
apt-get install -y curl wget git tmux tree less

git clone https://github.com/GindaChen/dotfiles.git ~/dotfiles || true

cd ~/dotfiles/runpod && bash ./setup.sh && cd -

echo "Done"

set +x