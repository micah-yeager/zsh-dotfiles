export NVM_DIR="$HOME/.nvm"
if [ ! -d "${NVM_DIR}" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "nvm not found, skipping initialization."
  return
fi

[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion