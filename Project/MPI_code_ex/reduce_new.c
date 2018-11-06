
#include <stdio.h>
#include <mpi.h>
#include <stdlib.h> 
#define max_rows 100000
int array[max_rows];
double sum = 0;

void main(int argc, char **argv) 
   {
      double partial_sum,start_time,end_time;
      MPI_Status status;
	  int my_id, ierr, i, num_rows, num_procs, ista, iend;
      
      ierr = MPI_Init(&argc, &argv);
      
      ierr = MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
      ierr = MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
      start_time = MPI_Wtime();
      printf("Start_Process %lf for processor %d\n",start_time,my_id);

      ista = my_id * 3 + 1;
 	  iend = ista + 2;

 	  for (i=ista;i<=iend;i++)
 	  	array[i]=i;
 	  
 	  for(i=ista;i<=iend;i++)
 	   sum = sum + array[i];

 	  MPI_Reduce(&array,&sum,3,MPI_INT,MPI_SUM,0,MPI_COMM_WORLD);

 	  if(my_id == 0)
 	  printf("sum = %lf\n",sum);
 	  
 	  end_time = MPI_Wtime();
      printf("End_time %lf for processor %d\n",end_time,my_id);
      printf("Total time by processor %d in microseconds is %lf\n",my_id,(end_time-start_time)*1000000);

      ierr = MPI_Finalize();
   }
 