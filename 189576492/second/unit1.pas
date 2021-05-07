unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;


type
  book = record
    name: string[8];
    author: string[8];
    year: integer
  end;
  fileOfBook = file of book;

procedure input(var A: fileOfBook; var m: byte);
procedure output(var A: fileOfBook);
procedure add(var A: fileOfBook; var m: byte);
procedure searchMAX(var A: fileOfBook);
procedure sort(var f: fileOfBook);
procedure searchByName(var A: fileOfBook; var F:fileOfBook);
procedure searchByYear(var A: fileOfBook; var F:fileOfBook);
implementation
 procedure input(var A: fileOfBook; var m: byte);
  var
    i: byte;
    c: book;

  begin
    Assign(A, 'Alpha.dat');
    rewrite(A);
    writeln('Сколько книг будет в новом файле?');
    Write('  ');
    readln(m);
    writeln('  введите данные ', m, ' книг');
    for i := 1 to m do
    begin
      writeln('книга № ', i);
      Write('Название: ');
      readln(c.name);

      Write('Автор:');
      readln(c.author);

      Write('Год выпуска:');
      readln(c.year);

      Write(A, c);
    end;
    Close(A);
    writeln;
  end;

procedure output(var A: fileOfBook);
  var
    c: book;
begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    Reset(A);
    writeln('Содержимое файла записей:');
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8);
    while not EOF(A) do
    begin
      Read(A, c);
      writeln(c.name: 8,' ',c.author:8,' ',c.year:8);
    end;
    Close(A);
  end;
end;

procedure add(var A: fileOfBook; var m: byte);
  var
    i: byte;
    c: book;
begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    reset(A);
    seek(A, filesize(A));
    writeln('Сколько книг вы хотите добавить?');
    readln(m);
    writeln('  введите данные ', m, ' книг');
    for i := 1 to m do
    begin
      writeln('книга № ', i);
      Write('Название: ');
      readln(c.name);

      Write('Автор:');
      readln(c.author);

      Write('Год выпуска:');
      readln(c.year);

      Write(A, c);
    end;
    Close(A);
    writeln;
  end;
end;

procedure searchMAX(var A: fileOfBook);
  var
    max: string;
    c: book;
    arr1:array[1..20] of integer;
    arr2:array[1..20] of string;
    i,j,size:integer;
  begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    Reset(A);
    for i:=1 to 20 do
    begin
         arr1[i]:=0;
         arr2[i]:='';
    end;
    size:=0;
    writeln('Авторы, выпустившие больше 1 книги с 2019:');
    writeln('Автор.':8);
    while not EOF(a) do
    begin
    Read(A, c);
    i:=1;
    while ((arr2[i]<>'') and (arr2[i]<>c.author)) and (c.year>2018) do
          begin
               i:=i+1;
          end;
    arr2[i]:=c.author;
    arr1[i]:=arr1[i]+1;
    if i>size then size:=i;
    end;
    for j:=1 to size do
        writeln(arr2[j]:8);
    end;
    end;


procedure sort(var f: fileOfBook); //по алфавиту
  Var
  i,  idmax:integer;
    max,x :book;
    begin
 {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin

  Reset(f);
  i := -1;

  repeat
    i:=i+1;
    idmax := i;
    seek(f, i);
    read(f, max);
    while not eof(f) do
    begin
      read(f, x);
      if lowercase(x.author) < lowercase(max.author) then
      begin
        idmax := filepos(f)-1;
        max := x;
      end;
    end;
    if i <> idmax then
    begin
      seek(f, i); read(f, x);
      seek(f, i); write(f, max);
      seek(f, idmax); write(f, x);

    end;
  until i = FileSize(f) - 1;
  Close(f);
  writeln('Массив отсортирован');
 end;
end;

procedure searchByName(var A: fileOfBook; var F:fileOfBook);
  var c:book;
      tmp:char;
  begin
  reset(A);
  rewrite(F);
  writeln('Поиск по автору, введите первую букву, чтобы увидеть все совпадения');
  readln(tmp);
  while not eof(A) do begin
      read(A, c);
      if lowercase(Trim(c.name)[1]) = tmp then write(F, c);
    end;
    writeln('Книги перенаправлены в новый файл');
    writeln('Содержимое:');
    Reset(F);
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8);
    while not EOF(F) do
    begin
      Read(F, c);
      writeln(c.name: 8,' ',c.author:8,' ',c.year:8);
    end;
    Close(F);
    Close(A);
  end;

procedure searchByYear(var A: fileOfBook; var F:fileOfBook);
  var c:book;
      tmp:integer;
  begin
  reset(A);
  rewrite(F);
  writeln('Поиск по году, введите, чтобы увидеть все совпадения');
  readln(tmp);
  while not eof(A) do begin
      read(A, c);
      if c.year = tmp then write(F, c);
    end;
    writeln('Книги перенаправлены в новый файл');
    writeln('Содержимое:');
    Reset(F);
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8);
    while not EOF(F) do
    begin
      Read(F, c);
      writeln(c.name: 8,' ',c.author:8,' ',c.year:8);
    end;
    Close(F);
    Close(A);
  end;
end.


