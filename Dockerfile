FROM php:8.2-fpm

RUN docker-php-ext-install mysqli

ARG USERNAME=user
ARG PASSWORD=password
ARG USER_UID=1000
ARG USER_GID=$USER_UID


RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash
    
RUN apt update && apt install openssh-server -y && \
    mkdir /var/run/sshd && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    
RUN ssh-keygen -A

COPY sandbox-entrypoint /usr/local/bin
ENTRYPOINT ["/usr/local/bin/sandbox-entrypoint"]


WORKDIR /php