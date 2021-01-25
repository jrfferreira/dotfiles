source ~/Code/dotfiles/zsh/antigen.zsh

export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export NVM_AUTO_USE=true
export DISABLE_VENV_CD=1

ENABLE_CORRECTION="true"
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  docker        # Docker section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  char          # Prompt character
)
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_CHAR_SYMBOL='$ '

antigen use oh-my-zsh

# from oh-my-zsh
antigen bundle common-aliases
antigen bundle emoji
antigen bundle gulp
antigen bundle jsontools
antigen bundle node
antigen bundle npm
antigen bundle pip
antigen bundle python
antigen bundle rust
antigen bundle vim-interaction
antigen bundle z
antigen bundle fzf
antigen bundle yarn
if [[ "$OSTYPE" == "darwin"* ]]; then
    antigen bundle osx
fi

# external
antigen bundle lukechilds/zsh-nvm
antigen theme denysdovhan/spaceship-prompt

antigen apply

# keychain manages ssh-agents
if [[ -o interactive ]]; then
    if command -v keychain 1>/dev/null 2>&1; then
	eval "$(keychain --eval)"
    fi
fi

alias cat=bat
alias ping=prettyping
#alias emacs=emacsclient -t

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias terminal=terminator
fi

alias short="dig txt +short"
alias c="clear && printf '\e[3J'"
alias rec="terminalizer record"

# work alias
alias dcontrol="~/Code/BISYS/python/dqueue/utils/dcontrol"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# DEBUG
# setopt XTRACE VERBOSE

#export SSH_KEY_PATH="~/.ssh/rsa_id"
# User configuration
export WORKON_HOME=$HOME/Code
export GOPATH=$WORKON_HOME/go
export GOROOT=$(go env GOROOT)
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_ROOT=$HOME/.pyenv
export NVM_DIR=$HOME/.nvm

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export VIRTUALENVWRAPPER_VIRTUALENV=$PYENV_ROOT/shims/virtualenv
export VIRTUALENVWRAPPER_PYTHON=$PYENV_ROOT/shims/python

# User configuration

# Emacs
source  ~/Code/dotfiles/scripts/emacs-commands.sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export EDITOR="emacsclient -nc --socket-name=main"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export EDITOR="/usr/local/bin/emacsclient -nc --socket-name=main"
fi

export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$GOPATH/bin:$GOROOT/bin:$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


eval "$(pyenv init -)"
eval "$(pyenv virtualenvwrapper)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

