
make_git_faster(){
    git config --add oh-my-zsh.hide-status 1
    git config --add oh-my-zsh.hide-dirty 1
}

setup_git_config(){
    source $DOTFILES_REPO_ROOT/setup_git.sh
}