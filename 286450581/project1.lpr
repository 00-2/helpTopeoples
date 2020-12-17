program pr2;
{$mode objfpc}{$H+}
uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
Classes, un2
{ you can add units after this };
var
f:tf;
c:char;
begin
repeat
      assignfile(f,'file.txt');
      writeln('Menu:');
      writeln('1.Input');
      writeln('2.Sort file(from high to min)');
      writeln('3.Show top of countries by count');
      writeln('4.Sort file(from min to high)');
      writeln('5.Output');
      writeln('6.Exit');
      write('Make your choice:');
      readln(c);
      case c of
      '1':vvod(f);
      '2':sortFileByCountMin(f);
      '3':showCountries(f);
      '4':sortFileByCountMax(f);
      '5':vivod(f);
      end;
until c='6';
writeln('Good bye');
end.
