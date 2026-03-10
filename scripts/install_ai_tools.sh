#!/bin/zsh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BREWFILE_PATH="$REPO_ROOT/Brewfile"
AI_AGENTS_DIR="$HOME/ai-agents"

echo "Installing AI development tools..."

echo "Installing Brew dependencies from: $BREWFILE_PATH"
brew bundle --file "$BREWFILE_PATH"

echo "Preparing CrewAI environment in: $AI_AGENTS_DIR"
mkdir -p "$AI_AGENTS_DIR"
cd "$AI_AGENTS_DIR"

if [ ! -f pyproject.toml ]; then
    uv init
fi

uv add crewai

echo "AI tools installation completed"
