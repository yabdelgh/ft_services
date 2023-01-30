FROM alpine:3.12

RUN apk update \
&&	echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&	apk add telegraf \
&&	mkdir -p etc/telegraf

COPY telegraf.conf etc/telegraf/telegraf.conf

CMD ["telegraf"]
