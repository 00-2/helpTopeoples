program pr1;


Uses sysutils;

type
  book = record
    name: string[8];
    author: string[8];
    year,edition: integer
  end;
  fileOfBook = file of book;


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

var
  A, B, F: fileOfBook;
  m: byte;
  key:string;

begin
  Assign(A, 'Alpha.dat');
  Assign(B, 'Beta.dat');
  Assign(F, 'Omega.dat');
  repeat
  writeln('Что вы хотите сделать?');
  writeln('1 - создать файл записей с данными о книгах');
  writeln('2 - вывести содержимое файла');
  writeln('3 - добавить книгу в файл');
  writeln('4 - найти самую тиражируемую книгу');
  writeln('5 - найти самые самую старую книгу');
  writeln('6 - удалить книгу из файла с конца');
  writeln('7 - отсортировать книги по алфавиту');
  writeln('8 - скопировать в др. файл книги, первая буква кот. < f');
  writeln('9 - скопировать в др. файл книги старше 1900');
  writeln('10 - закончить выполнение программы');
    readln(key);
    case key of
      '1': input(A, m);
      '2': output(A);
      '3': add(A, m);
      '4': searchMAX(A);
      '5': searchMIN(A);
      '6': delRecordFromEndOfFile(A, m);
      '7': sort(A);
      '8': searchByName(A,B);
      '9': searchByYear(A,F);
     '10': exit;
    end;
    readln;
  until key='10';
end.
