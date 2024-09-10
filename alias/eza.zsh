if ! type "eza" > /dev/null; then
	[ "$DOT_FILES_DEBUG" ] && echo "eza not found, skipping initialization."
	return
fi

alias ll="eza -l -g --icons"
alias ls="eza --icons"
alias la="eza -a --icons"
alias lt="eza --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"
