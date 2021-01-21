program pr14;
{$mode objfpc}{$H+}
uses
  Classes, SysUtils;

type
  Mag=record
    name: string[8];
    year,number,periodicity : integer;
  end;

arr=array [1..100] of Mag;
tf=file of Mag ;

procedure vvod(var f:tf);
var
  i,n:integer;
  a:Mag;
  begin
    write('Сколько журналов вы хотите ввести : ');
    readln(n);
    rewrite(f);
    for i:=1 to n do
    begin
      writeln('Введите данные:');
      write('Имя : ');
      readln(a.name);
      write('Год : ');
      readln(a.year);
      write('Номер : ');
      readln(a.number);
      write('Периодичность : ');
      readln(a.periodicity);
      write(f,a);
    end;
    closefile(f);
  end;

procedure vivod(var f:tf);
var
i,n:integer;
a:Mag;
begin
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
 begin
  writeln('Файл не найден')
 end
  else
begin
  reset(f);
  n:=filesize(f);
  writeln;
  for i:=1 to n do
  begin
    read(f,a);
    writeln;
    writeln(i, ' журнал');
    write('Имя : ');
    writeln(a.name);
    write('Год : ');
    writeln(a.year);
    write('Номер : ');
    writeln(a.number);
    write('Периодичность : ');
    writeln(a.periodicity);
  end;
  closefile(f);
end;
end;

procedure work(var f:tf);
var
i,n,max,maxi,j:integer;
a:Mag;
m:arr;
begin
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
 begin
  writeln('Файл не найден');
 end
  else
begin
  n:=0;
  n:=filesize(f);
  for i:=1 to n do
    read(f,m[i]);
  closefile(f);

    for i:=1 to n do
    begin
      a:=m[i];
      writeln;
    writeln(i, ' журнал');
    write('Имя : ');
    writeln(a.name);
    write('Год : ');
    writeln(a.year);
    write('Номер : ');
    writeln(a.number);
    write('Периодичность : ');
    writeln(a.periodicity);
    end;



  for i:=1 to n-1 do
  for j:=1 to n-i do
  if m[j].periodicity>m[j+1].periodicity then
  begin
    a:=m[j];
    m[j]:=m[j+1];
    m[j+1]:=a;
  end;


  rewrite(f);
  for i:=1 to n do
  write(f,m[i]);

  for i:=1 to n do
    begin
      a:=m[i];
      writeln;
    writeln(i, ' журнал');
    write('Имя : ');
    writeln(a.name);
    write('Год : ');
    writeln(a.year);
    write('Номер : ');
    writeln(a.number);
    write('Периодичность : ');
    writeln(a.periodicity);
    end;


   writeln;
   writeln('Магазин с наименьшей периодичностью:');
   a:=m[1];
   writeln;
    writeln(i, ' журнал');
    write('Имя : ');
    writeln(a.name);
    write('Год : ');
    writeln(a.year);
    write('Номер : ');
    writeln(a.number);
    write('Периодичность : ');
    writeln(a.periodicity);
  closefile(f);
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
writeln('Zaschita'te pozaluista ^_^');
end.
