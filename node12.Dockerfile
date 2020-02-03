FROM raviqqe/muffet as muffet

FROM node:12.14.1-stretch-slim

COPY --from=muffet /muffet /usr/local/bin/muffet

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        bzip2 \
        ca-certificates \
        curl \
        g++ \
        git \
        gnupg2 \
        gyp \
        iputils-ping \
        less \
        make \
        moreutils \
        nginx-light \
        pigz \
        procps \
        python-pip \
        software-properties-common \
        ssh \
        unzip \
        vim \
        xz-utils \
    && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y --no-install-recommends docker-ce && \
    apt-get clean
