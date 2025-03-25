local DOT_FILES_LOAD_TARGET="$HOME/.oh-my-zsh"
if [ ! -d "$DOT_FILES_LOAD_TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_OH_MY_ZSH" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_OH_MY_ZSH=true

source "$ZDOTDIR/configs/oh-my-zsh.zsh"
