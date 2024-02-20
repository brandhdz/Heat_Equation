subroutine progressive_step

    use parameters
    use grid

    implicit none

    if ( f > 0.5 ) then
        write(*,*) "Método inestable"
        write(*,*) "Prueba con otros parámetros"
    else
        do j = 1, n - 1
            do i = 2, m - 1
                u(i,j+1) = (1-2*f)*u(i,j) + f*(u(i+1,j)+u(i-1,j)) 
            end do
        end do
    end if
    
end subroutine progressive_step