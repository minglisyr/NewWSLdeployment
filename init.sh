#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential -y
brew install gcc

# Oh-My-Posh installation
brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install meslo
echo 'eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/microverse-power.omp.json)"' >> ~/.bashrc
source ~/.bashrc

# Tools installation
brew install tree uv fzf pyright fastfetch ruff

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


