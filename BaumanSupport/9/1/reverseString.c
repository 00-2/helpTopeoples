#include <stdlib.h>
#include <stdio.h>

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

void list_remove_duplicates(List *list, char data) {
    Item *ptr = list->head, *ptr_prev = NULL;
    
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

int main() {
    List *l = list_new();
    char c;
    while (c!=EOF)
    {
        if (c=='\n'){
            //удаляем пробелы, разворачиваем строку
            list_remove_duplicates(l,' ');
            //list_remove_duplicates(l,'\t');
            list_print(l);
            list_delete(l);
            l=list_new();
        }
        else{
            list_push_back(l,c);
        }
        c=getchar();
    }
    return 0;
}