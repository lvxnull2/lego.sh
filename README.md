# lego.sh

A shell script wrapper around [lego](https://go-acme.github.io/lego/) that
installs certificates into a docker/podman volume.

# Setup

Create a file called `.env`, define `EMAIL` (email used for letsencrypt
account) and `CF_DNS_API_TOKEN` (see [lego docs](https://go-acme.github.io/lego/dns/cloudflare/)).

# Usage

```sh
# Create a new certificate for example.com and test.example.com
lego-run -d example.com -d test.example.com

# Create a wildcard certificate for example.com
lego-run -d example.com -d '*.example.com'

# Renew the wildcard certificate
lego-renew -d example.com -d '*.example.com'
```
