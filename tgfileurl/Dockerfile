FROM python:3.8.13-alpine3.15

ARG VERSION

WORKDIR /app


RUN apk add --no-cache --update gcc  git   \  
    && git clone https://github.com/EverythingSuckz/TG-FileStreamBot.git /app \                        
    && pip3 install  -r /app/requirements.txt \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone 

COPY . .

RUN chmod +x start.sh 


# Run the app
CMD ["python3","-m","WebStreamer"]



