Numerical solution of the 1D Heat Equation.

There are three methods implemented inside the program:

1.- A differences progressive method called "Explicit <br />
2.- A regressive differences method called "Matrix" <br />
3.- The Cranck-Nicholson method called "CN" <br />

Are gradually stable solutions for distinct parameters but also more computationally expensive. You can provide them only specifying the name in the "method" section on the file "parameters.dat".

The rest of the parameters you can modify are:

a -- Thermal diffusivity <br />
n -- steps in time <br />
m -- steps in length <br />
t_if -- initial an final time <br />
x_if -- initial and final length <br />
f_if = initial and final boundary conditions <br />

Once specified parameters save the file, run "compile.sh" and you'll get the solution in "data" directory. To graph run the file "heat_bar.plt" on gnuplot in "figure" directory.

B.
