FROM alpine:latest
LABEL maintainer="ookk"

ARG VERSION

RUN set -xe && \
    UNAME=$(uname -m) \
    && if [ "$UNAME" = "x86_64" ]; then export PLATFORM=amd64 ; else export PLATFORM=arm64 ; fi  \
    && apk add --no-cache tzdata  \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/shanghai" > /etc/timezone \
    && apk del tzdata  \
    && wget https://github.com/pufferffish/wireproxy/releases/download/v${VERSION}/wireproxy_linux_${PLATFORM}.tar.gz   \
    && tar -xvf wireproxy_linux_${PLATFORM}.tar.gz  \
    && mv wireproxy /usr/bin/wireproxy \
    && rm -rf wireproxy_linux_${PLATFORM}.tar.gz /var/cache/apk/*

WORKDIR /app    

CMD ["/usr/bin/wireproxy","-c","/app/proxy.conf"]



# docker run -it --rm  --name wireproxy  -v $PWD/test:/app wireproxy:latest