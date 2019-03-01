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
export PATH="$PYENV_ROOT/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$GOPATH/bin:$GOROOT/bin"

export CAL_ID="125854635932-fq2lv63oevfglpubro35cei8j1ou0j8v.apps.googleusercontent.com"
export CAL_SECRET="K7cq_3vo_6C2alrgj8obJALW"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
