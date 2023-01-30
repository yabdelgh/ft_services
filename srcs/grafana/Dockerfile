FROM alpine:3.12
 
RUN apk add libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz \
    && tar -zxvf grafana-7.4.1.linux-amd64.tar.gz \
    && rm -rf grafana-7.4.1.linux-amd64.tar.gz 

RUN apk add openrc \
&&  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf


COPY grafana.db /grafana-7.4.1/data/
COPY telegraf.conf etc/
COPY start.sh /tmp

CMD ["/bin/sh" , "/tmp/start.sh"]
