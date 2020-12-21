program pr2;
{$mode objfpc}{$H+}
uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
Classes, un2
{ you can add units after this };

var
  A, B, C: fileOfPharmacy;
  m: byte;
  key:string;

begin
  repeat
  writeln('Что вы хотите сделать?');
  writeln('1 - создать файл записей с данными об лекарстве');
  writeln('2 - вывести содержимое файла');
  writeln('3 - добавить лекарство в файл');
  writeln('4 - найти самые старые лекарства');
  writeln('5 - найти самые новые лекарства');
  writeln('6 - удалить лекарства из файла с конца');
  writeln('7 - отсортировать лекарства по алфавиту');
  writeln('8 - скопировать в др. файл лекарства, которые начинаются с "e"');
  writeln('9 - скопировать в др. файл лекарства,которые применяют внутривенно');
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
      '9': searchByApplication(A,C);
     '10': exit;
    end;
    readln;
  until key='10';
end.
