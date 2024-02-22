program Crout_test

    use iso_fortran_env, only : dp => real64, i4 => int32
    use Crout_method

    implicit none

    integer(i4) :: i, j
    real(dp), dimension(4) :: x, b
    real(dp), dimension(4,4) :: a

    do j = 1, 4
        do i = 1, 4
            a(i,j) = 0
        end do
    end do

    do i = 1, 3
        a(i,i+1) = -1
    end do

    do i = 1, 4
        a(i,i) = 2
    end do

    do i = 2, 4
        a(i,i-1) = -1
    end do

    b = [1,0,0,1]

    x = Crout_sol(a,b,4)

    print*, x

end program Crout_test