FROM alpine:latest
LABEL maintainer="ookk"

ARG VERSION

RUN set -xe && \
    UNAME=$(uname -m) \
    && if [ "$UNAME" = "x86_64" ]; then export PLATFORM=amd64 ; else export PLATFORM=arm64 ; fi  \
    && apk add --no-cache  curl ffmpeg tzdata  \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/shanghai" > /etc/timezone \
    && apk del tzdata  \
    && wget https://github.com/Mrs4s/go-cqhttp/releases/download/v${VERSION}/go-cqhttp_linux_${PLATFORM}.tar.gz \
    && tar -xvf go-cqhttp_linux_${PLATFORM}.tar.gz  \
    && mv go-cqhttp /usr/bin/cqhttp \
    && rm -rf go-cqhttp_linux_${PLATFORM}.tar.gz /var/cache/apk/*


WORKDIR /data

# ENTRYPOINT ["/usr/bin/cqhttp"]
CMD [ "/usr/bin/cqhttp" ]
