# Dotfiles

## Runpod

> **Note**: Make sure `REPO_NAME=GindaChen/dotfiles` is your own repository name.


After starting the runpod, run the following command:
```bash
REPO_NAME="YourUsername/YourRepo" 
curl -sSL https://raw.githubusercontent.com/${REPO_NAME}/refs/heads/master/setup-runpod.sh | bash -s ${REPO_NAME} 
```

For example, if you are [@GindaChen](https://github.com/GindaChen) with dotfiles repository, you should run:
```bash
curl -sSL https://raw.githubusercontent.com/GindaChen/dotfiles/refs/heads/master/setup-runpod.sh | bash -s "GindaChen/dotfiles" 
```

### Configuration files
- `runpod/setup_git.sh`: Configure git with the username and email (not sensitive credentials).
- `runpod/bashrc.sh`: Customize the bashrc file. We by default install oh-my-bash and set the theme to `font`. If you do not like this setting, change this file to your own bash profile. 