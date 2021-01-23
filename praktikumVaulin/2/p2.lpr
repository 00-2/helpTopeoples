program p2;
uses SysUtils,Math;

var c:integer;
x:real;
begin
     write('x=');read(x);
     if x<-3 then c:=0;
     if (x>=-3) and (x<0) then c:=1;
     if (x>=0) and (x<1) then c:=2;
     if (x>=1) then c:=3;

     if c=0 then begin x:=-1/x;writeln(x);exit; end;
     if c=1 then begin x:=sqrt(-x);writeln(x);exit; end;
     if c=2 then begin x:=x*x;writeln(x);exit; end;
     if c=3 then begin x:=1-x;writeln(x);exit; end;

end.

