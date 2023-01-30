FROM alpine:3.12

RUN apk add --no-cache influxdb

RUN apk add openrc \
&&  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf

COPY telegraf.conf etc/
COPY influxdb.conf etc/influxdb.conf
COPY start.sh	/tmp

CMD ["/bin/sh" , "/tmp/start.sh"]
