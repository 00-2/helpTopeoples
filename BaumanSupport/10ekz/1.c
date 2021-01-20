
#include <stdio.h>
#include <string.h>
int main()
{
    char str[50],strRes[50];   
    int maxSum=0;
while(1)
    {
    fgets(str,50,stdin);
    int s = 0; //сумма ЧИСЕЛ
    int num = 0;
    for(int i=0; i<strlen(str)+1; i++) {
      if (str[i] >='0' && str[i]<='9') {
        num = 10*num + str[i] - '0';
      }
      else {
          s += num;
          num = 0;
      }
    }
    if (maxSum<=s){
        maxSum=s;
        strcpy(strRes,str);
    }
    s=0;
    if (strlen(str)==1){
        break;
    }
}
puts(strRes);

}
