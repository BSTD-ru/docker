docker run \
    --name nginx-letsencrypt \
    -d \
    --restart unless-stopped \
    --net reverse-proxy \
    -v $HOME/certs:/etc/nginx/certs:rw \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --volumes-from nginx-proxy \
    jrcs/letsencrypt-nginx-proxy-companion
