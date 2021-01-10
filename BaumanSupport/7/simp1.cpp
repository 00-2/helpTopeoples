#include <iostream>

using namespace std;

class Simplex{
int num_x; // кол-во переменных
int num_r; // кол-во ограничений
double *func;
double **syst;
short int *sign; // 
double *x;
double *rez;
int strs, cols;
public:
void inpValues();
void printMatrix();
bool check();
void getPlane();
};

void Simplex::inpValues(){
cout << "Vvedite kol-vo ogranichenii v syst: "; cin >> num_r;
cout << "Vvedite kol-vo x: "; cin >> num_x;
func = new double[num_x];
strs = num_r + 1;
cols = num_x + num_r + 2;
syst = new double *[strs];
for (int i = 0; i < strs; i++)
    syst[i] = new double[cols];
func = new double[num_x];
cout << "Vvedite koefficienti v glavnom urovnenii: \n";
for (int i = 0; i < num_x; i++){
    cout << "x" << i + 1 << " = "; cin >> func[i];
    syst[0][i] = func[i] * (-1);
}
sign = new short int[num_r];
x = new double[num_x];
rez = new double[num_r];
for (int i = 0; i < num_r; i++){
    cout << "Vvedite znak v " << i + 1 << "-m uravnenii systemi 0 - <=; 1 - >=:";cin >> sign[i];
    cout << "Vvedite koefficienti pri peremennih i rezultat dlya " << i + 1 << "-go uravneniya systemi: \n";
    for (int j = 0; j < num_x; j++){
        cout << "x" << j + 1 << " = "; cin >> x[j];
        if (sign[i] == 0) syst[i + 1][j] = x[j];
        else syst[i + 1][j] = x[j] * (-1);
    }
    cout << "rez = "; cin >> rez[i];
    if (sign[i] == 0) syst[i+1][cols-2] = rez[i];
    else syst[i + 1][cols - 2] = rez[i] * (-1);
}
syst[0][cols-2] = 0;
for (int i = 0, temp = 0; i < strs; i++, temp++){
    syst[i][cols - 1] = 0;
    for (int j = num_x; j < cols-2; j++){
        if (j == num_x + temp - 1 && i != 0) syst[i][j] = 1;
        else syst[i][j] = 0;
    }
}
printMatrix();
}

void Simplex::printMatrix(){
cout << "\n";
for (int i = 0; i < strs; i++){
    for (int j = 0; j < cols; j++)
        cout << syst[i][j] << " ";
    cout << "\n";
}
}

bool Simplex::check(){
bool temp = false;
for (int i = 0; i < cols - 1; i++){
    if (syst[0][i] < 0){ temp = true; break;}
}
return temp;    
}

void Simplex::getPlane(){
int i_str, i_col, i , j, last_str = 0;
double  min, atd, min_atd;
int iter = 0;
while (check()){
    ++iter;
    cout << "Iteraciia: "<< iter << "\n";

    min = 1;
    // находим разрешающий столбец
    for (i = 0; i < cols; i++){
        if (syst[0][i] < 0 && syst[0][i] < min){ min = syst[0][i];  i_col = i; }
    }
    min_atd = syst[1][cols - 2] / syst[1][i_col];
    // нахоидим разешающую строку
    for (i = 1; i < strs; i++){
        atd = syst[i][cols - 2] / syst[i][i_col];
        if (i != last_str && atd <= min_atd){ min_atd = atd; i_str = i; }
    }
    // Длим элементы строки с разрешающим эл-том на разреш. элем.
    for (i = 0; i < cols; i++)
        if (i != i_col) syst[i_str][i] = syst[i_str][i] / syst[i_str][i_col];
    syst[i_str][i_col] = 1;
    // находим остальные элементы строки
    for (i = 0; i < strs; i++){
        if (i != i_str){
            for (j = 0; j < cols - 1; i++){
                if (j != i_col) syst[i][j] = (syst[i_str][j] * (-1) * syst[i][i_col]) + syst[i][j];
            }
        } else continue;
        syst[i][i_col] = (syst[i_str][j] * (-1) * syst[i][i_col]) + syst[i][i_col];
    }   
    printMatrix();
}
 }

int main(){
Simplex *obj = new Simplex();
obj->inpValues();
//obj->getPlane();
system("pause");
}