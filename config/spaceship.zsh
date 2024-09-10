local TARGET="$HOMEBREW_PREFIX/opt/spaceship"
if [ ! -d "${TARGET}" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "${TARGET} not found, skipping initialization."
  return
fi

source "${TARGET}/spaceship.zsh"

export SPACESHIP_GCLOUD_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_DOCKER_COMPOSE_SHOW=false
export SPACESHIP_GIT_STATUS_SHOW=false
