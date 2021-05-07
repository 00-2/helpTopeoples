#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int compare(const char* first,const char * sec) { 
    int ctd1 = 0, ctd2 = 0;
    for (int i =0; i<strlen(first); ++i){
        if (first[i] == 'a' )ctd1++;
    }
    for (int i =0; i<strlen(sec); ++i){
        if (sec[i] == 'a' )ctd2++;
    }
    return ctd1 < ctd2 ? -1 : 1;
}

void shiftDown(char **numbers, int root, int bottom)
{
  int maxChild; // индекс максимального потомка
  int done = 0; // флаг того, что куча сформирована
  // Пока не дошли до последнего ряда
  while ((root * 2 <= bottom) && (!done)) 
  {
    if (root * 2 == bottom)    // если мы в последнем ряду,
      maxChild = root * 2;    // запоминаем левый потомок
    // иначе запоминаем больший потомок из двух
    else if (compare(numbers[root * 2],numbers[root * 2 + 1])==1)
      maxChild = root * 2;
    else
      maxChild = root * 2 + 1;
    // если элемент вершины меньше максимального потомка
    if (compare(numbers[root],numbers[maxChild])==-1) 
    {
      char * temp = numbers[root]; // меняем их местами
      numbers[root] = numbers[maxChild];
      numbers[maxChild] = temp;
      root = maxChild;
    }
    else // иначе
      done = 1; // пирамида сформирована
  }
}
// Функция сортировки на куче
void heapSort(char **numbers, int array_size) 
{
  // Формируем нижний ряд пирамиды
  for (int i = (array_size / 2); i >= 0; i--)
    shiftDown(numbers, i, array_size - 1);
  // Просеиваем через пирамиду остальные элементы
  for (int i = array_size - 1; i >= 1; i--)
  {
    char * temp = numbers[0];
    numbers[0] = numbers[i];
    numbers[i] = temp;
    shiftDown(numbers, 0, i - 1);
  }
}


void hsort(char *base, size_t nel, size_t width, int (*compare)(const char *a,const char *b)) { 
    char ** arr;
    arr = (char **) malloc(sizeof(char*)*nel+1);
    int count = 0;
    for(int i = 0 ; i<nel; i++){
        char * tmp = (char *) malloc(sizeof(char)*width+1);
        strncpy(tmp, base+count, width);
        arr[i]=(char *) malloc(sizeof(char)*width+1);
        arr[i]=tmp;
        count+=width;
    }
    printf("\nнеотсортированный массив\n");
    for(int i=0; i<nel;i++){
        printf(arr[i]);
        printf("\n");
    }
    heapSort(arr, nel);
    printf("\nотсортированный\n");
    for(int i=0; i<nel;i++){
        printf(arr[i]);
        printf("\n");
    }
}

int main()
{
    char base[100];
    int nel;
    printf("Введите кол-во элементов(ширины 4):");
    scanf("%d", &nel);
    printf("Введите строку:");
    scanf("%s", base);
    hsort(base,3,4,compare);
  return 0;
}