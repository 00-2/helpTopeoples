#include "header.hpp"

#define THREE(x) x x x

template <typename T>
Table<T>::~Table()
{
    for (size_t i = 0; i < n; i++)
    {
        delete[] matr[i];
    }
    delete[] matr;
}

template <typename T>
Table<T>::Table(std::vector<std::vector<T>> &Vec, std::vector<std::string> &up1, std::vector<std::string> &left1)
{
    up = up1;
    left = left1;
    n = Vec.size();
    m = 0;
    matr = new T *[n];
    for (size_t i = 0; i < n; i++)
        if (Vec[i].size() > m)
            m = Vec[i].size();
    for (size_t i = 0; i < n; i++)
    {
        matr[i] = new T[m];
        for (size_t j = 0; j < m; j++)
        {
            if (Vec[i].size() < j)
            {
                matr[i][j] = 0;
            }
            else
            {
                matr[i][j] = Vec[i][j];
            }
        }
    }
}

template <typename T>
T *Table<T>::operator[](size_t i)
{
    return matr[i];
}

template <typename T>
T *Table<T>::operator[](size_t i) const
{
    return matr[i];
}

template <typename T>
void Table<T>::paint_the_table()
{
    size_t wid = 8;
    std::cout << std::endl;
    std::string t = "      ";
    std::cout << std::setw(wid) << t;
    for (size_t i = 0; i < up.size(); i++)
        std::cout << std::setw(wid) << up[i];
    std::cout << std::endl;
    for (size_t i = 0; i < n; i++)
    {
        std::cout << std::setw(wid) << left[i];
        for (size_t j = 0; j < m; j++)
        {
            std::cout << std::setw(wid) << std::setprecision(4) << matr[i][j] << "  ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

template <typename T>
void transform(std::vector<std::vector<T>> &A, size_t &rows_A, size_t &cols_A)
{

    std::vector<std::vector<T>> temp(cols_A);
    for (size_t i = 0; i < rows_A; i++)
    {
        for (size_t j = 0; j < cols_A; j++)
        {
            temp[j].push_back(A[i][j]);
        }
    }
    A = temp;
    size_t temp_s = rows_A;
    rows_A = cols_A;
    cols_A = temp_s;
}

template <typename T>
void make_double(std::vector<std::vector<T>> &A, std::vector<T> &b, std::vector<T> &c, bool &to_min, size_t &rows_A, size_t &cols_b, size_t &cols_c)
{
    to_min = (!to_min);
    c.erase(c.begin());
    auto temp = b;
    b = c;
    c.clear();
    c.push_back(0);
    for (size_t o = 0; o < temp.size(); o++)
        c.push_back(temp[o]);
    size_t cols_A = cols_c - 1;
    for (size_t i = 0; i < rows_A; i++)
    {
        THREE(A[i].erase(A[i].end() - 1);)
    }
    transform(A, rows_A, cols_A);
    cols_c = c.size();
    cols_b = b.size();
}

template <typename T>
size_t Table<T>::Sio_neg()
{
    for (size_t i = 0; i < n - 1; i++)
        if (matr[i][0] < 0)
            return i;
    return n + 7;
}

template <typename T>
size_t Table<T>::F_pos()
{
    for (size_t j = 1; j < n; j++)
        if (matr[n - 1][j] > 0)
            return j;
    return n + 7;
}

template <typename T>
size_t Table<T>::col_of_sup(size_t i)
{
    for (size_t j = 1; j < n; j++)
        if (matr[i][j] < 0)
            return j;
    return n + 7;
}

template <typename T>
size_t Table<T>::row_of_sup(size_t j)
{
    size_t row = 0;
    double temp = matr[0][0] / matr[0][j];
    for (size_t i = 0; i < n - 1; i++)
    {
        if (matr[i][j] != 0)
        {
            if (temp > (matr[i][0] / matr[i][j]) > 0)
            {
                temp = matr[i][0] / matr[i][j];
                row = i;
            }
        }
    }
    if (temp != 0)
        return row;
    return n + 7;
}

template <typename T>
T Table<T>::result(bool to_min)
{
    if (!to_min)
        return (-1) * matr[n - 1][0];
    return matr[n - 1][0];
}

template <typename T>
void Table<T>::change_str_col(size_t str_num, size_t col_num)
{
    T sup_elem = matr[str_num][col_num];
    for (size_t i = 0; i < n; i++)
    {
        if (i != str_num)
        {
            for (size_t j = 0; j < m; j++)
            {
                if (j != col_num)
                    matr[i][j] -= (matr[i][col_num] * matr[str_num][j]) / sup_elem;
            }
        }
    }
    // str +, col -
    for (size_t i = 0; i < n; i++)
    {
        if (i != str_num)
            matr[i][col_num] /= (-1) * sup_elem;
    }
    for (size_t j = 0; j < m; j++)
    {
        if (j != col_num)
            matr[str_num][j] /= sup_elem;
    }
    matr[str_num][col_num] = 1 / sup_elem;
}

template <typename T>
void Table<T>::change_hat(size_t i, size_t j)
{
    std::string temp;
    temp = left[i];
    left[i] = up[j];
    up[j] = temp;
}

template <typename T>
void Table<T>::print_var()
{
    std::cout << std::endl
              << "При значениях переменных: " << std::endl;
    for (size_t i = 0; i < n; i++)
    {
        if (left[i] == "y1" || left[i] == "y2" || left[i] == "y3")
        {
            if (left[i] == "y1")
                std::cout << "y1 = " << matr[i][0] << std::endl;
            if (left[i] == "y2")
                std::cout << "y2 = " << matr[i][0] << std::endl;
            if (left[i] == "y3")
                std::cout << "y3 = " << matr[i][0] << std::endl;
        }
    }
    for (size_t j = 0; j < n; j++)
    {
        if (up[j] == "y1" || up[j] == "y2" || up[j] == "y3")
        {
            if (up[j] == "y1")
                std::cout << "y1 = 0" << std::endl;
            if (up[j] == "y2")
                std::cout << "y2 = 0" << std::endl;
            if (up[j] == "y3")
                std::cout << "y3 = 0" << std::endl;
        }
    }
}
