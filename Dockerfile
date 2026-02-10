FROM debian:trixie

RUN set -x \
    && apt-get update \
    && apt-get install -y apt-transport-https ca-certificates gnupg2 \
    && sed -i '0,/^URIs.*/{s!^URIs.*!URIs: https://mirrors.tuna.tsinghua.edu.cn/debian!}' /etc/apt/sources.list.d/debian.sources \
    && sed -i '0,/^Components.*/{s!^Components.*!Components: main contrib non-free non-free-firmware!}' /etc/apt/sources.list.d/debian.sources \
    && buildDeps="           emacs fd-find ripgrep" \
    && buildDeps="$buildDeps git ssh curl unzip file" \
    && buildDeps="$buildDeps gcc" \
    && buildDeps="$buildDeps vim-nox powerline" \
    && buildDeps="$buildDeps python3 python3-pip python3-venv python-is-python3 ipython3" \
    && buildDeps="$buildDeps sudo tmux" \
    && buildDeps="$buildDeps locales" \
    && buildDeps="$buildDeps nodejs npm" \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y $buildDeps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && sed -e 's/^# *\(en_US.UTF-8\)/\1/' -i /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && useradd -m -s /bin/bash hhkg \
    && passwd -d hhkg \
    && passwd -e hhkg \
    && echo 'hhkg ALL=(ALL:ALL) ALL' > /etc/sudoers.d/hhkg

USER hhkg
WORKDIR /home/hhkg