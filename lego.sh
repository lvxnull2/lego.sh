#!/bin/sh

set -eu

if [ -r .env ]; then
  set -a
  . ./.env
  set +a
fi

# Crash if the token is unset
: "${CF_DNS_API_TOKEN}"

exec podman run \
  --rm \
  --pull always \
  -e CF_DNS_API_TOKEN \
  -e LEGO_PATH=/legodir \
  -v certs:/certs \
  -v ./data:/legodir \
  -v ./install-cert.sh:/install-cert.sh \
  --name lego \
  goacme/lego:latest \
  --email "${EMAIL}" \
  --accept-tos \
  --dns cloudflare \
  "$@"
