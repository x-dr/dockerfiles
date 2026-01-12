#!/bin/sh
set -e

# 如果存在 prestart.sh 脚本，先执行它
PRE_START_PATH=/app/prestart.sh
if [ -f "$PRE_START_PATH" ]; then
    echo "Running prestart script: $PRE_START_PATH"
    . "$PRE_START_PATH"
fi

# 如果 /app 目录下有 uwsgi.ini，使用它覆盖默认配置
if [ -f /app/uwsgi.ini ]; then
    cp /app/uwsgi.ini /etc/uwsgi/uwsgi.ini
fi

# 如果 /app 目录下有 nginx.conf，使用它覆盖默认配置
if [ -f /app/nginx.conf ]; then
    cp /app/nginx.conf /etc/nginx/http.d/app.conf
fi

# 启动 Supervisor（管理 Nginx 和 uWSGI）
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
