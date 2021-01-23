program pr11;
var
  arrS: array of string;
  j, i, n:integer;
  tmp,s:string;
begin
write('Сколько будет слов в массиве?');
readln(n);
setlength(arrS, n);
writeln('Вводите слова');
for i:=0 to n-1 do
    begin
         write('слово ', i,':');
         readln(arrS[i]);
    end;
{n:=5;
Setlength(arrS,5);
arrS:=['low','bigger','FASTER','Real','ksenia'];
}
writeln('Исходный массив');
for i:=0 to n-1 do
    write(arrS[i], ' ');
writeln;
for i:=0 to n-1 do
    for j:=0 to n-i-2 do
        if length(arrS[j])>length(arrS[j+1]) then
           begin
             tmp:=arrs[j];
             arrS[j]:=arrs[j+1];
             arrS[j+1]:=tmp;
           end;

writeln('Самое короткое слово:', arrS[0]);

writeln('Отсортированный массив');
for i:=0 to n-1 do
    write(arrS[i], ' ');

end.

Program pr9;                         { Сортировки выбором }
  var a,aTmp : array [1 .. 100] of integer;    
        tmp,n,i,j, nmax,nmin, buf : integer;
begin
  write('n:');readln(n);

  writeln('Введите ', n, ' элементов массива');    
  for i := 1 to n do read(a[i]);
  
  for i:=1 to n do aTmp[i]:=a[i];
  
  writeln('Сортировка пузырьком по возрастанию');    
  for i := 1 to n-1 do
    for j := 1 to n-i do
      if aTmp[j] > aTmp[j+1] then
        begin
          {обмен элементов}
          tmp := aTmp[j];
          aTmp[j] := aTmp[j+1];
          aTmp[j+1] := tmp;
        end;
  for i := 1 to n do write(aTmp[i]:5);
  writeln;
  writeln('Сортировка пузырьком по убыванию');    
  for i := 1 to n-1 do
    for j := 1 to n-i do
      if aTmp[j] < aTmp[j+1] then
        begin
          {обмен элементов}
          tmp := aTmp[j];
          aTmp[j] := aTmp[j+1];
          aTmp[j+1] := tmp;
        end;
  for i := 1 to n do write(aTmp[i]:5);
  writeln;
  writeln('Сортировка методом наибольшего(по убыванию)');
  for i := 1 to n - 1 do begin      { просмотр массива n-1 раз }        
      nmax := i;        
      for j := i + 1 to n do            { поиск максимума }            
         if aTmp[j] > aTmp[nmax] then nmax := j;            
      buf := aTmp[i];                  { перестановка }            
      aTmp[i]:= aTmp[nmax];             { двух }            
      aTmp[nmax]:= buf;            { элементов массива }        
  end;        
  for i := 1 to n do write(aTmp[i]:5);
  writeln('Наибольшее ',aTmp[1]);
  
  writeln('Сортировка методом наименьшего(по возрастанию)');
  for i := 1 to n - 1 do begin      { просмотр массива n-1 раз }        
      nmin := i;        
      for j := i + 1 to n do            { поиск минимума }            
         if aTmp[j] < aTmp[nmin] then nmin := j;            
      buf := aTmp[i];                  { перестановка }            
      aTmp[i]:= aTmp[nmin];             { двух }            
      aTmp[nmin]:= buf;            { элементов массива }        
  end;        
  for i := 1 to n do write(aTmp[i]:5);
  writeln('Наименьшее ',aTmp[1]);
  
  readln;
end.
