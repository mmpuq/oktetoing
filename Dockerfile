FROM alpine:latest
RUN apk add --no-cache --virtual .build-deps ca-certificates nginx curl wget unzip git nginx

#同步系统时间
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN apk del tzdata

RUN mkdir /run/nginx
ADD default.conf /etc/nginx/conf.d/default.conf

RUN git clone https://github.com/xiongbao/we.dog
RUN mv we.dog/* /var/lib/nginx/html/
RUN rm -rf /we.dog
#ADD index.html /var/lib/nginx/html/index.html
ADD ks.txt /var/lib/nginx/html/ks.txt
ADD index.html /var/lib/nginx/html/index.html
ADD style.css /var/lib/nginx/html/style.css
ADD video.php /var/lib/nginx/html/video.php


ADD dearest /dearest
ADD base.txt /base.txt
ADD maxtcaddy.sh /maxtcaddy.sh
RUN chmod 755 /dearest
RUN chmod +x /maxtcaddy.sh
EXPOSE 3000 80
ENTRYPOINT ["/maxtcaddy.sh"]
