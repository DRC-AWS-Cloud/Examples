program MPI_BCAST_EX
! This program demonstrates the simple MPI_BCAST function.
! MPI_BCAST sends data from one process to all other processes in its group.
! It is much more efficient than reimplementing it with MPI_SEND and MPI_RECV.
! See the C program "compare_bcast.c" for a demonstration of this.

    implicit none
    use mpi
    integer rank, size, ierror, tag, status(MPI_STATUS_SIZE)
    integer dummy_data
    call MPI_INIT(ierror)                            ! Initialize MPI on all processes.
    call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror) ! Tell each process the size of the world.
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror) ! Tell each process its rank.

    dummy_data = 0
    print *,'Process',rank,'has created dummy_data and set it to',dummy_data
    if (rank == 0) then
        dummy_data = 5
        print *,'Process',rank,'has set dummy_data to',dummy_data
    endif

    call MPI_BCAST(dummy_data,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierror)
    if (rank == 0) then
        print *,'Process',rank,'has broadcast dummy_data.'
    endif
    print *,'Process',rank,'''s copy of dummy_data is',dummy_data


end program MPI_BCAST_EX
