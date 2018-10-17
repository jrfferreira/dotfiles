# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# User configuration
export EDITOR="emacsclient"
export WORKON_HOME=$HOME/Code
export GOPATH=$WORKON_HOME/go
export GOROOT=$(go env GOROOT)
export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$GOPATH/bin:$GOROOT/bin:$HOME/.pyenv/bin:$HOME/.pyenv/shims"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
