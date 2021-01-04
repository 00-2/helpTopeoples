#include "2.h"
#include <iostream>
#include<iomanip>
#include <fstream>

#define ML 128 //maxlength of string

using namespace std;
string textName = "Text.txt";

char* slice(char*s, int from, int to)//обрезка массива, нужна для замены
{
    int j = 0;
    for(int i = from; i <= to; ++i)
        s[j++] = s[i];
    s[j] = 0;
    return s;
};

void write(Book * arrOfBook, int size){//создать новый файл с записями, записать в него данные
    Book book;
    ofstream  out(textName);
    for (int i = 0; i<size; i++){
        book = arrOfBook[i];
        out<<i << " " << book.author << " "<< book.name << " " << book.ctd<<"\n";
    }
    out.close();   
}

void read(Book * arrOfBook,int size){//производит чтение из файла 
    ifstream  in(textName);
    int i = 0;
    for(int i = 0; i<size; i++)
    {
        char * author = new char [ML];
        char * name = new char[ML];
        char * n = new char[ML];
        int ctd;

        in >> n >> author >> name >> ctd;
        
        arrOfBook[i].author = author;
        arrOfBook[i].name = name;
        arrOfBook[i].ctd = ctd;

    }
    in.close();
}

void add(Book * arrOfBook, int *size){
    ofstream  out(textName,ios::app);
    
    cout << "Сколько записей Вы хотите добавить?";
    int n;
    cin >> n;
    char * author = new char [ML];
    char * name = new char[ML];
    int ctd;
    for (int i =*size;i<n+*size;i++)
    {
        cout << "Книга номер "<< i <<":\n";
        cout << "Введите автора(пробелы заменятся на -):";
        cin >> author;

        cout << "Введите название(пробелы заменятся на -):";
        cin >> name;

        cout << "Введите количество книг:";
        cin >> ctd;
        cout << "\n";
        out<<i << " " << author << " "<< name << " " << ctd<<"\n";

        arrOfBook[i].author = author;
        arrOfBook[i].name = name;
        arrOfBook[i].ctd = ctd;
    }
    cout <<n<< " записей добавлено";

    (*size)+=n;
    out.close();
}

void init(Book * arrOfBook, int size){
    ofstream  out(textName);
    char * author = new char [ML];
    char * name = new char[ML];
    int ctd;
    for (int i =0;i<size;i++)
    {
       cout << "Книга номер "<< i <<":\n";
        cout << "Введите автора(пробелы заменятся на -):";
        cin >> author;

        cout << "Введите название(пробелы заменятся на -):";
        cin >> name;

        cout << "Введите количество книг:";
        cin >> ctd;
        cout << "\n";
        out<<i << " " << author << " "<< name << " " << ctd<<"\n";

        arrOfBook[i].author = author;
        arrOfBook[i].name = name;
        arrOfBook[i].ctd = ctd;
    }
    cout <<size<< " записей добавлено\n";
    write(arrOfBook,size);
    out.close();
}

void output(Book * arrOfBook,int size){
    read(arrOfBook, size);
    for (int i = 0 ; i<size; i++){
        cout<<"Номер " << i << ":" << setw(20) << arrOfBook[i].author << " "<< setw(20) << arrOfBook[i].name << " " <<setw(4) << arrOfBook[i].ctd<<"\n";
    }
}

void change(Book * arrOfBook,int size){
    cout << "Исходный массив:\n";
    for (int i = 0 ; i<size; i++){
        cout<<"Номер " << i << ":" << setw(20) << arrOfBook[i].author << " "<< setw(20) << arrOfBook[i].name << " " <<setw(4) << arrOfBook[i].ctd<<"\n\n";
    }


    int key;
    int number;
        
    Book book;
    cout << "Введите номер(число) книги, которую хотите заменить. (Для выхода введите '-1')";
    while(key!=-1){
        cin >> key;
        if ( key==-1 )break;
            char * author = new char [ML];
            char * name = new char[ML];
            int ctd;
            cout << "Книга номер "<< key <<":\n";
            if (key <0 || key>=size) {cout << "такого номера в списке нет ";break;}
        cout << "Введите автора(пробелы заменятся на -):";
        cin >> author;

        cout << "Введите название(пробелы заменятся на -):";
        cin >> name;

        cout << "Введите количество книг:";
        cin >> ctd;
        cout << "\n";

        arrOfBook[key].author = author;
        arrOfBook[key].name = name;
        arrOfBook[key].ctd = ctd;

            cout << "Данные заменены. Текущий массив:\n";
            cout << "Исходный массив:\n";
            for (int i = 0 ; i<size; i++){
                cout<<"Номер " << i << ":" << setw(20) << arrOfBook[i].author << " "<< setw(20) << arrOfBook[i].name << " " <<setw(4) << arrOfBook[i].ctd<<"\n\n";
            }
            write(arrOfBook, size);
            cout << "Введите номер(число) книги, которую хотите заменить. (Для выхода введите '-1')";
        }
    }
    void sort(Book * arrOfBook,int size){
        for (int i = size-1;i>=0;i--){
            for(int j=0; j<size-i-1;j++){
                if (arrOfBook[j].ctd>arrOfBook[j+1].ctd){
                    Book tmp = arrOfBook[j];
                    arrOfBook[j] = arrOfBook[j+1];
                    arrOfBook[j+1] = tmp;
                }
            }
        }
        for (int i = 0 ; i<size; i++){
                cout<<"Номер " << i << ":" << setw(20) << arrOfBook[i].author << " "<< setw(20) << arrOfBook[i].name << " " <<setw(4) << arrOfBook[i].ctd<<"\n\n";
                }
        
        //write почему то косячит
        write(arrOfBook, size);
    }


int main(){
    setlocale(LC_ALL, "");
    int key;
    int size;
    bool flag = true;
    size=0;
    Book book;
    Book arrOfBook[ML] ;
    size = 0;
    while(key!=5){
        cout << "Выберите один из пунктов меню:\n0. Создать файл и записать в него данные.\n1.Вывести содержимое файла\n2.Добавить данные в файл.\n3.Изменить введенные данные.\n4.Отсортировать по количеству изданий.\n5.Выйти из программы.\n";
        cin >> key;
        cout << "\n";
        if (key == 0){
            cout << "Введите количество книг:";
            cin >> size;
            init(arrOfBook, size);
            flag = true;
        }
        if (key == 1){
            if (flag){
                output(arrOfBook, size);
            }
            else{
                cout << "Сначала используйте пункт 0\n";
            }
        }
        if (key == 2){
            if (flag){
                add(arrOfBook, &size);
            }
            else{
                cout << "Сначала используйте пункт 0\n";
            }
        }
        if (key == 3){
            if (flag){
                change(arrOfBook, size);
            }
            else{
                cout << "Сначала используйте пункт 0\n";
            }
        }
        if (key == 4){
            if (flag){
                sort(arrOfBook, size);
            }
            else{
                cout << "Сначала используйте пункт 0\n";
            } 
        }
        
        if (key == 5){
            cout << "Работа программы завершена. Ваши файлы сохранены в текстовом документе: "+textName;
            return 0;
        }
    }
}