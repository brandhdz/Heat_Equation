

SRC=./src
OBJ=./obj
BIN=./bin

gfortran -J$OBJ -c $SRC/parameters.f95 -o $OBJ/parameters.o
gfortran -J$OBJ -c $SRC/Crout_method.f95 -o $OBJ/Crout_method.o
gfortran -J$OBJ -c $SRC/grid.f95 -o $OBJ/grid.o
gfortran -J$OBJ -c $SRC/read_input.f95 -o $OBJ/read_input.o
gfortran -J$OBJ -c $SRC/assign_values.f95 -o $OBJ/assign_values.o
gfortran -J$OBJ -c $SRC/init_conditions.f95 -o $OBJ/init_conditions.o
#gfortran -J$OBJ -c $SRC/progressive_step.f95 -o $OBJ/progressive_step.o
#gfortran -J$OBJ -c $SRC/regressive_step.f95 -o $OBJ/regressive_step.o
gfortran -J$OBJ -c $SRC/heat_eq_methods.f95 -o $OBJ/heat_eq_methods.o
gfortran -J$OBJ -c $SRC/write_data.f95 -o $OBJ/write_data.o
gfortran -J$OBJ -c $SRC/main.f95 -o $OBJ/main.o
gfortran $OBJ/*.o -o $BIN/main.exe
$BIN/main.exe <<< parameters.dat
