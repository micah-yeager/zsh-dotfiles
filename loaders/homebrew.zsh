local DOT_FILES_LOAD_TARGET="/opt/homebrew"
if [ ! -d "$DOT_FILES_LOAD_TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_HOMEBREW" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET already loaded, skipping initialization."
  return
fi
export DOT_FILES_LOADED_HOMEBREW=true

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Autocompletions
if type brew &>/dev/null; then
  FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"

  autoload -Uz compinit
  rm -f ~/.zcompdump; compinit -u
fi
