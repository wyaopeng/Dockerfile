from registry.cn-shanghai.aliyuncs.com/qianjian/nginx
#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
#设置环境变量
ENV LC_ALL en_US.utf8
add nginx.conf /etc/nginx/nginx.conf
add html/paas/res /data/html/paas/
add html/paas/shop-master /data/html/paas/
RUN chmod -R 755 /data/html/
CMD nginx -g "daemon off;"

