#include "matrix.h"
std::vector<std::vector<double>> transponse(
    const std::vector<std::vector<double>> &data) {
  std::vector<std::vector<double>> result(data.front().size(),
                                          std::vector<double>(data.size()));
  for (size_t i = 0; i < data.front().size(); i++) {
    for (size_t j = 0; j < data.size(); j++) {
      result[i][j] = data[j][i];
    }
  }
  return result;
}

std::vector<std::vector<double>> operator-(
    const std::vector<std::vector<double>> &data) {
  std::vector<std::vector<double>> result(
      data.size(), std::vector<double>(data.front().size()));
  for (size_t i = 0; i < data.size(); i++) {
    for (size_t j = 0; j < data.front().size(); j++) {
      result[i][j] = -data[i][j];
    }
  }
  return result;
}
