#!/bin/bash

module load gcc

export CC=$(which gcc)
export CXX=$(which g++)

loggedRun()
{
    echo "$1"
    output=$(eval "$1")
    if [ $? -ne 0 ]; then
        echo "$output"
    fi
}

brew_install()
{
    brew install --cc=gcc $1
}

brew_upgrade()
{
    brew update
    brew upgrade --cc=gcc
}

pip3_install()
{
    loggedRun "pip3 --no-cache-dir install $1"
}
