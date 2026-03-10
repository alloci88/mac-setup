#!/bin/zsh

set -e

AI_AGENTS_DIR="$HOME/ai-agents"
CREWAI_PYTHON_BIN="$AI_AGENTS_DIR/.venv/bin/python"

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

echo "Checking Python 3.13..."
/opt/homebrew/bin/python3.13 --version

echo "Checking uv..."
uv --version

echo "Checking Cursor..."
if [ -d "/Applications/Cursor.app" ]; then
    echo "Cursor.app installed"
else
    echo "Cursor.app not found"
    exit 1
fi

echo "Checking CrewAI..."
if [ -x "$CREWAI_PYTHON_BIN" ]; then
    "$CREWAI_PYTHON_BIN" -c "import crewai; print('CrewAI OK')"
else
    echo "CrewAI virtual environment not found at $CREWAI_PYTHON_BIN"
    exit 1
fi

echo "Checking Claude Desktop..."
if [ -d "/Applications/Claude.app" ]; then
    echo "Claude.app installed"
else
    echo "Claude.app not found"
    exit 1
fi

echo "Checking Claude Code..."
if command -v claude >/dev/null 2>&1; then
    claude --version
else
    echo "Claude Code CLI not found"
    exit 1
fi

echo "All checks passed successfully"
