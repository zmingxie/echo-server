FROM fabiocicerchia/nginx-lua:debian

ADD nginx.conf /etc/nginx/nginx.conf
ADD template.lua /usr/local/share/lua/5.1/template.lua
ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
