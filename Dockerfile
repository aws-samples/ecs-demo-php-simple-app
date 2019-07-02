FROM amazonlinux:2

# Install dependencies
RUN yum install -y \
    curl \
    httpd \
    php \
 && ln -s /usr/sbin/httpd /usr/sbin/apache2

# Install app
RUN rm -rf /var/www/html/* && mkdir -p /var/www/html
ADD src /var/www/html

# Configure apache
RUN chown -R apache:apache /var/www
ENV APACHE_RUN_USER apache
ENV APACHE_RUN_GROUP apache
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
