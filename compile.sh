#! /bin/bash

SRC=./src
OBJ=./obj
BIN=./bin

gfortran -J$OBJ -c $SRC/parameters.f90 -o $OBJ/parameters.o
gfortran -J$OBJ -c $SRC/Crout_method.f90 -o $OBJ/Crout_method.o
gfortran -J$OBJ -c $SRC/grid.f90 -o $OBJ/grid.o
gfortran -J$OBJ -c $SRC/read_input.f90 -o $OBJ/read_input.o
gfortran -J$OBJ -c $SRC/assign_values.f90 -o $OBJ/assign_values.o
gfortran -J$OBJ -c $SRC/init_conditions.f90 -o $OBJ/init_conditions.o
gfortran -J$OBJ -c $SRC/heat_eq_methods.f90 -o $OBJ/heat_eq_methods.o
gfortran -J$OBJ -c $SRC/write_data.f90 -o $OBJ/write_data.o
gfortran -J$OBJ -c $SRC/main.f90 -o $OBJ/main.o
gfortran $OBJ/*.o -o $BIN/main.exe
$BIN/main.exe <<< parameters.dat
