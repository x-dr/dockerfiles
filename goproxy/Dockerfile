FROM alpine:latest
LABEL maintainer="ookk"


RUN set -xe && \
    UNAME=$(uname -m) \
    && if [ "$UNAME" = "x86_64" ]; then export PLATFORM=amd64 ; else export PLATFORM=arm64-v8 ; fi  \
    && apk add --no-cache tzdata  \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/shanghai" > /etc/timezone \
    && apk del tzdata  \
    && wget https://github.com/snail007/goproxy/releases/download/v${VERSION}/proxy-linux-${PLATFORM}.tar.gz  \
    && tar -xvf proxy-linux-${PLATFORM}.tar.gz  \
    && rm -rf proxy-linux-${PLATFORM}.tar.gz /var/cache/apk/*

CMD ["/proxy"]


