program Pr7;
uses
 SysUtils, Math;

var
 X0, X1, Eps, dX, p: Extended;
 i, n:integer;
begin
 //iteracii
writeln('введите корень и приближение');
 ReadLn(X0,Eps);
 P:=Abs(exp(3*ln(x0))/2-(14*x0*cos(14*x0)+sin(14*x0)));
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
 writeln('C точностью ',Eps, ' корень равен ', X0);
 end
 else if P>1 then
   writeln('метод итераций не применим');
 //kasatelnie
   WriteLn('');
 Write('введите n ');
 ReadLn(N);

 if (exp(4*ln(x0))/8-x0*sin(14*x0))*(3*x0*x0/2-28*cos(14*x0)+196*x0*sin(14*x0)) <= 0 then
 WriteLn('Не выполнено условие применимости метода касательных')
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
 ,exp(4*ln(x0))/8-x0*sin(14*x0):14)
 else
 WriteLn('корень уравнения не найден!');
 end;
 WriteLn;
 Readln;
end.

