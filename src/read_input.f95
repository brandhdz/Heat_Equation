subroutine read_input

    use iso_fortran_env, only : i4 => int32
    use parameters

    implicit none

    integer(i4) :: unit

    read(*,*) input_file

    open(newunit = unit, file = input_file)
    read(unit, nml = input_parameters)
    close(unit)

end subroutine read_input