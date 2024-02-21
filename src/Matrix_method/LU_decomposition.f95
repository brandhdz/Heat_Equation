program LU_decomposition

    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none

    integer(i4) :: i, j
    real(dp), dimension(4) :: z
    real(dp), dimension(4,4) :: l, u
    real(dp), dimension(4,5) :: a

    do j = 1, 5
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

    a(1,5) = 1
    a(2,5) = 0
    a(3,5) = 0
    a(4,5) = 1

    do i = 1, 4
        u(i,i) = 1
    end do

    l(1,1) = a(1,1)
    u(1,2) = a(1,2)/l(1,1)
    z(1) = a(1,5)/l(1,1)

    do i = 2, 3
        l(i,i-1) = a(i,i-1)
        l(i,i) = a(i,i) - l(i,i-1)*u(i-1,i)
        u(i,i+1) = a(i,i+1)/l(i,i)
        z(i) = (a(i,5)-l(i,i)*z(i-1))/l(i,i)
    end do

    l(4,3) = a(4,3)
    l(4,4) = a(4,4) - l(4,3)*u(3,4)
    z(4) = (a(4,5)-l(4,4)*z(3))/l(4,4)

    do i = 1, 4
        print*, a(i,:)
    end do
    print*, ""
    do i = 1, 4
        print*, l(i,:)
    end do
    print*, ""
    do i = 1, 4
        print*, u(i,:)
    end do

end program LU_decomposition