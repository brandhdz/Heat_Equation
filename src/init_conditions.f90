module init_conditions

    use iso_fortran_env, only : dp => real64, i4 => int32
    use parameters

    implicit none

    contains

    subroutine set_init_conditions(u, x, n, m, f_i, f_f)
        
        integer(i4), intent(in) :: n, m
        real(dp), intent(in) :: f_i, f_f
        real(dp), dimension(:), intent(in) :: x
        real(dp), dimension(:,:), intent(out) :: u
        
        do i = 1, n
            u(1, i) = f_i
            u(m, i) = f_f
        end do

        do j = 2, m - 1
            u(j, 1) = SIN(pi*x(j))
        end do
    
    end subroutine

end module init_conditions