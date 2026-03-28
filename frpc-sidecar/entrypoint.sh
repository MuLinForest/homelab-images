#!/bin/sh
set -e

cat > /tmp/frpc.toml << EOF
serverAddr = "${FRPS_SERVER}"
serverPort = ${FRPS_PORT:-7000}
auth.token = "${FRPS_TOKEN}"

[[proxies]]
name = "${NAME:-$SUBDOMAIN}"
type = "http"
localIP = "${LOCAL_IP}"
localPort = ${LOCAL_PORT}
subdomain = "${SUBDOMAIN}"
EOF

exec frpc -c /tmp/frpc.toml
