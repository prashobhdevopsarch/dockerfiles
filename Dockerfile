FROM centos

RUN yum -y install httpd mariadb-server mariadb php php-fpm php-mysqlnd php-opcache php-gd php-xml php-mbstring
COPY usebiller /var/www/html
RUN echo "<?php phpinfo(); ?>" > /var/www/html/test.php
CMD apachectl php-fpm mariadb  -DFOREGROUND
