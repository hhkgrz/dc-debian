FROM hhkg/dc-debian:latest

RUN set -x \
    && apt-get update \
    && sed -i '0,/^URIs.*/{s!^URIs.*!URIs: https://mirrors.tuna.tsinghua.edu.cn/debian!}' /etc/apt/sources.list.d/debian.sources \
    && sed -i '0,/^Components.*/{s!^Components.*!Components: main contrib non-free non-free-firmware!}' /etc/apt/sources.list.d/debian.sources \
    && apt-get update

USER hhkg
WORKDIR /home/hhkg
