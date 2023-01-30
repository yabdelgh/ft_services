FROM alpine:3.12

RUN apk update && apk upgrade \
&&  apk add nginx  openrc


RUN apk add php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap	\
	php7-ctype php7-dom php7-session php7-mbstring

RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz \
&&	tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz \
&&	rm phpMyAdmin-5.1.0-all-languages.tar.gz \
&&	mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin

RUN  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf

COPY telegraf.conf etc/
COPY default.conf   /etc/nginx/conf.d/
COPY start.sh       /tmp
COPY config.inc.php /var/www/phpmyadmin

EXPOSE 5000

CMD ["/bin/sh" , "/tmp/start.sh"]
