#ifndef LAB1_0_HEADER_HPP
#define LAB1_0_HEADER_HPP

#include <cstddef>

#include <iomanip>
#include <vector>
#include <iostream>

template <typename T>
class Table
{
private:
    size_t n, m; // n = rows, m = cols
    T **matr;
    std::vector<std::string> up;
    std::vector<std::string> left;

public:
    ~Table<T>();

    Table<T>(std::vector<std::vector<T>> &Vec, std::vector<std::string> &up1, std::vector<std::string> &left1);

    Table<T>() = default;

    T *operator[](size_t i);

    T *operator[](size_t i) const;

    void paint_the_table();

    size_t Sio_neg();

    size_t F_pos();

    size_t col_of_sup(size_t i);

    size_t row_of_sup(size_t j);

    T result(bool to_min);

    void change_str_col(size_t str_num, size_t col_num);

    void change_hat(size_t i, size_t j);

    void print_var();
};

#endif //LAB1_0_HEADER_HPP
