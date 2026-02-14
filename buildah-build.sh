#!/usr/bin/env bash
set -e

mkdir -p /tmp/containers

cat > /tmp/containers-storage.conf <<EOF
[storage]
driver = "vfs"
runroot = "/tmp/containers/run"
graphroot = "/tmp/containers/storage"
EOF

export CONTAINERS_STORAGE_CONF=/tmp/containers-storage.conf

aws ecr get-login-password --region "$AWS_REGION" | \
buildah login --username AWS --password-stdin \
"${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com"

buildah bud -t "${ECR_URI}:${K8S_IMAGE_TAG}" .
buildah tag "${ECR_URI}:${K8S_IMAGE_TAG}" "${ECR_URI}:latest"
buildah push "${ECR_URI}:${K8S_IMAGE_TAG}"
buildah push "${ECR_URI}:latest"
