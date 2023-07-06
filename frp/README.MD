### build
```shell
docker build -t frps .
```
> [Docker 镜像](https://hub.docker.com/repository/docker/gindex/frp)
### frps
```shell
docker run -itd --net=host  --name frps -v $PWD/frp/config:/frp/config -v $PWD/frp/logs:/frp/logs gindex/frp
```

### frpc
```shell
docker run -itd --net=host  --name frpc -v $PWD/frpc/config:/frp/config -v $PWD/frpc/logs:/frp/logs -e FRP_RUN=frpc gindex/frp