program main

    use parameters
    use grid
    use init_conditions

    implicit none

    call read_input()

    pi = 4*ATAN(1.0)

    k = (t_if(2)-t_if(1))/(n-1)
    h = (x_if(2)-x_if(1))/(m-1)

    f = a**2*k/h**2
    
    allocate(x(m),t(n),u(m,n))

    call set_grid(t, t_if(1), k, x, x_if(1), h)
    call set_init_conditions(u, x, n, m, f_if(1), f_if(2))
    call progressive_step()
    call write_data()

end program main