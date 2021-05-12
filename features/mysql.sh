#!/bin/bash

# install mysql
apt-get install --yes mysql-server

# configure mysql (as in mysql_secure_installation)
mysql --user=root <<EOF
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
EOF
