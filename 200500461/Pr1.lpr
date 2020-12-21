program Pr1;

uses
  Classes, SysUtils;

type
  Entrant=record
    name:string[30];
    department:string[20];
    avgMark:real;
  end;

arr=array [0..99] of Entrant;

var i,n:integer;
    arrOfEnt:arr;
    avgMark:real;
procedure writeArr();
var
   i:integer;
   a:Entrant;
   begin
        for i:=0 to n-1 do
            begin
                 a:=arrOfEnt[i];
                 if a.avgMark>avgMark then
                    writeln(i, ' ', a.name:30,a.department:20, a.avgMark:4);
            end;
   end;

procedure readArr();
var
    i:integer;
    a:Entrant;
begin
repeat
      for i:=0 to n-1 do
          arrOfEnt[i]:=a;
      write('How many entrants : ');
      readln(n);
      until (n>0);
      for i:=0 to n-1 do
      begin
        writeln('Entrant №',i,' : ');
        write('Name : ');
        readln(a.name);
        write('Department : ');
        readln(a.department);
        write('Average Mark : ');
        readln(a.avgMark);
        arrOfEnt[i]:=a;
      end;
end;

procedure sortArr();
var
   j,i:integer;
   a:Entrant;
   begin
        for i:=0 to n-1 do
        begin
        for j:=0 to n-i-2 do
            if arrOfEnt[j].name>arrOfEnt[j+1].name then
               begin
                    a:=arrOfEnt[j];
                    arrOfEnt[j]:=arrOfEnt[j+1];
                    arrOfEnt[j+1]:=a;
               end;
        end;
   end;

var
    c:char;
    a:Entrant;
begin
    {to show func
    a.name:='b';
    a.department:='2';
    a.avgMark:=2.3;
    arrOfEnt[n]:=a;
    n:=n+1;
    a.name:='c';
    a.department:='3';
    a.avgMark:=4;
    arrOfEnt[n]:=a;
    n:=n+1;
    a.name:='a';
    a.department:='3';
    a.avgMark:=4;
    arrOfEnt[n]:=a;
    n:=n+1;
    writeArr();
    sortArr();
    writeArr();
    readln;}

write('Enter min average mark');
readln(avgMark);

repeat
      writeln('Menu:');
      writeln('1.Input');
      writeln('2.Output');
      writeln('3.Sort');
      writeln('4.Exit');
      write('Make your choice:');
      readln(c);
      case c of
      '1':readArr();
      '2':writeArr();
      '3':sortArr();
      end;
until c='4';
writeln('Good bye');
end.
