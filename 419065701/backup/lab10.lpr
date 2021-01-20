program lab10;

type
  pos=record
  x,y:integer;
  end;
 type
   circle = record
   co:pos;
   radius:integer;
   end;

var fileOfPoint:text;
    fileOfCircle:text;
    arrayOfPoint: array[1..100] of pos;
    arrayOfCircle: array[1..100] of circle;
    arrayResult: array of integer;//в нем будет по порядковым номерам окр-ей кол-во точек
    i,j,numOfP,numOfC,posMin:integer;
    pointTmp:pos;
    circleTmp:circle;
begin
    //Обращение - задом наперед
    assign(fileOfPoint,'points.txt');
    reset(fileOfPoint);
    assign(fileOfCircle,'circles.txt');
    reset(fileOfCircle);
    numOfP:=0;
    while not eof(fileOfPoint) do//пока не конец файла
    begin
         numOfP:=numOfP+1;
         read(fileOfPoint, pointTmp.x,pointTmp.y);
         arrayOfPoint[numOfP]:=pointTmp;
    end;
    while not eof(fileOfCircle) do//пока не конец файла
    begin
         numOfC:=numOfC+1;
         read(fileOfCircle, circleTmp.co.x,circleTmp.co.y,circleTmp.radius);
         arrayOfCircle[numOfC]:=circleTmp;
    end;
    Setlength(arrayResult, numOfC);
    for i:=1 to numOfC do
    begin
         circleTmp:=arrayOfCircle[i];
         for j:=1 to numOfP do
             begin
                  pointTmp:=arrayOfPoint[j];
                  if((circleTmp.co.x-pointTmp.x)*(circleTmp.co.x-pointTmp.x)+(circleTmp.co.y-pointTmp.y)*(circleTmp.co.y-pointTmp.y)<=(circleTmp.radius*circleTmp.radius))
                  then
                      arrayResult[i]:=arrayResult[i]+1;
             end;
    end;
    for i:=1 to numOfC-1 do write(arrayResult[i], ' ' );
    j:=arrayResult[1];//наш счетчик, станет минимумом
    for i:=1 to numOfC-1 do write(arrayResult[i], ' ' );
end.

