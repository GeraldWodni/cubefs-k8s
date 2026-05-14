# server dockerfile
FROM debian:trixie-slim

RUN apt-get update && apt-get install -y \
    gawk \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/
RUN mkdir download && \
    cd download && \
    curl -s -o github.json https://api.github.com/repos/cubefs/cubefs/releases/latest && \
    TARBALLURL=$(cat github.json | jq -r '.tarball_url') && \
    TARURL=$(cat github.json | jq -r '.assets[] | select(.name | endswith("amd64.tar.gz")) | .browser_download_url') && \
    VERSION=$(cat github.json | jq -r '.tag_name') && \
    curl -sL -o ball.tar.gz $TARURL && \
    tar xzf ball.tar.gz && \
    cp cubefs/build/bin/cfs-cli /bin/cfs-cli && \
    cd /tmp && rm -Rf download

CMD sleep 99d

