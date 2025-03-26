# Positional parameters:
# - 1: The name of the loader to use (required).
# - 2+: A conditional (or string) to evaluate whether to use the loader (optional).
# Example: dot-files-alias homebrew [ -d /opt/homebrew ]
# TODO: allow using exit code instead of conditional.
function dot-files-load {
  local name="${1:?Loader name not provided}"
  local exported="DOT_FILES_LOADED_${name//-/_}"
  local loader="$ZDOTDIR/loaders/${name}.zsh"
  local tester=${@[@]:2}

  # Skip loading if already loaded.
  if ! eval "${tester:-true}"; then
    [ "$DOT_FILES_DEBUG" ] && echo "\033[93m\033[1m$name:\033[22m '$tester' returned false, skipping initialization.\033[0m"
    return
  elif [ "${(P)exported}" ]; then
    [ "$DOT_FILES_DEBUG" ] && echo "\033[34m\033[1m$name:\033[22m already loaded, skipping initialization.\033[0m"
    return
  fi

  # Otherwise, execute the loader.
  [ "$DOT_FILES_DEBUG" ] && echo "\033[37m\033[1m$name:\033[22m loading...\033[0m"
  source "$loader"
  export "$exported"=true
  [ "$DOT_FILES_DEBUG" ] && echo "\033[37m\033[1m$name:\033[22m finished loading.\033[0m"
}
