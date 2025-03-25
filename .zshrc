# This file executes:
# - After .zprofile
# - Before .zlogin
# - Only if an interactive shell

# Preflight
source "$ZDOTDIR/loaders/zle.zsh"
source "$ZDOTDIR/loaders/powerlevel10k-preflight.zsh"

# Loaders
source "$ZDOTDIR/loaders/homebrew.zsh"
source "$ZDOTDIR/loaders/zsh-syntax-highlighting.zsh"

source "$ZDOTDIR/loaders/libpq.zsh"
source "$ZDOTDIR/loaders/neon.zsh"
source "$ZDOTDIR/loaders/nvm.zsh"
source "$ZDOTDIR/loaders/pnpm.zsh"

source "$ZDOTDIR/loaders/powerlevel10k.zsh" # Keep this last

# Aliases
source "$ZDOTDIR/aliases/eza.zsh"
source "$ZDOTDIR/aliases/freeport.zsh"
source "$ZDOTDIR/aliases/kubectlgetall.zsh"

# Local
if [ -f "$ZDOTDIR/.zshrc.local" ]; then
  source "$ZDOTDIR/.zshrc.local"
fi
