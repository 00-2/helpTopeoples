unit un2;
 
{$mode objfpc}{$H+}
 
interface
 
uses
  Classes, SysUtils;
 
type
  Mount=record
    name:string[20];
    height:integer;
  end;
 
arr=array [1..100] of Mount;
tf=file of Mount ;
 
procedure vvod(var f:tf);
procedure vivod(var f:tf);
procedure work(var f:tf);
 
implementation
 
procedure vvod(var f:tf);
var
  i,n:integer;
  a:Mount;
  begin
    repeat
    write('How many mountains : ');
    readln(n);
    until (n>2);
    rewrite(f);
    for i:=1 to n do
    begin
      writeln('Mountain №',i,' : ');
      write('Name : ');
      readln(a.name);
      write('Height : ');
      readln(a.height);
      write(f,a);
    end;
    closefile(f);
  end;
 
procedure vivod(var f:tf);
var
i,n:integer;
a:Mount;
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
    writeln(a.name:20,a.height:10);
  end;
  closefile(f);
  end;
end;

procedure work(var f:tf);
var
i,n,max,maxi,j:integer;
a:Mount;
m:arr;
begin
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
 begin
  writeln('File not found')
 end
  else
  begin
  reset(f);
  n:=0;
  n:=filesize(f);
  for i:=1 to n do
    read(f,m[i]);
  closefile(f);
  max:=m[1].height;
  maxi:=1;
  for i:=2 to n do
  if (m[i].height>max) then
  begin
    max:=m[i].height;
    maxi:=i;
  end;
  writeln('hugest mountain:');
  writeln(m[maxi].name);
 
  for i:=1 to n-1 do
  for j:=1 to n-i do
  if m[j].name>m[j+1].name then
  begin
    a:=m[j];
    m[j]:=m[j+1];
    m[j+1]:=a;
  end;
  rewrite(f);
  for i:=1 to n do
  write(f,m[i]);
  closefile(f);
  end;
end;
end.

