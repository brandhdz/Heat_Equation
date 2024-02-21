module Crout_method

    use iso_fortran_env, only : dp => real64, i4 => int32

    implicit none

    contains

    function Crout_sol(a, n) result(s)

        implicit none

        integer(i4) :: i
        integer(i4), intent(in) :: n
        real(dp), dimension(n) :: z
        real(dp), dimension(n) :: s
        real(dp), dimension(n,n) :: l, w
        real(dp), dimension(n,n+1), intent(in) :: a

        do i = 1, n
            w(i,i) = 1
        end do

        l(1,1) = a(1,1)
        w(1,2) = a(1,2)/l(1,1)
        z(1) = a(1,n+1)/l(1,1)

        do i = 2, n - 1
            l(i,i-1) = a(i,i-1)
            l(i,i) = a(i,i) - l(i,i-1)*w(i-1,i)
            w(i,i+1) = a(i,i+1)/l(i,i)
            z(i) = (a(i,n+1)-l(i,i-1)*z(i-1))/l(i,i)
        end do

        l(n,n-1) = a(n,n-1)
        l(n,n) = a(n,n) - l(n,n-1)*w(n-1,n)
        z(n) = (a(n,n+1)-l(n,n-1)*z(n-1))/l(n,n)

        s(n) = z(n)

        do i = n - 1 , 1, -1
            s(i) = z(i) - w(i,i+1)*s(i+1)
        end do

    end function Crout_sol
    
end module Crout_method