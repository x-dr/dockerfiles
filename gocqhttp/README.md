
# go-cqhttp docker镜像


# 用法
### 初始化配置文件
```

docker run --rm -it \
           -v ${PWD}/gocqhttp_data:/data \
           --network=host \
           gindex/gocqhttp

```
> 初始化配置文件成功后，按下连续组合键 ctrl + C 退出

### 修改配置文件
```
vim gocqhttp_data/config.json
```

### 扫描二维码验证
```
docker run --rm -it \
           -v ${PWD}/gocqhttp_data:/data \
           --network=host \
           gindex/gocqhttp
```
> 扫描二维码验证成功后，按下连续组合键 ctrl + C 退出

### 启动
```
docker run -itd \
           -v ${PWD}/gocqhttp_data:/data \
           --name gocqhttp \
           --network=host \
           gindex/gocqhttp
```

### 检查log查看是否启动成功

```
docker logs gocqhttp
```

