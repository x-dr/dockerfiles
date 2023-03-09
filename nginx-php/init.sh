#!/usr/bin/env bash

msg() {
    echo -E "$1"
}

msg "Set permission for caching..."

chmod -R 755 /usr/share/nginx/html/*

msg "Start supervisord..."
supervisord -c /etc/supervisor/conf.d/supervisord.conf