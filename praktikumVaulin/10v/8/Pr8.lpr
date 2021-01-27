program Pr8;

const
  k = 5;
  l = 5;

Type
  tmas = array [1..k, 1..l] of integer;

var i, j, max, min, maxInd, minInd, proiz:integer;
  a:tmas;
begin
  for i:=1 to k do
    for j:=1 to l do
      a[i][j]:=random(21)-10;
 for i:=1 to k do
    begin
    proiz:=1;
     max:=a[i][1];
     min:=a[i][1];
     minInd:=1;
     maxInd:=1;
    for j:=1 to l do
      begin
      if a[i][j]>max then
       begin
         max:=a[i][j];
         maxInd:=j;
       end
      else
        if a[i][j]<min then
         begin
           min:=a[i][j];
           minInd:=j;
         end;
      write (a[i][j], ' ');
      end;
       if maxInd-minInd>1 then
         for j:=minInd+1 to maxInd-1 do
           proiz:=proiz*a[i][j]
       else
         if minInd-maxInd>1 then
          for j:=maxInd+1 to minInd-1 do
            proiz:=proiz*a[i][j]
       else
         proiz:=0;
       write(proiz, ' ', min, ' ', max);
       writeln;
      end;
  readln;

end.

