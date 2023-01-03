FROM ubuntu:20.04

WORKDIR /tmp

EXPOSE 8080

RUN adduser --quiet user01 && \
    apt update && apt install -y curl git && \
    curl -fOL https://github.com/coder/code-server/releases/download/v4.9.1/code-server_4.9.1_amd64.deb && \
    dpkg -i code-server_4.9.1_amd64.deb && \
    rm -fr code-server_4.9.1_amd64.deb

USER user01
WORKDIR /home/user01
CMD /usr/bin/code-server --cert --auth password --bind-addr 0.0.0.0:8080
