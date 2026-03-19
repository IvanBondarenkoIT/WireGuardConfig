#!/bin/bash
set -euo pipefail

mkdir -p /config/wg_confs

if [ -n "${WG0_CONF:-}" ]; then
  # Многострочное значение в Railway или одна строка с \n — оба варианта работают
  umask 077
  printf '%b' "$WG0_CONF" > /config/wg_confs/wg0.conf
  chmod 600 /config/wg_confs/wg0.conf
elif [ ! -s /config/wg_confs/wg0.conf ]; then
  echo "WireGuard: задайте переменную WG0_CONF (полный текст wg0.conf) или смонтируйте конфиг." >&2
  exit 1
fi

exec "$@"
