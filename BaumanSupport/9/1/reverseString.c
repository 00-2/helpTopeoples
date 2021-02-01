#include <stdlib.h>
#include <stdio.h>

typedef enum {false, true} bool; //перечисление - синтаксис


typedef struct Item {
    char data;
    struct Item *next;
} Item;

typedef struct List {
    Item *head;
    Item *tail;
} List;

List *list_new() {//Функция calloc выделяет блок памяти для массива размером — num элементов, каждый из которых занимает   size байт, и инициализирует все свои биты в нулями.
    return (List *) calloc(1, sizeof(List));
}

void list_delete(List *list) {//удаление листа
    Item *ptr = list->head, *ptr_prev;
    while (ptr) {
        ptr_prev = ptr;
        ptr = ptr->next;
        free(ptr_prev);
    }//идем по листу, начиная с головы. Каждый раз чистим предыдущий
    free(list);//чистим голову
}

void list_print(const List *list) {
    Item *ptr = list->head;
    while (ptr) {
        printf("%c", ptr->data);
        ptr = ptr->next;
    }// пока элементы есть : Выводим значение элемента ,указатель на элемент = указатель на следующий
    printf("\n");
}

int list_push_back(List *list, char data) {
    Item *ptr = (Item *) malloc(sizeof(Item));//временный элемент
    if (!ptr) {//если памяти нет
        return -1;
    }
    ptr->data = data;//значение временного элемента
    ptr->next = NULL;
    if (!list->head) {//если список пуст
        list->head = ptr;//указатель на голову и конец равен временному  
        list->tail = ptr;
    } else {
        list->tail->next = ptr;//конец ссылается на временный элемент
        list->tail = ptr;//конец = временному элементу
    }
    return 0;
}

int list_insert(List *list, char data) {
    Item *ptr = list->head, *ptr_prev = NULL;
    while (ptr && (ptr->data < data)) {//всегда по возрастанию
        ptr_prev = ptr;
        ptr = ptr->next;
    }
    //вставляем между ptr_prev и ptr
    Item *new = (Item *) malloc(sizeof(Item));//выделение памяти
    if (!new) {
        return -1;
    }
    new->data = data;
    new->next = ptr;//следующий указывает на ptr - дальше два варианта
    if (ptr_prev) {//если элемент не первый
        ptr_prev->next = new;
    } else {//если элемент первый,
        list->head = new;//голова становится новым элементов
    }
    if (!ptr) {//если ptr == NULL, то list->tail = 
        list->tail = new;
    }
    return 0;
}

void list_remove(List *list, char data) {//удаление элемента из массива
    Item *ptr = list->head, *ptr_prev = NULL;
    while (ptr && ptr->data != data) {
        ptr_prev = ptr;
        ptr = ptr->next;
    }//находим элемент, удаляем ptr
    if (!ptr) {
        return;
    }
    if (ptr == list->head) {//если удалять начальный
        list->head = ptr->next;
    }
    if (ptr == list->tail) {//если конечный
        list->tail = ptr_prev;
    }
    if (ptr_prev) {
        ptr_prev->next = ptr->next;
    }
    free(ptr);
}

bool list_contains(List *list, char data){//проерка, содержит ли лист элементы
    Item *ptr = list->head;
    while (ptr && ptr->data != data) {
        ptr = ptr->next;
    }
    if (ptr && ptr->data == data){
        return 1;
    }
    return 0;
}

int list_length(List *list){//размер листа
    int ctd;
    Item *ptr = list->head;
    while (ptr) {
        ctd++;
        ptr = ptr->next;
    }
    return ctd;
}

void list_remove_duplicates(List *list, char data){//удаления повторений
    Item *ptr = list->head, *ptr_prev = NULL;
    
    while(list_contains(list, data)){
    while (ptr && ptr->data != data) {
        ptr_prev = ptr;
        ptr = ptr->next;
    }//ptr_prev - первый элемент, который мы искали  
    
    if (ptr){//если элемент, который мы искали - не последний, то
        ptr_prev=ptr;
        ptr=ptr->next;}
    
    if (!ptr) {
        return;
    }
    
    while(ptr && ptr->data==data){
        ptr_prev->next = ptr->next;
        ptr = ptr->next;
    }//удаление элементов, начиная с ptr, если нашли эл не равный тому, что ищем - останавливаемся
    }//теперь начинаем поиск с ptr найденного выше
}

void list_replace_symbols(List *list, char source, char target) {//замена символов
    Item *ptr = list->head;
    while (ptr) {
        if (ptr->data == source){//если нашли элемент с таким значением, то поменяли ему значение
            ptr->data = target;
        }
        ptr = ptr->next;
    }   
}

void list_reverse(List *list){
    Item *phead = list->head;
    Item *prhead = NULL; // Здесь в итоге окажется указатель на голову перевёрнутого списка.

    while (phead != NULL)
    {
        Item *p = phead->next;
        phead->next = prhead;
        prhead = phead;
        phead = p;
    }
    list->head = prhead;
}

