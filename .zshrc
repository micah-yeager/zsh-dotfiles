# This file executes:
# - After .zprofile
# - Before .zlogin
# - Only if an interactive shell

# Preflight
source "$ZDOTDIR/config/zle.zsh"
source "$ZDOTDIR/config/powerlevel10k-preflight.zsh"

# Configuration
source "$ZDOTDIR/config/homebrew.zsh"
source "$ZDOTDIR/config/powerlevel10k.zsh"
source "$ZDOTDIR/config/zsh-syntax-highlighting.zsh"

source "$ZDOTDIR/config/neon.zsh"
source "$ZDOTDIR/config/nvm.zsh"

# Aliases
source "$ZDOTDIR/alias/kubectlgetall.zsh"

# Local
if [ -f "$ZDOTDIR/.zshrc.local" ]; then
  source "$ZDOTDIR/.zshrc.local"
fi
