#!/bin/bash
set -eu
PYTHON_VENV="/home/ubuntu/jupytext-venv"

echo "Activating feature 'Neovim Config'"

echo "Create and Activate VENV"
python3 -m venv $PYTHON_VENV
source $PYTHON_VENV/bin/activate

echo "Install Treesitter Dependencies"
apt-get -y update
apt-get install -y clang
cargo install --locked tree-sitter-cli

echo "Install Jupytext Plugin Dependencies"
pip install jupytext

echo "Install Agents"
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://opencode.ai/install | bash

echo "Clone Config"
git clone https://github.com/essercodes/neovim-config /home/ubuntu/.config/nvim

echo "Install Neovim Plugins and Tools"
sudo -u ubuntu nvim --headless "+Lazy! sync" +qa
sudo -u ubuntu nvim --headless -c 'MasonToolsInstallSync' -c 'qa'
