#!/bin/sh
xcode-select --install

brew tap caskroom/cask
brew tap caskroom/versions

# basics
brew cask install nordvpn
brew cask install iterm2
brew cask install firefox
brew cask install chrome
brew cask install sketch
brew cask install docker
brew install coreutils

# usability
brew cask install spectacle
brew cask install authy
brew cask install istat-menus

# fun
brew cask install spotify
brew cask install vlc
brew cask install webtorrent
brew cask install skype
brew cask install wireshark

# python
brew install python
brew install pyenv
brew install mypy
brew install black
pyenv install 3.6.5 && pyenv global 3.6.5
sudo curl -o- https://bootstrap.pypa.io/get-pip.py | python
pip install virtualenvwrapper

# oh-my-zsh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
ln -s ./zsh/.zshrc ~/.zshrc

# env
ln -s ./zsh/.zshenv ~/.zshenv

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# npm modules
nvm install stable && nvm use stable
npm adduser jrfferreira
npm install -g  typescript flow flow-bin tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier

brew tap caskroom/fonts
brew cask install font-fira-mono
brew cask install font-fira-code
brew cask install font-fira-mono-for-powerline
brew cask install font-source-code-pro

brew install ag
brew install bat
brew install prettyping
brew install htop

# emacs
brew tap railwaycat/emacsmacport
brew cask install emacs

cd ~/
mkdir Code
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak
git clone https://github.com/jrfferreira/emacs-config ~/Code/emacs-config
ln -s ~/Code/emacs-config .emacs.d

