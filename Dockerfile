FROM codercom/code-server:3.9.1

USER root

RUN apt update -qy && \
  apt install -qy nano tmux

RUN curl -SLs https://get.docker.com | sh

RUN curl -SLs https://dl.get-arkade.dev | sh
RUN arkade get faas-cli && \
    arkade get kubectl && \
    arkade get helm && \
    chmod +x $HOME/.arkade/bin/* && \
    mv $HOME/.arkade/bin/* /usr/local/bin/

RUN usermod -aG docker coder

ENV DISABLE_TELEMETRY=true

WORKDIR /home/coder
USER coder
