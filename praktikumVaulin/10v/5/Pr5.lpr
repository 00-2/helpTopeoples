program Pr5;
uses
  SysUtils,
  Math;

const
  count = 5;

var
  n:integer;
  x, r, s, eps:real;
begin
  Write('Введите требуемую точность: ');
 ReadLn(Eps);
 Write('Введите значение аргумента функции: ');
 ReadLn(X);
 N:=1;
 R:=2*X;
 S:=0;
 while Abs(R)>Eps do
 try
 S:=S+R;
 if n<count then
 WriteLn('N=', N, ' R=', R:14:11, ' S=', S:14:11);
 N:=N+1;
  r:=2*(exp((2*n-1)*LN(x)))/(2*n-1);
 except
  on E:Exception do
  begin
  WriteLn(E.Message);
  WriteLn('Исключение возникло на шаге N = ',N);
  ReadLn;
  Halt
  end;
  end;

  WriteLn('Число шагов за которое достигнута заданная точность = ',N);

  WriteLn('Приближенное значение функции ln((1+X)/(1-x)) = '
  ,S:14:11);

  WriteLn('ln((1+X)/(1-x)) = ',Ln((1+X)/(1-x)):14:11);
  //Àáñîëþòíàÿ îøèáêà
  WriteLn('A = '
  ,Abs(Ln((1+X)/(1-x))-S):14:11);
  //Îòíîñèòåëüíàÿ îøèáêà
  WriteLn('Îòíîñèòåëüíàÿ îøèáêà = '
  ,Abs((Ln((1+X)/(1-x))-S)/Ln((1+X)/(1-x))):14:11,'%');
  ReadLn;
 end.

