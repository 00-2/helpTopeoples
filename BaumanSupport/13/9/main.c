#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void csort(char *src, char *dest) { 
  char **a;    
  char sep [10]=" ";
  int i = 0;
  int n = (strlen(src));
  int ctdWords = 0; 
  printf("\nИсходная строка\n");
  for (i = 0; i<n; ++i){
      printf("%c", src[i]);
  }
  while (i < n)
    {
        if(src[i] == ' ' && src[i+1] == ' '){
           for (int j = i ; j + 1 < n; ++j)
           {
              src[j] = src[j+1];
           }
           n--;           
        }
        else
        ++i;
    }
  i=0;

  char * istr = strtok (src,sep);
  a = (char**) malloc(sizeof(char*)*100);
  a[i] = (char*) malloc(strlen(istr) + 1);
  while (istr != NULL)
   {
      a[i] = (char*) malloc(strlen(istr) + 1);
      strcpy(a[i], istr);
      ctdWords++;
      i++;
      // Выделение очередной части строки
      istr = strtok (NULL,sep);
   }
printf("\nНеотсортированная строка без пробелов\n");
for (int i = 0; i<ctdWords; i++){
    printf("%s ", a[i]);
}
for (int i = 0; i < ctdWords - 1; i++) {
        for (int j = 0; j < ctdWords - i - 1; j++) {                 
            if (strlen(a[j]) > strlen(a[j + 1])) {
                // меняем элементы местами
                char * temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
int * count = (int*) malloc(ctdWords+1);
for (int i = 0; i<ctdWords; i++){
    int size = strlen(dest);
    count[i] = size;
    for (int j = 0; j<strlen(a[i]); j++){
        dest[j+size]=a[i][j];
    }
    dest[strlen(dest)]=' ';
    }
printf("\nМассив count(для нижней строки)\n");
for (int i = 0; i<ctdWords; i++){
        printf("%d ", count[i]);
    }
}

int main(void) {  
  
  char *a;
  char str [27]="t1   te2 t3 test4";
   // Набор символов, которые должны входить в искомый сегмент
  a = (char*) malloc(sizeof(char)*100);
  csort(str, a);
  printf("\nОтсортированная строка\n");
  for (int i = 0; i<strlen(a); i++){
      printf("%c",a[i]);
  }
  return 0;
}