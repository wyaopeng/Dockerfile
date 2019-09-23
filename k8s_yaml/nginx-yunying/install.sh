./configure --prefix=/usr/local/nginx --with-http_gzip_static_module --with-http_stub_status_module --with-http_ssl_module --with-file-aio --with-http_realip_module --add-module=/usr/local/echo-nginx-module-0.61 --add-module=/usr/local/redis2-nginx-module-0.15rc1 --add-module=/usr/local/lua-nginx-module-0.10.12rc2 --add-module=/usr/local/ngx_devel_kit-0.3.1rc1 --add-module=/usr/local/set-misc-nginx-module-0.32rc1 &&
make && make install &&
\cp /usr/local/nginx.conf /usr/local/nginx/conf/nginx.conf &&
\cp -r /usr/local/vhosts /usr/local/nginx/conf/ &&
\cp -r /usr/local/lua /usr/local/nginx/ &&
mkdir -p /data/logs/nginx/ &&
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf -g "daemon off;"
