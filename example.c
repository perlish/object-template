/* file libprint.c */
#include "stdio.h"

int  main(int argc, char *argv[])
{
	printf("normal print \n");
	printstring(argv[1]); 
	return (0);
}
