#!/usr/bin/env bash

ARTIFACTS="$(find $CI_PROJECT_DIR/halium/out -name 'system.img' -or -name 'halium-boot.img' -or -name 'hybris-boot.img')"
echo "Deploying $ARTIFACTS"

mkdir -p ~/.ssh/
echo $DEPLOY_KEY_PRIVATE | base64 -d | xz -d > ~/.ssh/id_rsa
echo $DEPLOY_KEY_PUBLIC | base64 -d | xz -d > ~/.ssh/id_rsa.pub
chmod 400 ~/.ssh/id_rsa

# Generate checksums
for file in $FILES; do
	sha256sum $file > ${file}.sha256
done

# Deploy to server
rsync -avzP -e \
        "ssh -o StrictHostKeyChecking=no -p $DEPLOY_PORT" \
        $ARTIFACTS \
        $DEPLOY_ACCOUNT:/var/www/archive.kaidan.im/halium/$DEVICE
