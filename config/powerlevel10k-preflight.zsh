if [ "$DOT_FILES_LOADED_POWERLEVEL10K_PREFLIGHT" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "powerlevel10k preflight already loaded, skipping initialization."
fi
export DOT_FILES_LOADED_POWERLEVEL10K_PREFLIGHT=true

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/dev/zsh-dotfiles/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi