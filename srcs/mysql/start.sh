#!/bin/sh

openrc
touch /run/openrc/softlevel

rc-service telegraf start
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start telegraf: $status"
    exit $status
fi

/etc/init.d/mariadb setup
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start
status=$?
if [ $status -ne 0 ]; then
	echo "Failed to start mysql: $status"
	exit $status
fi

mysql -u root -e "CREATE USER 'wordpress'@'' IDENTIFIED BY 'wordpress123';"
mysql -u root -e "CREATE DATABASE wordpress_db;"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress'@'';"
mysql -u root -e "FLUSH PRIVILEGES;"

while sleep 2; do
  ps aux |grep [t]elegraf > /dev/null 2>&1
  PROCESS_1_STATUS=$?
  ps aux |grep [m]ysql > /dev/null 2>&1
  PROCESS_2_STATUS=$?
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done

