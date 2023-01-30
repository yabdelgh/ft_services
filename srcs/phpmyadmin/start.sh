#!/bin/sh

openrc
touch /run/openrc/softlevel

rc-service nginx start
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start nginx: $status"
    exit $status
fi

rc-service telegraf start
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start telegraf: $status"
    exit $status
fi

rc-service php-fpm7 start
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start php7.3-fpm: $status"
    exit $status
fi

while sleep 2; do
  ps aux |grep [n]ginx > /dev/null 2>&1
  PROCESS_1_STATUS=$?
  ps aux |grep [t]elegraf > /dev/null 2>&1
  PROCESS_2_STATUS=$?
  ps aux |grep [p]hp-fpm > /dev/null 2>&1
  PROCESS_3_STATUS=$?
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    echo "nginx has already exited."
    exit 1
  fi
  if [ $PROCESS_2_STATUS -ne 0 ]; then
    echo "telegraf has already exited."
    exit 1
  fi
  if [ $PROCESS_3_STATUS -ne 0 ]; then
    echo "php-fpm has already exited."
    exit 1
  fi
done


