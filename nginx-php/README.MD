### 启动
```
docker run -itd \
           -v path:/usr/share/nginx/html \
           --name nginx-php \
           -p 8080:80 \
           --restart=always \
           gindex/nginx-php
```

> `path` 是运行的目录