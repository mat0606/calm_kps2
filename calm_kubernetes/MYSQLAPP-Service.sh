spec:
  type: ClusterIP
  ports:
    - protocol: TCP
      targetPort: 3306
      name: mysql
      port: 3306
  selector:
    tier: mysql
    app: wordpress
metadata:
  labels:
    app: wordpress
  namespace: default
  name: wordpress-mysql
