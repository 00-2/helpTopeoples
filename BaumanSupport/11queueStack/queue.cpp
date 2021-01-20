
#include <iostream>
using namespace std;
struct Node //описание узла списка
{
int data; //информационное поле
Node *next; //указатель на следующий элемент
};

struct Queue //описание очереди
{
int size; //счетчик размера очереди
Node *first; //указатель на начало очереди
Node *last; //указатель на конец очереди
};

void print(Queue *Q) //удаление элемента
{
Node *node = Q->first->next;
cout <<"\n";
while(node){
    cout << node->data << " ";
    node=node->next;
}
cout <<"\n";
}

void constructorQ(Queue *Q) //создание очереди
{
Q->first=new Node;
Q->first->next=NULL;
Q->last=Q->first;
Q->size=0;
}
bool isEmpty(Queue *Q) //проверка очереди на пустоту
{
if (Q->first==Q->last) return true;
else return false;
}

int pop(Queue *Q) //вывод начального элемента
{
if(isEmpty(Q)){cout << "Очередь пуста";}
else{
int data = Q->first->next->data;
Q->first=Q->first->next; //смещение указателя
Q->size--;
return data;
}
}

void push(Queue *Q) //добавление элемента
{
int value;
cout<<"\nЗначение > "; cin>>value;
Q->last->next=new Node;
Q->last=Q->last->next;
Q->last->data=value; //добавление элемента в конец
Q->last->next=NULL; //обнуление указателя на следующий элемент
Q->size++;
cout<<"\nЭлемент добавлен\n\n";
}


int Size(Queue *Q) //размер очереди
{ return Q->size; }

int main() //главная функция
{
setlocale(LC_ALL,"Rus");
Queue Q;
constructorQ(&Q);
char number;
do
{
cout<<"1. Добавить элемент"<<endl;
cout<<"2. Вывод элементов"<<endl;
cout<<"3. Достать верхний элемент"<<endl;
cout<<"4. Узнать размер очереди"<<endl;
cout<<"0. Выйти\n\n";
cout<<"Номер команды > "; cin>>number;
switch (number)
{
case '1': push(&Q);
break;
//-----------------------------------------------
case '2':
if (isEmpty(&Q)) cout<<endl<<"Очередь пуста\n\n";
else print(&Q);
break;
//-----------------------------------------------
case '3':
if (isEmpty(&Q)) cout<<endl<<"Очередь пуста\n\n";
else { cout<<"\nНачальный элемент: "<<pop(&Q)<<"\n\n"; }
break;
//-----------------------------------------------
case '4':
if (isEmpty(&Q)) cout<<endl<<"Очередь пуста\n\n";
else cout<<"\nРазмер очереди: "<<Size(&Q)<<"\n\n";
break;
//-----------------------------------------------
case '0': break;
default: cout<<endl<<"Команда не определена\n\n";
break;
}
} while(number!='0');

}