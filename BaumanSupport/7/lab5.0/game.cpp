#include "game.h"
std::vector<double> Game::find_strategy_A() const {
  std::cout << "Finding strategy for player A." << std::endl;
  auto A = -transponse(game_table_);
  auto b = -matrix(n, std::vector<double>(1, 1));
  auto c = matrix(1, std::vector<double>(m, 1));
  auto solution = SimplexTable(A, b, c).solve();
  solution[0] = 1 / solution[0];
  for (size_t i = 1; i < solution.size(); ++i) {
    solution[i] *= solution[0];
  }
  return solution;
}

std::vector<double> Game::find_strategy_B() const {
  std::cout << "Finding strategy for player B." << std::endl;
  auto A = game_table_;
  auto b = matrix(m, std::vector<double>(1, 1));
  auto c = -matrix(1, std::vector<double>(n, 1));
  auto solution = SimplexTable(A, b, c).solve();
  solution[0] = -1 / solution[0];
  for (size_t i = 1; i < solution.size(); ++i) {
    solution[i] *= solution[0];
  }
  return solution;
}
Game::Game(const Game::matrix& game_table) {
  if (!game_table.empty()) {
    m = game_table.size();
    n = game_table.front().size();
    game_table_ = game_table;
  }
}
