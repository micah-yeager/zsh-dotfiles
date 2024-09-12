# This file executes:
# - After .zshenv
# - Before .zshrc
# - Only if a login shell

# Preflight
source "$ZDOTDIR/config/zle.zsh"
# While this isn't necessarily needed in a login-only shell (i.e. not
# interactive), we still keep it here to allow for faster rendering when the
# shell IS interactive.
source "$ZDOTDIR/config/powerlevel10k-preflight.zsh"

# Config
source "$ZDOTDIR/config/homebrew.zsh"
source "$ZDOTDIR/config/nvm.zsh"

# Local
if [ -f "$ZDOTDIR/.zprofile.local" ]; then
  source "$ZDOTDIR/.zprofile.local"
fi
