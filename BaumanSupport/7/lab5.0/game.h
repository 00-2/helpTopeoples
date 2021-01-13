#pragma once

#include <vector>

#include "matrix.h"
#include "simplex.h"
class Game {
 private:
  using matrix = std::vector<std::vector<double>>;

  size_t n = 0;
  size_t m = 0;
  matrix game_table_;

 public:
  explicit Game(const matrix &game_table);

  std::vector<double> find_strategy_A() const;
  std::vector<double> find_strategy_B() const;
};
