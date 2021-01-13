#include "simplex.h"
SimplexTable::SimplexTable(SimplexTable::matrix A, SimplexTable::matrix b,
                           SimplexTable::matrix c)
    : A_(std::move(A)),
      b_(std::move(b)),
      c_(std::move(c)),
      m_(A_.size()),
      n_(A_.front().size()),
      table(m_ + 1, std::vector<double>(n_ + 1)),
      row(m_ + 1),
      column(n_ + 1) {
  for (size_t i = 0; i < m_; ++i) {
    table[i][0] = b_[i][0];
    for (size_t j = 1; j <= n_; j++) {
      table[i][j] = A_[i][j - 1];
    }
  }
  for (size_t j = 1; j <= n_; ++j) {
    table[m_][j] = -c_[0][j - 1];
  }
  column[0] = "S0";
  for (size_t i = 1; i <= n_; ++i) {
    column[i] = "x" + std::to_string(i);
  }
  row[m_] = "F";
  for (size_t i = 0; i < m_; ++i) {
    row[i] = "x" + std::to_string(n_ + i + 1);
  }
  print_table();
}

void SimplexTable::find_basic() {
  size_t negative_row_index = -1;
  for (size_t i = 0; i < m_; ++i) {
    if (table[i][0] < 0) {
      negative_row_index = i;
      break;
    }
  }
  if (negative_row_index == -1) {
    throw std::runtime_error("The table has already basic solution.");
  }
  size_t solving_column = -1;
  for (size_t i = 1; i <= n_; ++i) {
    if (table[negative_row_index][i] < 0) {
      solving_column = i;
      break;
    }
  }
  if (solving_column == -1) {
    throw std::runtime_error("Task has no solution");
  }
  size_t solving_row = -1;
  double ratio = std::numeric_limits<double>::max();
  for (size_t i = 0; i < m_; ++i) {
    if (table[i][solving_column] != 0 &&
        table[i][0] / table[i][solving_column] >= 0 &&
        table[i][0] / table[i][solving_column] < ratio) {
      solving_row = i;
      ratio = table[i][0] / table[i][solving_column];
    }
  }
  if (solving_row == -1) {
    throw std::runtime_error("Task has no solution");
  }
  swap(solving_column, solving_row);
  std::cout << "Solving column: " << solving_column
            << ", solving row: " << solving_row << std::endl;
  print_table();
}

void SimplexTable::optimize() {
  size_t solving_column = -1;
  for (size_t i = 1; i <= n_; ++i) {
    if (table[m_][i] > 0) {
      solving_column = i;
      break;
    }
  }
  if (solving_column == -1) {
    throw std::runtime_error("The solution has already been optimized");
  }
  size_t solving_row = -1;
  double ratio = std::numeric_limits<double>::max();
  for (size_t i = 0; i < m_; ++i) {
    if (table[i][solving_column] != 0 &&
        table[i][0] / table[i][solving_column] >= 0 &&
        table[i][0] / table[i][solving_column] < ratio) {
      solving_row = i;
      ratio = table[i][0] / table[i][solving_column];
    }
  }
  if (solving_row == -1) {
    throw std::runtime_error("The system is unlimited");
  }
  swap(solving_column, solving_row);
  std::cout << "Solving column: " << solving_column
            << ", solving row: " << solving_row << std::endl;
  print_table();
}

void SimplexTable::swap(size_t solving_column, size_t solving_row) {
  std::swap(column[solving_column], row[solving_row]);
  matrix new_table = table;
  auto solving_element = table[solving_row][solving_column];
  for (size_t i = 0; i <= n_; ++i) {
    if (i != solving_column) {
      new_table[solving_row][i] = table[solving_row][i] / solving_element;
    }
  }
  for (size_t i = 0; i <= m_; ++i) {
    if (i != solving_row) {
      new_table[i][solving_column] =
          -table[i][solving_column] / solving_element;
    }
  }
  new_table[solving_row][solving_column] =
      static_cast<double>(1) / solving_element;
  for (size_t i = 0; i <= m_; ++i) {
    for (size_t j = 0; j <= n_; ++j) {
      if (!(i == solving_row || j == solving_column)) {
        new_table[i][j] = table[i][j] - table[i][solving_column] *
                                            table[solving_row][j] /
                                            solving_element;
      }
    }
  }
  table = std::move(new_table);
}

bool SimplexTable::is_optimal() const {
  for (size_t i = 1; i <= n_; ++i) {
    if (table[m_][i] > 0) {
      return false;
    }
  }
  return true;
}

bool SimplexTable::has_basic_solution() const {
  for (size_t i = 0; i < m_; ++i) {
    if (table[i][0] < 0) return false;
  }
  return true;
}

void SimplexTable::print_table() const {
  print_flags();
  std::cout << " "
            << "|";
  for (const auto &el : column) {
    print_flags();
    std::cout << el << "|";
  }
  std::cout << std::endl;
  for (size_t i = 0; i < m_ + 1; ++i) {
    print_flags();
    std::cout << row[i] << "|";
    for (size_t j = 0; j < n_ + 1; ++j) {
      print_flags();
      std::cout << table[i][j] << "|";
    }
    std::cout << std::endl;
  }
}

void SimplexTable::print_flags() {
  std::cout.setf(std::ios::right, std::ios::adjustfield);
  std::cout.precision(2);
  std::cout.setf(std::ios::fixed);
  std::cout.width(7);
}

std::vector<double> SimplexTable::solve() {
  while (!has_basic_solution()) {
    find_basic();
  }
  std::cout << "Found reference solution. Now let's find optimal" << std::endl;
  while (!is_optimal()) {
    optimize();
  }
  std::vector<double> solution(n_ + 1);
  solution[0] = table[m_][0];
  for (size_t i = 1; i <= n_; ++i) {
    if (auto x = std::find(row.begin(), row.end(), "x" + std::to_string(i));
        x != row.end()) {
      solution[i] = table[x - row.begin()][0];
    }
  }
  return solution;
}
