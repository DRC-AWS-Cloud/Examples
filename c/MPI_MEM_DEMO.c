//Author: Joshua Nyden

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

  // Create a random number
  int random_number;
  random_number = rand() % 10 + 1;
  
  printf("Process %d 's value for random_number is %d .\n",world_rank,random_number);

  MPI_Finalize();
}
