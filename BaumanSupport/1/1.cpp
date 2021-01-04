#define _CRT_SECURE_NO_WARNINGS // для возможности использования scanf
#include <stdio.h>
#include <stdlib.h> // для перехода на русский язык
int main()
{
  char str[256],strCmp[256],strWordLast[256];
  char c;
  int size=0, i=0,j=0,ctd=0,tmp;
  scanf("%c", &c);     // вводим значения переменной y
  str[i++]=c;
  while(c!='.'){
      scanf("%c", &c); 
      str[i++]=c;
  }
  size = ++i;
  printf("Исходный массив.\n");
  
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
  //a done
  //b st
  j=0,i=size-2;
  while(str[i]!=' '){
      strWordLast[j]=str[i];
      i--;
      j++;
  }//strWL - задом наперед
  
  
  for (char tmp, i=0;i<j/2;i++){//разворот strWL
      tmp = strWordLast[i];
      strWordLast[i]=strWordLast[j-i-1];
      strWordLast[j-i-1]=tmp;
  }  
  printf("Последнее слово:");
  
  for (i=0;i<j;i++){
      printf("%c",strWordLast[i]);
  }
  printf("\n");


  printf("Выводим слова, которые отличаются от последнего, удаляя из них последнюю букву.\n");
  
  j=0,ctd=0;
  for(i = 0; i<size-1; j++,i++){
    if (str[i]!=' '){
          strCmp[j]=str[i];
        }
    else{
        for(tmp = 0; tmp<j; tmp++){
            if (strCmp[tmp]!=strWordLast[tmp]){
                ctd++; //если нашли различие
            }
        }
        if (ctd!=0){
            for( tmp = 0;tmp<j-2; tmp++){
                printf("%c",strCmp[tmp]);
            }
            printf("\n");
        }
        j=-1,ctd=0; 
    }
  }
}
