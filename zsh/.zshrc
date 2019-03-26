source /usr/share/zsh/share/antigen.zsh

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
antigen bundle vim-interaction
antigen bundle virtualenvwrapper
antigen bundle z
antigen bundle yarn

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
alias emacs=emacsclient -t
alias terminal=terminator
alias c="clear && printf '\e[3J'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
