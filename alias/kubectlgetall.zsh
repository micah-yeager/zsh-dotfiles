if ! type "kubectl" > /dev/null; then
  [ "$DOT_FILES_DEBUG" ] && echo "kubectl not found, skipping initialization."
  return
fi

# Get all all resources across all namespaces.
function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}
alias kga="kubectlgetall"
