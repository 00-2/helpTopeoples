
#include <stdio.h>
#include <conio.h>



void bubbleSort(int arr[], int n)
{
    // Базовый вариант
    if (n == 1)
        return;
    // Один проход пузырьковой сортировки. После
    // этот проход, самый большой элемент
    // перемещается (или всплывает) в конец.
    for (int i=0; i<n-1; i++)
        if (arr[i] > arr[i+1])
            {
                int t = arr[i];
                arr[i] = arr[i+1];
                arr[i+1]=t;
            }
    // Самый большой элемент исправлен,
    // повторить оставшийся массив
    bubbleSort(arr, n-1);
} 


void mergeSort(int *a, int n)
{
  int step = 1;  // шаг разбиения последовательности
  int *temp = (int*)malloc(n * sizeof(int)); // дополнительный массив
  while (step < n)  // пока шаг меньше длины массива
  {
    int index = 0;    // индекс результирующего массива
    int l = 0;      // левая граница участка
    int m = l + step;  // середина участка
    int r = l + step * 2;  // правая граница участка
    do
    {
      if (!(m<n)){
          m=n;
      }// сортируемый участок не выходит за границы последовательности
      if (!(r<n)){
          r=n;
      }
      int i1 = l, i2 = m; // индексы сравниваемых элементов
      for (; i1 < m && i2 < r; ) // пока i1 не дошёл до середины и i2 не дошёл до конца
      {
        if (a[i1] < a[i2]) { temp[index++] = a[i1++]; } // заполняем участок результирующей последовательности
        else { temp[index++] = a[i2++]; }
      }
      // Или i1 < m или i2 < r - только один из операторов while может выполниться
      while (i1 < m) temp[index++] = a[i1++]; // заносим оставшиеся элементы сортируемых участков
      while (i2 < r) temp[index++] = a[i2++]; // в результирующий массив
      l += step * 2; // перемещаемся на следующий сортируемый участок
      m += step * 2;
      r += step * 2;
    } while (l < n); // пока левая граница сортируемого участка - в пределах последоватльности
    for (int i = 0; i < n; i++) // переносим сформированный массив обратно в a
      a[i] = temp[i];
    step *= 2; // увеличиваем в 2 раза шаг разбиения
  }
}

int main()
{
    int **arr;
    int n,m;
    printf("n=");scanf("%d",&n);
    printf("\nm=");scanf("%d",&m);
    
    arr = (int**) malloc(n * sizeof(int*));
    for (int i = 0; i < m; i++) {
        arr[i] = (int*) malloc(m * sizeof(int));
    }
    
    
    for(int i = 0; i<n; i++){
        for (int j = 0; j<m; j++)  // цикл по столбцам
        {
            arr[i][j]=rand()%100-30;            
        }
    }
    
    for(int i = 0; i<n; i++){
        for (int j = 0; j<m; j++)  // цикл по столбцам
        {
            printf("%d ",arr[i][j]);
        }
        printf("\n");
    }
    
    printf("\nПосле пузырьковой сортировки\n");
    for(int i=0; i<n; i++){
        
        bubbleSort(arr[i],m);
    }
    
    for(int i = 0; i<n; i++){
        for (int j = 0; j<m; j++)  // цикл по столбцам
        {
            printf("%d ",arr[i][j]);
        }
        printf("\n");
    }
    int ctd = 0;
    int * arrRes;
    arrRes = (int*) malloc(n*m * sizeof(int));
    for(int i = 0; i<n; i++){
        for (int j = 0; j<m; j++)  // цикл по столбцам
        {
            arrRes[ctd]=arr[i][j];    
            ctd+=1;
        }
    }
    printf("\n");
    for(int i =0; i<n*m;i++){
        printf("%d ", arrRes[i]);
    }
    printf("\nПосле сортировки слиянием\n");
    
    mergeSort(arrRes, n*m);
    
    for(int i =0; i<n*m;i++){
        printf("%d ", arrRes[i]);
    }
    
    return 0;
}
