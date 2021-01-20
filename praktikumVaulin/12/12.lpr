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

