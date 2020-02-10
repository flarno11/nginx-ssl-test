FROM centos:7

RUN yum install -y epel-release && yum install -y nginx

RUN openssl req -x509 -newkey rsa:4086 -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" -keyout "/etc/ssl/key.pem" -out "/etc/ssl/cert.pem" -days 3650 -nodes -sha256

ADD nginx.conf /etc/nginx.conf

# default logfile is used before the config is read
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 8080
EXPOSE 8443

VOLUME /var/lib/nginx/tmp

# needs to be numeric for Kubernetes runAsNonRoot to work
# 999: UID of nginx user
USER 999

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx.conf"]
