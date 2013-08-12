from base

maintainer Alexandre Bulté

# https://github.com/dotcloud/docker/issues/1024
run dpkg-divert --local --rename --add /sbin/initctl
run ln -s /bin/true /sbin/initctl

# install mysql
run apt-get update
run echo "mysql-server-5.5 mysql-server/root_password password root4mysql" | debconf-set-selections
run echo "mysql-server-5.5 mysql-server/root_password_again password root4mysql" | debconf-set-selections
run apt-get install -y mysql-server

expose 3306

cmd ["mysqld"]