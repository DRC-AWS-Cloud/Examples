program MPI_PING_PONG
! This program is known as a ping pong program. It uses MPI_SEND and MPI_RECV
! to send messages back and forth between two processes.
    implicit none
    include 'mpif.h'
    integer rank, size, ierror, tag, status(MPI_STATUS_SIZE)
    integer ping_pong_counter ! This will increment each time a message is received.
    integer isEven
    integer partner_rank
    call MPI_INIT(ierror)                            ! Initialize MPI on all processes.
    call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror) ! Tell each process the size of the world.
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror) ! Tell each process its rank.

    ping_pong_counter = 0
    partner_rank = mod(rank + 1,2)
    do
        if (ping_pong_counter == 50) then
            exit
        endif
        isEven = mod(ping_pong_counter,2)
        if (rank == isEven) then
            ping_pong_counter = ping_pong_counter + 1
            print *,'Process',rank,'sending counter value of',ping_pong_counter
            call MPI_SEND(ping_pong_counter,1,MPI_INTEGER,partner_rank,5,MPI_COMM_WORLD,ierror)
        else
            call MPI_RECV(ping_pong_counter,1,MPI_INTEGER,partner_rank,5,MPI_COMM_WORLD,status,ierror)
            print *,'Process',rank,'getting counter value of',ping_pong_counter
        endif
    enddo
end program MPI_PING_PONG
