from base

maintainer Alexandre Bulté

#install mysql

run apt-get update
run apt-get install -y mysql-server

expose 3306

cmd ["service", "mysql", "start"]