#!/bin/bash

set -x
# Setup the bash script
if [ -f /root/.bashrc ]; then
    echo "Removing existing .bashrc"
    rm /root/.bashrc
fi

echo "Creating symlink /workspace/home/.bashrc -> ~/.bashrc"
cd ~ && ln -s /workspace/home/.bashrc . && cd -


mkdir -p ~/envs

if [ ! -d ~/projects ]; then
    echo "Creating symlink /workspace/projects -> ~/projects"
    cd ~ && ln -s /workspace/projects . && cd -
fi

if [ ! -d ~/workspace ]; then
    echo "Creating symlink /workspace -> ~/workspace"
    cd ~ && ln -s /workspace . && cd -
fi

if [ ! -d ~/.oh-my-bash ]; then
    echo "Creating symlink /workspace/.oh-my-bash -> ~/.oh-my-bash"
    cd ~ && ln -s /workspace/.oh-my-bash ~/ && cd -
fi

if [ ! -d /root/.cache/huggingface ]; then
    echo "Creating directory /root/.cache/huggingface"
    mkdir -p /root/.cache/huggingface
fi

if [ ! -d /root/.cache/huggingface/hub ]; then
    echo "Creating symlink /workspace/hf_home/hub -> /root/.cache/huggingface/hub"
    ln -s /workspace/hf_home/hub /root/.cache/huggingface/hub
fi



# bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended

# upgrade_oh_my_bash

apt-get update 
apt-get install -y curl wget git htop tmux sudo nvtop ccache tree less

# Setup your git config
git config --global credential.helper "cache --timeout=604800"
# TODO: Make this configurable
git config --global user.name "GindaChen"
git config --global user.email "32371474+GindaChen@users.noreply.github.com"

# Install uv and setup environments
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
bash /workspace/env_prepare/setup_envs.sh

# Install necessary packages
pip install nvitop gpustat

set +x
