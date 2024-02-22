subroutine regressive_step

    use iso_fortran_env, only : dp => real64, i4 => int32
    use parameters
    use grid
    use Crout_method

    implicit none

    real(dp), dimension(:,:) :: a

    do j = 1, m - 2
        do j = 1, m - 2
            a(j,j) = 0
        end do
    end do

    do j = 1, m - 3
        a(j,j+1) = -f
    end do

    do j = 1, m - 2 
        a(j,j) = 1 + 2*f
    end do

    do j = 2, m - 2
        a(j,j-1) = -f
    end do

    do i = 1, n - 1
            u(:,i + 1) = Crout_sol(a,u(:,i),m-2)
    end do
    
end subroutine regressive_step