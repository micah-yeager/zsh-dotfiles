local DOT_FILES_LOAD_TARGET="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting"
if [ ! -d "$DOT_FILES_LOAD_TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_ZSH_SYNTAX_HIGHLIGHTING" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_ZSH_SYNTAX_HIGHLIGHTING=true

source "$DOT_FILES_LOAD_TARGET/zsh-syntax-highlighting.zsh"
