# free-port <port>
function freeport {
  readonly port=${1:?"Please specify a port."}

  lsof -i tcp:"$port" | grep LISTEN | awk '{print $2}'
}
alias fp="freeport"