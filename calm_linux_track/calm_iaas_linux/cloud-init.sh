#cloud-config
users:
  - name: centos
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
chpasswd:
  list: |
    centos:@@{vm_password}@@
  expire: False
ssh_pwauth:   true
