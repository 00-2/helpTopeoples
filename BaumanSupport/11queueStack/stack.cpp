
#include <iostream>
using namespace std;
struct Node //описание узла списка
{
int data; //информационное поле
Node *next; //указатель на следующий элемент
};

struct Stack //описание стека
{
int size; //счетчик размера стека
Node *first; //указатель на начало стека
Node *last; //указатель на конец стека
};

void constructorS(Stack *S) //создание стека
{
S->first=new Node;
S->first->next=NULL;
S->last=S->first;
S->size=0;
}


void print(Stack *S) //удаление элемента
{
Node *node = S->first;
cout <<"\n";
while(node->next){
    cout << node->data << " ";
    node=node->next;
}
cout <<"\n";
}

bool isEmpty(Stack *S) //проверка стека на пустоту
{
if (S->first==S->last) return true;
else return false;
}

void destructorS(Stack *S) //создание стека
{
while(!isEmpty(S)){
    S->first=S->first->next; //смещение указателя
    S->size--;
}
cout <<"\nСтек удален\n";
}


int pop(Stack *S) //вывод начального элемента
{
if(isEmpty(S)){cout << "Стек пуст";}
else{
int data = S->first->data;
S->first=S->first->next; //смещение указателя
S->size--;
return data;
}
}

void push(Stack *S) //добавление элемента
{
int value;
cout<<"\nЗначение > "; cin>>value;
Node *node = new Node;
node->data=value;
node->next=S->first;
S->first=node;
S->size++;
cout<<"\nЭлемент добавлен\n\n";
}


int Size(Stack *S) //размер стека
{ return S->size; }

int main() //главная функция
{
setlocale(LC_ALL,"Rus");
Stack S;
constructorS(&S);
char number;
do
{
cout<<"1. Добавить элемент"<<endl;//+
cout<<"2. Вывод элементов"<<endl;//+
cout<<"3. Достать верхний элемент"<<endl;
cout<<"4. Узнать размер стека"<<endl;
cout<<"5. Удалить Стек"<<endl;
cout<<"0. Выйти\n\n";
cout<<"Номер команды > "; cin>>number;
switch (number)
{
case '1': push(&S);
break;
//-----------------------------------------------
case '2':
if (isEmpty(&S)) cout<<endl<<"Стек пуст\n\n";
else print(&S);
break;
//-----------------------------------------------
case '3':
if (isEmpty(&S)) cout<<endl<<"Стек пуст\n\n";
else { cout<<"\nНачальный элемент: "<<pop(&S)<<"\n\n"; }
break;
//-----------------------------------------------
case '4':
if (isEmpty(&S)) cout<<endl<<"Стек пуст\n\n";
else cout<<"\nРазмер стека: "<<Size(&S)<<"\n\n";
break;
//-----------------------------------------------
case '5':
if (isEmpty(&S)) cout<<endl<<"Стек пуст\n\n";
else destructorS(&S);
break;
//-----------------------------------------------
case '0': break;
default: cout<<endl<<"Команда не определена\n\n";
break;
}
} while(number!='0');

}