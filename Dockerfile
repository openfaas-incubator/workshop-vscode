FROM codercom/code-server:1.1156-vsc1.33.1

USER root

RUN curl -SLs https://get.docker.com | sh

RUN curl -sSLO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl


RUN curl -sSL https://github.com/kubernetes-sigs/kind/releases/download/v0.4.0/kind-linux-amd64 -o /usr/local/bin/kind \
 && chmod +x /usr/local/bin/kind

RUN usermod -aG docker coder

USER coder
