FROM alpine:3.12

RUN apk update && apk upgrade

RUN	apk add mysql mysql-client

RUN apk add openrc \
&&  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf

COPY telegraf.conf etc/
COPY start.sh				/tmp

CMD ["/bin/sh" , "/tmp/start.sh"]
