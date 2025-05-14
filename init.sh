#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential gcc kitty mupdf -y

# Register mupdf as default viewer for PDF
xdg-mime default mupdf.desktop application/pdf

# Oh-My-Posh installation
brew install oh-my-posh
oh-my-posh font install meslo

curl -O https://raw.githubusercontent.com/minglisyr/NewWSLdeployment/main/microverse-power.omp.json
mkdir $HOME/.config/oh-my-posh/
mv microverse-power.omp.json $HOME/.config/oh-my-posh/

echo '# Only initialize Oh My Posh if running in a graphical terminal
if [[ -n "$DISPLAY" ]] || [[ -n "$WAYLAND_DISPLAY" ]] || [[ "$TERM_PROGRAM" == "vscode" ]] || [[ "$COLORTERM" == "truecolor" ]]; then
    eval "$($(brew --prefix)/bin/oh-my-posh init bash --config $HOME/.config/oh-my-posh/microverse-power.omp.json)"
fi
' >> ~/.bashrc

source ~/.bashrc

# Tools installation
brew install tree uv fzf pyright fastfetch ruff fd luarocks ripgrep imagemagick gs tectonic lazygit pyvim xclip

# uv customization
echo '# Define an alias for uv venv
uvv() {
  if [ -z "$1" ]; then
    uv venv && source .venv/bin/activate
  else
    uv venv "$1" && source "$1/bin/activate"
  fi
}' >> ~/.bashrc

# neovim installation
brew install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

python3 -m venv ~/.nvim-python
source ~/.nvim-python/bin/activate
pip3 install pynvim --trusted-host pypi.org --trusted-host files.pythonhosted.org

npm install @mermaid-js/mermaid-cli

curl -O https://raw.githubusercontent.com/minglisyr/dotfiles/main/.vimrc
curl -O https://raw.githubusercontent.com/minglisyr/dotfiles/main/.tmux.conf
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
# alias brewuu='brew update && brew upgrade'

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

