module parameters

    use iso_fortran_env, only : dp => real64, i4 => int32

    implicit none

    private :: dp, i4
    
    integer(i4) :: n, m, i, j
    real(dp) :: a, k, h, f, pi
    real(dp), dimension(2) :: t_if, x_if, f_if
    character(100) :: method, input_file, file_name

    namelist /input_parameters/ method, a, n, m, t_if, x_if, f_if, file_name

end module parameters