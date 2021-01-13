#include <iostream>
#include <vector>

#include "game.h"

void print(const std::vector<double>& strategy, const std::string& player) {
  std::cout << "Strategy for player " << player << ":" << std::endl;
  for (size_t i = 0; i < strategy.size(); ++i) {
    if (i == 0) {
      std::cout << "F " << std::setw(6) << std::fixed << std::setprecision(2)
                << strategy[i] << std::endl;
    } else {
      std::cout << "x" << i << std::setw(6) << std::fixed
                << std::setprecision(2) << strategy[i] << std::endl;
    }
  }
}

int main() {
  size_t n = 0;
  size_t m = 0;
  std::cout << "Enter m and n:" << std::endl;
  std::cin >> m >> n;
  std::vector<std::vector<double>> game_matrix(m, std::vector<double>(n));
  std::cout << "Enter matrix (as in task):" << std::endl;
  for (size_t i = 0; i < m; ++i) {
    for (size_t j = 0; j < n; ++j) {
      std::cin >> game_matrix[i][j];
    }
  }

  Game game(game_matrix);
  auto strategy_A = game.find_strategy_A();
  auto strategy_B = game.find_strategy_B();
  print(strategy_A, "A");
  print(strategy_B, "B");

  return 0;
}
