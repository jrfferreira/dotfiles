source /usr/share/zsh/share/antigen.zsh

export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export NVM_AUTO_USE=true
export DISABLE_VENV_CD=1

# History Settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

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

#antigen use oh-my-zsh

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
