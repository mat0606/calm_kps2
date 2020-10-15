spec:
  selector:
    matchLabels:
      tier: mysql
      app: wordpress
  replicas: '1'
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        tier: mysql
        app: wordpress
      namespace: default
      name: MYSQLAPP
    type: PROVISION_K8S_POD
    spec: {}
metadata:
  labels:
    app: wordpress
  namespace: default
  name: wordpress-mysql
