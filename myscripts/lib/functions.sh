# my centralized Functions

KUBECTLOPTIONS=${KUBECTLOPTIONS:-"--insecure-skip-tls-verify"}
KUBECTL="kubectl ${KUBECTLOPTIONS}"

function kubeconfig(){
  KUBECONFIG="${KUBECONFIG:-XX}"
  if [ ! -d ~/.kube ] || [ "${KUBECONFIG}" != "XX" ]; then
    echo "look Howto to set configuration for kubectl" >&2
    echo "Work with export or $HOME/.kube"
    exit 2
  fi
}
