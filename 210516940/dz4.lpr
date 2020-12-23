program dz4;


Uses sysutils,math;

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

function isCorrect(var c:cake):boolean;
//т.к. ввод у нас типизированный, то все записи корректны
    begin
    isCorrect:=True;
    end;

procedure testing(var arr:arrOfCake;m:integer);
    var
        i:integer;
    begin
        writeln('Название':8,' ','Результат проверки');
        for i := 1 to m do
             writeln(arr[i].name:8, ' ' , isCorrect(arr[i]));
    end;

function find(var arr:arrOfCake;m:integer):integer;
    var
        maxi, i:integer;
        kpd:real;
    begin
        for i := 1 to m do
             if kpd <> max(kpd,arr[i].cost/arr[i].calorie) then
                 begin
                     kpd:=arr[i].cost/arr[i].calorie;
                     maxi:=i
                 end;
        find:=maxi;
    end;
procedure finding(var arr:arrOfCake;m:integer);
          var i:integer;
          begin
          writeln('Булочка с max соотношением цены и калорийности');
          writeln('Название':8,' ','Калории.':8,' ','Цена':8);
          i:=find(arr,m);
          writeln(arr[i].name: 8,' ',arr[i].calorie:8,' ',arr[i].cost:8);

    end;
procedure makeArrayWithCakesContainsCheeseOrCabbage(var arr:arrOfCake;m:integer);
          var
            ctd,i,j:integer;
            Aresult:arrOfCake;
          begin
               SetLength(Aresult,100);
               j:=0;
                for i:=1 to m do
                  begin
                     if ((pos(arr[i].name,'сыр')<>0 )or(pos(arr[i].name,'капуст')<>0)) then
                        begin
                             j:=j+1;
                             Aresult[j]:=c;
                        end;
                  end;
                writeln('Название':8,' ','Калории.':8,' ','Цена':8);
                for i := 1 to j do
                    writeln(Aresult[i].name: 8,' ',arr[i].calorie:8,' ',arr[i].cost:8);


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
  writeln('6 - проверка');
  writeln('7 - поиск');
  writeln('8 - поиск булочек с сыром и капустой');
  writeln('9 - вывод');
  writeln('10 - закончить выполнение программы');
    readln(key);
    m:=length(A);
    case key of
      '1': input(A, m);
      '2': sort1(A,m);
      '3': sort2(A,m);
      '4': sort3(A,m);
      '5': sort4(A,m);
      '6': testing(A,m);
      '7': finding(A,m);
      '8': makeArrayWithCakesContainsCheeseOrCabbage(A,m);
      '9': output(A, m);
     '10': exit;
    end;
    readln;
  until key='10';

end.
