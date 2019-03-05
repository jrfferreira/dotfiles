# ssh
#export SSH_KEY_PATH="~/.ssh/rsa_id"

# User configuration
export EDITOR="emacsclient"
export WORKON_HOME=$HOME/Code
export GOPATH=$WORKON_HOME/go
export GOROOT=$(go env GOROOT)
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_ROOT="$HOME/.pyenv"
export VIRTUALENVWRAPPER_VIRTUALENV=$PYENV_ROOT/shims/virtualenv
export VIRTUALENVWRAPPER_PYTHON=$PYENV_ROOT/shims/python
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$GOPATH/bin:$GOROOT/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
