#!/bin/sh

openrc
touch /run/openrc/softlevel

rc-service telegraf start
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start telegraf: $status"
    exit $status
fi

cd /grafana-7.4.1/bin/ && ./grafana-server
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start grafana: $status"
    exit $status
fi


while true
do
    ps aux |grep [t]elegraf > /dev/null 2>&1
    PROCESS_1_STATUS=$?
	ps aux |grep [g]rafana > /dev/null 2>&1
    PROCESS_2_STATUS=$?
    if [ $PROCESS_1_STATUS -ne 0 ]; then
        echo "telegraf has already exited."
        exit 1
    fi
    if [ $PROCESS_2_STATUS -ne 0 ]; then
        echo "grafana has already exited."
        exit 1
    fi
    sleep 2
done

