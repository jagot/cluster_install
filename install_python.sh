#!/bin/bash

source common.sh

get_python (){
    rm -rf $HOME/.pyenv
    brew_install pyenv
    eval "$(pyenv init -)"
    export PYENV_VERSION=$(pyenv install --list | grep -v - | grep -v b | tail -1 | sed 's/ *//')
    pyenv install $PYENV_VERSION
    pyenv rehash
    qq=$(ag pyenv $HOME/.common.sh)
    if [ $? -ne 0 ]; then
        echo -e "\nexport PYENV_VERSION=\"$PYENV_VERSION\"" >> $HOME/.common.sh
        echo -e "eval \"\$(pyenv init -)\"" >> $HOME/.common.sh
    fi
}

brew_install openssl
brew_install ag
get_python
loggedRun "pip3 install --upgrade pip setuptools"
