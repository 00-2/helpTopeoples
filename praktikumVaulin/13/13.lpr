program pr12;
type  mag = record
    name: string[8];
    year,number,periodicity : integer;
  end;

var
  c:mag;
  arrOfMag,arrResult:array of Mag;
  arrResultB:array of Boolean;
  m, j, i,ctd,l,r:integer;
begin
     writeln('Сколько журналов будет в массиве?');
     Write('  ');
     readln(m);
     setlength(arrofmag,m);
     setlength(arrResultB,m);
     writeln('  введите данные ', m, ' журналов');
     for i := 0 to m-1 do
     begin
      writeln('Журнал № ', i);
      Write('Название: ');
      readln(c.name);
      Write('Год выпуска: ');
      readln(c.year);
      Write('Номер журнала: ');
      readln(c.number);
      Write('Периодичность(целое число лет): ');
      readln(c.periodicity);
      arrOfMag[i]:=c;
      end;
     writeln('Введите левую границу интервала и правую границу интервала:');
     write('От ');
     read(l);
     write(' До ');
     readln(r);
  {m:=4;
  setlength(arrofmag,m);
  setlength(arrResultB,m);
  l:=10;r:=20;
  i:=0;
  arrOfMag[i].name:='a1';
  arrOfMag[i].year:=5;
  arrOfMag[i].periodicity:=2;
  i:=i+1;
  arrOfMag[i].name:='d1';
  arrOfMag[i].year:=7;
  arrOfMag[i].periodicity:=3;
  i:=i+1;
  arrOfMag[i].name:='b2';
  arrOfMag[i].year:=3;
  arrOfMag[i].periodicity:=5;
  i:=i+1;
  arrOfMag[i].name:='a2';
  arrOfMag[i].year:=21;
  arrOfMag[i].periodicity:=5;}
   //1 2 3 4
   //x o o o
  for i:=l to r do
      for j:=0 to length(arrOfMag)-1 do
          //10-7 = 6
          if ((i-arrOfMag[j].year)>0) and ((i-arrOfMag[j].year) mod arrOfMag[j].periodicity = 0) then
                arrResultB[j]:=True;
  ctd:=0;
  for i:=0 to length(arrResultB)-1 do
      if arrResultB[i] then ctd:=ctd+1;

  setLength(arrResult,ctd);
  j:=0;
  for i:=0 to length(arrResultB)-1 do
      if arrResultB[i] then
            begin
              arrResult[j]:=arrOfMag[i];
              j:=j+1;
            end;

  writeln('Исходный массив');
  for i:=0 to length(arrResult)-1 do
      write(arrResult[i].name, ' ');
  writeln;


  for i:=0 to length(arrResult)-2 do
      for j:=0 to length(arrResult)-i-2 do
          if arrResult[j].name>arrResult[j+1].name then
                begin
                     c:=arrResult[j];
                     arrResult[j]:=arrResult[j+1];
                     arrResult[j+1]:=c;
                end;


  writeln('Отсортированный массив:');
  for i:=0 to length(arrResult)-1 do
      write(arrResult[i].name, ' ');
  writeln;

  writeln('журнал с наименьшей периодичностью');
  for i:=0 to length(arrResult)-1 do
      if c.periodicity>arrResult[i].periodicity then
            c:=arrResult[i];
  writeln(c.name, ' ' , c.year, ' ', c.periodicity);


end.

