local TARGET="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting"
if [ ! -d "${TARGET}" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "${TARGET} not found, skipping initialization."
  return
fi

source "${TARGET}/zsh-syntax-highlighting.zsh"