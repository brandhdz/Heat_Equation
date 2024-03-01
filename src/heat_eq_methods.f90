module heat_eq_methods

    use iso_fortran_env, only : dp => real64, i4 => int32
    use parameters
    use grid
    use Crout_method

    implicit none

    contains

    subroutine progressive_step

    if ( f > 0.5 ) then
        write(*,*) "¡Método inestable!"
        write(*,*) "Prueba con otros parámetros o con otro método"
    else
        do i = 1, n - 1
            do j = 2, m - 1
                u(j,i+1) = (1-2*f)*u(j,i) + f*(u(j+1,i)+u(j-1,i)) 
            end do
        end do

        call write_data()

    end if
    
    end subroutine progressive_step

    subroutine regressive_step

        implicit none

        real(dp), dimension(m,m) :: p

        do j = 1, m 
            do i = 1, m
                p(j,i) = 0
            end do
        end do
    
        p(1,1) = 1
    
        do j = 2, m - 2
            p(j,j+1) = -f
        end do
    
        do j = 2, m - 1
            p(j,j) = 1 + 2*f
        end do
    
        do j = 3, m - 1
            p(j,j-1) = -f
        end do
    
        p(m,m) = 1
        
        do i = 1, n - 1
            u(:,i + 1) = Crout_sol(p,u(:,i),m)
        end do

        call write_data()
    
    end subroutine regressive_step

    subroutine CN_step

        implicit none

        real(dp), dimension(m) :: r
        real(dp), dimension(m,m) :: q

        do j = 1, m 
            do i = 1, m
                q(j,i) = 0
            end do
        end do

        q(1,1) = 1
    
        do j = 2, m - 2
            q(j,j+1) = -f*0.5
        end do
    
        do j = 2, m - 1
            q(j,j) = 1 + f
        end do
    
        do j = 3, m - 1
            q(j,j-1) = -f*0.5
        end do
    
        q(m,m) = 1

	    do i = 1, n - 1
            r(:) = u(:,i)
            do j = 2, m - 1 
                u(j, i) = (1-f)*r(j) + f*0.5*(r(j+1)+r(j-1))
            end do
	        u(:,i + 1) = Crout_sol(q,u(:,i),m)
        end do

        call write_data()
    
    end subroutine CN_step
    
end module heat_eq_methods