subroutine progressive_step

    use parameters
    use grid

    implicit none

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