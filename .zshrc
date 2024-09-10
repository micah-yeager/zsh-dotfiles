# This file executes:
# - After .zprofile
# - Before .zlogin
# - Only if an interactive shell

# Configuration
source ./config/homebrew.zsh
source ./config/oh-my-zsh.zsh
source ./config/spaceship.zsh

source ./config/neon.zsh
source ./config/nvm.zsh

# Aliases
source ./alias/kubectlgetall.zsh

if [ -f ./zshrc.local ]; then
  source ./zshrc.local
fi
