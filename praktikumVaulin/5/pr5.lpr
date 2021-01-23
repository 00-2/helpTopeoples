program pr5;
uses math;
var
  s, x, R, eps, accurate, pa, po: real;
     n, k: integer;
     //n - число просуммированных членов
     //к - номер эпсилон
begin
  write('x:');read(x);writeln;
  while not (x<1) do
  begin
       writeln('x должен быть меньше 1, ln(1-x)');
       write('x:');read(x);writeln;
  end;
  write('eps:');readln(eps);
  write('k:');readln(k);
  s:=-x; //начальное значение
  n:=1;
  R:=-x;
  accurate:=ln(1-x);
  while abs(R)>eps do
    begin
      n:=n+1;
      R:=R*(x/n)*(n-1);
      s:=s+R;
    end;
  pa:=abs(s-accurate);//абс погрешность
  po:=abs(pa/s);//относ погрешность

  writeln();
  writeln('точность S=', accurate:k);
  writeln();
  writeln('S = ', s:k+3:k,' ':3, 'R=',R:k+3:k,' ':3, 'n=', n:4);
  writeln();
  writeln('Абсолютная погрешность = ', pa:6:2);
  writeln('Относительная погрешность =', po:6:2);
  readln();
end.
//R0=-x
//R=R0*(x/n)*(n-1)
//x=0.5
//R=-0.125
//eps=0.126 k=3
//-0.5-(0.5*0.5)=-0.625

