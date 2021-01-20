program pr9real;


function checkArithmeticProgression(mass:array of real;n:integer):boolean;
  var
    i:integer;
    d:real;
  begin
    d:= mass[1]-mass[0];
    for i:=2 to n-1 do
        begin
          if((mass[i]-mass[i-1])<>d) then
              begin
                   checkArithmeticProgression:=False;
                   exit;
              end;
        end;
    checkArithmeticProgression:=True;
end;

procedure writeArr(var arr:array of real;i,size:integer);
begin
    for i:=0 to size-1 do
      write(arr[i],' ');
end;

  var arrForTest,arrSumOfProgression:array of real;
      matrixInit, matrixResult:array of array of real;
      ctd,m,n,i,j:integer;
      sumOfP:real;
begin
  writeln('Size of matrix:');
  write('n=:');
  readln(n);
  write('m=:');
  readln(m);
  SetLength(matrixInit,n,m);
  writeln('Insert matrix:');
  for i:=0 to n-1 do
      for j:=0 to m-1 do
          read(matrixInit[i][j]);
      writeln;

  {m:=3;n:=4;
  SetLength(matrixInit,n,m);
  matrixInit:= [[1,4,7],[10,13,16],[20,23,26],[5,5,5]];
  }


  setLength(arrForTest,m);
  ctd:=0;


  for i:=0 to n-1 do
    begin
      for j:=0 to m-1 do
        begin
          write(matrixInit[i][j]:5:2,' ');
        end;
      writeln;
    end;


  for i:=0 to n-1 do
    begin
      for j:=0 to m-1 do
          begin
            arrForTest[j]:=matrixInit[i][j];
          end;
      if checkArithmeticProgression(arrForTest,m) then
         ctd:=ctd+1;
    end;

  SetLength(matrixResult,n,ctd);
  SetLength(arrSumOfProgression,ctd);
  ctd:=0;

  for i:=0 to n-1 do
    begin
      for j:=0 to m-1 do
          begin
            arrForTest[j]:=matrixInit[i][j];
          end;


      sumOfP:=0;
      if checkArithmeticProgression(arrForTest,m) then
         begin
              for j:=0 to m-1 do
                begin
                  matrixResult[ctd, j]:=matrixInit[i][j];
                  sumOfP:=sumOfP+matrixInit[i][j];
                end;
               arrSumOfProgression[ctd]:=sumOfP;
               ctd:=ctd+1;
         end;
    end;
  writeln;
  for i:=0 to ctd-1 do
    begin
      for j:=0 to m-1 do
        begin
          write(matrixResult[i][j]:5:2,' ');
        end;
      writeln(' sum:',arrSumOfProgression[i]:5:2);
    end;

  readln();
end.

