FROM linuxserver/wireguard:latest

COPY wg0.conf /config/wg_confs/wg0.conf

ENV PUID=1000
ENV PGID=1000
ENV TZ=UTC
