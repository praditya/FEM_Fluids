#include<stdio.h>
#include<time.h>
int main(){

 int i,array[9],sum=0;
 double start_time,end_time;
 start_time = clock();
 for(i=1;i<10;i++){
   array[i]= i;
   sum = sum + array[i];
 }

 end_time = clock();
 printf("Total sum = %d and time taken = %lf\n",sum,end_time-start_time);
 return 0;
}
