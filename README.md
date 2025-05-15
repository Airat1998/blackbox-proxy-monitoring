# Blackbox Exporter через Proxychains

Проект демонстрирует, как запустить [Prometheus Blackbox Exporter](https://github.com/prometheus/blackbox_exporter)
через SOCKS5-прокси с использованием `proxychains4`.

## Что внутри

- `Dockerfile` — образ с Blackbox Exporter + proxychains
- `proxychains.conf` — конфигурация SOCKS5-прокси
- `blackbox.yml` — модуль `http_2xx` для проверки доступности HTTP-сервисов
- `prometheus/blackbox_job.yml` — Prometheus job, отправляющий запросы через прокси
- `prometheus/targets/ovirt_node_exporter.json` — список таргетов в формате file_sd

## 🚀 Запуск

```bash
docker build -t blackbox-proxy .
docker run -p 9116:9116 blackbox-proxy
