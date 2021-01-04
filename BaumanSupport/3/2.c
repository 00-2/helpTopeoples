
#include <stdio.h>
#include <math.h>
int main() {
  FILE *f,*fw;
  
  char * name = "text.txt";
  if ((f = fopen(name, "r")) == NULL)
  {
    printf("Не удалось открыть файл");
    return 0;
  }
  float sum=0, multiply=1, tmp;
  while (fscanf(f, "%f", &tmp )!=EOF){
      sum+=tmp;
      multiply*=tmp;
      printf("%f ", tmp);   
  }

  printf("\n");
  char * name1 = "result.txt";
  fw = fopen(name1, "w");
  printf("Модуль суммы:%f Квадрат умножения:%f \n",fabs(sum), multiply*multiply);
  fprintf(fw, "Модуль суммы:%f Квадрат умножения:%f \n",fabs(sum), multiply*multiply);
  // открыть файл удалось
  // требуемые действия над данными
  fclose(f);
  fclose(fw);
  return 0;
}
