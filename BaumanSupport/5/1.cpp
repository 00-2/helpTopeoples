//РЕШЕНИЕ ЗАДАЧИ:
//Ввести два действительных двоичных числа, 
//представленных как символьные строки, и найти их сумму.
 
#include <iostream>
#include <conio.h>
#include <string>
 
using namespace std;
 
//функция ограничивает ввод пользователя символами:
//               '0', '1', '.', ',', '(', ')', '\n'
string input_binary_number();
 
//Проверяет корректность ввода
int handing_input_errors(string input);
 
//Сложение двух целых двоичных чисел
string summ_binary_integer(string x, string y);
 
//Наибольший общий делитель
int NOD(int a, int b);
 
//Наименьшее общее кратное
int NOK(int a, int b);
 
main(){
    
    int exit_enter_number_1;
    string input1;
    
    do{
        cout << "Введите первое двоичное число: \n";
        input1 = input_binary_number();
        exit_enter_number_1 = handing_input_errors(input1);     
    }while(exit_enter_number_1 == 1);
    
    int exit_enter_number_2;
    string input2;
    
    do{
        cout << "Введите второе двоичное число: \n";
        input2 = input_binary_number();
        exit_enter_number_2 = handing_input_errors(input2);     
    }while(exit_enter_number_2 == 1);
    
    string z, z1, z2; //целая часть введенных чисел
    string d, d1, d2; //дробная часть, до периода
    string p, p1, p2; //период
 
    int nz1 = 0; int nz2 = 0;//колличество символов
    int nd1 = 0; int nd2 = 0;
    int np1 = 0; int np2 = 0;
    
    //разбиваю на части первое число
    int flag1 = 0;
    string s;
    int i;
    for (i = 0; i <= input1.size() - 2; ++i){
        if (input1[i] == '.' || input1[i] == ','){
            z1 = s;
            s.clear();
            nz1 = i;
            flag1 = 1;
        }else if (input1[i] == 40 /* код символа '('*/){
            d1 = s;
            s.clear();
            nd1 = i - nz1 - 1;
            flag1 = 2;
        }else if (input1[i] == 41 /* код символа ')'*/){
            p1 = s;
            s.clear();
            np1 = i - nd1 - nz1 - 2; 
        }else 
            s.push_back(input1[i]); 
    }
    if (flag1 == 0){
        z1 = s;
        nz1 = i;
    }else if (flag1 == 1){
        d1 = s;
        nd1 = i - nz1 - 1;
    }
    
    //разбиваю на части второе число
    int flag2 = 0;
    s.clear();
    for (i = 0; i <= input2.size() - 2; ++i){
        if (input2[i] == '.' || input2[i] == ','){
            z2 = s;
            s.clear();
            nz2 = i;
            flag2 = 1;
        }else if (input2[i] == 40 /* код символа '('*/){
            d2 = s;
            s.clear();
            nd2 = i - nz2 - 1;
            flag2 = 2;
        }else if (input2[i] == 41 /* код символа ')'*/){
            p2 = s;
            s.clear();
            np2 = i - nd2 - nz2 - 2; 
        }else 
            s.push_back(input2[i]); 
    }
    if (flag2 == 0){
        z2 = s;
        nz2 = i;
    }else if (flag2 == 1){
        d2 = s;
        nd2 = i - nz2 - 1;
    }
    
    string output;
    
    if (flag1 == 0 && flag2 == 0){//оба числа целые
        output = summ_binary_integer(input1, input2);
    }else if (flag1 != 2 && flag2 != 2){//хотя бы одно из чисел действительное, периода нет
        while (d1.size() != d2.size()){
            if (d1.size() < d2.size()){
                d1.push_back('0');
                ++nd1;
            }
            else{
                d2.push_back('0');
                ++nd2;
            }
        }
        cout << d1 << endl<< nd1 << endl << d2 << endl<< nd2 << endl;
        d = summ_binary_integer(d1, d2);cout << "d= " << d << endl;//здесь уже неправильно считает функция
        z = summ_binary_integer(z1, z2);cout << "z= " << z << endl;//тоже неправильно считает
        if (d.size() > d1.size()){
            s.clear();
            s.push_back('1'); 
            z = summ_binary_integer(z, s);cout << z << endl;
            d.erase(0,1);   
        }
        output = z;
        output.push_back(',');
        output.append(d); 
    }
    
    cout << output << endl;
    return 0;
}
 
//функция ограничивает ввод пользователя символами:
//               '0', '1', '.', ',', '(', ')', '\n'
string input_binary_number(){
    
    char symbol;
    string input;
    
    input.clear(); //не знаю как правильно инициализировать поэтому так
    
    do{
        symbol = getch();
        if (symbol == '0' || symbol == '1' || symbol == '.' || symbol == ',' ||
            symbol == '(' || symbol == ')' || symbol == 13){
        //13 - это символ конца строки
            putchar(symbol);
            input.push_back(symbol);
        }
    }while (symbol != 13);//13 - это символ конца строки ('\n' - не работает с getch())
    
    cout<<endl;
    
    return input;
}
 
//Функция проверяет корректность ввода
int handing_input_errors(string input){
    
    int flag = 0;
    
    for (int i = 0; i < input.size()-1; ++i){
        if (i == 0 && input[i] != '0' && input[i] != '1'){
            cout << "Первый символ двоичного числа не может быть: " << input[i] << endl;
            flag = 4;
            break;
        }
        
        if (flag !=1 && (input[i] == '.' || input[i] == ','))
            flag = 1;
        else if (flag == 1 && (input[i] == '.' || input[i] == ',')){
            cout << "Действительное число не может содержать больше 1-й десятичной точки" << endl;
            flag = 4;
            break;
        }
        
        if (flag != 2 && input[i] == 40 /* код символа '(' */){
            if (flag == 0){
                cout << "Период не может начинаться раньше десятичной точки" << endl;
                flag = 4;
                break;
            } 
            flag = 2;
        }
        else if (flag == 2 && input[i] == 40 /* код символа '(' */){
            cout << "Действительное число не может содержать больше 1-й '('" << endl;
            flag = 4;
            break;  
        }
        
        if (flag != 3 && input[i] == ')'){
            if (flag != 2){
                cout <<"Закрывающая скобка может идти только после открывающей" << endl;
                flag = 4;
                break;
            }
            flag = 3;
        }   
        else if (flag == 3 && input[i] == ')'){
            cout << "Действительное число не может содержать больше 1-й ')'" << endl;
            flag = 4;
            break;
        }
        
        if (flag == 3 && input[i] != ')'){
            cout << "Действительное число не может содержать цифр после ')'" << endl;
            flag = 4;
            break;
        }
            
    }
    if (flag != 4) 
        return 0;
    else return 1;
}
 
//Сложение двух целых двоичных чисел
string summ_binary_integer(string x, string y){
    
    string s, s1, s2;
    char transfer = '0';
    
    s.clear(); //не знаю как правильно инициализировать поэтому так
    
    if (x.size() >= y.size()){
        s1 = x;
        s2 = y;
    }
    else{
        s1 = y;
        s2 = x;
    }
    
    for (int i = 0; i <= s2.size() - 2; ++i){
        if (s1[s1.size() - 2 - i] == '0' && s2[s2.size() - 2 - i] == '0' && transfer == '0'){
            s.push_back('0');
            transfer = '0';
        }else 
        if (s1[s1.size() - 2 - i] == '1' && s2[s2.size() - 2 - i] == '0' && transfer == '0'){
            s.push_back('1');
            transfer = '0';
        }else 
        if (s1[s1.size() - 2 - i] == '0' && s2[s2.size() - 2 - i] == '1' && transfer == '0'){
            s.push_back('1');
            transfer = '0';
        }else 
        if (s1[s1.size() - 2 - i] == '1' && s2[s2.size() - 2 - i] == '1' && transfer == '0'){
            s.push_back('0');
            transfer = '1';
        }else 
        if (s1[s1.size() - 2 - i] == '0' && s2[s2.size() - 2 - i] == '0' && transfer == '1'){
            s.push_back('1');
            transfer = '0';
        }else 
        if (s1[s1.size() - 2 - i] == '1' && s2[s2.size() - 2 - i] == '0' && transfer == '1'){
            s.push_back('0');
            transfer = '1';
        }else 
        if (s1[s1.size() - 2 - i] == '0' && s2[s2.size() - 2 - i] == '1' && transfer == '1'){
            s.push_back('0');
            transfer = '1';
        }else 
        if (s1[s1.size() - 2 - i] == '1' && s2[s2.size() - 2 - i] == '1' && transfer == '1'){
            s.push_back('1');
            transfer = '1';
        }                           
    }
    for (int i = 0; i < (s1.size() - s2.size()); ++i){
        if (s1[s1.size() - s2.size() - 1 - i] == '0' && transfer == '0'){
            s.push_back('0');
            transfer = '0';
        }else
        if (s1[s1.size() - s2.size() - 1 - i] == '1' && transfer == '0'){
            s.push_back('1');
            transfer = '0';
        }else
        if (s1[s1.size() - s2.size() - 1 - i] == '0' && transfer == '1'){
            s.push_back('1');
            transfer = '0';
        }else
        if (s1[s1.size() - s2.size() - 1 - i] == '1' && transfer == '1'){
            s.push_back('0');
            transfer = '1';
        }
    }
    if (transfer == '1')
        s.push_back('1');
        
    s1.clear();
    for (int i = 0; i < s.size(); ++i){
        s1.push_back(s[s.size() - 1 - i]);
    }
 return s1;
}
 
//Наибольший общий делитель
int NOD(int a, int b){ 
    if (a > b){
        if(a%b == 0) 
            return b; 
        return NOD(b, a%b);
    }else{
        if(b%a == 0) 
            return a; 
        return NOD(a, b%a);
    }
}
 
//Наименьшее общее кратное
int NOK(int a, int b){
    return a*b/NOD(a,b);