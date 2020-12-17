unit un2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  Guy=record
    surname:string[20];
    mark:integer;
  end;

arr=array [1..100] of Guy;
tf=file of Guy ;

procedure vvod(var f:tf);
procedure vivod(var f:tf);
procedure work(var f:tf);

implementation

procedure vvod(var f:tf);
var
  i,n:integer;
  a:Guy;
  begin
    repeat
    write('How many guys : ');
    readln(n);
    until (n>2);
    rewrite(f);
    for i:=1 to n do
    begin
      writeln('Insert Guy');
      write('Surname : ');
      readln(a.surname);
      write('Mark : ');
      readln(a.mark);
      write(f,a);
    end;
    closefile(f);
  end;

procedure vivod(var f:tf);
var
i,n:integer;
a:Guy;
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
    writeln(a.surname:20,a.mark:10);
  end;
  closefile(f);
end;
end;

procedure work(var f:tf);
var
i,n,max,maxi,j:integer;
a:Guy;
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

  writeln('Insert Guy');
  write('Surname : ');
  readln(a.surname);
  write('Mark : ');
  readln(a.mark);
  m[n+1]:=a;
  reset(f);

  for i:=1 to n do
  for j:=1 to n-i+1 do
  if m[j].surname>m[j+1].surname then
  begin
    a:=m[j];
    m[j]:=m[j+1];
    m[j+1]:=a;
  end;
  rewrite(f);
  for i:=1 to n+1 do
  write(f,m[i]);
  closefile(f);
end;
end;

end.
