from base

maintainer Alexandre Bulté "alexandre@bulte.net"

# https://github.com/dotcloud/docker/issues/1024
run dpkg-divert --local --rename --add /sbin/initctl
run ln -s /bin/true /sbin/initctl

# install mysql
run apt-get update
run DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# not only localhost
run sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./set-access-rights.sh /tmp/set-access-rights.sh
RUN /bin/sh /tmp/set-access-rights.sh

expose 3306

CMD ["/usr/sbin/mysqld"]
