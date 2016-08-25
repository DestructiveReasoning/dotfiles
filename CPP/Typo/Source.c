#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

int getSize(char **array)
{
	int i;
	for(i = 0; array[i]; i++);
	return i;
}

int main()
{
	srand(time(NULL)); 
	int size = 0;
	FILE *file;
	file = fopen("/home/harwiltz/.typo","r");
	char *line = NULL;
	size_t length = 0;
	ssize_t read;
	char *insults[128];
	while((read = getline(&line,&length,file)) != -1)
	{
		char *insult = line;
		insults[size] = insult;	
		size = size + 1;
		line = NULL;
	}
	fclose(file);
//	insults[size + 1] = NULL;
//	char *insults[] =  {"YOU FUCKIN IDIOT! FUCK!", "GO FUCK YOURSELF!", "DO YOU SEE MY NUTS?", "WHAT ARE YOU, AN ASSHOLE?","ARE YOU...RETARDED?","THAT'S WHAT I GOTTA SAY ABOUT YOUR PARTY",NULL};
	char systemcall[128];
//	puts(systemcall);
	memset(systemcall,128,'\0');
	strcpy(systemcall,"cowsay -f udder \"");
//	puts(systemcall);
	strcat(systemcall,insults[rand()%size]);
	int q;
//	for(q = 0; q < size; q++)
//	{
//		printf("%s, ",insults[q]);
//	}
//	printf("%d\n",getSize(insults));
	strcat(systemcall,"\"");
	system(systemcall);
	return 0;
}
