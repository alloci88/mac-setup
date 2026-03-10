#!/bin/zsh

echo "Installing AI development tools..."

echo "Installing Brew dependencies..."
brew bundle --file ~/SETUP/Brewfile

echo "Preparing CrewAI environment..."

mkdir -p ~/ai-agents
cd ~/ai-agents

if [ ! -f pyproject.toml ]; then
    uv init
fi

uv add crewai

echo "AI tools installation completed"
