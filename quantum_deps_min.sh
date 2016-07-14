#!/bin/bash

source common.sh

brew_install ag
brew_install boost
brew install --cc=gcc cmake --without-docs
brew_install ninja
brew_install ncdu
brew tap homebrew/science
brew_install openblas
brew tap homebrew/dupes
brew install --cc=gcc --with-cxx homebrew/science/hdf5
brew_install rsync
