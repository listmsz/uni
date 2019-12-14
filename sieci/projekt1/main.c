#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <ctype.h>
#include <netdb.h>

char *trim(char *s) {
    char *ptr;
    if (!s)
        return NULL;   // handle NULL string
    if (!*s)
        return s;      // handle empty string
    for (ptr = s + strlen(s) - 1; (ptr >= s) && isspace(*ptr); --ptr);
    ptr[1] = '\0';
    return s;
}

int main(void)
{
    char ip_address[512] = "127.0.0.1";
    char file_path[1024];
    char destination_file_path[1024];
    struct sockaddr_in adr;
    unsigned int port = 5000;
    int LENGTH = 1024;
    int s;

    s = socket(PF_INET, SOCK_STREAM, 0);
    adr.sin_family = AF_INET;
    adr.sin_port = htons(port);
    adr.sin_addr.s_addr = inet_addr(ip_address);
    if (connect(s, (struct sockaddr *)&adr,
                sizeof(adr)) < 0)
    {
        printf("Connection failed\n");
        return 1;
    }
    printf("Connection established.\nPlease provide local file path (jpeg/png, up to 10MiB):");
    fflush(stdout);
    fgetc(stdin);
    fgets(file_path, 1024, stdin);
    printf("file_path received.\n");

    printf("Please provide remote file path:");
    fflush(stdout);
    fgetc(stdin);
    fgets(destination_file_path, 1024, stdin);

    int converted_number = htonl(strlen(destination_file_path));
    write(s, &converted_number, sizeof(converted_number));

    send(s, destination_file_path, strlen(destination_file_path), 0);
    printf("file_path sent.\n");

    // TODO
    char *fs_name = trim(file_path);
    char sdbuf[LENGTH];
    printf("Sending %s", fs_name);
    FILE *fs = fopen(fs_name, "rb");
    if (fs == NULL)
    {
        printf("File %s not found.\n", fs_name);
        exit(1);
    }

    bzero(sdbuf, LENGTH);
    int fs_block_sz;
    while ((fs_block_sz = fread(sdbuf, sizeof(char), LENGTH, fs)) > 0)
    {
        if (send(s, sdbuf, fs_block_sz, 0) < 0)
        {
            fprintf(stderr, "Failed to send file");
            break;
        }
        bzero(sdbuf, LENGTH);
    }
    printf("File sent.");

    close(s);
    return 0;
}