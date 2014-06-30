program MPI_GATHER_TEST

! This program has each process generate an array of random numbers before
! adding that up and using MPI_GATHER to send those sums to the root process
! for more addition.
! If you are using a gfortran compiler, the sums will be the same every time the program is run.
! Don't worry. That's not what the program is trying to teach. It exists to demonstrate MPI_GATHER.

    include 'mpif.h'
    integer rank, size, ierror, tag, status(MPI_STATUS_SIZE)
    integer grand_total
    integer random_numbers(25)
    real random_result
    integer final_sum(1)
    integer sum_recv_buff(2)


    call MPI_INIT(ierror)
        call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
        call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
        final_sum = 0;
        !print *,rank
        do 10 i = 1, 25
           call RANDOM_NUMBER(random_result)
           random_numbers(i) = INT(random_result * 100)
 10     continue

        do 20 i = 1, 25
            final_sum(1) = final_sum(1) + random_numbers(i)
 20     continue
        print *, 'process final sum: ', final_sum(1)
        call MPI_GATHER(final_sum,1,MPI_INTEGER,sum_recv_buff,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierror)
        grand_total = 0
        if (rank == 0) then
           !print *,grand_total
            do 30 i = 1,2
                grand_total = grand_total + sum_recv_buff(i)
 30         continue
            print *,'Grand total: ',grand_total
        end if
        !print *,'program complete'
     call MPI_FINALIZE(ierror)
end program MPI_GATHER_TEST
