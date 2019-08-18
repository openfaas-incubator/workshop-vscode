FROM codercom/code-server:1.1156-vsc1.33.1

USER root

RUN apt update -qy && apt install -qy nano tmux

RUN curl -SLs https://get.docker.com | sh

RUN curl -sSLO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl

RUN curl -SLs https://cli.openfaas.com | sh

RUN usermod -aG docker coder

ENV DISABLE_TELEMETRY=true


USER coder

