FROM alpine:3.12

RUN apk update && apk upgrade \
&&	apk add nginx  openrc

RUN apk add php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN wget https://wordpress.org/latest.tar.gz \
&&	tar -xzvf latest.tar.gz	\
&&	rm latest.tar.gz \
&&	mv wordpress /var/www/wordpress 

RUN chown -R nginx:nginx /var/www/

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf

COPY telegraf.conf etc/
COPY wp-config.php	/var/www/wordpress
COPY start.sh		/tmp
COPY default.conf	/etc/nginx/conf.d/

EXPOSE 5050

CMD ["/bin/sh" , "/tmp/start.sh"]
