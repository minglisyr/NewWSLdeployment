#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential gcc kitty -y


# Oh-My-Posh installation
brew install oh-my-posh
oh-my-posh font install meslo

curl -O https://raw.githubusercontent.com/minglisyr/NewWSLdeployment/main/microverse-power.omp.json
mv microverse-power.omp.json $(brew --prefix oh-my-posh)/themes/
echo 'eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/microverse-power.omp.json)"' >> ~/.bashrc
source ~/.bashrc

# Tools installation
brew install tree uv fzf pyright fastfetch ruff fd luarocks ripgrep imagemagick gs tectonic lazygit pyvim xclip

# neovim installation
brew install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim


python3 -m venv ~/.nvim-python
source ~/.nvim-python/bin/activate
pip3 install pynvim

npm install @mermaid-js/mermaid-cli

'''
cd $HOME
uv venv
source .venv/bin/activate
uv pip install vtk matplotlib numpy pandas

cd ~/.local/share/nvim/lazy
rm snacks.nvim.cloning
cd snacks.nvim
git restore --source=HEAD :/

# SSL configuration / Certificate issues
git config --global http.sslVerify false
git config --list --show-origin --show-scope

curl --remote-name --time-cond cacert.pem https://curl.se/ca/cacert.pem

sudo cp custom.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates

npm config set cafile /usr/local/share/ca-certificates/custom.crt
npm config set strict-ssl false

openssl s_client -showcerts -connect github.com:443 -servername github.com

# vim plugins installation
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# PIP install skipping Certificate issues
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org uv --break-system-packages

# Building fastfetch from source
https://github.com/fastfetch-cli/fastfetch/wiki/Building
'''

