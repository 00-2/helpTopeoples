program pr2;
var
  arrA,arrB:array[1..100] of integer;
  arr: array of array of integer;
  x,y,i,j,n,m,xMin,distance:integer;
begin
  n:=10;
  m:=10;
  Setlength(arr,n,m);
  For I:=0 to n-1 do
    For J:=0 to m-1 do
      arr[I,J]:=random(200)-101;

  {//если вводить через консоль
    write('Введите n:');
    readln(n);
    write('Введите m:');
    readln(m);
  Setlength(arr,n,m);
  write('Введите массив:');
  For I:=0 to n-1 do
    For J:=0 to m-1 do
        begin
             read(arr[I,J]);
        end;
    writeln;
  }


  writeln('array of array');
  For I:=0 to n-1 do
    begin
         For J:=0 to m-1 do
             write(arr[i,j]:4,' ');
    writeln;
    end;
  writeln;

  xMin:=0;
  for i:=0 to n*m-1 do
      begin
          if arr[i div n,i mod n]<xMin then
             xMin:=arr[i div n,i mod n];
      end;
   for i:=0 to n*m-1 do
      begin
          if (arr[i div n,i mod n]>xMin) and (arr[i div n,i mod n]<0) then
             xMin:=arr[i div n,i mod n];
      end;
   xMin:= Abs(xMin);
   distance:=0;
   writeln(xMin);
   for i:=0 to n*m-1 do
      begin
          if abs((abs(arr[i div n,i mod n])-xMin))>distance then
             begin
                 distance:=abs(arr[i div n,i mod n])-xMin;
                 x:=i;
             end;
      end;
    writeln('position of x: ', x);
    //first half
    j:=0;
    for i:=0 to x do
      begin
           if ((arr[i div n,i mod n]=2) or (arr[i div n,i mod n]=0)) then
              begin
                  arrA[j]:=arr[i div n,i mod n];
                  j:=j+1;
              end;
      end;


    writeln('arrA:');
    for  i:=0 to j-1 do
      begin
           write(arrA[i], ' ');
      end;
      writeln;
    //first half done

     //second half
     distance:=0;//distance is ctd
     For I:=1 to n-1 do
     begin
         For J:=0 to n-i-1 do
             begin
                  arrB[distance]:=arr[i-1,j];
                  distance:=distance+1;
             end;
         writeln;
     end;

     writeln('arrB:');
    for  i:=0 to distance-1 do
      write(arrB[i], ' ');
    writeln;
     //second half done
end.

