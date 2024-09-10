local TARGET="eza"
if ! type "$TARGET" > /dev/null; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
fi

alias ll="$TARGET -l -g --icons"
alias ls="$TARGET --icons"
alias la="$TARGET -a --icons"
alias lt="$TARGET --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"
