program pr2;
{$mode objfpc}{$H+}
uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
Classes, un2
{ you can add units after this };

var
  A, B: fileOfBook;
  F:TextFile;
  m: byte;
  key:string;

begin
  Assign(A, 'Alpha.dat');
  Assign(B, 'Beta.dat');
  Assign(F, 'Omega.txt');
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
