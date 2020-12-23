program dz3;


Uses sysutils,math;

type
  cake = record
    name: string[20];
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

procedure sort1(var A: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if A[j].name > A[j+1].name then begin
                tmp := A[j];
                A[j] := A[j+1];
                A[j+1] := tmp;
            end;
    end;

procedure sort2(var A: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if A[j].calorie > A[j+1].calorie then begin
                tmp := A[j];
                A[j] := A[j+1];
                A[j+1] := tmp;
            end;
    end;

procedure sort3(var A: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if A[j].cost > A[j+1].cost then begin
                tmp := A[j];
                A[j] := A[j+1];
                A[j+1] := tmp;
            end;
    end;

procedure sort4(var A: arrOfCake;m:integer);
    var
        i,j:integer;
        tmp:cake;
    begin
        for i := 1 to m do
        for j := 1 to m-i do
            if A[j].name > A[j+1].name then begin
                tmp := A[j];
                A[j] := A[j+1];
                A[j+1] := tmp;
            end;
            
        for i := 1 to m do
        for j := 1 to m-i do
            if (A[j].name = A[j+1].name) and (A[j].cost>A[j+1].cost) then begin
                tmp := A[j];
                A[j] := A[j+1];
                A[j+1] := tmp;
            end;
    end;

procedure output(var arr:arrOfCake;m:integer);
    var
        i:integer;
    begin
        writeln('Название':20,' ','Калории.':8,' ','Цена':8);
        for i := 1 to m do
              writeln(arr[i].name: 20,' ',arr[i].calorie:8,' ',arr[i].cost:8);
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
        writeln('Название':20,' ','Результат проверки');
        for i := 1 to m do
             writeln(arr[i].name:20, ' ' , isCorrect(arr[i]));
    end;
function find(var arr:arrOfCake;m:integer):integer;
    var
        maxi, i:integer;
        kpd:real;
    begin
        for i := 1 to m do
             if kpd <> max(kpd,arr[i].calorie/arr[i].cost) then
                 begin
                     kpd:=arr[i].calorie/arr[i].cost;
                     maxi:=i
                 end;
        find:=maxi;
    end;
procedure finding(var arr:arrOfCake;m:integer);
          var i:integer;
          begin
          writeln('Булочка с max соотношением калорийность/цена');
          writeln('Название':20,' ','Калории.':8,' ','Цена':8);
          i:=find(arr,m);
          writeln(arr[i].name: 20,' ',arr[i].calorie:8,' ',arr[i].cost:8);

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
  writeln('8 - вывод');
  writeln('9 - закончить выполнение программы');
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
      '8': output(A, m);
     '9': exit;
    end;
    readln;
  until key='8';
{
//этот код для проверки
  SetLength(A,6);
  i:=1;
  c.name:='TEST2';c.calorie:=10;c.cost:=50;
  A[i]:=c;

  i:=2;
  c.name:='TEST1';c.calorie:=1000;c.cost:=150;
  A[i]:=c;
  
  
  i:=3;
  c.name:='TEST3';c.calorie:=80;c.cost:=60;
  A[i]:=c;

  i:=4;
  c.name:='TEST4';c.calorie:=1000;c.cost:=350;
  A[i]:=c;
  
  i:=5;
  c.name:='TEST4';c.calorie:=1000;c.cost:=150;
  A[i]:=c;
  
  output(A,i);
  finding(A,i);
  output(A,i);}
end.
