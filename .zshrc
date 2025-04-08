# This file executes:
# - After .zprofile
# - Before .zlogin
# - Only if an interactive shell

# Preflight
source "$ZDOTDIR/utils/load.zsh"
dot-files-load zle
dot-files-load powerlevel10k-preflight

# Loaders
dot-files-load homebrew [ -d /opt/homebrew ]
dot-files-load zsh-syntax-highlighting [ -d "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting" ]

dot-files-load libpq [ -d "$HOMEBREW_PREFIX/opt/libpq" ]
dot-files-load neon [ -f "$HOMEBREW_PREFIX/bin/neon" ]
dot-files-load nvm [ -d "$HOME/.nvm" ]
dot-files-load pnpm [ -d "$HOME/Library/pnpm" ]
dot-files-load bun [ -f "$HOME/.bun/bin/bun" ]

dot-files-load powerlevel10k [ -d "$HOMEBREW_PREFIX/opt/powerlevel10k" ] # Keep this last

# Aliases
source "$ZDOTDIR/utils/alias.zsh"
dot-files-alias eza [ -f "$HOMEBREW_PREFIX/bin/eza" ]
dot-files-alias freeport
dot-files-alias kubectlgetall [ -f "$HOMEBREW_PREFIX/bin/kubectl" ]

# Cleanup
source "$ZDOTDIR/utils/clean-up.zsh"

# Local
if [ -f "$ZDOTDIR/.zshrc.local" ]; then
  source "$ZDOTDIR/.zshrc.local"
fi
