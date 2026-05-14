FROM ubuntu:latest

COPY entrypoint.sh /entrypoint.sh

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        tzdata \
        ca-certificates \
        git \
        libatomic1 \
        cron \
        curl \
        adb && \
    update-ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh
    
WORKDIR /root

CMD ["/entrypoint.sh"]
