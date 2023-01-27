#!/usr/bin/zsh
# (https://medium.com/swlh/deploy-your-private-docker-registry-as-a-pod-in-kubernetes-f6a489bf0180)
# 1: User
# 2: Password

mkdir certs
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -sha256 -keyout certs/tls.key -out certs/tls.crt -subj "/CN=registry.brotherlogic-backend.com" -addext "subjectAltName = DNS:registry.brotherlogic.backend.com"

mkdir auth
docker run --rm --entrypoint htpasswd registry:2.6.2 -Bbn $1 $2 > auth/htpasswd