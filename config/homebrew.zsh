# Pre-flight checks
if [ ! -d "/opt/homebrew" ]; then
  # Always print this if missing, don't defer to DOT_FILES_DEBUG.
  echo "\033[0;31mCannot find the Homebrew installation. It can be installed via https://brew.sh/\033[0m" >&2
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
