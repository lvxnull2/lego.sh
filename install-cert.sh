#!/bin/sh

set -eu

CERT_PATH="/certs/${LEGO_CERT_DOMAIN}/cert"
CERT_KEY_PATH="/certs/${LEGO_CERT_DOMAIN}/key"

install -Dm644 "${LEGO_CERT_PATH}" "${CERT_PATH}"
install -Dm644 "${LEGO_CERT_KEY_PATH}" "${CERT_KEY_PATH}"
