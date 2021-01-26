program pr15;
{ objfpc}{+}
uses
  Classes, SysUtils;

type
  Mag=record
    name: string[8];
    year,number,periodicity : integer;
  end;

arr=array [1..100] of Mag;
tf=text;

procedure vvod(var f:tf);
var
  i,n:integer;
  a:Mag;
  begin
    write('How many mags : ');
    readln(n);
    rewrite(f);
    for i:=1 to n do
    begin
      writeln('Insert Mag');
      write('Name : ');
      readln(a.name);
      write('Year : ');
      readln(a.year);
      write('Number : ');
      readln(a.number);
      write('Periodicity : ');
      readln(a.periodicity);
      writeln(f,a.name:8,a.year:4,a.number:4,a.periodicity:4);
    end;
    closefile(f);
  end;

procedure vivod(var f:tf);
var
i,n:integer;
a:Mag;
begin
 {-} reset(f);  {+}
  if IOResult <> 0 then
 begin
  writeln('File not found')
 end
  else
begin
  reset(f);
  writeln;
  i:=0;
  while(not eof(f)) do
  begin
    i:=i+1;
    readln(f,a.name,a.year,a.number,a.periodicity);
    writeln;
    writeln(i, ' Mag');
    write('Name : ');
    writeln(a.name);
    write('Year : ');
    writeln(a.year);
    write('Number : ');
    writeln(a.number);
    write('Periodicity : ');
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
 {-} reset(f);  {+}
  if IOResult <> 0 then
 begin
  writeln('File not found')
 end
  else
begin
  n:=0;
  i:=0;
  while(not eof(f)) do
  begin
      i:=i+1;
      readln(f,a.name,a.year,a.number,a.periodicity);
      m[i]:=a;
      writeln;
      writeln(i, ' Mag');
      write('Name : ');
      writeln(a.name);
      write('Year : ');
      writeln(a.year);
      write('Number : ');
      writeln(a.number);
      write('Periodicity : ');
      writeln(a.periodicity);
    end;
    n:=i;


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
    writeln(f,a.name:8,a.year:4,a.number:4,a.periodicity:4);

  for i:=1 to n do
    begin
      a:=m[i];
      writeln;
      writeln(i, ' Mag');
      write('Name : ');
      writeln(a.name);
      write('Year : ');
      writeln(a.year);
      write('Number : ');
      writeln(a.number);
      write('Periodicity : ');
      writeln(a.periodicity);
    end;


   writeln;
   writeln('Mag with lowest periodicity:');
   a:=m[1];
   write('Name : ');
   writeln(a.name);
   write('Year : ');
   writeln(a.year);
   write('Number : ');
   writeln(a.number);
   write('Periodicity : ');
   writeln(a.periodicity);
  closefile(f);
end;
end;

var
f:text;
c:char;
begin
repeat
      assignfile(f,'file.txt');
      writeln('Menu:');
      writeln('1.Input');
      writeln('2.Output');
      writeln('3.Work');
      writeln('4.Exit');
      write('Make your choice:');
      readln(c);
      case c of
      '1':vvod(f);
      '2':vivod(f);
      '3':work(f);
      end;
until c='4';
writeln('Good bye');
end.

end.
