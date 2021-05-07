program pr1;
Const Digits : Array [0..21] Of Char = '0123456789aeiuoyAEIUOY';
var arr:array [0..19] of char;
i,j,ctd,n:integer;
begin
ctd:=0;//счетчик гласных/цифр
n:=19;//20
for i:=0 to n do
read(arr[i]);
for i:=0 to n do
for j:=0 to 21 do
if arr[i]=Digits[j] then
ctd:=ctd+1;
Write(ctd);
end.
