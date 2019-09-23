from centos
#定义时区参数
ENV TZ=Asia/Shanghai

#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
#设置环境变量
ENV LC_ALL en_US.utf8
run yum install epel-release -y
run yum install gcc-c++ pcre pcre-devel zlib zlib-devel openssl lua lua-socket lua-devel lua-socket-devel lua-static luajit* openssl-devel perl-devel perl-ExtUtils-Embed -y
copy nginx-1.14.0 /usr/local/src/nginx-1.14.0
add install.sh /usr/local/src/nginx-1.14.0/
add echo-nginx-module-0.61.tar.gz /usr/local/
add lua-nginx-module-0.10.12rc2.tar.gz /usr/local/
add redis2-nginx-module-0.15rc1.tar.gz /usr/local/
add set-misc-nginx-module-0.32rc1.tar.gz /usr/local/
add ngx_devel_kit-0.3.1rc1.tar.gz /usr/local/
add lua.tar.gz /usr/local/
add nginx.conf /usr/local/
workdir /usr/local/nginx/sbin/
CMD /usr/local/src/nginx-1.14.0/install.sh

