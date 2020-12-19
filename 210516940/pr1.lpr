program pr1;
var
  arrA: array of integer;
  arrB: array[1..100] of integer;
  ctd,x,y,xMin,distance,j,i,n,m:integer;

begin
  {ввод данных
  write('Size:');
  readln(n);
  for i:= 1 to n do
      begin
        write('arr',i,':');
        readln(arrA[i]);
      end;}
  ctd:=0;
  n:=16;
  arrA:=[105,-3,3,-5,-6,0,165,2,-4,5,6,2,2,3,0,3];
  {1. перенести в arrB левее x, которое подходят под z }
  writeln('arrA:');
  for i:=0 to n do
      write(arrA[i], ' ');
  writeln;


  xMin:=0;
  for i:=0 to n-1 do
      begin
          if arrA[i]<xMin then
             xMin:=arrA[i];
      end;
   for i:=0 to n-1 do
      begin
          if (arrA[i]>xMin) and (arrA[i]<0) then
             xMin:=arrA[i];
      end;
   xMin:= Abs(xMin);
   distance:=0;


   for i:=0 to n-1 do
      begin
          if abs((abs(arrA[i])-xMin))>distance then
             begin
                 distance:=abs(arrA[i])-xMin;
                 x:=i;
             end;
      end;


   j:=0;
   for i:=0 to x do
       begin
           if (arrA[i] = 0) or (arrA[i]=2) then
              begin
              arrB[j]:=arrA[i];
              j:=j+1;
              end;
       end;
   writeln('arrB:');
   for i:=0 to j-1 do
       write(arrB[i], ' ');
   writeln;
      {2. удалить из arrA левее x, которое подходят под y и правее, кот под z }

      ctd:=0;
      i:=0;
      m:=x;
      while i < m do
        if arrA[i] >= 0 then begin
            for j := i to n do
                arrA[j] := arrA[j+1];
            ctd:=ctd+1;
            m := m - 1;
        end
        else
            i := i + 1;

      i:=x-ctd;//так как несколько элементов ушло
      m:=n-ctd;
      while i < m do
        if (arrA[i]=0) or (arrA[i]=2) then begin
            for j := i to n do
                arrA[j] := arrA[j+1];
            m := m - 1;
            ctd:=ctd+1;
        end
        else
            i := i + 1;
        writeln('arrA:');
        for i:= 0 to n-ctd-1 do
            write(arrA[i]:4);
        writeln;

end.

