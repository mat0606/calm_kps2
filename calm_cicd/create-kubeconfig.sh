sed "s/    token:.*/    token: `kubectl get secrets $(kubectl get serviceaccounts jenkins -o jsonpath={.secrets[].name}) -o jsonpath={.data.token} | base64 --decode`/g" ~/.kube/config
