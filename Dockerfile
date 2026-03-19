FROM linuxserver/wireguard:latest

# Конфиг создаётся из переменной WG0_CONF при старте (см. entrypoint.sh)
RUN mkdir -p /config/wg_confs

ENV PUID=1000
ENV PGID=1000
ENV TZ=UTC

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/init"]
