program pr1;


Uses sysutils;

type
  cake = record
    name: string[8];
    calorie,cost: integer;
  end;

arrOfCake = array of cake;

procedure input(var A: arrOfCake;m:integer);
  var
    i: byte;
    c: cake;
  begin
    writeln('Сколько булочек будет в новом массиве?');
    readln(m);
    writeln('введите данные ', m, ' ,булочек');
    SetLength(A,m);
    for i := 1 to m do
    begin
      writeln('булочка № ', i);
      repeat
      	Write('Название: ');
        readln(c.name);
      until (c.name<>'');
      repeat
      Write('Калории:');
        readln(c.calorie);
      until (IntToStr(c.calorie)<>'') and (c.calorie>0);
      repeat
      Write('Стоимость:');
        readln(c.cost);
      until (IntToStr(c.cost)<>'') and (c.cost>0);
      A[i]:=c;
    end;
    writeln;
  end;

procedure sort1(var arr: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if arr[j].name > arr[j+1].name then begin
                tmp := arr[j];
                arr[j] := arr[j+1];
                arr[j+1] := tmp;
            end;
    end;

procedure sort2(var arr: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if arr[j].calorie > arr[j+1].calorie then begin
                tmp := arr[j];
                arr[j] := arr[j+1];
                arr[j+1] := tmp;
            end;
    end;

procedure sort3(var arr: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if arr[j].cost > arr[j+1].cost then begin
                tmp := arr[j];
                arr[j] := arr[j+1];
                arr[j+1] := tmp;
            end;
    end;

procedure sort4(var arr: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if arr[j].name = arr[j+1].name then
                if arr[j].cost > arr[j+1].cost then begin
                    tmp := arr[j];
                    arr[j] := arr[j+1];
                    arr[j+1] := tmp;
            end;
    end;

procedure output(var arr:arrOfCake;m:integer);
    var
        i:integer;
    begin
        writeln('Название':8,' ','Калории.':8,' ','Цена':8);
        for i := 1 to m do
              writeln(arr[i].name: 8,' ',arr[i].calorie:8,' ',arr[i].cost:8);
    end;


var
  m: integer;
  key:string;
  A:arrOfCake;
  i:integer;
  c:cake;
begin
  repeat
  writeln('Что вы хотите сделать?');
  writeln('1 - ввод');
  writeln('2 - сортировка 1');
  writeln('3 - сортировка 2');
  writeln('4 - сортировка 3');
  writeln('5 - сортировка 4');
  writeln('6 - вывод');
  writeln('7 - закончить выполнение программы');
    readln(key);
    m:=length(A);
    case key of
      '1': input(A, m);
      '2': sort1(A,m);
      '3': sort2(A,m);
      '4': sort3(A,m);
      '5': sort4(A,m);
      '6': output(A, m);
     '7': exit;
    end;
    readln;
  until key='7';

end.
