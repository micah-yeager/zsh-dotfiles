# Positional parameters:
# - 1: The name of the alias to use (required).
# - 2+: A conditional (or string) to evaluate whether to use the alias (optional).
# Example: dot-files-alias homebrew [ -d /opt/homebrew ]
# TODO: allow using exit code instead of conditional.
function dot-files-alias {
  local name="${1:?Alias name not provided}"
  local exported="DOT_FILES_ALIASED_${name//-/_}"
  local loader="$ZDOTDIR/aliases/${name}.zsh"
  local tester=${@[@]:2}

  # Skip loading if already loaded.
  if ! eval "${tester:-true}"; then
    [ "$DOT_FILES_DEBUG" ] && echo "\033[93m\033[1m$name:\033[22m '$tester' returned false, skipping initialization.\033[0m"
    return
  elif [ "${(P)exported}" ]; then
    [ "$DOT_FILES_DEBUG" ] && echo "\033[34m\033[1m$name:\033[22m already aliased, skipping initialization.\033[0m"
    return
  fi

  # Otherwise, execute the loader.
  echo "\033[37m\033[1m$name:\033[22m aliasing...\033[0m"
  source "$loader"
  export "$exported"=true
  echo "\033[37m\033[1m$name:\033[22m finished aliasing.\033[0m"
}
