#pragma once

#include <algorithm>
#include <iomanip>
#include <iostream>
#include <string>
#include <utility>
#include <vector>

class SimplexTable {
 private:
  using matrix = std::vector<std::vector<double>>;

  matrix A_;
  matrix b_;
  matrix c_;
  size_t m_ = 0;
  size_t n_ = 0;
  matrix table;
  std::vector<std::string> row;
  std::vector<std::string> column;

  static inline void print_flags();
  void print_table() const;
  bool has_basic_solution() const;
  bool is_optimal() const;
  void swap(size_t solving_column, size_t solving_row);
  void find_basic();
  void optimize();

 public:
  SimplexTable(matrix A, matrix b, matrix c);
  std::vector<double> solve();
};
