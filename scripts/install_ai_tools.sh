#!/bin/zsh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BREWFILE_PATH="$REPO_ROOT/Brewfile"
AI_AGENTS_DIR="$HOME/ai-agents"
PYTHON_3_13_BIN="/opt/homebrew/bin/python3.13"

echo "Installing AI development tools..."

echo "Installing Brew dependencies from: $BREWFILE_PATH"
brew bundle --file "$BREWFILE_PATH"

if [ ! -x "$PYTHON_3_13_BIN" ]; then
    echo "Python 3.13 not found at $PYTHON_3_13_BIN"
    exit 1
fi

echo "Preparing CrewAI environment in: $AI_AGENTS_DIR"
mkdir -p "$AI_AGENTS_DIR"
cd "$AI_AGENTS_DIR"

rm -rf .venv

"$PYTHON_3_13_BIN" -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip setuptools wheel
pip install crewai

deactivate

echo "AI tools installation completed"
