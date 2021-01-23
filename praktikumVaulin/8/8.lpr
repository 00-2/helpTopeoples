program pr7;
uses
    math;
Const
    nMax=12; mMax=15;
Var
    Schet:array[1..mMax] of real;
    Snechet:array[1..mMax] of real;
    matr:array[1..nMax, 1..mMax] of real;
    i, j, n, m,imax,imin : integer;


begin
    Writeln;
    Write('n:');Readln(n);
    Write('m:');Readln(m);
    Writeln('Введите матрицу');
    for i:=1 to n do
        begin
            for j:=1 to m do
                read(matr[i,j]);
            readln;
        end;

    for i:=1 to n do
    begin
        for j:=1 to m do 
            write(matr[i,j]:8:2);
        writeln;
    end;
        
        
        Writeln;
        Writeln('Сумма нечетных ':(9*(m+1)+23),' ':4,'Сумма четных':8,' ');
        for i:=1 to n do
        begin
            for j:=1 to m do
            begin
               write(matr[i,j]:8:2,' ':2);
               if j mod 2=0 then
                                 begin
                                   Schet[i]:=Schet[i]+matr[i,j];
                                 end
               else
                                 begin
                                   Snechet[i]:=Snechet[i]+matr[i,j];
                                 end;
            end;
            write(Snechet[i]:10:2,' ':5);
            write(Schet[i]:10:2);
            writeln;
        end;
          imax:=i;
          imin:=i;
         for i:=1 to m do
        begin
          if Snechet[i]>Snechet[imax] then imax:=i;
          if Schet[i]<Schet[imin] then imin:=i;
        end;
        
        
writeln;
writeln('Максимальная сумма нечетных =',Snechet[imax]:6:2);
writeln;
writeln('Минимальная сумма четных =',Schet[imin]:6:2);
readln;
end.
