#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt-get install build-essential unzip


# Oh-My-Posh installation
curl -k https://ohmyposh.dev/install.sh | bash
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
echo 'eval "$(oh-my-posh init bash --config $HOME/.cache/oh-my-posh/themes/microverse-power.omp.json)"' >> ~/.bashrc
oh-my-posh font install meslo
source ~/.bashrc

# Tools installation
sudo apt install tree

sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch


uv fzf pyright fastfetch ruff

# neovim installation
brew install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

cd $HOME
uv venv
source .venv/bin/activate
uv pip install vtk matplotlib numpy pandas

cd ~/.local/share/nvim/lazy
rm snacks.nvim.cloning
cd snacks.nvim
git restore --source=HEAD :/
