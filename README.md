Build:

    docker build -t flarno11/nginx-ssl-test .

Run:

    docker run -d --name nginx-ssl-test --read-only -p 8080:8080 -p 8443:8443 -v $PWD/tmp:/var/lib/nginx/tmp flarno11/nginx-ssl-test

Run interactively:

    docker run --rm -it --name nginx-ssl-test --read-only -p 8080:8080 -p 8443:8443 -v $PWD/tmp:/var/lib/nginx/tmp flarno11/nginx-ssl-test bash

    nginx -g "daemon off;" -c /etc/nginx.conf
