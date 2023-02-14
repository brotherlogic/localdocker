#!/usr/bin/zsh
# (https://medium.com/swlh/deploy-your-private-docker-registry-as-a-pod-in-kubernetes-f6a489bf0180)
# 1: User
# 2: Password

mkdir auth
docker run --rm --entrypoint htpasswd registry:2.6.2 -Bbn $1 $2 > auth/htpasswd
 
kubectl create secret generic auth-secret --from-file=/registry/auth/htpasswd