subroutine assign_values
    
    use parameters
    use grid

    implicit none

    pi = 4*ATAN(1.0)

    k = (t_if(2)-t_if(1))/(n-1)
    h = (x_if(2)-x_if(1))/(m-1)

    f = a**2*k/h**2
    
    allocate(x(m),t(n),u(m,n))

end subroutine assign_values