# This file executes:
# - After .zprofile
# - Before .zlogin
# - Only if an interactive shell

# Configuration
source "$ZDOTDIR/config/homebrew.zsh"
source "$ZDOTDIR/config/oh-my-zsh.zsh"
source "$ZDOTDIR/config/spaceship.zsh"

source "$ZDOTDIR/config/neon.zsh"
source "$ZDOTDIR/config/nvm.zsh"

# Aliases
source "$ZDOTDIR/alias/kubectlgetall.zsh"

if [ -f ./zshrc.local ]; then
  source "$ZDOTDIR/zshrc.local"
fi
