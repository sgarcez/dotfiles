

#alt left and right bindings for navigating to prev/next word
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

#venvwrapper
export WORKON_HOME=/var/www//python-virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

export EDITOR='vim'

# required for byobu
export TERM="xterm-256color"
export BYOBU_PREFIX=$(brew --prefix)

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin
