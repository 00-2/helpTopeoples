#include <stdlib.h>
#include <stdio.h>
#include "reverseString.c"



int main() {
    List *l = list_new();
    char c;
    c=getchar();
    while (c!=EOF)
    {
        if (c=='\n'){
            //удаляем пробелы, разворачиваем строку
            list_replace_symbols(l,'\t',' ');
            list_remove_duplicates(l,' ');
            list_reverse(l);
            list_print(l);
            list_delete(l);
            l=list_new();
        }
        else{   
            list_push_back(l,c);
        }
        c=getchar();
    }
    return 0;
}
