#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential kitty -y


# Oh-My-Posh installation
brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install meslo

curl -O https://raw.githubusercontent.com/minglisyr/NewWSLdeployment/main/microverse-power.omp.json
mv microverse-power.omp.json $(brew --prefix oh-my-posh)/themes/
echo 'eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/microverse-power.omp.json)"' >> ~/.bashrc
source ~/.bashrc

# Tools installation
brew install tree uv fzf pyright fastfetch ruff fd luarocks ripgrep imagemagick gs tectonic lazygit pyvim xclip

npm install -g @mermaid-js/mermaid-cli

python3 -m venv ~/.nvim-python
source ~/.nvim-python/bin/activate
pip3 install pynvim --trusted-host pypi.org --trusted-host files.pythonhosted.org

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


