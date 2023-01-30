FROM	alpine:3.12

RUN		apk update && apk add vsftpd

RUN apk add openrc \
&&  echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&&  apk add telegraf \
&&  mkdir -p etc/telegraf



RUN	apk add openssl  \
&&  openssl	req	-x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=yassine"

RUN echo -e "yassine\nyassine" | adduser yassine \
&& echo "yassine" | tee -a /etc/vsftpd.userlist

COPY telegraf.conf etc/
COPY vsftpd.conf etc/vsftpd/
COPY start.sh	/tmp

CMD ["/bin/sh" , "/tmp/start.sh"]
