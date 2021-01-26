#include <stdio.h>
#include "stdlib.h"
#include "string.h"
#include <time.h>
const char *MSGS[] = {"0. Завершить работу программы", "1. Чтение данных для обработки из входного потока (с клавиатуры).",
 "2. Чтение данных для обработки из текстового файла.", "3. Случайная генерация данных для обработки.",
 "4. Сортировка данных (в соответствии с индивидуальным заданием).", "5. Обработка данных (в соответствии с индивидуальным заданием)",
 "6. Запись текущего состояния обрабатываемых данных в текстовый файл", "7. Замеры сортировок(тестируйте на 100*100(минимально)"};
const int MSGS_SIZE = sizeof(MSGS) / sizeof(MSGS[0]);

int dialog(const char *msgs[], int n) {
    char *error = "";
    int choice;
    do {
	puts(error);
	error = "You're wrong. Try again!";
	for (int i = 0; i < n; ++i) {
	    puts(msgs[i]);
    }
	puts("Make your choice: ");
	choice = getchar() - '0';
	while (getchar() != '\n') {}
    } while (choice < 0 || choice >= n);
    return choice;
}//выдаёт  код символа -38, через раз выводит "You're wrong" 

int ** readFromKeyboard(int *n, int *m){
    printf("\nn=:");scanf("%d",n);
    printf("\nm=:");scanf("%d",m);
    int **matrix = (int**) malloc(*n * sizeof(int*));
    for(int i = 0; i<*n; i++){
        matrix[i] = (int*) malloc(*m*(sizeof(int)));
    }//ввод n,m, присваивание значений их указателям, выделение памяти под динмаческий массив  
	
    for(int i = 0; i<*n; ++i){
        for(int j = 0; j<*m; ++j){
            scanf("%d", &matrix[i][j]);
        }
        printf("\n");
    }//ввод матрицы с клавиатуры
    return matrix;//возвращает указатель
}

int ** readFromFile(int *n, int *m){
    printf("\nn=:");scanf("%d",n);
    printf("\nm=:");scanf("%d",m);
    int **matrix = (int**) malloc(*n * sizeof(int*));
for(int i = 0; i<*n; i++){
        matrix[i] = (int*) malloc(*m*(sizeof(int)));
    }//ввод n,m, присваивание значений их указателям, выделение памяти под динмаческий массив  

FILE* fp;
char * nameOfFile = "matrix.txt";//задаем имя файла
fp = fopen(nameOfFile, "rt");//открываем в режиме чтения текстового файла
if (fp == NULL)
{
    puts("Open file error");
    return;
}//если файл не открылся - вернулись в меню
for (int i = 0; i < *n; i++)
{
    for (int j = 0; j < *m; j++)
    {
        fscanf(fp, "%d ", &matrix[i][j]);
    }
}//прочитали матрицу, если в файле записано неправильно - не обработана ошибка
printf("\nМатрица\n");
for (int i = 0; i < *n; i++)
{
    for (int j = 0; j < *m; j++)
    {
        printf("%d\t", matrix[i][j]);
    }
    printf("\n");
}
fclose(fp);
return matrix;
}

int ** readRandomData(int *n, int *m){
    printf("\nn=:");scanf("%d",n);
    printf("\nm=:");scanf("%d",m);
    int **matrix = (int**) malloc(*n * sizeof(int*));
    for(int i = 0; i<*n; i++){
        matrix[i] = (int*) malloc(*m*(sizeof(int)));
    }//Выделение памяти

    for(int i = 0; i<*n; ++i){
        for(int j = 0; j<*m; ++j){
            matrix[i][j] = rand()%100-50;
        }
    }//заполнение рандомными данными

    for (int i = 0; i <*n; i++){
        for (int j = 0; j <* m; j++){
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }//вывод матрицы
    return matrix;
}

void choicesSort(int* arrayPtr, int length_array) // сортировка выбором(вроде бы возрастание)
{
    /*Поиск минимального значения элемента в массиве, и перемещения этого значения в начало массива.*/ 
    for (int repeat_counter = 0; repeat_counter < length_array; repeat_counter++)
    {
        int temp = arrayPtr[0]; // временная переменная для хранения значения перестановки
        for (int element_counter = repeat_counter + 1; element_counter < length_array; element_counter++)
        {
            if (arrayPtr[repeat_counter] > arrayPtr[element_counter])
            {
                temp = arrayPtr[repeat_counter];
                arrayPtr[repeat_counter] = arrayPtr[element_counter];
                arrayPtr[element_counter] = temp;
            }
        }
    }
}

void doChoisesSort(int** matrix, int n, int m){
    if (!matrix){
        printf("\nСначала введите матрицу\n");
        return;
    }
    for(int i = 0; i<n; i++){//для каждой строки
        choicesSort(matrix[i], m);
    }
}

int ** remakeMatrix(int ** matrix, int *n, int *m){
    //нахождение сумм
    if (!matrix){//Если матрицы нет
        printf("\nСначала введите матрицу\n");
        return NULL;
    }
    int * sums = (int * ) malloc(*m*sizeof(m));//выделение памяти под массив сумм
    int sum = 0;
    for(int j = 0; j<*m; ++j){
        for(int i = 0; i<*n; ++i){
            sum+=matrix[i][j];//сложение элементов столбцов
	    //Если не понимаешь - попробуй цикл на бумажке
        }
        sums[j] = sum;//запись найденной суммы в массив сумм
        sum = 0;
    }
    //нахождение сумм	
    int **matrixTmp = (int**) malloc((*n+1) * sizeof(int*));//выделение памяти (n+1)! тк должны добавить строку сумм 
    for(int i = 0; i < *n; ++i)
    {
        matrixTmp[i] = (int*) malloc(*m*(sizeof(int)));
        matrixTmp[i]=matrix[i];
        //copy(matrix[i], matrix[i] + m, matrixTmp[i]);
        //free(matrix[i]);
	// я не стал создавать новую матрицу, просто присвоил i эл указатели на старую матрицу
    }
    matrixTmp[*n] = sums;//последняя строка - массив сумм
    ++*n;//увеличили значение n по указателю 
    return matrixTmp; //вернули Измененную матрицу
}

void writeMatrixIntoFile(int ** matrix, int n, int m){
FILE *fp;
char * nameOfFile = "matrix.txt";
fp = fopen(nameOfFile, "w");//режим записи в текстовый файл
if (fp == NULL)
{
    puts("Open file error");
    return;
}
for (int i=0; i<n; ++i){
    for (int j=0; j<m;++j){
//сейчас выводим элементы матрицы 
        fprintf(fp,"%d%c",matrix[i][j], ' ');
  }
//после каждой строки переходим на новую строку
    fprintf(fp,"%c",'\n');
}
fclose(fp);
}

void bubbleSort(int *a, size_t size) {//обычная пузырьковая сортировка массива
    // При каждом проходе алгоритма по внутреннему циклу,
    //очередной наибольший элемент массива ставится на своё место в конце массива рядом с предыдущим «наибольшим элементом»,
    //а наименьший элемент перемещается на одну позицию к началу массива 
    size_t i, j;
    int tmp;
    for (i = 1; i < size; i++) {
        for (j = 1; j < size; j++) {
            if (a[j] > a[j-1]) {
                tmp = a[j];
                a[j] = a[j-1];
                a[j-1] = tmp;
            }
        }
    }
}

void timeOfSorts(int ** matrix, int n, int m){
   double avgTime;


   int tmpMatrix[n][m];
   for(int i = 0; i<n;i++){
       for(int j = 0; j<m; j++){
            tmpMatrix[i][j] = matrix[i][j];
       }
   }//создали матрицу tmp, чтобы измерять другую сортировку не на отсортированном массиве


   // Сортировка выбором
   int msec = 0; /* 10ms */
   clock_t before = clock();//начало работы программы
   for(int i = 0; i<n ; i++){
       choicesSort(tmpMatrix[i], m);
   }
   clock_t difference = clock() - before;
   msec = difference * 1000 / CLOCKS_PER_SEC;
   printf("\nВремя работы сортировки выбором:%d msec\n", msec);
   
   // Сортировка пузырьком
   for(int i = 0; i<n;i++){
       for(int j = 0; j<m; j++){
            tmpMatrix[i][j] = matrix[i][j];
       }
   }
   before = clock();
   for(int i = 0; i<n ; i++){
       bubbleSort(tmpMatrix[i], m);
   }
   difference = clock() - before;
   msec = difference * 1000 / CLOCKS_PER_SEC;
   printf("\nВремя работы сортировки пузырьком:%d msec\n", msec);

}

int main() {
    int c = 0;
    int **matrix;
    int n, m;

do {
	c = dialog(MSGS, MSGS_SIZE);//иногда тупит ввод
    //c = getchar()-'0';
    //ввод вверху работает идеально, но нет вывода меню
    switch(c) {
	case 0:
	    break;
	case 1:
	    matrix = readFromKeyboard(&n,&m);
	    break;
	case 2:
	    matrix = readFromFile(&n,&m);
	    break;
    case 3:
	    matrix = readRandomData(&n,&m);
	    break;
    case 4:
	    doChoisesSort(matrix,n,m);
	    break;
    case 5:
	    matrix = remakeMatrix(matrix,&n,&m);
	    break;
    case 6:
            writeMatrixIntoFile(matrix, n,m);
            break;
    case 7:
            timeOfSorts(matrix, n, m);
            break;
    }
} while (c != 0);
}
