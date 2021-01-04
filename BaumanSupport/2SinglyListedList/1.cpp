#include <stdlib.h>
#include <iostream>


using namespace std;
struct list
{
    int field;
    struct list *ptr;
};

struct list * init(int a)//А - значение первого узла
{
    struct list *lst;
    lst = (struct list *)malloc(sizeof(struct list));
    lst->field = a;
    lst->ptr = NULL; // это последний узел списка
    return lst;
};

struct list * addelem(list *lst, int number)
{
    struct list * tmp, *p;
    tmp = (struct list *)malloc(sizeof(struct list));
    p=lst->ptr;
    lst->ptr = tmp;
    tmp->field = number;
    tmp->ptr = p;
    return tmp;
}

struct list * deletelem(list *lst, list *root)
{
  struct list *temp;
  temp = root;
  while (temp->ptr != lst) // просматриваем список начиная с корня
  { // пока не найдем узел, предшествующий lst
    temp = temp->ptr;
  }
  temp->ptr = lst->ptr; // переставляем указатель
  free(lst); // освобождаем память удаляемого узла
  return(temp);
}

struct list * deletehead(list *root)
{
  struct list *temp;
  temp = root->ptr;
  free(root); // освобождение памяти текущего корня
  return(temp); // новый корень списка
}

void listprint(list *root)
{
  struct list *p;
  p = root;
  do {
    cout << p->field << " "; // вывод значения элемента p
    p = p->ptr; // переход к следующему узлу
  } while (p != NULL);
}

list * findNumberByField(list * root, int number){
    struct list *p; // удаление из середины по значению
    p = root;
    do {
        if (p->field == number){ //проверка поля
            break;
        } 
        p = p->ptr; // переход к следующему узлу
    } while (p != NULL);
    return p;
}

list * findNumberByPos(list * root, int number){
    struct list *p; // удаление из середины по значению
    p = root;
    int ctd=0;
    do {
        if (ctd == number){ //проверка поля
            break;
        } 
        p = p->ptr; // переход к следующему узлу
        ctd++;
    } while (p != NULL);
    return p;
}

void input(struct list *root,struct list *last){
    char key,localKey;
    int number,tmpInt;
    bool flag=false;
    struct list * tmpNode;
    while(key!='e'){
    if (root == NULL) flag = false;
    cout << "1.Создание списка.\n2.Добавление элемента в список.\n3.Вывод списка.\n4.Проверка на пустоту.\n5.Удаление\n6.Поиск элементов по выбранному признаку.\n7.Удаление списка.\nВведите e(английскую), чтобы выйти.";
    cin >> key;
    cout <<"\n\n";
    switch (key)
    {
    case '1'://Инициализация
        cout << "Введите первый элемент массива: "; 
        cin >> number;
        root = init(number);
        last = root;
        cout << "Массив создан.\n";
        flag = true;
        break;
    case '2'://Добавление
        if (flag){
            cout <<  "Куда Вы хотите добавить элемент?\n1.В начало.\n2.В конец\n3.После номера\n4.После значения\n";
            cin >> localKey;
            switch (localKey)
            {
            case '1':// w
                cout << "Введите элемент массива: "; 
                cin >> number;
                tmpNode->field = root->field;/*здесь происходит сохранение данных корня, удаление корня, после этого эти данные вставляются в список*/
                addelem(root, number);
                root = deletehead(root);
                addelem(root, tmpNode->field);
                break;
            case '2':// w
                cout << "Введите элемент массива: "; 
                cin >> number;
                last = addelem(last, number);
                break;
            case '3':
                cout << "Введите номер элемента массива, после которого вставить элемент: ";
                cin >> tmpInt;
                if (tmpInt<=0 or tmpInt>=sizeof(root)){cout << "\nОшибка в введенном числе: Попробуйте ещё раз. Следите за размером.\n";break;}
                tmpNode = findNumberByPos(root, tmpInt);
                if(tmpNode == NULL){cout << "Ошибка, попробуйте ещё раз.\n";break;}
                cout << "Введите элемент массива: "; 
                cin >> number;
                addelem(tmpNode, number);
                break;
            case '4':
                cout << "Введите значение элемента массива, после которого вставить элемент: ";
                cin >> tmpInt;
                tmpNode = findNumberByField(root, tmpInt);
                if (tmpNode==NULL){cout << "Такого элемента в списке нет.\n";break;}
                cout << "Введите элемент массива: "; 
                cin >> number;
                addelem(tmpNode, number);
                break;
           default:
                cout << "Повторите попытку";
                break;
            }
            break;
        }
        else{
            cout << "Сначала выберите пункт 1.\n";
            break;
        }
    case '3'://вывод
        if (flag){
            cout << "\n";
            listprint(root);
            cout << "\n";
            break;
        }
        else{
            cout << "Сначала выберите пункт 1.\n";
            break;
        }
    case '4'://проверка на пустоту
        if (flag){
            if (root == NULL){cout << "Список пуст.\n";}
            else {cout << "Список не пуст.\n";}
            break;
        }
        else
        {
           cout << "Сначала выберите пункт 1.\n";
            break;
        }
    case '5':
        if (flag){
            cout <<  "Откуда Вы хотите удалить элемент(Не применяйте 3 к крайним, для них есть свои функции)?\n1.Из начала.\n2.Из конца\n3.По номеру\n4.По значению\n";
            cin >> localKey;
            switch (localKey)
            {
            case '1':// w
                if (root!=NULL)root = deletehead(root);
                break;
            case '2':// w
                if (root!=NULL)last = deletelem(last, root);
                break;
            case '3':
                cout << "Введите номер элемента массива, на котором надо удалить элемент: ";
                cin >> tmpInt;
                if (tmpInt<=0 or tmpInt>=sizeof(root)){cout << "\nОшибка в введенном числе: Попробуйте ещё раз. Следите за размером.\n";break;}//Нельзя работать с крайними, для этого есть отдельная функция
                tmpNode = findNumberByPos(root, tmpInt);
                if(tmpNode == NULL){cout << "Ошибка, попробуйте ещё раз.\n";break;}
                deletelem(tmpNode, root);
                break;
            case '4':
                cout << "Введите значение элемента массива, которое надо удалить: ";
                cin >> tmpInt;
                if (tmpInt<0 or tmpInt>sizeof(root)){cout << "\nОшибка в введенном числе: Попробуйте ещё раз. Следите за размером.\n";break;}//Нельзя работать с крайними, для этого есть отдельная функция
                tmpNode = findNumberByField(root, tmpInt);
                if (tmpNode == root){if (root!=NULL)root = deletehead(root);break;}
                else if (tmpNode == last){if (root!=NULL)root = deletelem(last, root);break;}
                else if (tmpNode==NULL){cout << "Такого элемента в списке нет.\n";break;}
                deletelem(tmpNode, root);
                break;
            }
        }
        else
        {
           cout << "Сначала выберите пункт 1.\n";
            break;
        }
        case '6'://Поиск элементов по выбранному признаку
            if(flag){cout << "Введите значение:";
                cin >> number;
                cout << "Все номера элементов, которые равны "+number;
                cout << "\n";
                tmpNode = root;
                tmpInt = 0;
                do {
                    if (tmpNode->field == number){ //проверка поля
                        cout << tmpInt << " ";
                        tmpInt++;
                    } 
                tmpNode = tmpNode->ptr; // переход к следующему узлу
                } while (tmpNode != NULL);
                break;
            }
            else
            {
                cout << "Сначала выберите пункт 1.\n";
                break;
            }
        case '7':
            if (flag){
                do {
                    root = deletehead(root); // переход к следующему узлу
                } while (root != NULL);
                cout << "Список очищен.\n";
             }
            else
            {
                cout << "Сначала выберите пункт 1.\n";
                break;
            }
        default:
            break;
        }
    }
}
int main(){
    struct list *root;
    struct list *last;
    input(root, last);
}