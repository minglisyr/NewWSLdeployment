#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt-get install build-essential unzip -y


# Oh-My-Posh installation
curl -k https://ohmyposh.dev/install.sh | bash
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
echo 'eval "$(oh-my-posh init bash --config $HOME/.cache/oh-my-posh/themes/microverse-power.omp.json)"' >> ~/.bashrc
source ~/.bashrc
oh-my-posh font install meslo


# Tools installation
sudo apt install tree python3-pip fzf -y
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org uv --break-system-packages
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org ruff --break-system-packages
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org pyright --break-system-packages

sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch

# neovim installation
sudo apt install neovim -y
git config --global http.sslVerify false
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

cd $HOME
uv venv
source .venv/bin/activate

git config --global http.sslVerify true
uv pip install vtk matplotlib numpy pandas

cd ~/.local/share/nvim/lazy
rm snacks.nvim.cloning
cd snacks.nvim
git restore --source=HEAD :/
