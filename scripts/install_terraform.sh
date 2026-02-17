#!/bin/zsh

TERRAFORM_VERSION="1.14.5"
ARCH="darwin_arm64"

cd ~/Downloads || exit 1

curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${ARCH}.zip"

unzip -o "terraform_${TERRAFORM_VERSION}_${ARCH}.zip"

sudo mv terraform /usr/local/bin/
sudo chmod +x /usr/local/bin/terraform

rm -f "terraform_${TERRAFORM_VERSION}_${ARCH}.zip"

hash -r
terraform -version
