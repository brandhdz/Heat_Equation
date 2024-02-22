program main

    use grid
    use init_conditions

    implicit none

    call read_input()
    call assign_values()
    call set_grid(t, t_if(1), k, x, x_if(1), h)
    call set_init_conditions(u, x, n, m, f_if(1), f_if(2))

    if ( method == 'Explicit' ) then
        call progressive_step()
    else if ( method == 'Matrix') then 
        call regressive_step()
    else
        print*, "Método incorrecto"
    end if
    
    call write_data()

end program main