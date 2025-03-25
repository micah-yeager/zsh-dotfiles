if [ "$DOT_FILES_LOADED_FREEPORT" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "freeport already loaded, skipping initialization."
fi
export DOT_FILES_LOADED_FREEPORT=true

# free-port <port>
function freeport {
  readonly port=${1:?"Please specify a port."}

  lsof -i tcp:"$port" | grep LISTEN | awk '{print $2}'
}
alias fp="freeport"