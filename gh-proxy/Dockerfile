# 使用本地构建的轻量级 Alpine 镜像
FROM gindex/uwsgi-nginx-flask-alpine:latest

LABEL maintainer="ookk" \
      description="GitHub Proxy Service" \
      version="1.0"

# 设置环境变量
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# 安装依赖（单独层，利用缓存）
RUN pip install --no-cache-dir flask requests

# 设置工作目录
WORKDIR /app

# 复制应用代码
COPY ./app/ /app/

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:80/health || exit 1

EXPOSE 80

CMD ["/start.sh"]


