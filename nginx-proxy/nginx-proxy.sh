docker network create --driver bridge reverse-proxy

docker run \
    --name nginx-proxy \
    -d \
    --restart unless-stopped \
    --net reverse-proxy \
    -p 80:80 -p 443:443 \
    -v $HOME/certs:/etc/nginx/certs:ro \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    -v /etc/nginx/vhost.d \
    -v /usr/share/nginx/html \
    --label com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy \
    jwilder/nginx-proxy
