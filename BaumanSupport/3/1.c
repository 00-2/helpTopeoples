#define _CRT_SECURE_NO_WARNINGS // для возможности использования scanf
#include <stdio.h>
#include <stdlib.h> // для перехода на русский язык
int main()
{
  char str[256],strRes[256];
  char c;
  int size=0, i=0,j=0,ctd=0,tmp;
  printf("Введите строку:\n");
  scanf("%c", &c);     // вводим значения переменной
  str[i++]=c;
  while(c!='\n'){
      scanf("%c", &c); 
      if(c!='\n')str[i++]=c;
  }
  size = ++i;
  printf("Исходная строка.\n");
  
  for (i=0;i<size-1;i++){
      printf("%c",str[i]);
  }
    printf("\n");

  //удаление пробелов лишних работает
  for(i = 0; i<size-1; i++){
      if (str[i]==' '){
          j=i+1,ctd=0;
          while(str[j]==' '){
              j++;//индекс окончания пробелов
              ctd++;//кол-во пробелов
            }
            for (;ctd>0;ctd--){//циклический сдвиг влево на кол-во пробелов-1
                c = str[i+1];
                for (tmp = i; tmp < size-1; tmp++) str[tmp] = str[tmp+1];
                str[size] = c;
                size-=1;
            }
        }
    }

    printf("Строка без пробелов.\n");
    for(i = 0; i<size-1;i++){
        printf("%c",str[i]);
    }
    printf("\n");
    
    int number;
    printf("Введите число:\n");
    scanf("%d", &number);
    printf("\n");

    printf("Вывести все слова, длина которых больше заданного числа.\n");
    ctd = 0;
    for (i = 0,j=0; i<size-1;i++,j++){
        if (str[i]==' '){
            if (j-1>number){
                for(ctd = 1; ctd<j;ctd++){
                    printf("%c", strRes[ctd]);
                }
                printf(" ");
            }
            j=0;
        }
        else{ 
            strRes[j] = str[i];
        }
    }
    if (j-1>number){
        for(ctd = 1; ctd<j;ctd++){
            printf("%c", strRes[ctd]);
        }
    }
}
