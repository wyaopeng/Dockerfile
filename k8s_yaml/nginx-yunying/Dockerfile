from nginx
#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
#设置环境变量
ENV LC_ALL C.UTF-8
add nginx.conf /etc/nginx/nginx.conf
copy ./html /data/html/
workdir /etc/nginx/conf.d
CMD nginx -g "daemon off;"

