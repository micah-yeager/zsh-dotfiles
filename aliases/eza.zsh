local DOT_FILES_LOAD_TARGET="eza"
if ! type "$DOT_FILES_LOAD_TARGET" > /dev/null; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_EZA" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$DOT_FILES_LOAD_TARGET already loaded, skipping initialization."
fi
export DOT_FILES_LOADED_EZA=true

alias ll="$DOT_FILES_LOAD_TARGET -l -g --icons"
alias ls="$DOT_FILES_LOAD_TARGET --icons"
alias la="$DOT_FILES_LOAD_TARGET -a --icons"
alias lt="$DOT_FILES_LOAD_TARGET --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"
