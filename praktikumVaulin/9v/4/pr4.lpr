Program pr4;
var
   indMin,indMax, min, max,tmp,n,i: integer;
   d:array[1..26] of integer;
begin
  read(n);
  for i:=1 to n do
      d[i]:=random(20)-22;

  for i:=1 to n do
      write(d[i], ' ');
  writeln;

  max:=d[1];min:=d[1];indMax:=1;indMin:=1;
  for i:=1 to n do
      if d[i]>max then
      begin
           max:=d[i];
           indMax:=i;
      end;
  for i:=1 to n do
      if d[i]<min then
      begin
           min:=d[i];
           indMin:=i;
      end;
  d[1]:=min;
  d[n]:=max;
  writeln('max:',max,' indexMax:',indMax);
  writeln('min:',min,' indexMin:',indMin);
  writeln('Array:');
  for i:=1 to n do
      write(d[i], ' ');
end.
