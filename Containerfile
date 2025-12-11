FROM fedora:latest

RUN dnf install -y httpd 

RUN mkdir /structure \
    && chmod 777 /structure \
    && useradd collin

RUN echo "Containers are easy!" >> var/www/html/index.html 

USER sync
RUN mkdir /structure/sync-work 

USER nobody
RUN mkdir /structure/nobody-work

USER root
EXPOSE 80/tcp
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND

