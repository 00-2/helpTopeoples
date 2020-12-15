program Project1;
{$mode objfpc}{$H+}
uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
Classes, unit1
{ you can add units after this };
var
f:textfile;
c:char;
begin
repeat
      assignfile(f,'file.txt');
      writeln('Menu:');
      writeln('1.Input');
      writeln('2.Output');
      writeln('3.Work');
      writeln('4.Exit');
      write('Make your choice:');
      readln(c);
      case c of
      '1':vvod(f);
      '2':vivod(f);
      '3':obrabotka(f);
      end;
until c='4';
writeln('Good bye');
end.
