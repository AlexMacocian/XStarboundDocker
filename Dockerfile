FROM ubuntu:24.04

EXPOSE 28015
EXPOSE 28016

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get install -y locales

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y \
    ca-certificates \
    software-properties-common \
    lib32gcc-s1 \
    libstdc++6 \
    curl \
    wget \
    build-essential \
    jq \
    rsync

RUN mkdir -p /steamcmd
RUN mkdir -p /starbound

WORKDIR "/starbound"

RUN cd /steamcmd \
        && wget -o /tmp/steamcmd.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
        && tar zxvf steamcmd_linux.tar.gz \
        && rm steamcmd_linux.tar.gz \
        && chmod +x ./steamcmd.sh

WORKDIR /

RUN /steamcmd/steamcmd.sh +force_install_dir /starbound/ +quit

COPY start.sh /start.sh
COPY install.sh /install.sh
COPY copy-mods.sh /copy-mods.sh

RUN chmod +x install.sh && \
    chmod +x start.sh && \
    chmod +x copy-mods.sh

ENTRYPOINT ["./start.sh"]