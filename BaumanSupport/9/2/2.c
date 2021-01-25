#include <stdio.h>
#include "stdlib.h"
#include "string.h"
const char *MSGS[] = {"0. Quit", "1. Чтение данных для обработки из входного потока (с клавиатуры).",
 "2. Чтение данных для обработки из текстового файла.", "3. Случайная генерация данных для обработки.",
 "4. Сортировка данных (в соответствии с индивидуальным заданием).", "5. Обработка данных (в соответствии с индивидуальным заданием)",
 "6. Запись текущего состояния обрабатываемых данных в текстовый файл", "7. замеры сортировок(пока что нет)"};
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
}

int ** readFromKeyboard(int *n, int *m){
    printf("\nn=:");scanf("%d",n);
    printf("\nm=:");scanf("%d",m);
    int **matrix = (int**) malloc(*n * sizeof(int*));
    for(int i = 0; i<*n; i++){
        matrix[i] = (int*) malloc(*m*(sizeof(int)));
    }
    for(int i = 0; i<*n; ++i){
        for(int j = 0; j<*m; ++j){
            matrix[i][j]=i;
        }
    }

    for(int i = 0; i<*n; ++i){
        for(int j = 0; j<*m; ++j){
            scanf("%d", &matrix[i][j]);
        }
        printf("\n");
    }
    return matrix;
}

int ** readFromFile(int *n, int *m){
    printf("\nn=:");scanf("%d",n);
    printf("\nm=:");scanf("%d",m);
    int **matrix = (int**) malloc(*n * sizeof(int*));
for(int i = 0; i<*n; i++){
        matrix[i] = (int*) malloc(*m*(sizeof(int)));
    }

FILE* fp;
char * nameOfFile = "matrix.txt";
fp = fopen(nameOfFile, "rt");
if (fp == NULL)
{
    puts("Open file error");
    return;
}
for (int i = 0; i < *n; i++)
{
    for (int j = 0; j < *m; j++)
    {
        fscanf(fp, "%d ", &matrix[i][j]);
    }
}
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
    }

    for(int i = 0; i<*n; ++i){
        for(int j = 0; j<*m; ++j){
            matrix[i][j] = rand()%100-50;
        }
    }

    for (int i = 0; i <*n; i++){
        for (int j = 0; j <* m; j++){
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }
    return matrix;
}

void choicesSort(int* arrayPtr, int length_array) // сортировка выбором
{
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
    for(int i = 0; i<n; i++){
        choicesSort(matrix[i], m);
    }
}

int ** remakeMatrix(int ** matrix, int *n, int *m){
    if (!matrix){
        printf("\nСначала введите матрицу\n");
        return NULL;
    }
    int * sums = (int * ) malloc(*m*sizeof(m));
    int sum = 0;
    for(int j = 0; j<*m; ++j){
        for(int i = 0; i<*n; ++i){
            sum+=matrix[i][j];
        }
        sums[j] = sum;
        sum = 0;
    }
    //break
    int **matrixTmp = (int**) malloc((*n+1) * sizeof(int*));
    for(int i = 0; i < *n; ++i)
    {
        matrixTmp[i] = (int*) malloc(*m*(sizeof(int)));
        matrixTmp[i]=matrix[i];
        //copy(matrix[i], matrix[i] + m, matrixTmp[i]);
        //free(matrix[i]);
    }
    matrixTmp[*n] = sums;
    ++*n;
    return matrixTmp;
}

void writeMatrixIntoFile(int ** matrix, int n, int m){
FILE *fp;
char * nameOfFile = "matrix.txt";
fp = fopen(nameOfFile, "w");
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

int main() {
    int c = 0;
    int **matrix;
    int n, m;

do {
	c = dialog(MSGS, MSGS_SIZE);
    //c = getchar()-'0';
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
	}
} while (c != 0);
}
