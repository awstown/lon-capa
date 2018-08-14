FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -yq dist-upgrade \
 && apt install -yq --no-install-recommends \
    software-properties-common \
    python-software-properties \
    postfix \
    wget \
 && apt-add-repository 'deb http://install.loncapa.org/ubuntu xenial main' \
 && wget http://install.loncapa.org/versions/ubuntu/APT-GPG-KEY-loncapa.asc \
 && apt-key add APT-GPG-KEY-loncapa.asc \
 && echo 'mysql-server mysql-server/root_password password root' | debconf-set-selections \
 && echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections \
 && apt update && apt install -yq --no-install-recommends \
    loncapa-prerequisites \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*