#!/bin/bash
# - Exit when any command fails.
set -e

# - Cfg.
IMG_NAME=jts-git-service:latest

# - Test file existence.
if test -f "./Dockerfile"; then
  echo "docker file exists."
else
  echo "docker file not exist."
  exit 1
fi

# - Remove old img.
echo "delete previous image."
docker rmi "${IMG_NAME}" 2>/dev/null 1>&2 || true
docker image prune -f

# - Copy ssh key
echo "Copy ssh pub key"
cp ../env-ssh-key/jts_rsa.pub ./

# - Build img
echo "build docker image: ${IMG_NAME}"
docker build -q -t ${IMG_NAME} -f Dockerfile . --no-cache

# - Clean
echo "Clean up"
docker image prune --filter label=jts_git_img__stage=init
rm -f ./jts_rsa.pub


