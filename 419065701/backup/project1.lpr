program project1;

function isReverse(strTmp:string; strRes:string):boolean;
var i,size:integer;
begin
     if length(strTmp)=length(strRes) then
        begin
        size:=length(strTmp);
        for i:=1 to size div 2 do
            if strTmp[i]<>strRes[size+1-i] then
               begin
                    isReverse:=False;
                    exit;
               end;
        isReverse:=True;
        exit;
        end
     else begin
         isReverse:=False;
         exit;
     end;
end;

var f:text;
    i,j,n:integer;
    c:char;
    strRes,strTmp:string;
    flag:boolean;
    arrayOfString: array[1..100] of string;
begin
    //Обращение - задом наперед
    assign(f,'text.txt');
    reset(f);
    flag:=FALSE;
    n:=1;
    strTmp:='';

    while not eof(f) do//пока не конец файла
    begin
         readln(f,strTmp);
         n:=n+1;
         arrayOfString[n]:=strTmp;
         strTmp:='';
    end;

    for i:=1 to n-1 do
        begin
        if flag then break;
        strRes:=arrayOfString[i];
        for j:= i+1 to n do
            begin
                 strTmp:=arrayOfString[j];
                 if isReverse(strTmp, strRes) then
                    begin
                         flag:=TRUE;
                         break;
                    end;
            end;
        end;
    writeln('Найденная пара: ', strRes, ' ' , strTmp);
end.

