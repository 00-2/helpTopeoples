unit un2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;


type
  book = record
    name: string[8];
    author: string[8];
    year,edition: integer
  end;
  fileOfBook = file of book;

procedure input(var A: fileOfBook; var m: byte);
procedure output(var A: fileOfBook);
procedure add(var A: fileOfBook; var m: byte);
procedure searchMAX(var A: fileOfBook);
procedure searchMIN(var A: fileOfBook);
procedure delRecordFromEndOfFile(var A: fileOfBook; var m: byte);
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

      Write('Тираж:');
      readln(c.edition);

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
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8,' ','Тираж':8);
    while not EOF(A) do
    begin
      Read(A, c);
      writeln(c.name: 8,' ',c.author:8,' ',c.year:8,' ', c.edition: 8);
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

      Write('Тираж:');
      readln(c.edition);

      Write(A, c);
    end;
    Close(A);
    writeln;
  end;
end;

procedure searchMAX(var A: fileOfBook);   //находит самую тиражируемую
  var
    max: integer;
    c: book;
  begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    max := 0;
    Reset(A);
    writeln('Самая тиражируемая книга:');
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8,' ','Тираж':8);
    while not EOF(a) do
    begin
      Read(A, c);
      if c.edition > max then
        max := c.edition;
    end;
    Reset(A);
    while not EOF(a) do
    begin
      Read(A, c);
      if c.edition = max then
        writeln(c.name: 8,' ',c.author:8,' ',c.year:8,' ', c.edition: 8);
    end;
    Close(A);
  end;
  end;

procedure searchMIN(var A: fileOfBook);       //самую старую
  var
    min: integer;
    c: book;
  begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    min := 9999;
    Reset(A);
    writeln('Самая старая книга:');
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8,' ','Тираж':8);
    while not EOF(a) do
    begin
      Read(A, c);
      if c.year < min then
        min := c.year;
    end;
    Reset(A);
    while not EOF(a) do
    begin
      Read(A, c);
      if c.year = min then
        writeln(c.name: 8,' ',c.author:8,' ',c.year:8,' ', c.edition: 8);
    end;
    Close(A);
  end;
  end;

procedure delRecordFromEndOfFile(var A: fileOfBook; var m: byte);
    begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('Файл не найден. Введите 1')
     end
  else
  begin
    writeln('Сколько книг вы хотите удалить из конца файла?');
    Write('  ');
    readln(m);
    reset(A);
    seek(A, filesize(A) - m);
    truncate(A);
    writeln(m, 'Книги удалены');
    Close(A);
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
      if lowercase(x.name) < lowercase(max.name) then
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
  begin
  reset(A);
  rewrite(F);
    while not eof(A) do begin
      read(A, c);
      if lowercase(c.name[1]) < 'f' then write(F, c);
    end;
    writeln('Книги перенаправлены в новый файл');
    writeln('Содержимое:');
    Reset(F);
    writeln('Название':8,' ','Автор.':8,' ','Год выпуска':8,' ','Тираж':8);
    while not EOF(F) do
    begin
      Read(F, c);
      writeln(c.name: 8,' ',c.author:8,' ',c.year:8,' ', c.edition: 8);
    end;
    Close(F);
    Close(A);
  end;

procedure searchByYear(var A: fileOfBook; var F:TextFile);  //старше 1900
  var c:book;
  begin
  reset(A);
  rewrite(F);
    while not eof(A) do begin
      read(A, c);
      if c.year > 1900 then writeln(F,c.name: 8,' ',c.author:8,' ',c.year:8,' ', c.edition: 8);
    end;
    writeln('Книги перенаправлены в новый файл');
    Close(F);
    Close(A);
  end;
end.

