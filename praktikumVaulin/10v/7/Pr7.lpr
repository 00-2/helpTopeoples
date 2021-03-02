program Pr7;
uses
 SysUtils, Math;

//вычисление приближения корня уравнения методом итераций и касательных
//уравнение x^4/8-xsin(14x)=0

var
 X0, X1, Eps, dX, p: real;
 i, n:integer;
begin
 //iteracii
write('введите корень:  ');
 ReadLn(X0);
write('введите приближения:  ');
 ReadLn(Eps);
 P:=Abs(exp(3*ln(x0))/2-(14*x0*cos(14*x0)+sin(14*x0)));  //вычисление модуля второй производной
 //для проверки применимости метода
 if P=0 then
 begin
 WriteLn('Нарушено условие применимости метода итераций!');
 ReadLn;
 end
 else if P<1 then
 begin
 repeat
 X1:=exp(4*ln(x0))/8-x0*sin(14*x0);
 dX:=Abs(X0-X1);
 X0:=X1 ;
 until dX<Eps ;
 writeln('C точностью ',Eps:16:14, ' корень равен ', X0:16:14); //вывод результатов
 end
 else if P>1 then
   writeln('метод итераций не применим, тк у функции нет ей обратной');
 //kasatelnie
   WriteLn('введите n');
 ReadLn(N);
   //проверка применимости метода касательных
 if (exp(4*ln(x0))/8-x0*sin(14*x0))*(3*x0*x0/2-28*cos(14*x0)+196*x0*sin(14*x0)) <= 0 then
//вторая производная
 WriteLn('Не выполнено условие применимости метода касательных ')
 else
 begin
 i:=0;
 repeat
 i:=i+1;
 dX := (exp(4*ln(x0))/8-x0*sin(14*x0))/(exp(3*ln(x0))/2-(14*x0*cos(14*x0)+sin(14*x0)));
 X1:=X0-dX;
 X0:=X1
 until (Abs(dX)<Eps) or (i=N);
 if Abs(dX)<Eps then
 WriteLn('Корень Х уравнения ',X0:14, ' найден за ' ,i,' шагов, Y(X) = '
 ,exp(4*ln(x0))/8-x0*sin(14*x0):14) //вывод результатов
 else
 WriteLn('корень уравнения не найден!');
 end;
 WriteLn;
 Readln;
end.
