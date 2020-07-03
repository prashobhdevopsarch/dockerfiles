FROM centos:7
RUN \ 
  yum -y install \
    php \
    php-mysql \
    httpd   
RUN \ 
  yum -y install \
    mod_ssl \
    openssl 

RUN echo "<?php phpinfo(); ?>" > /var/www/html/test.php 
COPY docker.crt /docker.crt
COPY docker.key /docker.key
COPY ssl.conf /etc/httpd/conf.d/default.conf 
CMD apachectl -DFOREGROUND

