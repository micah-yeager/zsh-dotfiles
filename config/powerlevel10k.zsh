local TARGET="$HOMEBREW_PREFIX/opt/powerlevel10k"
if [ ! -d "$TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_POWERLEVEL10K" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET already loaded, skipping initialization."
fi
export DOT_FILES_LOADED_POWERLEVEL10K=true

source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

source "$ZDOTDIR/config/powerlevel10k-config.zsh"
