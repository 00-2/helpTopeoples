program Pr6;
uses
SysUtils,
math;

var A,B,dX,dX2,X,Z,Z0:real;
 i,N:Integer;
begin
  writeln('Введите пределы интегрирования а и b');
  readln(a, b);
  writeln('Введите n');
  readln(n);

  //parabola
  WriteLn('Метод параболы при N = ',N);
 dX:=(B-A)/N;
 dX2:=dX/2;
 Z:=(a/Exp(3*Ln(1+a))+b/Exp(3*Ln(1+b)))/2+2*(b-dx2)/Exp(3*Ln(1+b-dx2));
 X:=A+dX;
 for i:=1 to N-1 do
  begin
    Z:=Z+x/Exp(3*Ln(1+x))+2*(x-dx2)/Exp(3*Ln(1+x-dx2));
    X:=X+dX;
  end;
 Z:=Z*dX/3;
 Z0:=1/(2*(1+b)*(1+b))-1/(1+b)-1/(2*(1+a)*(1+a))-1/(1+a);
 WriteLn(Z,' - приближенное значение интеграла');
 WriteLn(Z0,' - точное значение');
 WriteLn(Abs(Z0-Z),' - абсолютная ошибка');
 WriteLn(Abs((Z0-Z)/Z0),' - относительная ошибка');
 WriteLn;
 //pryamoug
 WriteLn('метод прямоугольников при N = ',N);
 X:=A+dX/2;
   Z:=0;
 for i:=1 to N do
 begin
 Z:=Z+x/Exp(3*Ln(1+x));
 X:=X+dX;
 end;
 Z:=Z*dX;
 WriteLn(Z,' - приближенное значение интеграла');
 WriteLn(Z0,' - точное значение');
 WriteLn(Abs(Z0-Z),' - абсолютная ошибка');
 WriteLn(Abs((Z0-Z)/Z0),' - относительная ошибка');
 WriteLn;


 readln;
end.

