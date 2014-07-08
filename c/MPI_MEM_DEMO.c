//Author: Joshua Nyden

//This code exists to demonstrate that each MPI process has its own copy of memory.
//Variables with the same name as one another can and will hold different values.

#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  MPI_Init(NULL, NULL);

  // Get the number of processes
  int world_size;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);

  // Get the rank of the process
  int world_rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

  // Get the name of the processor
  char processor_name[MPI_MAX_PROCESSOR_NAME];
  int name_len;
  MPI_Get_processor_name(processor_name,&name_len);

  // Create a number
  int data;
  
  //Set it to the processor's rank.
  data = world_rank;
  
  printf("Process %d 's value for data is %d .\n",world_rank,data);

  MPI_Finalize();
}
