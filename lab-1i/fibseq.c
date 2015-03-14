#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  float time_compare = 0;
  
  clock_t start,end; 
 
  scanf("%d",&number);
  
  start = clock();	
  result = fibonacci(number);   
  end = clock();

  time_compare = (float)(end - start)/CLOCKS_PER_SEC; 

  printf("The fibonacci sequence at %d is: %d,time is %f\n", number, result,time_compare);
  
}

