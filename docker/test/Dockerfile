FROM ubuntu:18.04
COPY ./root /root
COPY ./rootfs /

RUN apt-get update 
RUN apt-get install -y --no-install-recommends openssh-server python3 sudo\
    && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 trial
RUN useradd -m -G trial docker-user
RUN echo "docker-user:password01" | chpasswd
RUN usermod -aG sudo docker-user

ENTRYPOINT ["/entrypoint.sh"]

