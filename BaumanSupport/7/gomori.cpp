
#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <algorithm>
#include <fstream>
#include <string>
#include <tuple>
using namespace std;

void PrintVector(const vector<double>& v) {
  //выводит вектор(для матрицы)
	for (const auto& elements : v)
		cout << setw(6) << setprecision(2) << elements;
}

vector<double> input_vector(const string& filename, int a) {
  //достаёт вектор из файла(для b и c векторов)
  //УМНОЖАЕТ НА -1, при доставании из файла для dualSimplex умн на 1
	ifstream input(filename);
	vector<double> f_vector;
	double f_element;

	while (input >> f_element)
		f_vector.push_back(a*f_element);//(*-1)
	return f_vector;
}

void fulling_var(vector<string>& var, const int& size, int pointer) {
  //заполняет вектор(y1 y2 y3 y4 ..)
  //если вводим n, то, (4,3)-> 123
  /*
                               4
                               5
                               6
                               7
  
  Нужно передавать переменную, n/m, 0/m
  */
  for (int i = pointer; i < size+pointer; i++)
		var.push_back("y" + to_string(i + 1));
}



tuple<bool, int> CheckNegative(const vector<double>& v) {
	for (int i = 0; i < v.size(); i++) {
		if (v[i] < 0)
			return make_tuple(true, i);
	}
	return make_tuple(false, -1);
}

tuple<bool, int> CheckPositive(const vector<double>& v) {
	for (int i = 1; i < v.size(); i++) {
		if (v[i] > 0)
			return make_tuple(true, i);
	}
	return make_tuple(false, -1);
}

int MinPositive(const vector<double>& v1, const vector<double>& v2) {
	double min = 2000;
	int r = -1;
	for (int i = 0; i < v1.size() - 1; i++) {
		if (v2[i] != 0 && v1[i] / v2[i] < min && v1[i] / v2[i] > 0) {
			min = v1[i] / v2[i];
			r = i;
		}
	}
	return r;
}

vector<double> vector_from_column(const vector<vector<double>>& matr, const int& column_num) {
	vector<double> v;
	for (int i = 0; i < matr.size(); i++)
		v.push_back(matr[i][column_num]);
	return v;
}

void Jordan(vector<vector<double>>& matr, vector<string>& base, vector<string>& free, const int& r, const int& k) {
	string tmp = base[r];
	base[r] = free[k - 1];
	free[k - 1] = tmp;
	vector<vector<double>> matr_ = matr;
	for (int i = 0; i < matr.size(); i++) {
		for (int j = 0; j < matr[i].size(); j++) {
			if (i != r && j != k)
				matr_[i][j] = matr[i][j] - (matr[i][k] * matr[r][j] / matr[r][k]);
			if (i == r && j != k)
				matr_[r][j] = matr[r][j] / matr[r][k];
			if (i != r && j == k)
				matr_[i][k] = (-1)*(matr[i][k] / matr[r][k]);
			if (i == r && j == k)
				matr_[r][k] = 1 / matr[r][k];
		}
	}
	matr = matr_;
}

int findk(const vector<vector<double>>& matr, const int& r_) {
	vector<double> tmp = matr[r_];
	auto iter = tmp.cbegin();
	tmp.erase(iter);
	int k = get<1>(CheckNegative(tmp));
	return k;
}

class Simplex {
public:
	Simplex(const string& A, const string& b, const string& c) {
		ifstream input(A);
		input >> n;
		input.ignore(1);
		input >> m;
    if (n!=m){

      vector<double> rows;
		  vector<double> b_vector;
		  vector<double> c_vector;
		  double row_element;
      b_vector = input_vector(b, -1);
		  c_vector = input_vector(c, -1);
      
	  
	  for (int i = 0; i < m; i++) {
			  matrix.push_back({});
        for (int j = 0; j < n; j++) {
				  matrix[i].push_back(0);
			  }
      }

	// i<m !
    for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
          	input >> row_element;
          	matrix[j][i]=(-1)*row_element;
        }
	}
    
	
	  for (int i = 0; i < m; i++) {
			  for (int j = 0; j < n; j++) {
          cout << matrix[i][j]<<" ";
        }
        cout << "\n";
	    }
      cin.get();
    }
    else{
		vector<double> rows;
		vector<double> b_vector;
		vector<double> c_vector;
		double row_element;
    cout << "\n0\n";
		b_vector = input_vector(b, -1);
		c_vector = input_vector(c, -1);
		
    for (int i = 0; i < n; i++) {
		matrix.push_back({});
        for (int j = 0; j < m; j++) {
				matrix[i].push_back(0);
			}
    }
    
    
    for (int i = 0; i < n; i++) {
			for (int j = 0; j < m; j++) {
        input >> row_element;
        matrix[j][i]=(-1)*row_element;
      }
	}

    for (int i = 0; i < n; i++) {
			for (int j = 0; j < m; j++) {
        cout << matrix[i][j] << " ";
      }
      cout << "\n";
	}

    
    cout << "\n1\n";
		for (int i = 0; i < n; i++) {
			auto it = matrix[i].cbegin();
			matrix[i].insert(it, c_vector[i]);
		}
		auto iter = b_vector.cbegin();
		b_vector.insert(iter, 0);
		matrix.push_back(b_vector);
		
		fulling_var(base_var, n, m);
		base_var.push_back("F ");
		fulling_var(free_var, m, 0);
	  }
  }

	void Print() {
		cout << setw(8) << 'S';
		for (int i = 0; i < free_var.size(); i++)
			cout << setw(6) << free_var[i];
		cout << endl;
		for (int i = 0; i < base_var.size(); i++) {
			cout << base_var[i];
			PrintVector(matrix[i]);
			cout << endl;
		}
		cout << endl;
	}

	void PrintSolution(const string& str, bool SolutionExist) {
		cout << str;
		if (SolutionExist) {
			for (int i = 0; i < n + 1; i++)
				cout << base_var[i] << " = " << fixed << setprecision(2) << matrix[i][0] << endl;
		}
	}
	tuple<bool, bool, bool> IsReferenceSolution() {
		vector<double> s_vector;
		bool reference_flag = false;
		bool no_solution_flag = false;
		bool optimum_flag = false;

		for (int i = 0; i < n; i++)
			s_vector.push_back(matrix[i][0]);

		int r1 = get<1>(CheckNegative(s_vector));

		if (r1 < 0)
			reference_flag = true;
		else {
			int k = findk(matrix, r1);
			if (k < 0)
				no_solution_flag = true;
		}
		if (!get<0>(CheckPositive(matrix[matrix.size() - 1])))
			optimum_flag = true;
		return make_tuple(reference_flag, no_solution_flag, optimum_flag);
	}

	void FindReferenceSolution() {
		vector<double> s_vector;
		for (int i = 0; i < n; i++)
			s_vector.push_back(matrix[i][0]);
		int r1 = get<1>(CheckNegative(s_vector));
		int k = findk(matrix, r1) + 1;
		cout << "r1 = " << r1 << endl;
		vector<double> v1 = vector_from_column(matrix, 0);
		vector<double> v2 = vector_from_column(matrix, k);
		int r = MinPositive(v1, v2);

		cout << "r = " << base_var[r] << ", k = " << free_var[k - 1] << endl;
		Jordan(matrix, base_var, free_var, r, k);
	}
	void FindOptimumSolution() {
		int k = get<1>(CheckPositive(matrix[matrix.size() - 1]));
		vector<double> v1 = vector_from_column(matrix, 0);
		vector<double> v2 = vector_from_column(matrix, k);
		int r = MinPositive(v1, v2);
		cout << "r = " << base_var[r] << ", k = " << free_var[k - 1] << endl;
		Jordan(matrix, base_var, free_var, r, k);
	}


private:
	int n;
	int m;
	vector<string> base_var;
	vector<string> free_var;
	vector<vector<double>> matrix;
};

int main()
{
	Simplex a("a.txt", "b.txt", "c.txt");
	cout << "First stage: \n\n";
	while (true) {
		a.Print();
		if (get<0>(a.IsReferenceSolution())) {
			a.PrintSolution("Reference solution: \n", 1);
			break;
		}
		else {
			if (get<1>(a.IsReferenceSolution())) {
				a.PrintSolution("No solution. \n", 0);
				return 0;
			}
			else
				a.FindReferenceSolution();
		}
	}
	cout << "Second stage: \n\n";

	while (true) {
		a.Print();
		if (get<2>(a.IsReferenceSolution())) {
			a.PrintSolution("Optimal solution: \n", 1);
			break;
		}
		else
			a.FindOptimumSolution();
	}
	return 0;
}

