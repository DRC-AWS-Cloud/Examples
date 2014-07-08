MPI Tutorial Examples
=================


------- CREDITS -------
  Thanks and credit goes to Wes Kendall for the C examples.
  The Fortran examples were written by Joshua Nyden.


------- BUILDING THE EXAMPLES -------
  These examples were tested on an AWS cluster built using StarCluster v 0.95.5. They were confirmed to run properly with MPICH2 on that cluster. They should still work with any other installation of MPI that comes after that, however.

  --- C EXAMPLES ---
    The C code comes with makefiles. Simply go to the directory containing the programs you wish to run, and "make all."

  --- FORTRAN EXAMPLES ---
    The Fortran examples can be compiled using your Fortran MPI compiler. In my case, this is "mpif90". So, if I want to build "MPI_HELLO_WORLD.f90" and call it "hello", I would type "mpif90 -o hello ./MPI_HELLO_WORLD.f90"


------- RUNNING THE EXAMPLES -------

  --- C EXAMPLES ---
    The C programs each have a Perl script included to run them. You can run each program by using that script with the name of the program as an argument. For instance, to run the mpi_hello_world program, you type "./run.perl mpi_hello_world." Alternatively, you can invoke your computer's MPI wrapper yourself. To do this in my case, I type "mpirun -n *NUMBER OF PROCESSES* ./mpi_hello_world".
  
  --- FORTRAN EXAMPLES ---
    The Fortran examples can be run by invoking your computer's MPI wrapper. If I wanted to run the "hello" program, I would type "mpirun -n *NUMBER OF PROCESSES* ./hello".
