subroutine regressive_step

    use iso_fortran_env, only : dp => real64
    use parameters
    use grid

    implicit none

	real(dp), dimension(:) :: l, z

	l(1) = 1 + 2*f
	u(1,1) = -f/l(1)

	do i = 2, m - 1
	    
    end do

        do j = 1, n - 1
            do i = 2, m - 1
                u(i,j+1) = (1-2*f)*u(i,j) + f*(u(i+1,j)+u(i-1,j)) 
            end do
        end do
    
end subroutine regressive_step