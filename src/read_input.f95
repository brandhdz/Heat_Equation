subroutine read_input

    !use iso_fortran_env, only : i4 => int32
    use parameters

    implicit none

    !integer(i4) :: unit

    read(*,*) input_file

    open(unit = 3, file = input_file)
    read(3, nml = input_parameters)
    !close(3)

end subroutine read_input