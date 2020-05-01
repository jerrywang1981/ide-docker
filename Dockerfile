FROM ubuntu:19.10
LABEL maintainer "wangjianjun@gmail.com"
RUN apt-get update \
    && apt-get install neovim \
    curl \
    python3 \
    golang \
    nodejs \
    npm \
    git \
    python-pip \
    python3-pip  -y \
    && apt-get clean \
    && apt-get autoremove

RUN mkdir -p /home/jerry
WORKDIR /home/jerry
RUN mkdir -p /root/.config
RUN mkdir -p /root/.cache

RUN pip3 install --upgrade pynvim
RUN pip2 install --upgrade pynvim

RUN npm install -g yarn
RUN npm install -g neovim

RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
RUN sh ./installer.sh ~/.cache/dein

RUN git clone https://github.com/jerrywang1981/nvim.git /root/.config/nvim

# RUN pip3 install -r requirements_ubuntu19_py37.txt

