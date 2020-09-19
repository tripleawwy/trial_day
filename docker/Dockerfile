FROM alpine:3.12
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY rootfs /

RUN apk add --no-cache openssh python3 sudo\
        && addgroup -g 1000 trial \
        && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel\
        && adduser -D -u 1000 -G trial docker-user \
        && adduser docker-user wheel\
        && chown docker-user:trial /home/docker-user\
        && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
        && echo "docker-user:password01" | chpasswd
