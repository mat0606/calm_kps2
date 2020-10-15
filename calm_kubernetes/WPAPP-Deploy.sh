spec:
  selector:
    matchLabels:
      tier: frontend
      app: wordpress
  replicas: '1'
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        tier: frontend
        app: wordpress
      namespace: default
      name: WORDPRESSAPP
    type: PROVISION_K8S_POD
    spec: {}
metadata:
  labels:
    app: wordpress
  namespace: default
  name: wordpress
