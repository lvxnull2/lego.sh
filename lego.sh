#!/bin/sh

set -eu

if [ -r .env ]; then
  set -a
  . ./.env
  set +a
fi

if hash podman 2>/dev/null; then
  docker=podman
else
  docker=docker
fi

# Crash if the token is unset
: "${CF_DNS_API_TOKEN}"

exec $docker run \
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
