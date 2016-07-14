#!/bin/bash

source common.sh

module unload intel
module load intel/15.0.0

source $(dirname $(dirname $(which icc)))/compilervars.sh intel64

git clone git://github.com/JuliaLang/julia.git
cd julia
git pull
git checkout release-0.4
cp ../Make.user.julia Make.user
make
cd ..
