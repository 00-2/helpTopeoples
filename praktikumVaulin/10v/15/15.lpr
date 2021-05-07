program pr14;
{$mode objfpc}{$H+}
uses
  Classes, SysUtils;

type  Student = record
    height,age,index:integer;
    name,surname: string[8];
  end;

arr=array [0..100] of Student;
tf=text;

procedure vvod(var f:tf);
var
  c:Student;
  m, i:integer;
begin
     rewrite(f);
     writeln('Сколько студентов будет в массиве?');
     Write('  ');
     readln(m);
     writeln('  введите данные ', m, ' студентов');
     for i := 0 to m-1 do
     begin
      writeln('Студент № ', i);
      Write('Индекс группы: ');
      readln(c.index);
      Write('Введите имя: ');
      readln(c.name);
      Write('Введите фамилию: ');
      readln(c.surname);
      Write('Введите возраст: ');
      readln(c.age);
      Write('Введите рост: ');
      readln(c.height);
      writeln(f, c.index, ' ', c.name:7, ' ' , c.surname:7, ' ' , c.age, ' ', c.height);
      end;
    closefile(f);
  end;

procedure vivod(var f:tf);
var
c:Student;
n, i:integer;
begin
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
 begin
  writeln('Файл не найден')
 end
  else
begin
  reset(f);
  writeln;
  i:=0;
  while not EOF(f) do
     begin
      readln(f,c.index,c.name,c.surname,c.age,c.height);
      writeln('Студент № ', i);
      Write('Индекс группы: ');
      writeln(c.index);
      Write('Введите имя: ');
      writeln(c.name);
      Write('Введите фамилию: ');
      writeln(c.surname);
      Write('Введите возраст: ');
      writeln(c.age);
      Write('Введите рост: ');
      writeln(c.height);
      i:=i+1;
     end;
    closefile(f);
end;
end;

procedure work(var f:tf);
var
 c:Student;
  arrOfMag,arrResult:array[0..200] of Student;
  m, j, i, average, sum,sizeOfArrayRes:integer;
begin
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
 begin
  writeln('Файл не найден');
 end
  else
begin
  i:=0;
  while not EOF(f) do
     begin
      readln(f,c.index,c.name,c.surname,c.age,c.height);
      arrOfMag[i]:=c;
      i:=i+1;
     end;
  m:=i;  
  closefile(f);
      for i := 0 to m-1 do
     begin
      c:=arrOfMag[i];
      writeln('Студент № ', i);
      Write('Индекс группы: ');
      Writeln(c.index);
      Write('Введите имя: ');
      Writeln(c.name);
      Write('Введите фамилию: ');
      Writeln(c.surname);
      Write('Введите возраст: ');
      Writeln(c.age);
      Write('Введите рост: ');
      Writeln(c.height);
      end;


   sum:=0;
  for i:=0 to m-1 do
  begin
       sum:=sum+arrOfMag[i].height;
  end;
  average:=sum div m;
  
  j:=0;
  for i:=0 to m-1 do
      if (arrOfMag[i].height>=average) then
            begin
                 arrResult[j]:=arrOfMag[i];
                 j:=j+1;
            end;
  sizeOfArrayRes:=j;
  writeln('Исходный массив:');
  for i:=0 to sizeOfArrayRes-1 do
      write(arrResult[i].name, ' ');
  writeln;

  for i:=0 to sizeOfArrayRes-1 do
      for j:=0 to sizeOfArrayRes-2 do
          if arrResult[j].name>arrResult[j+1].name then
                begin
                     c:=arrResult[j];
                     arrResult[j]:=arrResult[j+1];
                     arrResult[j+1]:=c;
                end;


  writeln('Отсортированный массив:');
  for i:=0 to sizeOfArrayRes-1 do
      write(arrResult[i].name, ' ');
  writeln;

  writeln('Студент с наибольшим ростом');
  c:=arrResult[0];
  for i:=0 to sizeOfArrayRes-1 do
      if c.height<arrResult[i].height then
            c:=arrResult[i];
  writeln(c.name, ' ' , c.surname, ' ', c.height);

end;
end;

var
f:tf;
c:char;
begin
repeat
      assignfile(f,'file.txt');
      writeln('Menu:');
      writeln('1.VVOD');
      writeln('2.VIVOD');
      writeln('3.RABOTA');
      writeln('4.VIHOD');
      write('Make your choice:');
      readln(c);
      case c of
      '1':vvod(f);
      '2':vivod(f);
      '3':work(f);
      end;
until c='4';
writeln('До свидания!');
end.
