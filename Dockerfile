FROM ubuntu:17.10

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl apache2 php7.1 libapache2-mod-php7.1 php7.1-mcrypt php7.1-mysql

# Install app
RUN rm -rf /var/www/*
ADD src /var/www

# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
