/*
 * main.c
 *
 *  Created on: 12 ott 2020
 *      Author: Roxanji
 */

#include <stdio.h>
#include "prog1.h"
#include "snake.h"

int try(void)
{
  int i, j, n;

  for (i = 0; i < 11; i++) {
    for (j = 0; j < 10; j++) {
      n = 10*i + j;
      if (n > 108) break;
      printf("\033[%dm %3d\033[m", n, n);
    }
    printf("\n");
  }
  return (0);
}

int main(){
	//hello();
	int a = 4;
	int b = 12;
	int c = a + b;

	/*
	int c = &a;
	void* vpt1 = &a;
	void* vpt2 = vpt1 + 1;
	 */

	printf("Dio boia");
	//printf("\e[1;1H\e[2J");
	printf("\033[2J\033[H");
	printf("mannaggia");
	printf("minchisa");


	return 0;
}

