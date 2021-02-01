program Pr9;

//сортировка массива пузырьком от максимума к минимуму и наоборот
//сортировка массива выбором максимума и минимума
//считает количество перестановок для сравнения

const
  n = 10;

  type
    Tmas = array [1..n] of integer;

procedure inPut(var a:tmas);  //заполнение массива с клавиатуры
var  i:integer;
   begin
   for i:=1 to n do
    read(a[i]);
   end;

procedure createMas(var a, aSort:tmas); //создание второго, дублирующего массива для сортировок
var  i:integer;
   begin
     for i:=1 to n do
      aSort[i]:=a[i];
   end;

procedure outP(a:tmas); //вывод массива
var  i:integer;
   begin
     for i:=1 to n do
      write(a[i], ' ');
   writeln;
   end;

procedure puzyrekMaxMin(a:tmas);  //пузырек от максимума к минимуму
var   aSort:Tmas;
   k, i, c, p:integer;
   begin
   createMas(a, aSort);  //создает доп массив для работы
   p:=0;     //переменная для подсчета перестановок
   repeat
     k:=0;   //переменная "индикатор" для выхода из цикла
     for i:=1 to n-1 do
      if aSort[i]<aSort[i+1] then //если соседние элементы стоят "не по порядку"
       //меняем их местами
       begin
         c:=aSort[i];
         aSort[i]:=aSort[i+1];
         aSort[i+1]:=c;
         k:=k+1;  //количество перестановок в цикле
         p:=p+1;
       end;
   until k=0 ; //если в цикле не было перестановок-массив отсортирован
   writeln('метод "пузырька" по убыванию');  //вывод
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

procedure puzyrekMinMax(a:tmas); //пузырек от минимума к максимуму
var  aSort:Tmas;
   k, i, c, p:integer;
   begin
   createMas(a, aSort);  //создает доп массив для работы
   p:=0;         //переменная для подсчета перестановок
   repeat
     k:=0;     //переменная "индикатор" для выхода из цикла
     for i:=1 to n-1 do
      if aSort[i]>aSort[i+1] then  //если соседние элементы стоят "не по порядку"
       //меняем их местами
       begin
         c:=aSort[i];
         aSort[i]:=aSort[i+1];
         aSort[i+1]:=c;
         k:=k+1;  //количество перестановок в цикле
         p:=p+1;
       end;
   until k=0 ; //если в цикле не было перестановок-массив отсортирован
   writeln('метод "пузырька" по возрастанию'); //вывод
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

procedure poiskMax(a:tmas);      //сортировка выбором максимума
var i, max, maxInd, j, c, p:integer;
   aSort:tmas;
   begin
   P:=0;     //переменная для подсчета перестановок
   createMas(a, aSort);  //создает доп массив для работы
   for i:=1 to n do
    begin
      max:=aSort[i];   //установка максимума на каждом повторении цикла
      maxInd:=i;
      for j:=i to n do   //ищем максимум среди остальных элементов
       if aSort[j]>max then
        begin
          max:=aSort[j];
          maxInd:=j;
        end;
      if maxind>i then  //если максимум изменился, меняем элементы местами
       begin
         c:=aSort[i];
         aSort[i]:=aSort[maxInd];
         aSort[maxInd]:=c;
         p:=p+1;
       end;
    end;
   writeln('метод поиск максимума');  //вывод
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

procedure poiskMin(a:tmas);   //сортировка выбором минимума
var  i, min, minInd, j, c, p:integer;
   aSort:tmas;
   begin
   p:=0;     //переменная для подсчета перестановок
   createMas(a, aSort); //массив для сортировки
   for i:=1 to n do
    begin
      min:=aSort[i];  //установка i-того элемента минимумом
      minInd:=i;
      for j:=i to n do   //ищем минимум среди остальных элементов
       if aSort[j]<min then
        begin
          min:=aSort[j];
          minInd:=j;
        end;
      if minInd>i then  //если минимум изменился то меняем местами i-тый элемент с минимумом
       begin
         c:=aSort[i];
         aSort[i]:=aSort[minInd];
         aSort[minInd]:=c;
         p:=p+1;
       end;
    end;
   writeln('метод поиск минимума');  //вывод
   outp(aSort);
   writeln('Количество перестановок ', p);
   end;

var
   i:integer;
   a:tmas;
begin
 inPut(a);
 outP(a);
 puzyrekMaxMin(a);
 puzyrekMinMax(a);
 poiskMax(a);
 poiskMin(a);
 readln;
end.
