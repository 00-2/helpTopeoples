#include "header.hpp"
#include "table.cpp"

Table<double> make_table(std::vector<std::vector<double>> &A, size_t rows_A, std::vector<double> &b, std::vector<double> &c, std::vector<std::string> &up, std::vector<std::string> &left)
{
    std::vector<std::vector<double>> table(rows_A + 1);

    for (size_t i = 0; i < rows_A; i++)
    {
        table[i].push_back(b[i]);
        for (size_t j = 0; j < rows_A; j++)
            table[i].push_back(A[i][j]);
    }

    table[rows_A] = c;

    return Table<double>(table, up, left);
}


int main()
{
    size_t cols_c = 4;
    size_t rows_A = 3;
    size_t cols_b = 3;
    std::vector<std::vector<double>> A(rows_A);
    std::vector<double> c(cols_c), b(cols_b);
    c = {0, 5, 6, 1}; // первый 0 - свободный член

    A[0] = {2, 1, 1, 1, 0, 0};
    A[1] = {1, 2, 0};
    A[2] = {0, 0.5, 1};

    b = {5, 3, 8};

    bool to_min = false;

    make_double(A, b, c, to_min, rows_A, cols_b, cols_c);

    for (size_t i = 0; i < b.size(); i++)
    {
        b[i] *= (-1);
    }

    //следющее условие выполнять только, если нужно найти min
    if (to_min)
    {
        for (size_t j = 1; j < cols_c; j++)
            if (c[j] != 0)
                c[j] *= (-1);
    }

    for (size_t i = 0; i < rows_A; i++)
    {
        for (size_t j = 0; j < (cols_c - 1); j++)
            A[i][j] *= (-1);
    }

    std::vector<std::string> left = {"y4", "y5", "y6", "F"};
    std::vector<std::string> up = {"Si0", "y1", "y2", "y3"};

    Table<double> table = make_table(A, rows_A, b, c, up, left);

    table.paint_the_table();

    size_t i = table.Sio_neg(), j;
    while (i != rows_A + 8)
    { // rows_a*2 - рандомное значение  флаг, ибо такого количества строк быть не может,их всего rows_A + 1
        j = table.col_of_sup(i);
        if (j == rows_A + 8)
            throw std::logic_error("Ограничения неверны");
        table.change_str_col(i, j);
        table.change_hat(i, j);
        i = table.Sio_neg();
        table.paint_the_table();
    }

    std::cout<<std::endl<< "Опорное решение: "<< table[cols_b][0]<<std::endl;
    table.print_var();

    j = table.F_pos();
    while (j != rows_A + 8)
    { // rows_a*2 - рандомное значение  флаг, ибо такого количества строк быть не может,их всего rows_A + 1
        i = table.row_of_sup(j);
        if (j == rows_A + 8)
            throw std::logic_error("Max у функции нет");
        table.change_str_col(i, j);
        table.change_hat(i, j);
        j = table.F_pos();
        table.paint_the_table();
    }

    std::cout << "F min =  " << table.result(to_min);

    table.print_var();

    return 0;
}