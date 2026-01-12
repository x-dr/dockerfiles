# uwsgi-nginx-flask:python3.11-alpine

轻量级的 Python Flask + uWSGI + Nginx 基础镜像，基于 Alpine Linux。

## 特性

- 🐍 Python 3.11
- 🏔️ Alpine Linux（镜像体积小）
- 🚀 uWSGI 应用服务器
- 🌐 Nginx 反向代理
- 📦 Supervisor 进程管理

## 构建

```bash
docker build -t uwsgi-nginx-flask:python3.11-alpine .
```

## 使用

在你的 Dockerfile 中：

```dockerfile
FROM uwsgi-nginx-flask:python3.11-alpine

# 安装依赖
RUN pip install --no-cache-dir flask requests

# 复制应用
COPY ./app /app

EXPOSE 80
CMD ["/start.sh"]
```

## 目录结构

应用代码放在 `/app` 目录下，入口文件为 `main.py`，Flask 应用实例名为 `app`：

```python
# /app/main.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello World!'
```

## 自定义配置

- **uWSGI 配置**: 放置 `uwsgi.ini` 到 `/app/uwsgi.ini`
- **Nginx 配置**: 放置 `nginx.conf` 到 `/app/nginx.conf`
- **启动脚本**: 放置 `prestart.sh` 到 `/app/prestart.sh`（用于数据库迁移等）

## 环境变量

可通过环境变量自定义配置（需在应用中读取）。
