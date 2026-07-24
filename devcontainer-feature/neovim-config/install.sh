#!/bin/bash
set -eu
# PYTHON_VENV="/home/ubuntu/jupytext-venv"
echo "Activating feature 'Neovim Config'"

# Install Treesitter Dependences
apt-get -y update
apt-get install -y clang
cargo install --locked tree-sitter-cli

# Install Jupytext Plugin Dependences
# python3 -m venv $PYTHON_VENV
# source $PYTHON_VENV/bin/activate

# pip install jupytext

# Install Agents
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://opencode.ai/install | bash

git clone https://github.com/essercodes/neovim-config /home/ubuntu/.config/nvim
sudo -u ubuntu nvim --headless "+Lazy! sync" +qa
sudo -u ubuntu nvim --headless -c 'MasonToolsInstallSync' -c 'qa'
