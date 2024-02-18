module init_conditions

    use parameters

    implicit none
    
    allocate(x(m),t(n),u(m,n))

    do i = 1, n
        u(1, i) = 0.0
        u(m, i) = 0.0
    end do

    do j = 1, m
        u(j, 1) = SIN(pi*x(j))
    end do
    
end module init_conditions