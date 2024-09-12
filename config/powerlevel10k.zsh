local TARGET="$HOMEBREW_PREFIX/opt/powerlevel10k"
if [ ! -d "$TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
fi

source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

source "$ZDOTDIR/config/powerlevel10k-config.zsh"
