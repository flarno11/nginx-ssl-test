FROM centos:7

RUN yum install -y epel-release && yum install -y nginx

RUN openssl req -x509 -newkey rsa:4086 -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" -keyout "/etc/ssl/key.pem" -out "/etc/ssl/cert.pem" -days 3650 -nodes -sha256

ADD nginx.conf /etc/nginx.conf

EXPOSE 8080
EXPOSE 8443

VOLUME /var/lib/nginx/tmp

# the group 'users' with id 100 already exists
RUN useradd --system --uid 100 --gid 100 containeruser
RUN chown -R containeruser:users /var/lib/nginx

# needs to be numeric for Kubernetes runAsNonRoot to work
USER 100

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx.conf"]
