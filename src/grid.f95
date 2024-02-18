module grid

    use iso_fortran_env, only : dp => real64, i4 => int32

    implicit none

    real(dp), allocatable dimension(:) :: x, t
    real(dp), allocatable, dimension(:,:) :: u

    contains

    subroutine set_grid(t,t_i,k,x,x_i,h)
        integer(i4) :: i, j
        real(dp), intent(in) :: t_i, x_i
        real(dp), intent(out), dimension(:) :: t, x

        t(1) = t_i 
         do i = 1, n - 1
             t(i+1) = ti + k*i
        end do

        x(1) = x_i
        do j = 1, m - 1
            x(j+1) = xi + h*j
        end do
    
    end subroutine

end module grid