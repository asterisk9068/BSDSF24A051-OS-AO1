#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../include/myfilefunctions.h"

int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (file == NULL) return 1;
    *lines = 0; *words = 0; *chars = 0;
    int in_word = 0; char c;
    rewind(file);
    while ((c = fgetc(file)) != EOF) {
        (*chars)++;
        if (c == '\n') (*lines)++;
        if (c == ' ' || c == '\n' || c == '\t') { in_word = 0; } 
        else if (in_word == 0) { in_word = 1; (*words)++; }
    }
    return 0;
}

int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (fp == NULL || search_str == NULL || matches == NULL) return 1;
    char* line = NULL; size_t len = 0; int count = 0;
    *matches = NULL;
    rewind(fp);
    while (getline(&line, &len, fp) != -1) {
        if (strstr(line, search_str) != NULL) {
            *matches = realloc(*matches, sizeof(char*) * (count + 1));
            (*matches)[count] = strdup(line);
            count++;
        }
    }
    free(line);
    return count;
}
