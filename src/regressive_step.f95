subroutine regressive_step

    use iso_fortran_env, only : dp => real64, i4 => int32
    use parameters
    use grid
    use Crout_method

    implicit none

    real(dp), dimension(m,m) :: p

    p(1,1) = 1

    do j = 2, m - 1
        do i = 2, m - 1
            p(j,i) = 0
        end do
    end do

    do j = 2, m - 3
        p(j,j+1) = -f
    end do

    do j = 2, m - 1 
        p(j,j) = 1 + 2*f
    end do

    do j = 2, m - 1
        p(j,j-1) = -f
    end do

    p(m,m) = 1

    do i = 1, n - 1
        u(:,i + 1) = Crout_sol(p,u(:,i),m)
    end do
    
end subroutine regressive_step