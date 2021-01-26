program pr7;
uses math;
var xL,xp,x0,x1,dx,eps,FL,Fx,x:real;
  ni,ni2,k:integer;
  begin
    writeln('xL:');readln(xL);
    writeln('xp:');readln(xp);
    writeln('eps:');readln(eps);
    writeln('k:');readln(k);
    ni:=0;
    x0:=(xL+xp)/2;
    repeat
      x1:=power(x0,5)*cos(x0)+1;
      dx:=abs(x1-x0);
      x00:=x0;
      x0:=x1;
      ni:=ni+1;
      until dx<eps;
writeln('x1=',x1:k+3:k,' ':3,'x0=',x0:k+3:k,' ':3,'ni=':5);

FL:=power(xL,5)*cos(xL)-xL+1;
ni2:=0;
while abs(xL-xp)<eps do
begin
    x:=(xL+xp)/2;
    Fx:=power(x,5)*cos(x)+1;
    if FL*Fx>0 then xp:=x
    else xL:=x;
end;
writeln('xL=',xL:k+3:k,' ':3,'xp=',xp:k+3:k,' ':3,'ni2=':5);
readln;
end.   
