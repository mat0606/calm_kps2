name: wordpress
env:
  - name: WORDPRESS_DB_HOST
    value: '@@{MYSQLK8sPublishedService.name}@@'
  - name: WORDPRESS_DB_PASSWORD
    value: '@@{MYSQL_PASSWORD}@@'
ports:
  - containerPort: 80
    name: wordpress
image: 'wordpress:4.8-apache'
