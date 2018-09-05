#!/bin/bash -e
yum install -y epel-release openssl-devel  pcre-devel GeoIP-devel libmp4v2-devel gperftools-devel gcc-c++ libpqxx-devel libxml2-devel libxslt-devel gd-devel perl-ExtUtils-Embed libatomic_ops-devel 
tar -axvf openresty_with_dependencies.tar.gz -C /usr/local/src/
cd /usr/local/src
tar axvf drizzle7-2011.07.21.tar.gz
cd drizzle7-2011.07.21
./configure --without-server
make libdrizzle-1.0
make install-libdrizzle-1.0
echo /usr/local/lib > /etc/ld.so.conf.d/local.conf
ldconfig
cd ../openresty
tar axvf openresty-1.13.6.2.tar.gz
cd openresty-1.13.6.2
./configure -j4 --user=nginx --group=nginx --without-select_module --with-http_iconv_module --with-http_drizzle_module --with-http_postgres_module --with-luajit --with-poll_module --with-threads --with-file-aio --with-http_v2_module --with-http_realip_module --with-http_addition_module --with-http_xslt_module --with-http_image_filter_module --with-http_geoip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_slice_module --with-http_stub_status_module --with-http_perl_module --with-mail --with-mail_ssl_module --with-stream --with-stream_ssl_module --with-google_perftools_module --with-pcre --with-pcre-jit --with-libatomic --add-module=../../ngx_http_substitutions_filter_module --with-openssl=../../openssl-1.1.0i
gmake
gmake install
