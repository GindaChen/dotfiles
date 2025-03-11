# Dotfiles

## Runpod

> **Note**: Make sure to replace `REPO_NAME=GindaChen/dotfiles` with your own repository name in the command below if you've forked this repository. The setup script will configure git with the credentials specified in `runpod/setup_git.sh`.


After starting the runpod, run the following command:
```bash
REPO_NAME="YourUsername/YourRepo" 
curl -sSL https://raw.githubusercontent.com/${REPO_NAME}/refs/heads/master/setup-runpod.sh | bash -s ${REPO_NAME} 
```

For example, if you are @GindaChen with dotfiles repository, you should run:
```bash
curl -sSL https://raw.githubusercontent.com/GindaChen/dotfiles/refs/heads/master/setup-runpod.sh | bash -s "GindaChen/dotfiles" 
```
