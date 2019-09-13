# ssh
#export SSH_KEY_PATH="~/.ssh/rsa_id"

# User configuration
export WORKON_HOME=$HOME/Code
export GOPATH=$WORKON_HOME/go
export GOROOT=$(go env GOROOT)
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_ROOT="$HOME/.pyenv"
export VIRTUALENVWRAPPER_VIRTUALENV=$PYENV_ROOT/shims/virtualenv
export VIRTUALENVWRAPPER_PYTHON=$PYENV_ROOT/shims/python
export NVM_DIR="$HOME/.nvm"

# User configuration


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export EDITOR="emacsclient"
    export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$GOPATH/bin:$GOROOT/bin:$HOME/bin"

elif [[ "$OSTYPE" == "darwin"* ]]; then
    export EDITOR="/usr/local/bin/emacs"
    export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
    eval "$(pyenv init -)"
fi
