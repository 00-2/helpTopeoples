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
  writeln('File not found')
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
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
 begin
  writeln('File not found')
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
f:tf;
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
