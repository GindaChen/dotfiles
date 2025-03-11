#!/bin/bash

set -x

echo -e "\033[36m  _   _                 _    ___ _           _     \033[0m
\033[36m | | | | __ _  ___    / \  |_ _| |     __ _| |__  \033[0m
\033[36m | |_| |/ _\` |/ _ \  / _ \  | || |    / _\` | '_ \ \033[0m
\033[35m |  _  | (_| | (_) |/ ___ \ | || |___| (_| | |_) |\033[0m
\033[34m |_| |_|\__,_|\___//_/   \_\___|_____|\__,_|_.__/ \033[0m
\033[33m                                                  \033[0m
\033[32m ===== SETUP SCRIPT STARTING ===== \033[0m"

if [ -z "$1" ]; then
    echo "Error: Repository name is required."
    echo "Usage: $0 YourUsername/YourRepo"
    echo "For example, if you are @GindaChen with dotfiles repository, you should run:"
    echo "curl -sSL https://raw.githubusercontent.com/GindaChen/dotfiles/refs/heads/master/setup-runpod.sh | bash -s GindaChen/dotfiles"
    exit 1
fi
REPO_NAME=$1

apt-get update 
apt-get install -y curl wget git tmux tree less

git clone https://github.com/${REPO_NAME}.git ~/dotfiles || true

bash ~/dotfiles/runpod/setup.sh || true && cd -

echo "Done"

set +x