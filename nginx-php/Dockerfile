ARG VERSION

FROM alpine:${VERSION}

WORKDIR /var/www/html

ADD init.sh /
# Install packages and remove default server definition
RUN set -ex  && \
    apk update && \
    apk add --no-cache \
    curl \
    nginx \
    php81 \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-fpm \
    php81-gd \
    php81-intl \
    php81-mbstring \
    php81-mysqli \
    php81-opcache \
    php81-openssl \
    php81-phar \
    php81-session \
    php81-xml \
    php81-xmlreader \
    supervisor \
    tzdata \
    bash  && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/shanghai" > /etc/timezone && \
    chmod a+x /init.sh  &&\
    rm -rf /var/cache/apk/*



COPY index.php /var/www/html/
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY php_set_jit.ini /etc/php8/conf.d/00_jit.ini
COPY php_set_timezone.ini /etc/php81/conf.d/custom.ini

EXPOSE 80


ENTRYPOINT [ "/init.sh" ]


