program Pr9;

const
  n = 10;

  type
    Tmas = array [1..n] of integer;

procedure inPut(var a:tmas);
var  i:integer;
   begin
   for i:=1 to n do
    readln(a[i]);
   end;

procedure createMas(var a, aSort:tmas);
var  i:integer;
   begin
     for i:=1 to n do
      aSort[i]:=a[i];
   end;

procedure outP(a:tmas);
var  i:integer;
   begin
     for i:=1 to n do
      write(a[i], ' ');
   writeln;
   end;

procedure puzyrekMaxMin(a:tmas);
var   aSort:Tmas;
   k, i, c, p:integer;
   begin
   createMas(a, aSort);
   p:=0;
   repeat
     k:=0;
     for i:=1 to n-1 do
      if aSort[i]<aSort[i+1] then
       begin
         c:=aSort[i];
         aSort[i]:=aSort[i+1];
         aSort[i+1]:=c;
         k:=k+1;
         p:=p+1;
       end;
   until k=0 ;
   writeln('метод "пузырька" по убыванию');
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

procedure puzyrekMinMax(a:tmas);
var  aSort:Tmas;
   k, i, c, p:integer;
   begin
   createMas(a, aSort);
   p:=0;
   repeat
     k:=0;
     for i:=1 to n-1 do
      if aSort[i]>aSort[i+1] then
       begin
         c:=aSort[i];
         aSort[i]:=aSort[i+1];
         aSort[i+1]:=c;
         k:=k+1;
         p:=p+1;
       end;
   until k=0 ;
   writeln('метод "пузырька" по возрастанию');
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

procedure poiskMax(a:tmas);
var i, max, maxInd, j, c, p:integer;
   aSort:tmas;
   begin
   P:=0;
   createMas(a, aSort);
   for i:=1 to n do
    begin
      max:=aSort[i];
      maxInd:=i;
      for j:=i to n do
       if aSort[j]>max then
        begin
          max:=aSort[j];
          maxInd:=j;
        end;
      if maxind>i then
       begin
         c:=aSort[i];
         aSort[i]:=aSort[maxInd];
         aSort[maxInd]:=c;
         p:=p+1;
       end;
    end;
   writeln('метод поиск максимума');
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

procedure poiskMin(a:tmas);
var  i, min, minInd, j, c, p:integer;
   aSort:tmas;
   begin
   p:=0;
   createMas(a, aSort);
   for i:=1 to n do
    begin
      min:=aSort[i];
      minInd:=i;
      for j:=i to n do
       if aSort[j]<min then
        begin
          min:=aSort[j];
          minInd:=j;
        end;
      if minInd>i then
       begin
         c:=aSort[i];
         aSort[i]:=aSort[minInd];
         aSort[minInd]:=c;
         p:=p+1;
       end;
    end;
   writeln('метод поиск минимума');
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

var
   i:integer;
   a:tmas;
begin
 inPut(a);
 outP(a);
 puzyrekMaxMin(a);
 puzyrekMinMax(a);
 poiskMax(a);
 poiskMin(a);
 readln;
end.

