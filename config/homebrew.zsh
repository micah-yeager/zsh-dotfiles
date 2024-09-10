TARGET="/opt/homebrew"
if [ ! -d "$TARGET" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
fi

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Autocompletions
if type brew &>/dev/null; then
  FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"

  autoload -Uz compinit
  rm -f ~/.zcompdump; compinit -u
fi
