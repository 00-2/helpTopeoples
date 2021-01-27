program pr12;

function reverse(const str: string): string;
var
  i, j: Integer;
begin
  j := length(str);
  setlength(reverse, j);
  for i := 1 to j do
    reverse[i] := str[j - i + 1];
end;


var
  arrS: array of string;
  reverseString: string;
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
writeln('Исходный массив');
for i:=0 to n-1 do
    write(arrS[i], ' ');
writeln;

writeln('Измененный массив');
for i:=0 to n-1 do
    begin
        reverseString:=reverse(arrS[i]);
        arrS[i]:=arrS[i]+reverseString;
        write(arrS[i], ' ');
    end;
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

