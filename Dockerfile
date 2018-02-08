FROM centos:7

RUN yum install -y epel-release && yum install -y nginx

ADD nginx.conf /etc/nginx.conf

RUN openssl req -x509 -newkey rsa:4086 -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" -keyout "/etc/ssl/key.pem" -out "/etc/ssl/cert.pem" -days 3650 -nodes -sha256

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx.conf"]
