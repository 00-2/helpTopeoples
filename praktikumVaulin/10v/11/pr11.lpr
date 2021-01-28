program pr11;
uses math;
{находит первый отрицательный в строке и меняет на сумму положительных. 
Если нет отрицательных, то закидывает номер строки в массив NOM}

type
Matrix = array of array of integer;

procedure findAndReplace(var matrixInit:Matrix;var k:integer; var l:integer ;var NOM:array of integer;var ctd:integer);
var i,j,sum,flag:integer;
begin
    ctd:=0;
    flag:=0;sum:=0;
    for i:=0 to k-1 do
       begin
       for j:=0 to l-1 do
           begin
                if (matrixInit[i][j]>=0) then
                   sum:=sum+matrixInit[i][j]
                else flag:=1;
           end;
       if flag=1 then
          begin
          for j:=0 to l-1 do
             begin
                  if (matrixInit[i][j]<0) then begin matrixInit[i][j]:=sum; break; end;
             end;
          end
       else begin NOM[ctd]:=i; ctd:=ctd+1;end;
       sum:=0;
       flag:=0;
       end;
end;

var
  matrixInit:Matrix;
  NOM:array[0..15] of integer;
  i,j,k,l,sizeOfNom:integer;
begin
  writeln('Введите размер:');
  write('k=:');
  readln(k);
  write('l=:');
  readln(l);
  SetLength(matrixInit,k,l);
  writeln('Введите матрицу:');
  for i:=0 to k-1 do
      for j:=0 to l-1 do
          read(matrixInit[i][j]);
      writeln;

   findAndReplace(matrixInit, k, l , NOM, sizeOfNom);

   for i:=0 to k-1 do
      begin
      for j:=0 to l-1 do
         write(matrixInit[i][j]:4,' ');
      writeln;
      end;
   writeln;
   for i:=0 to sizeOfNom-1 do
      write(NOM[i]:4,' ');
end.
