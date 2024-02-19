subroutine write_data

    use iso_fortran_env, only : dp => real64, i4 => int32
    use parameters
    use grid

    implicit none

    integer(i4) :: unit
    
    open(newunit = unit, file = file_name)
    do j = 1, m
        write(unit,*) x(j), u(j,:)
    end do
    !close(unit)
    
end subroutine write_data