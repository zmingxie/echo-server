#!/bin/bash

echo "Generating self-signed certificate"
mkdir -p /certs
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
  -keyout /certs/echo-server.key \
  -out /certs/echo-server.crt \
  -subj "/CN=echo-server"


echo "Starting nginx"
nginx -g "daemon off;"
