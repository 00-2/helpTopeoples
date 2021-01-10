#include <vector>
#include <string>
#include <iostream>
#include "gomori.cpp"
using namespace std;


vector<bool> check_fulling_var(){
  vector<bool> result{false,false,false};

  //1 test
  int ctd=0;
  int n = 4;
  int m = 3;
  vector<string> basis{"y4","y5","y6","y7"}, free{"y1","y2","y3"};
  vector<string> basisTest,freeTest;
  fulling_var(basisTest, n, m);
  fulling_var(freeTest, m, 0);
  if(basis == basisTest && free == freeTest);result[0]=true;
  basisTest={},freeTest={};
  
  //2 test
  n = 3;
  m = 3;
  basis={"y4","y5","y6"}, free={"y1","y2","y3"};
  fulling_var(basisTest, n, m);
  fulling_var(freeTest, m, 0);
  if(basis == basisTest && free == freeTest)result[1]=true;
  basisTest={},freeTest={};

  //3 test
  n = 5;
  m = 2;
  basis={"y3","y4","y5","y6","y7",};free={"y1","y2"};
  basisTest,freeTest;
  fulling_var(basisTest, n, m);
  fulling_var(freeTest, m, 0);
  if(basis == basisTest && free == freeTest)result[2]=true;
  return result;
}

void PrintVector(const vector<bool>& v) {
  //выводит вектор(для матрицы)
	for (const auto& elements : v)
		cout << setw(2) <<elements;
}


int main(){
  vector<bool> check_fulling_var_res = check_fulling_var();
  cout << "check_fulling_var: ";PrintVector(check_fulling_var_res);cout <<"\n";

}