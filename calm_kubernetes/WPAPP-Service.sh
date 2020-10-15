spec:
  type: NodePort
  ports:
    - protocol: TCP
      targetPort: 80
      name: wordpress
      port: 80
  selector:
    tier: frontend
    app: wordpress
metadata:
  labels:
    app: wordpress
  namespace: default
  name: wordpress
