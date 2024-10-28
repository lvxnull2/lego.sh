#!/bin/sh

set -eu

CERT_DIR="/certs"
CERT_PATH="${CERT_DIR}/${LEGO_CERT_DOMAIN}/cert"
CERT_KEY_PATH="${CERT_DIR}/${LEGO_CERT_DOMAIN}/key"

install -Dm644 "${LEGO_CERT_PATH}" "${CERT_PATH}"
install -Dm644 "${LEGO_CERT_KEY_PATH}" "${CERT_KEY_PATH}"
