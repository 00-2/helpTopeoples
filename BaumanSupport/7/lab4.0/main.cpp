#include <iostream>
#include <vector>
#include "simplex.cpp"


int main() {
  size_t n = 0;
  size_t m = 0;
  std::cout << "Enter m and n:" << std::endl;
  /*std::cin >> m >> n;*/
  n = 3,m=3;
  std::vector<std::vector<double>> gomoriMatrix(m, std::vector<double>(n));
  std::vector<std::vector<double>> b={{7},{8},{6}},c={{5,6,4}};
  std::cout << "Enter matrix (as in task):" << std::endl;
  /*for (size_t i = 0; i < m; ++i) {
    for (size_t j = 0; j < n; ++j) {
      std::cin >> gomoriMatrix[i][j];
    }
  }*/
  gomoriMatrix={{1,1,1},{1,3,0},{0,0.5,4}};
  SimplexTable sTable = SimplexTable(gomoriMatrix, b,c);
  
  return 0;
}
