# This file executes:
# - After .zshenv
# - Before .zshrc
# - Only if a login shell

# Preflight
source "$ZDOTDIR/utils/load.zsh"
dot-files-load zle
# While this isn't necessarily needed in a login-only shell (i.e. not
# interactive), we still keep it here to allow for faster rendering when the
# shell IS interactive.
dot-files-load powerlevel10k-preflight

# Configuration
dot-files-load homebrew [ -d "/opt/homebrew" ]

dot-files-load libpq [ -d "$HOMEBREW_PREFIX/opt/libpq" ]
dot-files-load nvm [ -d "$HOME/.nvm" ]
dot-files-load pnpm [ -d "$HOME/Library/pnpm" ]

# Don't source "$ZDOTDIR/loaders/powerlevel10k.zsh", since that will be loaded
# .zshrc last if an interactive shell.

# Cleanup
source "$ZDOTDIR/utils/clean-up.zsh"

# Local
if [ -f "$ZDOTDIR/.zprofile.local" ]; then
  source "$ZDOTDIR/.zprofile.local"
fi
