
                       /*  Simplest MPI code  -  Hello World  */

                       /*  Tasks are on different processes   */

#include	<stdio.h>
#include	<mpi.h>          /* MPI header file */

int main(int argc, char *argv[])
{

   int rank, size;
                                 /* init into MPI */
   MPI_Init(&argc, &argv);
                                 /* my rank - my id */
   MPI_Comm_rank(MPI_COMM_WORLD, &rank);
                                 /* how many processes in the virtual machine */
   MPI_Comm_size(MPI_COMM_WORLD, &size);


                                  /* tasks to perform may depend on */
                                  /* which process is running       */
   if ( rank == 0 ) 
      printf( " I am %d out of %d  -- I am the master! \n", rank, size );
   else if ( rank == size-1 )
      printf( " I am %d out of %d  -- I am last in this world! \n", rank, size );
   else
      printf( " I am %d out of %d  -- I am a great worker! \n", rank, size );


                                 /* out of the virtual machine */
   MPI_Finalize();

}


