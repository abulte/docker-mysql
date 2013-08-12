from base

maintainer Alexandre Bulté "alexandre@bulte.net"

# https://github.com/dotcloud/docker/issues/1024
run dpkg-divert --local --rename --add /sbin/initctl
run ln -s /bin/true /sbin/initctl

# install mysql
run apt-get update
run echo "mysql-server-5.5 mysql-server/root_password password root4mysql" | debconf-set-selections
run echo "mysql-server-5.5 mysql-server/root_password_again password root4mysql" | debconf-set-selections
run apt-get install -y mysql-server

# not only localhost
run sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

expose 3306

CMD ["/usr/bin/mysqld_safe", "&"]