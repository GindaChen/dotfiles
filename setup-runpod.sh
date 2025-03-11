#!/bin/bash


if [ -z "$1" ]; then
    echo "Error: Repository name is required."
    echo "Usage: $0 YourUsername/YourRepo"
    echo "For example, if you are @GindaChen with dotfiles repository, you should run:"
    echo "curl -sSL https://raw.githubusercontent.com/GindaChen/dotfiles/refs/heads/master/setup-runpod.sh | bash -s GindaChen/dotfiles"
    exit 1
fi
REPO_NAME=$1

# Extract username from repo name
USERNAME=$(echo $REPO_NAME | cut -d'/' -f1)

set -x

apt-get update 
apt-get install -y curl wget git tmux tree less
apt-get install -y figlet toilet lolcat

echo
figlet -f slant "Dotfiles Setup" | lolcat
echo
echo -e "Repository: \e[1;33m$REPO_NAME\e[0m\n" | lolcat -a


git clone https://github.com/${REPO_NAME}.git ~/dotfiles || true

bash ~/dotfiles/runpod/setup.sh || true && cd -

echo "Done"

set +x