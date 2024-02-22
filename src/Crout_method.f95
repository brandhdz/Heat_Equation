module Crout_method

    use iso_fortran_env, only : dp => real64, i4 => int32

    implicit none

    contains

    function Crout_sol(a, b, d) result(s)

        implicit none

        integer(i4) :: i
        integer(i4), intent(in) :: d
        real(dp), dimension(d) :: z, s
        real(dp), dimension(:), intent(in) :: b
        real(dp), dimension(d,d) :: l, w
        real(dp), dimension(d,d), intent(in) :: a

        do i = 1, d
            w(i,i) = 1
        end do

        l(1,1) = a(1,1)
        w(1,2) = a(1,2)/l(1,1)
        z(1) = b(1)/l(1,1)

        do i = 2, d - 1
            l(i,i-1) = a(i,i-1)
            l(i,i) = a(i,i) - l(i,i-1)*w(i-1,i)
            w(i,i+1) = a(i,i+1)/l(i,i)
            z(i) = (b(i)-l(i,i-1)*z(i-1))/l(i,i)
        end do

        l(d,d-1) = a(d,d-1)
        l(d,d) = a(d,d) - l(d,d-1)*w(d-1,d)
        z(d) = (b(d)-l(d,d-1)*z(d-1))/l(d,d)

        s(d) = z(d)

        do i = d - 1 , 1, -1
            s(i) = z(i) - w(i,i+1)*s(i+1)
        end do

        end function Crout_sol

end module Crout_method