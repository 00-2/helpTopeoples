unit un2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;


type
  pharmacy = record
    name: string[8];
    dateOB,dateOD,application: string[6];
  end;
  fileOfPharmacy = file of pharmacy;



procedure input(var A: fileOfPharmacy; var m: byte);
procedure output(var A: fileOfPharmacy);
procedure add(var A: fileOfPharmacy; var m: byte);
procedure searchMAX(var A: fileOfPharmacy);
procedure searchMIN(var A: fileOfPharmacy);
procedure delRecordFromEndOfFile(var A: fileOfPharmacy; var m: byte);
procedure sort(var f: fileOfPharmacy);
procedure searchByName(var A: fileOfPharmacy; var B:fileOfPharmacy);
procedure searchByApplication(var A: fileOfPharmacy; var B:fileOfPharmacy);
implementation


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
      writeln(DD, MM,YY);
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<12) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOB:=date;

      repeat
      Write('Дата окончания срока годности - строка чисел (YYMMDD):');
      readln(date);
      YY:=date[1]+date[2];
      MM:=date[3]+date[4];
      DD:=date[5]+date[6];
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<12) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOD:=date;

      repeat
      Write('Способ использования(in/out):');
      readln(tmp);
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
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<12) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOB:=date;

      repeat
      Write('Дата окончания срока годности - строка чисел (YYMMDD):');
      readln(date);
      YY:=date[1]+date[2];
      MM:=date[3]+date[4];
      DD:=date[5]+date[6];
      until (StrToInt(DD)<32) and (StrToInt(DD)>0) and (StrToInt(MM)<12) and  (StrToInt(MM)>0) and  (StrToInt(YY)>-1);
      c.dateOD:=date;

      repeat
      Write('Способ использования(in/out):');
      readln(tmp);
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


end.

