# uwsgi-nginx-flask:python3.11-alpine
# 轻量级 Python Flask + uWSGI + Nginx 基础镜像
FROM python:3.11-alpine

LABEL maintainer="x-dr" \
      description="Lightweight uWSGI + Nginx + Flask base image" \
      version="python3.11-alpine"

# 安装运行时依赖
RUN apk add --no-cache \
    nginx \
    supervisor \
    pcre \
    mailcap \
    && rm -rf /var/cache/apk/*

# 安装构建依赖并编译 uWSGI
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    linux-headers \
    pcre-dev \
    && pip install --no-cache-dir uwsgi \
    && apk del .build-deps \
    && rm -rf /root/.cache

# 创建必要目录
RUN mkdir -p /app /run/nginx /var/log/supervisor

# 配置 Nginx
RUN rm -f /etc/nginx/http.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/http.d/app.conf

# 配置 Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 配置 uWSGI
COPY uwsgi.ini /etc/uwsgi/uwsgi.ini

# 启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /app

EXPOSE 80

CMD ["/start.sh"]
