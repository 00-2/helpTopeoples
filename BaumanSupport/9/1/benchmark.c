#include <stdlib.h>
#include <stdio.h>
#include <time.h>

typedef enum {false, true} bool; 


typedef struct Item {
    char data;
    struct Item *next;
} Item;

typedef struct List {
    Item *head;
    Item *tail;
} List;

List *list_new() {
    return (List *) calloc(1, sizeof(List));
}

void list_delete(List *list) {
    Item *ptr = list->head, *ptr_prev;
    while (ptr) {
        ptr_prev = ptr;
        ptr = ptr->next;
        free(ptr_prev);
    }
    free(list);
}

void list_print(const List *list) {
    Item *ptr = list->head;
    while (ptr) {
        printf("%c", ptr->data);
        ptr = ptr->next;
    }
    printf("\n");
}

int list_push_back(List *list, char data) {
    Item *ptr = (Item *) malloc(sizeof(Item));
    if (!ptr) {
        return -1;
    }
    ptr->data = data;
    ptr->next = NULL;
    if (!list->head) {
        list->head = ptr;
        list->tail = ptr;
    } else {
        list->tail->next = ptr;
        list->tail = ptr;
    }
    return 0;
}

int list_insert(List *list, char data) {
    Item *ptr = list->head, *ptr_prev = NULL;
    while (ptr && (ptr->data < data)) {
        ptr_prev = ptr;
        ptr = ptr->next;
    }
    Item *new = (Item *) malloc(sizeof(Item));
    if (!new) {
        return -1;
    }
    new->data = data;
    new->next = ptr;
    if (ptr_prev) {
        ptr_prev->next = new;
    } else {
        list->head = new;
    }
    if (!ptr) {
        list->tail = new;
    }
    return 0;
}

void list_remove(List *list, char data) {
    Item *ptr = list->head, *ptr_prev = NULL;
    while (ptr && ptr->data != data) {
        ptr_prev = ptr;
        ptr = ptr->next;
    }
    if (!ptr) {
        return;
    }
    if (ptr == list->head) {
        list->head = ptr->next;
    }
    if (ptr == list->tail) {
        list->tail = ptr_prev;
    }
    if (ptr_prev) {
        ptr_prev->next = ptr->next;
    }
    free(ptr);
}

bool list_contains(List *list, char data){
    Item *ptr = list->head;
    while (ptr && ptr->data != data) {
        ptr = ptr->next;
    }
    if (ptr && ptr->data == data){
        return 1;
    }
    return 0;
}

int list_length(List *list){
    int ctd;
    Item *ptr = list->head;
    while (ptr) {
        ctd++;
        ptr = ptr->next;
    }
    return ctd;
}

void list_remove_duplicates(List *list, char data) {
    Item *ptr = list->head, *ptr_prev = NULL;
    
    while(list_contains(list, data)){
    while (ptr && ptr->data != data) {
        ptr_prev = ptr;
        ptr = ptr->next;
    }   
    
    if (ptr){
        ptr_prev=ptr;
        ptr=ptr->next;}
    
    if (!ptr) {
        return;
    }
    
    while(ptr && ptr->data==data){
        ptr_prev->next = ptr->next;
        ptr = ptr->next;
    }
    }
}

void list_replace_symbols(List *list, char source, char target) {
    Item *ptr = list->head;
    while (ptr) {
        if (ptr->data == source){
            ptr->data = target;
        }
        ptr = ptr->next;
    }   
}

void list_reverse(List *list){
    Item *ptr_tail = list->head, *ptr_head = list->head, *prev,*next,*curr, *ptrTmp;
    bool flag = 0;
    int ctd = 0;
    char separator1 = ' ', separator2 = '\t';
while(ptr_head->next)
    {
    //Find begin and end of word
    while(ptr_tail->next&& (ptr_tail->next->data != separator1 && ptr_tail->next->data != separator2) ){
        if(!flag){flag = 1; ptr_head = ptr_tail;}
        ptr_tail = ptr_tail->next;
        ctd++;
    }
    
    //Reverse word
    next = ptr_head->next;
    prev = ptr_head;
    ptr_head->next = ptr_tail->next;
    for(;ctd>0;ctd--){
        curr=next;
        next = next->next;
        curr->next = prev;
        prev = curr;
    }
    ptr_tail = curr;
    ptrTmp = list->head;
    prev = ptrTmp;
    while(ptr_head!=ptrTmp) {
        prev = ptrTmp;
        ptrTmp = ptrTmp->next;
    }
    if (prev == list->head){
        list->head = ptr_tail;
    }
    else{
        prev->next = ptr_tail;
    }

    if (ptr_head->next){
        ptr_head = ptr_head->next->next;
        ptr_tail = ptr_head;
    }
    else{
        return;    
    }
    }
}


int main() {
    List *l = list_new();
    char s[33] = "test benchmark        one    two";
    int size = 33,ctd=-1;
    printf("СТРОКА ДЛЯ ТЕСТА:\n");
    for(int i = 0; i<size; i++){
        printf("%c", s[i]);
    }
    printf("\nСколько раз запустить программу?:");
    while(ctd<0){
        scanf("%d", &ctd);
        if(ctd<0){printf("\nОшибка.Сколько раз запустить программу?:");}
    }
    long int btime,etime;
    double avgTime;
   // Считываем текущее время
   btime = time (NULL);
   printf("%ld", btime);
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
    etime = time(NULL);
    double fullTime = difftime(etime, btime);
    printf("%ld", etime);
    avgTime = fullTime/ctd;
    //printf("\nВремя работы программы:%lf\nКол-во выполненных раз:%d\nСреднее время, затраченное на одну операцию:%g\n", fullTime,ctd,avgTime);
}
