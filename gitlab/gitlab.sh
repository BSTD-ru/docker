docker run \
    --name gitlab \
    -d \
    --net reverse-proxy \
    --hostname gitlab.example.com \
    --publish 22:22 \
    --restart always \
    --volume /var/docker/gitlab/config:/etc/gitlab \
    --volume /var/docker/gitlab/logs:/var/log/gitlab \
    --volume /var/docker/gitlab/data:/var/opt/gitlab \
    -e VIRTUAL_HOST=gitlab.sitedev.ru \
    -e LETSENCRYPT_EMAIL=admin@example.com \
    -e LETSENCRYPT_HOST=gitlab.example.com \
    gitlab/gitlab-ce:latest
