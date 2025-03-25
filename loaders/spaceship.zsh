local DOT_FILES_LOAD_TARGET="$HOMEBREW_PREFIX/opt/spaceship"
if [ ! -d "$DOT_FILES_LOAD_TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_SPACESHIP" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_SPACESHIP=true

source "$DOT_FILES_LOAD_TARGET/spaceship.zsh"
source "$ZDOTDIR/configs/spaceship.zsh"
