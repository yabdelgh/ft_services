#!/bin/sh

openrc
touch /run/openrc/softlevel

rc-service telegraf start
status=$?
if [ $status -ne 0 ]; then
	echo "Failed to start vsftpd: $status"
	exit $status
fi

rc-service influxdb start
status=$?
if [ $status -ne 0 ]; then
	echo "Failed to start influxdb: $status"
	exit $status
fi

while true
do
	ps aux |grep [t]elegraf > /dev/null 2>&1
	PROCESS_1_STATUS=$?
	ps aux |grep [i]nfluxdb > /dev/null 2>&1
	PROCESS_2_STATUS=$?
	if [ $PROCESS_1_STATUS -ne 0 ]; then
		echo "telegraf has already exited."
		exit 1
	fi
	if [ $PROCESS_2_STATUS -ne 0 ]; then
		echo "influxdb has already exited."
		exit 1
	fi
	sleep 2
done

