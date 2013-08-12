from base

maintainer Alexandre Bulté "alexandre@bulte.net"

# https://github.com/dotcloud/docker/issues/1024
run dpkg-divert --local --rename --add /sbin/initctl
run ln -s /bin/true /sbin/initctl

# install mysql
run apt-get update
run apt-get install -y mysql-server

# not only localhost
run sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# access rights
run echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root4mysql' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
run sleep 5

expose 3306

CMD ["/usr/sbin/mysqld"]