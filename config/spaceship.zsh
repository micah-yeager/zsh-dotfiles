local SPACESHIP_OPT="$HOMEBREW_PREFIX/opt/spaceship"
if [ ! -d "$SPACESHIP_OPT" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$SPACESHIP_OPT not found, skipping initialization."
  return
fi

source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$SPACESHIP_OPT/spaceship.zsh"

export SPACESHIP_GCLOUD_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_DOCKER_COMPOSE_SHOW=false
export SPACESHIP_GIT_STATUS_SHOW=false
