#!/bin/bash
sudo apt update && sudo apt upgrade

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc

# Oh-My-Posh installation
brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install meslo
echo 'eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/microverse-power.omp.json)"' >> ~/.bashrc
source ~/.bashrc

# tree and uv installation
brew install tree
brew install uv

# Neovim installation
brew install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
