local DOT_FILES_LOAD_TARGET="$HOMEBREW_PREFIX/opt/libpq"
if [ ! -d "$DOT_FILES_LOAD_TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_LIBPQ" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_LIBPQ=true

export PATH="$DOT_FILES_LOAD_TARGET/bin:$PATH"