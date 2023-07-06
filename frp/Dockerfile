FROM alpine:latest

LABEL maintainer="ookkaha <ookkaha@gmail.com>"

# ENV VERSION 0.38.0
ARG VERSION
ENV FRP_RUN='frps'

WORKDIR /app

ADD . /app/ 



RUN apk update -f \
    && apk upgrade \
    && apk --no-cache add -f tzdata \
    && mkdir -p /frps/logs \
    && mkdir -p /frps/config \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/cache/apk/* \
    && cd /app \
    &&  if [ "$(uname -m)" = "x86_64" ]; then export PLATFORM=amd64 ; else if [ "$(uname -m)" = "aarch64" ]; then export PLATFORM=arm64 ; fi fi  \
	&& wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${PLATFORM}.tar.gz \ 
	&& tar zxvf frp_${VERSION}_linux_${PLATFORM}.tar.gz  \
	&& cd frp_${VERSION}_linux_${PLATFORM} \
    &&  cp frps /app/ \
    &&  cp frpc /app/ \
    &&  cd /app \
    &&  rm frp_${VERSION}_linux_${PLATFORM}.tar.gz \
    &&  rm -rf frp_${VERSION}_linux_${PLATFORM}/  \
    &&  chmod +x frps \
    &&  chmod +x docker-entrypoint.sh 

# EXPOSE 8080


# CMD ["./docker-entrypoint.sh"]
ENTRYPOINT [ "./docker-entrypoint.sh" ]
# ENTRYPOINT /app/frps -c /app/frps.ini