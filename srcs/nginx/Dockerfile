FROM	alpine:3.12

RUN		apk update && apk add nginx

RUN		apk add openssl  \
&&  	openssl	req	-x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=yassine"

RUN apk add openrc \
&&  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf

COPY	telegraf.conf etc/
COPY	default.conf /etc/nginx/conf.d/
COPY	start.sh /tmp

CMD ["/bin/sh" , "/tmp/start.sh"]
