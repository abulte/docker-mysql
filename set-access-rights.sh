/usr/sbin/mysqld &
sleep 5
echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root4mysql' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
