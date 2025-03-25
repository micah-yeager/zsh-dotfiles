# This file executes:
# - After .zshenv
# - Before .zshrc
# - Only if a login shell

# Preflight
source "$ZDOTDIR/loaders/zle.zsh"
# While this isn't necessarily needed in a login-only shell (i.e. not
# interactive), we still keep it here to allow for faster rendering when the
# shell IS interactive.
source "$ZDOTDIR/loaders/powerlevel10k-preflight.zsh"

# Configuration
source "$ZDOTDIR/loaders/homebrew.zsh"

source "$ZDOTDIR/loaders/libpq.zsh"
source "$ZDOTDIR/loaders/nvm.zsh"
source "$ZDOTDIR/loaders/pnpm.zsh"

# Don't source "$ZDOTDIR/loaders/powerlevel10k.zsh", since that will be loaded
# .zshrc last if an interactive shell.

# Local
if [ -f "$ZDOTDIR/.zprofile.local" ]; then
  source "$ZDOTDIR/.zprofile.local"
fi
