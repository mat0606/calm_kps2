$ cd ~/
$ kubectl create serviceaccount jenkins
$ cat << EOF > jenkins-rb.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: default
  name: jenkins-rolebinding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: admin
subjects:
- kind: ServiceAccount
  name: jenkins
  namespace: default
EOF
$ kubectl create -f jenkins-rb.yaml
