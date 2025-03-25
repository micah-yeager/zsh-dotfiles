local TARGET="$HOME/Library/pnpm"
if [ ! -d "$TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_PNPM" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_PNPM=true

export PNPM_HOME="$TARGET"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac