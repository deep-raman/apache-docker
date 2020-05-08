FROM debian:buster-slim
LABEL maintainer="batraman"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y apache2 libapache2-mod-php php-mysql php-gd php-xml php-intl && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/www/html/index.html 

COPY index.php /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
