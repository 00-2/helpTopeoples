#define _CRT_SECURE_NO_WARNING
#include <stdio.h>
#include <string.h>
char * nameOfFile = "data.bin";
#define ML 128 
struct product
{
    char name[ML];
    int cost;
    int ctd;//кол-во экз-ов
}products[ML];

void input(int *size, int * flag){
    *flag = 1;
    FILE * f = fopen(nameOfFile, "wb");
    if  (f!=NULL){
        printf("Введите количество элементов: ");
        scanf("%d", size);
        printf("\n");
        for (int i = 0; i<*size;i++){
            printf("Введите название %d-го продукта:\n",i);
            scanf("%s", products[i].name);
            printf("Введите количество %d-го продукта:\n",i);
            scanf("%d", &products[i].ctd);
            printf("Введите стоимость %d-го продукта:\n",i);
            scanf("%d", &products[i].cost);
            printf("\nПросходит сохранение информации.\n");
        }
        fwrite(products, sizeof(products)/ML*(*size),1,f);
    }
    else{
        printf("Произошла ошибка при выполнении программы.");
    }
    fclose(f);
}

void output(int size){
    FILE * f = fopen(nameOfFile, "rb");
    if  (f!=NULL){
        rewind(f); // переместили указатель чтения/записи в начало файла
        printf("В файле %s сохранена следующая информация: \n",nameOfFile);
        for (int i = 0; i < size; i++){
            fread(&products[i], sizeof(products)/ML, 1, f); // чтение значений из файла побайтно
        }
        for(int i = 0; i<size; i++){
            printf("Название: %s Цена:%d Кол-во:%d.\n", products[i].name,products[i].cost,products[i].ctd);
        }
    }
    else{
        printf("Произошла ошибка при выполнении программы.");
    }
    fclose(f);
}

void delProduct(int * size){
    printf("Удаление всех записей, в которых количество < 8\n");
    FILE * f = fopen(nameOfFile, "rb");
    int tmp;
    int ctd, cost;
    char name[100];
    if  (f!=NULL){
        rewind(f);
        for (int i = 0; i<(*size); i++){
            fread(&products[i], sizeof(products)/ML, 1, f); // чтение значений из файла побайтно
        }
        for(int i = 0; i<(*size); i++){
            if (products[i].ctd<8){//перетаскиваем в конец, уменьшаем размер на 1
                for(int j = i;j<(*size); j++){
                    ctd = products[j].ctd;cost = products[j].cost; for(tmp = 0;tmp<100;tmp++)name[tmp] = products[j].name[tmp];
                    products[j] = products[j+1];
                    products[j+1].ctd = ctd; products[j+1].cost = cost;for(tmp = 0;tmp<100;tmp++)products[j+1].name[tmp] = name[tmp];
                }
                (*size)-=1;
            }
        }
    fclose(f);
    FILE * f = fopen(nameOfFile, "wb");
    rewind(f);
    printf("Оставшиеся в файле %s данные\n",nameOfFile);
    for (int i = 0; i<*size;i++){
            printf("Название: %s Цена:%d Кол-во:%d.\n", products[i].name,products[i].cost,products[i].ctd);
            fwrite(products, sizeof(products),1,f);
        }
    }
    else{
         printf("Произошла ошибка при выполнении программы.");
    }
    fclose(f);
}

void delFile(){
    printf ("Удаление файла: ");
    // Удаление файла
    if (-1 == remove (nameOfFile))
    printf ("Ошибка\n");
    else
    printf ("Выполнено\n");
}

void option(int *size){
    FILE * f = fopen(nameOfFile, "rb");
    int wholeSum = 0,ctd = 0;
    double averageCost=0;
    if  (f!=NULL){
        rewind(f);
        for (int i = 0; i<(*size); i++){
            fread(&products[i], sizeof(products)/ML, 1, f); // чтение значений из файла побайтно
        }
        for(int i = 0; i<(*size); i++){
          wholeSum+=products[i].cost;
          ctd+=products[i].ctd;
        }
        averageCost = wholeSum/ctd;
        printf("Стоимость : %d . Средняя цена : %f\n",wholeSum,averageCost);
        fclose(f);
    }
    else
    {
        printf("Произошла ошибка при выполнении программы.");
    }
    
}
int main(){
    int key;
    int size,flag;
    size=0;
    while(key!=5){
        printf("Выберите один из пунктов меню:\n0. Создать файл и записать в него данные.\n1.Вывести содержимое файла\n2.Удалить данные, где количество < 8.\n3.Удалить файл.\n4.Определить общую стоимость и среднюю цену.\n5.Выйти из программы.\n");
        scanf("%d", &key);
        printf("\n");
        if (key == 0){
            input(&size,&flag);
        }
        if (key == 1){
            if (flag){
                output(size);
            }
            else{
                printf("Сначала используйте пункт 0\n");
            }
        }
        if (key == 2){
            if (flag){
                delProduct(&size);
            }
            else{
                printf("Сначала используйте пункт 0\n");
            }
        }
        if (key == 3){
            if (flag){
                delFile();
                flag = 0;            
            }
            else{
                printf("Сначала используйте пункт 0\n");
            }
        }
        if (key == 4){
            if (flag){
                option(&size);            
            }
            else{
                printf("Сначала используйте пункт 0\n");
            }
        }
        if (key == 5){
            printf("Работа программы завершена. Ваши файлы сохранены в текстовом документе: %s", nameOfFile);
            return 0;
        }
    }
}