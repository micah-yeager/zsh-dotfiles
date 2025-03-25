local TARGET="$HOMEBREW_PREFIX/opt/libpq"
if [ ! -d "$TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_LIBPQ" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_LIBPQ=true

export PATH="$TARGET/bin:$PATH"