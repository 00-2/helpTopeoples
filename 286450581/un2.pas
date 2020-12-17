unit un2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  Product=record
    name:string[20];
    country:string[20];
    count:integer;
  end;

arr=array [1..100] of Product;
tf=file of Product ;

procedure vvod(var f:tf);
procedure vivod(var f:tf);
procedure sortFileByCountMin(var f:tf);
procedure showCountries(var f:tf);
procedure sortFileByCountMax(var f:tf);
implementation

procedure vvod(var f:tf);
var
  i,n:integer;
  a:Product;
  begin
    write('How many products : ');
    readln(n);
    rewrite(f);
    for i:=1 to n do
    begin
      writeln('Insert Product');
      write('name : ');
      readln(a.name);
      write('country : ');
      readln(a.country);
      write('count : ');
      readln(a.count);
      write(f,a);
    end;
    closefile(f);
  end;

procedure vivod(var f:tf);
var
i,n:integer;
a:Product;
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
    writeln(a.name:20,a.country:20,a.count:10);
  end;
  closefile(f);
end;
end;

procedure sortFileByCountMin(var f:tf);
var
i,n,j:integer;
a:Product;
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

  for i:=1 to n-1 do
  for j:=1 to n-i do
  if m[j].count<m[j+1].count then
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

procedure showCountries(var f:tf);
var
i,n,j:integer;
a:Product;
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

  for i:=1 to n-1 do
  for j:=1 to n-i do
  if m[j].count<m[j+1].count then
  begin
    a:=m[j];
    m[j]:=m[j+1];
    m[j+1]:=a;
  end;
  writeln('Countries with the top count:(from high)');
  for i:=1 to n do
      writeln(m[i].country);
end;
end;


procedure sortFileByCountMax(var f:tf);
var
i,n,j:integer;
a:Product;
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

  for i:=1 to n-1 do
  for j:=1 to n-i do
  if m[j].count>m[j+1].count then
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
