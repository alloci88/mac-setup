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

echo "All checks passed successfully"echo "Checking Node..."
node --version

echo "Checking Python..."
python3 --version

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
if [ -d "$AI_AGENTS_DIR" ]; then
    cd "$AI_AGENTS_DIR"
    uv run python -c "import crewai; print('CrewAI OK')"
else
    echo "CrewAI environment directory not found: $AI_AGENTS_DIR"
    exit 1
fi

echo "All checks passed successfully"
