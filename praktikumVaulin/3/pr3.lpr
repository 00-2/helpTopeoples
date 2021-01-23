program pr3;
uses crt,math;
var
  x,x1,tmp:real;
  i,j,ctd:integer;
begin
clrscr;
i:=0;
   repeat
         i:=i+1;
         x:=tan(1/(i+1) * 45);writeln(x:4);
         j:=0;ctd:=1;
         tmp:=x;
         x:=0;
         for j:=0 to 4 do
             begin
                  x1:=exp(ln(tmp)*ctd)/(ctd);
                  ctd:=ctd+2;
                  if j mod 2 = 0 then
                     x1:=x1*(-1);
                  x:=x+x1;
             end;
         write(x,' ');
         x1:=x;
         x:=0;
         x:=x-exp(ln(tmp)*(3))/(3)+exp(ln(tmp)*(5))/(5)-exp(ln(tmp)*(7))/(7)+exp(ln(tmp)*(9))/(9);
         write(x, ' ');
         x:=abs(x-x1);
         writeln(x);
   until i<15;
readln
end.


