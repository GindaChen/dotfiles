#!/bin/bash

echo "Runnig custom setup script"

set -x
# Setup the bash script
if [ -f /root/.bashrc ]; then
    echo "Removing existing .bashrc"
    mv /root/.bashrc /root/.bashrc.$(date +%Y%m%d).backup
fi

CUR_DIR=$(dirname $(realpath $0))

echo "Creating symlink $CUR_DIR/bashrc.sh -> ~/.bashrc"
cd ~ && ln -s $CUR_DIR/bashrc.sh .bashrc && cd -


mkdir -p ~/envs

if [ ! -d /workspace/projects ]; then
    mkdir -p /workspace/projects
fi

if [ ! -d ~/projects ]; then
    echo "Creating symlink /workspace/projects -> ~/projects"
    cd ~ && ln -s /workspace/projects . && cd -

    # TODO: git clone more projects if needed
fi

if [ ! -d ~/workspace ]; then
    echo "Creating symlink /workspace -> ~/workspace"
    cd ~ && ln -s /workspace ~/ && cd -
fi

if [ ! -d ~/.oh-my-bash ]; then
    git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
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

# bash $CUR_DIR/setup_git.sh

# Install uv and setup environments
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
bash $CUR_DIR/setup_envs.sh


set +x
