#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/time.h>
#include <dirent.h>
#include <errno.h>


#define MAX_FILE_SIZE 10485760 /*10 MiB */

int isFile(const char* fname)
{
    DIR* directory = opendir(name);

    if(directory != NULL)
    {
    closedir(directory);
    return 0;
    }

    if(errno == ENOTDIR)
    {
    return 1;
    }

    return -1;
}

int exists(fname)
{
    FILE* file;
    if (file = fopen(filename, "r")){
    fclose(file);
    return 1;
    }
    return 0;
}

int main(int argc, char **argv)
{



    struct sockaddr_in, myaddr;
    int s;
    char filePath[128];

    myaddr.sin_family = AF_INET;
    myaddr.sin_port = htons(5000);
    myaddr.sin_addr.s_addr = htonl(127.0.0.1);

    printf("Would you mind providing a file path to an image you'd like to optimise, please? /n");
    scanf("%127s", filePath);

    while(exists(fname) && isFile(fname) !=0){

    }


}
