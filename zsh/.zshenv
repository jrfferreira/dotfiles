# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm

# User configuration
export EDITOR="/usr/local/bin/emacs"
export WORKON_HOME=$HOME/Code
export GOPATH=$WORKON_HOME/go
export GOROOT=$(go env GOROOT)
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:$GOROOT/bin:$PATH:$PYTHONPATH:$HOME/.pyenv/bin:/usr/local/bin"
