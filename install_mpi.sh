#!/bin/bash

source common.sh

export OMPI_CC=$(which gcc)
export OMPI_CXX=$(which g++)
export OMPI_F77=$(which gfortran)
export OMPI_FC=$(which gfortran)

brew install --cc=gcc open-mpi -v