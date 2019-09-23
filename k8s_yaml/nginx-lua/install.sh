yum install gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel perl-devel perl-ExtUtils-Embed -y &&
cd /usr/local/src/nginx-1.14.0 &&
./configure --prefix=/usr/local/nginx --with-http_gzip_static_module --with-http_stub_status_module --with-http_ssl_module --with-file-aio --with-http_realip_module --with-pcre --add-module=/usr/local/echo-nginx-module-0.61 --add-module=/usr/local/redis2-nginx-module-0.15rc1 --add-module=/usr/local/lua-nginx-module-0.10.12rc2 --add-module=/usr/local/ngx_devel_kit-0.3.1rc1 --add-module=/usr/local/set-misc-nginx-module-0.32rc1 &&
make && make install &&
\cp /usr/local/nginx.conf /usr/local/nginx/conf/nginx.conf &&
\cp -r /usr/local/lua /usr/local/nginx/ &&
cd /usr/local/nginx/lua/lua-redis-parser-0.13 && make && make install &&
cd /usr/local/nginx/lua/lua-resty-redis-0.26 && make && make install &&
cp -R /usr/local/lib/lua /usr/lib64/
mkdir -p /data/logs/nginx/ &&
chmod -R 755 /usr/local/nginx/
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf -g "daemon off;"
