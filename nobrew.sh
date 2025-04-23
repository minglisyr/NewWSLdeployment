#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt-get install build-essential unzip -y


# Oh-My-Posh installation
curl -k https://ohmyposh.dev/install.sh | bash
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
echo 'eval "$(oh-my-posh init bash --config $HOME/.cache/oh-my-posh/themes/microverse-power.omp.json)"' >> ~/.bashrc
source ~/.bashrc

sudo curl -kL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output /usr/local/share/fonts/MesloLGS-NF-Regular.ttf
sudo curl -kL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output /usr/local/share/fonts/MesloLGS-NF-Bold.ttf
sudo curl -kL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output /usr/local/share/fonts/MesloLGS-NF-Italic.ttf
sudo curl -kL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output /usr/local/share/fonts/MesloLGS-NF-Bold-Italic.ttf
fc-cache -fv
fc-list | grep MesloLGS

# Tools installation
sudo apt install tree python3-pip fzf -y
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org uv --break-system-packages
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org ruff --break-system-packages
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org pyright --break-system-packages

source build fastfetch >> https://github.com/fastfetch-cli/fastfetch/wiki/Building

# vim plugins installation
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# neovim installation
curl -kLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

git config --global http.sslVerify false
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

find . -mindepth 1 -maxdepth 1 -type d -exec git -C {} pull origin main \;

cd $HOME
uv venv
source .venv/bin/activate

git config --global http.sslVerify true

uv pip install vtk matplotlib numpy pandas

cd ~/.local/share/nvim/lazy
rm snacks.nvim.cloning
cd snacks.nvim
git restore --source=HEAD :/
