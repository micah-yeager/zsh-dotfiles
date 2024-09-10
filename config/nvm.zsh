local TARGET="$HOME/.nvm"
if [ ! -d "${TARGET}" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "${TARGET} not found, skipping initialization."
  return
fi

export NVM_DIR="${TARGET}"

[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion