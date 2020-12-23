program pr10;
uses math;

type
Matrix = array of array of integer;

function replaceRow(var matrixInit:Matrix;var n,m,minI,maxI,minN,minM,maxN,maxM:integer): boolean;
var i,j,tmp:integer;
begin
  if minI=maxI then//все одинаковы
     begin
          replaceRow:=True;
          exit;
     end;
  if minN<>maxN then
     //поменять местами столбцы
     begin
       for j:=0 to n-1 do
              begin
                  tmp:=matrixInit[minN][j];
                  matrixInit[minN][j]:=matrixInit[maxN][j];
                  matrixInit[maxN][j]:=tmp;
              end;
     end
  else
      //поменять местами строки
      begin
          for i:=0 to m-1 do
              begin
                  tmp:=matrixInit[i][minM];
                  matrixInit[i][minM]:=matrixInit[i][maxM];
                  matrixInit[i][maxM]:=tmp;
              end;
      end;
      replaceRow:=False;
end;

var
  matrixInit:Matrix;
  i,j,minI,maxI,minN,minM,maxN,maxM,n,m:integer;
begin
   {writeln('Size of matrix:'
  write('n=:');
  readln(n);
  write('m=:');
  readln(m);
  writeln('Insert matrix:')
  for i:=0 to n do
      for j:=0 to m do
          read(matrixInit[i][j];
      writeln;
  }
  m:=3;n:=4;
  SetLength(matrixInit,n,m);
  //matrixInit:= [[1,4,60],[10,13,16],[20,23,26],[5,5,5]];
  //matrixInit:= [[1,4,7],[10,13,16],[20,23,26],[5,5,5]];
  //matrixInit:= [[1,1,1],[1,1,1],[1,1,1],[1,1,1]];
  
   for i:=0 to n-1 do
      begin
      for j:=0 to m-1 do
         write(matrixInit[i][j]:4,' ');
      writeln;
      end;

  maxI:=matrixInit[0][0];
  minI:=matrixInit[0][0];
  for i:=0 to n-1 do
      for j:=0 to m-1 do
          if maxI<matrixInit[i][j] then
             begin
                  maxI:=matrixInit[i][j];
                  maxN:=i;maxM:=j;
             end;
          if minI>matrixInit[i][j] then
             begin
                  minI:=matrixInit[i][j];
                  minN:=i;minM:=j;
             end;
   writeln(replaceRow(matrixInit, n,m,mini,maxi,minn,minm,maxn,maxm));

   for i:=0 to n-1 do
      begin
      for j:=0 to m-1 do
         write(matrixInit[i][j]:4,' ');
      writeln;
      end;
end.

