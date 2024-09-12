local TARGET="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting"
if [ ! -d "$TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_ZSH_SYNTAX_HIGHLIGHTING" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET already loaded, skipping initialization."
fi
export DOT_FILES_LOADED_ZSH_SYNTAX_HIGHLIGHTING=true

source "$TARGET/zsh-syntax-highlighting.zsh"