#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
#include "reverseString.c"



int main() {
    List *l = list_new();
    printf("Размер строки:\n");
    int size;scanf("%d", &size);
    char s[size];
    for(int i = 0; i<size; i++){
        if (i%5==0 && i!=(size-1) && i!=0){
            if (i%2){s[i] = ' ';}
            else{s[i] = '\t';}
            continue;
        }
        s[i] = rand()%65+57;
    }
    int ctd=-1;
    printf("СТРОКА ДЛЯ ТЕСТА:\n");
    for(int i = 0; i<size; i++){
        printf("%c", s[i]);
    }
    printf("\nСколько раз запустить программу?:");
    while(ctd<0){
        scanf("%d", &ctd);
        if(ctd<0){printf("\nОшибка.Сколько раз запустить программу?:");}
    }

   double avgTime;
   // Считываем текущее время
   //btime = time (NULL);
   int msec = 0, trigger = 10; /* 10ms */
   clock_t before = clock();
   
   
   //printf("%ld", btime);
   char c;
   for(int i = 0; i<ctd; ++i){  
        
        for(int j = 0; j<size; ++j){
            c = s[j];
            list_push_back(l,c);
        }
        list_replace_symbols(l,'\t',' ');
        list_remove_duplicates(l,' ');
        list_reverse(l);
        list_print(l);
        list_delete(l);
        l=list_new();
               
   }
    clock_t difference = clock() - before;
    msec = difference * 1000 / CLOCKS_PER_SEC;
    if (msec!=0){
        avgTime = pow(ctd/msec,-1);}
    printf("\nВремя работы программы:%d msec\nКол-во выполненных раз:%d\nСреднее время, затраченное на одну операцию:%.8fmsec\n", msec,ctd,avgTime);
}
