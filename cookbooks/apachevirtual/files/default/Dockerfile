FROM centos:7

# Install dependencies
RUN yum -y install httpd

# Install app
RUN rm -rf /var/www/*
ADD sites /etc/httpd/conf.d/
ADD sitedata /var/www/html/

# Configure apache
RUN chown -R apache:apache /var/www

EXPOSE 80 81
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
