program tub;
const step=0.1;
var y,yDerivative, xBegin, xEnd: real;
begin
    xBegin:= 0.5; xEnd:= 2.5;
    while xBegin<=xEnd do
    begin
        writeln('Табулирование функции:**');
        y:= (3*sqr(xBegin)-4)*(xBegin+1);//тут формула
        writeln('x=' , xBegin:5:3, ' / y=' , y:5:3);
        xBegin:= xBegin+step;
    end;
    yDerivative:=0;xBegin:=0.5;xEnd:=2.5;
    writeln('Табулирование производной функции:**');
    while xBegin<=xEnd do
    begin
        writeln('Табулирование производной функции:**');
        yDerivative:= (3*sqr(xBegin)-4)*(xBegin+1);//тут формула
        writeln('x=' , xBegin:5:3, ' / y=' , yDerivative:5:3);
        xBegin:= xBegin+step;
    end;
    readln
    end.
