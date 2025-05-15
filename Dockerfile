FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y curl proxychains4 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt && \
    curl -L https://github.com/prometheus/blackbox_exporter/releases/download/v0.24.0/blackbox_exporter-0.24.0.linux-amd64.tar.gz | \
    tar xz -C /opt && \
    mv /opt/blackbox_exporter-0.24.0.linux-amd64 /opt/blackbox_exporter

COPY proxychains.conf /etc/proxychains.conf
COPY blackbox.yml /opt/blackbox_exporter/blackbox.yml

WORKDIR /opt/blackbox_exporter

CMD ["bash", "-c", "echo '🚀 Starting blackbox_exporter with proxychains4...'; proxychains4 ./blackbox_exporter --config.file=blackbox.yml --web.listen-address=:9116"]
