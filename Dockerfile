FROM php:5.6-apache

RUN apt-get update
RUN apt-get install -y \
        openssh-client \
        openssh-server \
        libmcrypt-dev \
        libjpeg-dev \
        libpng12-dev
RUN apt-get install -y libfreetype6-dev
RUN docker-php-ext-install json mcrypt pdo_mysql mbstring


RUN apt-get update && apt-get install -y libmagickwand-6.q16-dev --no-install-recommends \
&& ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin \
&& pecl install imagick \
&& echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

RUN apt-get update \
&& apt-get install -y libfreetype6-dev \
&& docker-php-ext-configure gd --with-freetype-dir=/usr \
&& docker-php-ext-install gd \
&& echo "extension=gd.so" > /usr/local/etc/php/conf.d/ext-gd.ini

RUN apt-get install -y \
        vim \
        wget

RUN apt-get install -y net-tools
RUN apt-get install -y mysql-client

ADD ./src/craft /var/www/craft/
ADD ./src/public /var/www/html/

ADD ./src/apache/plazm /etc/apache2/sites-available/plazm.conf
ADD ./src/apache/dev-start.sh /var/www/dev-start.sh
ADD ./src/apache/env.sh /var/www/env.sh
ADD ./src/apache/start.sh /var/www/start.sh

RUN a2ensite plazm
RUN a2enmod rewrite
RUN usermod -u 1000 www-data
RUN chown www-data -R /var/www/craft

COPY src/apache/php.ini /usr/local/etc/php/php.ini

EXPOSE 80

WORKDIR /var/www

CMD []
ENTRYPOINT ["./start.sh"]