subroutine increment_ctr(n, ctr)
    use omp_lib
    implicit none
    integer, intent(in) :: n
    double precision, intent(out) :: ctr
    
    double precision :: local_ctr
    
    integer :: i
    
    local_ctr = 0
    !$omp parallel private(i) reduction(+:local_ctr)
    !$omp do
    do i = 1, n
        local_ctr = local_ctr + 1.5
    end do
    !$omp end do
    !$omp end parallel
    
    ctr = ctr + local_ctr
end subroutine
    
program openmp_06
    use omp_lib
    integer, parameter :: n = 1000000
    double precision :: ctr

    call omp_set_num_threads(8)
    ctr = 0
    call increment_ctr(n, ctr)
    print *, ctr
    if(abs(ctr - 1.5e6) > 0.0002 ) error stop
end program