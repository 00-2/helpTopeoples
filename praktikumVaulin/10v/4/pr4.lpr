program pr4;

{
Находит минимум, максимум,их номера, потом находит среднее = (max+min)/2, после считает произведение всех 
элементов больше среднего
}

Type
  tmas = array [1..25] of integer;

var
   indMin,indMax, min, max,i, proiz, n: integer;
   srznach: real;
   d:Tmas;
begin
  writeln('введите размер массива');
  readln(n);
  for i:=1 to n do
      read(d[i]);  // заполнить массив

  for i:=1 to n do
      write(d[i], ' ');    //  вывод массива
  writeln;

  max:=d[1];
  min:=d[1];
  indMax:=1;
  indMin:=1;
  for i:=1 to n do        // поиск минимума и максимума
      if d[i]>max then
      begin
           max:=d[i];
           indMax:=i;
      end
      else
       if d[i]<min then
         begin
           min:=d[i];
           indMin:=i;
         end;
  srznach:=(min+max)/2;
  proiz:=1;
  for i:=1 to n do       //  вычисление произведения
      if d[i]>srznach then
        proiz:=proiz*d[i];

  writeln('минимальный элемент в массиве ', min, ', его номер ', indmin);
  writeln('максимальный элемент в массиве ', max, ', его номер ', indmax);
  writeln('произведение чисел превышающих среднее зн ', proiz);
  readln;
end.

