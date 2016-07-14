#!/bin/bash

source common.sh

PREFIX=/tmp/$(whoami)_tmp_ruby
rm -rf $PREFIX
mkdir $PREFIX
rm -rf $LINUXBREW
rm -rf $HOME/.cache/Homebrew
rm -rf $HOME/.cache/pip

export PATH=$PATH:$PREFIX/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib:$PREFIX/lib64

get_and_build () {
    echo "Building $2"
    rm -rf $2
    wget -N "$1/$2.tar.gz"
    tar xzpf "$2.tar.gz"
    cd $2
    loggedRun "./configure --prefix=$PREFIX"
    loggedRun "make"
    loggedRun "make install"
    cd ..
    rm -rf $2
}

yaml () {
    get_and_build "http://pyyaml.org/download/libyaml" "yaml-0.1.5"
}

ffi () {
    get_and_build "ftp://sourceware.org/pub/libffi" "libffi-3.2.1"
}

build_ruby () {
    get_and_build "http://cache.ruby-lang.org/pub/ruby/2.2" "ruby-2.2.3"
}

yaml
ffi
build_ruby
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
echo
brew doctor
echo
read -n1 -r -p "Review output from brew doctor above, if happy press any key, if unhappy, press C-c"
brew_install git
brew_install ruby
brew_install tmux
rm -rf $PREFIX
brew_upgrade
