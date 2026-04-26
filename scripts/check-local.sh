#!/usr/bin/env bash
set -euo pipefail

python -m pip install --upgrade pip
python -m pip install -r requirements-dev.txt

if [ -f requirements.txt ]; then
  python -m pip install -r requirements.txt
fi

ruff check .

if find app -name "*.py" | grep -q .; then
  mypy app
  bandit -r app -c pyproject.toml
else
  echo "No Python files found under app/. Skipping mypy and bandit."
fi

pytest

if [ -f requirements.txt ] && grep -vE '^\s*(#|$)' requirements.txt | grep -q .; then
  pip-audit -r requirements.txt
else
  echo "No runtime dependencies found in requirements.txt. Skipping pip-audit."
fi
