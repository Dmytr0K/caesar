#include "functions.h"
#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#define MAX_LEN 512
int main () {
    char text[MAX_LEN] = "";
    char output[MAX_LEN] = "";
    int64_t key = 0;
    unsigned mode = 0;
    printf("Please choose a mode:\n");
    printf("1 - for encryption\n");
    printf("2 - for decryption\n");
    printf("Mode: ");
    if (!scanf("%d",&mode) || !mode || mode > 2) {
        printf("Error mode! Programm will be closed!\n");
        return 0;
    } else {
        printf("Enter text: ");
        fseek(stdin,0,SEEK_END);
        fgets(text,MAX_LEN,stdin);
        printf("Enter key: ");
        if (!scanf("%lld",&key)){
            printf("Error key! Programm will be closed!\n");
            return 0;
         }
        caesar(output,text,key,strlen(text),mode);
        puts(output);
    }
    return 0;
}
