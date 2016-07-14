#!/bin/bash

source common.sh

brew_install m4
brew_install libtool
brew_install zeromq
brew_install ag
pip3_install numpy
pip3_install pyzmq
pip3_install hy
brew_install open-mpi
pip3_install mpi4py
brew_install boost
brew install --cc=gcc cmake --without-docs
brew_install ninja
brew_install ncdu
brew tap homebrew/science
brew_install openblas
brew tap homebrew/dupes
brew install --cc=gcc --with-cxx homebrew/science/hdf5
loggedRun "HDF5_DIR=$LINUXBREW pip3 --no-cache-dir install h5py"
brew_install astyle
brew_install rsync
