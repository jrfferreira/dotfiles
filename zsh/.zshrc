export ZSH=$HOME/.oh-my-zsh

# keychain keeps track of ssh-agents
[ -f $HOME/.keychain/$HOSTNAME-sh ] \
    && . $HOME/.keychain/$HOSTNAME-sh

# keychain manages ssh-agents
if command -v keychain 1>/dev/null 2>&1; then
  eval "$(keychain --eval)"
fi

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  dir           # Current directory section
  docker        # Docker section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  php           # PHP section
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  char          # Prompt character
)

SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_CHAR_SYMBOL='$ '

export DISABLE_VENV_CD=1

ENABLE_CORRECTION="true"

plugins=(
#    autoenv
    bower
#    brew
#    cap
#    capistrano
    common-aliases
#    django
#    fabric
    emoji
    grunt
    gulp
    jsontools
    node
    npm
    pip
    python
    vagrant
    vim-interaction
    virtualenvwrapper
    zsh-nvm
    z
)

export NVM_AUTO_USE=true

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias cat=bat
alias ping=prettyping
alias emacs=emacsclient -t
alias terminal=terminator
alias c=clear&&reset
