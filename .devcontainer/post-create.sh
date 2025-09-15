#!/usr/bin/env bash
#pip3 install -r requirements.txt
#pip3 install -r requirements-dev.txt

# setup streamrip dependencies and install rip command
pip install poetry
poetry install
poetry update

# Move in project's virtual env (to activate rip command)
echo -e "\nalias venv=\"source \\\$(poetry env info -p)/bin/activate\"" >> ~/.bashrc
# alias venv="source \$(poetry env info -p)/bin/activate"