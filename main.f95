program main

    use iso_fortran_env, only : dp => real64, i4 => int32

    implicit none

    integer(i4) :: n, m, i, j
    real(dp) :: h, k, a, f, pi, ti, tf, xi, xf
    real(dp), allocatable :: x(:), t(:)

    real(dp), allocatable, dimension(:,:) :: u

    n = 10
    m = 10
    ti = 0.0
    tf = 1.0
    xi = 0.0
    xf = 1.0

    a = 0.4
    pi = 4*ATAN(1.0)

    k = (tf-ti)/(n-1)
    h = (xf-xi)/(m-1)
    f = a**2*k/h**2

    allocate(x(m),t(n),u(m,n))

    t(1) = ti 
    do i = 1, n - 1
        t(i+1) = ti + k*i
    end do

    x(1) = xi
    do j = 1, m - 1
        x(j+1) = xi + h*j
    end do

    do i = 1, n
        u(1, i) = 0.0
        u(m, i) = 0.0
    end do

    do j = 1, m
        u(j, 1) = SIN(pi*x(j))
    end do


    do j = 1, n - 1
        do i = 2, m - 1
            u(i,j+1) = (1-2*f)*u(i,j) + f*(u(i+1,j)+u(i-1,j)) 
        end do
    end do

    open( unit = 100, file = 'heat_bar.dat')
    do j = 1, m
        write(100,*) x(j), u(j,:)
    end do

end program main