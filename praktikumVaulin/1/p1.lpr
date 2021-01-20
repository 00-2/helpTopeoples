program p1;
uses SysUtils,Math;
var X,Y,A:real;
begin
     a:=4;
     x:=-3;
     y:=exp(ln(A) * x)- exp(ln(A)*(2*x))/(3) + (exp(ln(A)*(3*x))*4)/(3*5)-(exp(ln(A)*(4*x))*6)/(3*5*7);
     writeln('x=-3:y=',y:2:4);
     x:=3;
     y:=exp(ln(A) * x)- exp(ln(A)*(2*x))/(3) + (exp(ln(A)*(3*x))*4)/(3*5)-(exp(ln(A)*(4*x))*6)/(3*5*7);
     writeln('x=3:y=',y:2:4);
     x:=0;
     y:=exp(ln(A) * x)- exp(ln(A)*(2*x))/(3) + (exp(ln(A)*(3*x))*4)/(3*5)-(exp(ln(A)*(4*x))*6)/(3*5*7);
     writeln('x=0:y=',y:2:4);
end.

