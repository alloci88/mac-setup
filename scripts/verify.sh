#!/bin/zsh

echo "Checking Git..."
git --version

echo "Checking GitHub CLI..."
gh --version

echo "Checking Terraform..."
terraform -version

echo "Checking Azure CLI..."
az version

echo "Checking Ansible..."
ansible --version

echo "Checking Docker..."
docker --version

echo "Checking Podman..."
podman --version

echo "Checking Ollama..."
ollama --version

echo "Checking Aider..."
aider --version

echo "Checking LLM CLI..."
llm --version

echo "Checking Node..."
node --version
