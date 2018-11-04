
                       /*  Simplest MPI code  -  Hello World  */

                       /*  Tasks are on different processes   */
                       /*  Master - Slave subroutines         */

#include	<stdio.h>
#include        <stdlib.h>
#include	<mpi.h>         /* MPI header file */


                                /* master routine */
void master( int rank, int size )                   
{
  printf( " (master routine) I am %d out of %d  -- I am the master! \n", 
                                                              rank, size );
}


                                /* slave routine */
void slave( int rank, int size )
{
   if ( rank == 0 ) 
     {
        fprintf( stderr, "Error in the slave routine \n" );
        MPI_Finalize();
        exit (1);
     }
   else if ( rank == size-1 )
      printf( " (slave routine) I am %d out of %d  -- I am last in this world! \n",
                                                             rank, size );
   else
      printf( " (slave routine) I am %d out of %d  -- I am a great worker! \n", 
                                                             rank, size );
}


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
      master( rank, size );
   else 
      slave( rank, size );


                                 /* out of the virtual machine */
   MPI_Finalize();
}
