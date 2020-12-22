program pr1;


Uses sysutils;

type
  pharmacy = record
    name: string[8];
    dateOB,dateOD,application: string[6];
  end;
  fileOfPharmacy = file of pharmacy;


procedure input(var A: fileOfPharmacy; var m: byte);
  var
    i: byte;
    c: pharmacy;
    tmp, date,DD,MM,YY:string[6];

  begin
    Assign(A, 'Alpha.dat');
    rewrite(A);
    writeln('Сколько лекарств будет в новом файле?');
    Write('  ');
    readln(m);
    writeln('  введите данные ', m, ' лекарств');
    for i := 1 to m do
    begin
      writeln('Лекарство № ', i);
      Write('Название: ');
      readln(c.name);
      repeat
      //если вводить не числа - будет крашиться
      Write('Дата изготовления - строка чисел (YYMMDD):');
      readln(date);
      YY:=date[1]+date[2];
      MM:=date[3]+date[4];
      DD:=date[5]+date[6];
      writeln('Вы ввели:',YY,MM,DD, ' если введенное вами дата существует, то вы перейдете на следующий этап');
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<13) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOB:=date;

      repeat
      //если вводить не числа - будет крашиться
      Write('Дата изготовления - строка чисел (YYMMDD):');
      readln(date);
      YY:=date[1]+date[2];
      MM:=date[3]+date[4];
      DD:=date[5]+date[6];
      writeln('Вы ввели:',YY,MM,DD, ' если введенное вами дата существует, то вы перейдете на следующий этап');
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<13) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOB:=date;

      repeat
      Write('Способ использования(in/out):');
      readln(tmp);
      writeln('Вы ввели:',tmp, ' если значение соответствует формату ввода,то вы перейдете на следующий этап');
      until((tmp='in') or(tmp='out'));
      c.application:=tmp;

      Write(A, c);
    end;
    Close(A);
    writeln;
  end;

procedure output(var A: fileOfPharmacy);
  var
    c: pharmacy;
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
    writeln('Название':8,' ','Изгот.':6,' ','Годен до':8,' ','Способ использования');
    while not EOF(A) do
    begin
      Read(A, c);
      writeln(c.name: 8,' ',c.dateOB:6,' ',c.dateOD:8,' ', c.application: 3);
    end;
    Close(A);
  end;
end;

procedure add(var A: fileOfPharmacy; var m: byte);
  var
    i: byte;
    c: pharmacy;
    tmp, date,DD,MM,YY:string[6];
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
    writeln('Сколько лекарств добавить?');
    Write('  ');
    readln(m);
    writeln('  введите данные ', m, ' лекарств');
    for i := 1 to m do
    begin
      writeln('Лекарство № ', i);
      Write('Название: ');
      readln(c.name);
      repeat
      //если вводить не числа - будет крашиться
      Write('Дата изготовления - строка чисел (YYMMDD):');
      readln(date);
      YY:=date[1]+date[2];
      MM:=date[3]+date[4];
      DD:=date[5]+date[6];
      writeln('Вы ввели:',YY,MM,DD, ' если введенное вами дата существует, то вы перейдете на следующий этап');
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<13) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOB:=date;

      repeat
      //если вводить не числа - будет крашиться
      Write('Дата изготовления - строка чисел (YYMMDD):');
      readln(date);
      YY:=date[1]+date[2];
      MM:=date[3]+date[4];
      DD:=date[5]+date[6];
      writeln('Вы ввели:',YY,MM,DD, ' если введенное вами дата существует, то вы перейдете на следующий этап');
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<13) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOB:=date;

      repeat
      Write('Способ использования(in/out):');
      readln(tmp);
      writeln('Вы ввели:',tmp, ' если значение соответствует формату ввода,то вы перейдете на следующий этап');
      until((tmp='in') or(tmp='out'));
      c.application:=tmp;
      Write(A, c);
    end;
    Close(A);
    writeln;
  end;
end;

procedure searchMAX(var A: fileOfPharmacy);
  var
    max: string[6];
    c: pharmacy;
  begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    max := '';
    Reset(A);
    writeln('Лекарства, которые испортятся позже всего:');
    writeln('Название':8,' ','Изгот.':6,' ','Годен до':8,' ','Способ использования');
    while not EOF(a) do
    begin
      Read(A, c);
      if c.dateOD > max then
        max := c.dateOD;
    end;
    Reset(A);
    while not EOF(a) do
    begin
      Read(A, c);
      if c.dateOD = max then
        writeln(c.name: 8,' ',c.dateOB:6,' ',c.dateOD:8,' ', c.application: 3);
    end;
    Close(A);
  end;
  end;

procedure searchMIN(var A: fileOfPharmacy);
  var
    min: string[6];
    c: pharmacy;
  begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    min := '999999';
    Reset(A);
    writeln('лекарства, которые испортятся позже всего:');
    writeln('Название':8,' ','Изгот.':6,' ','Годен до':8,' ','Способ использования');
     while not EOF(a) do
    begin
      Read(A, c);
      if c.dateOD < min then
        min := c.dateOD;
    end;
    Reset(A);
    while not EOF(a) do
    begin
      Read(A, c);
      if c.dateOD = min then
        writeln(c.name: 8,' ',c.dateOB:6,' ',c.dateOD:8,' ', c.application: 3);
    end;
    Close(A);
  end;
  end;

procedure delRecordFromEndOfFile(var A: fileOfPharmacy; var m: byte);
    begin
 {$I-} reset(A);  {$I+}
  if IOResult <> 0 then
     begin
          writeln('File not found')
     end
  else
  begin
    writeln('Сколько лекарств вы хотите удалить из конца файла?');
    Write('  ');
    readln(m);
    reset(A);
    seek(A, filesize(A) - m);
    truncate(A);
    writeln(m, ' лекарства удалены');
    Close(A);
  end;
end;

procedure sort(var f: fileOfPharmacy);
  Var
  i,  idmax:integer;
    max,x :pharmacy;
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
      if x.name > max.name then
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

procedure searchByName(var A: fileOfPharmacy; var B:fileOfPharmacy);
  var c:pharmacy;
  begin
  reset(A);
  Assign(B, 'Beta.dat');
  rewrite(B);
    while not eof(A) do begin
      read(A, c);
      if lowercase(c.name[0]) < 'e' then write(B, c);
    end;
    close(B);
    writeln('Лекарства перенаправлены в новый файл');
    writeln('Содержимое:');
    Reset(B);
    writeln('Название':8,' ','Изгот.':6,' ','Годен до':8,' ','Способ использования');
    while not EOF(B) do
    begin
      Read(B, c);
      writeln(c.name: 8,' ',c.dateOB:6,' ',c.dateOD:8,' ', c.application: 3);
    end;
    Close(B);
    Close(A);
  end;


procedure searchByApplication(var A: fileOfPharmacy; var B:fileOfPharmacy);
  var c:pharmacy;
  begin
  reset(A);
  Assign(B, 'Omega.dat');
  rewrite(B);
    while not eof(A) do begin
      read(A, c);
      if c.application='in' then write(B, c);
    end;
    close(B);
    writeln('Лекарства перенаправлены в новый файл');
    writeln('Содержимое:');
    Reset(B);
    writeln('Название':8,' ','Изгот.':6,' ','Годен до':8,' ','Способ использования');
    while not EOF(B) do
    begin
      Read(B, c);
      writeln(c.name: 8,' ',c.dateOB:6,' ',c.dateOD:8,' ', c.application: 3);
    end;
    Close(B);
    Close(A);
  end;

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
