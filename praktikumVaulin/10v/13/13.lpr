program pr13;
type  Student = record
    height,age,index:integer;
    name,surname: string;
  end;

var
  c:Student;
  arrOfMag,arrResult:array of Student;
  m, j, i, average, sum:integer;
begin
     writeln('Сколько студентов будет в массиве?');
     Write('  ');
     readln(m);
     setlength(arrofmag,m);
     writeln('  введите данные ', m, ' студентов');
     for i := 0 to m-1 do
     begin
      writeln('Студент № ', i);
      Write('Индекс группы: ');
      readln(c.index);
      Write('Введите имя: ');
      readln(c.name);
      Write('Введите фамилию: ');
      readln(c.surname);
      Write('Введите возраст: ');
      readln(c.age);
      Write('Введите рост: ');
      readln(c.height);
      arrOfMag[i]:=c;
      end;
  sum:=0;
  for i:=0 to m do
  begin
       sum:=sum+arrOfMag[i].height;
  end;
  average:=sum div m;
  
  j:=0;
  for i:=0 to m-1 do
      if (arrOfMag[i].height>=average) then
            begin
                 j:=j+1;
            end;
  setlength(arrResult, j);
  j:=0;
  for i:=0 to m-1 do
      if (arrOfMag[i].height>=average) then
            begin
                 arrResult[j]:=arrOfMag[i];
                 j:=j+1;
            end;

  writeln('Исходный массив:');
  for i:=0 to length(arrResult)-1 do
      write(arrResult[i].name, ' ');
  writeln;

  for i:=0 to length(arrResult)-1 do
      for j:=0 to length(arrResult)-2 do
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

  writeln('Студент с наибольшим ростом');
  c:=arrResult[0];
  for i:=0 to length(arrResult)-1 do
      if c.height<arrResult[i].height then
            c:=arrResult[i];
  writeln(c.name, ' ' , c.surname, ' ', c.height);


end.

