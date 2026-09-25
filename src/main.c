#include <stdio.h>
#include <stdlib.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char dest[100];
    const char* src = "Hello OS Project!";
    
    printf("mystrlen: %d\n", mystrlen(src));
    
    mystrcpy(dest, src);
    printf("mystrcpy: %s\n", dest);
    
    mystrncpy(dest, "Short", 5);
    dest[5] = '\0';
    printf("mystrncpy: %s\n", dest);
    
    mystrcat(dest, " Append");
    printf("mystrcat: %s\n", dest);

    printf("\n--- Testing File Functions ---\n");
    FILE* test_file = fopen("test.txt", "w+");
    if (test_file) {
        fputs("This is a test line.\nAnother line with the word OS.\nThird line.", test_file);
        
        int lines, words, chars;
        if (wordCount(test_file, &lines, &words, &chars) == 0) {
            printf("WordCount - Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);
        }
        
        char** matches = NULL;
        int count = mygrep(test_file, "OS", &matches);
        printf("Grep matches found: %d\n", count);
        for (int i = 0; i < count; i++) {
            printf("Match %d: %s\n", i + 1, matches[i]);
            free(matches[i]); 
        }
        free(matches);
        fclose(test_file);
        remove("test.txt"); 
    }
    return 0;
}
