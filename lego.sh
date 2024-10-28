#!/bin/sh

set -eu

if [ -r .env ]; then
  set -a
  . ./.env
  set +a
fi

# Crash if the token is unset
: "${CF_DNS_API_TOKEN}"

exec lego \
  --email "${EMAIL}" \
  --accept-tos \
  --dns cloudflare \
  "$@"
