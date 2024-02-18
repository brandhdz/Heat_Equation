module parameters

    use iso_fortran_env, only : dp => real64, i4 => int32

    implicit none

    private :: dp, i4
    
    integer(i4) :: n, m, i, j
    real(dp) :: a, k, h, f, pi
    real(dp), dimension(2) :: t_if, x_if
    character(100) :: file_name, input_file

    namelist /input_parameters/ a, n, m, t_if, x_if, file_name
    
    pi = 4*ATAN(1.0)

    k = (tf-ti)/(n-1)
    h = (xf-xi)/(m-1)

    f = a**2*k/h**2
    
end module parameters