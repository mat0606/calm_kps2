name: mysql
env:
  - name: MYSQL_ROOT_PASSWORD
    value: '@@{MYSQL_PASSWORD}@@'
ports:
  - containerPort: 3306
    name: mysql
image: 'mysql:5.6'
imagePullPolicy: Always
