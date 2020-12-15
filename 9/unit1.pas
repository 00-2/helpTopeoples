unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure vvod(var f:textfile);
procedure vivod(var f:textfile);
procedure obrabotka(var f:textfile);
implementation
procedure vvod(var f:textfile);
var
        str1:string;
        len:integer;
    begin
        rewrite(f);
        writeln('Insert your text. (min 3 sentences)');
        readln(str1);
        write(f,str1);
        close (f);
    end;

procedure vivod(var f:textfile);
var
       c:char;
       len:integer;
   begin
       reset(f);
       while not eof(f) do //ввод данных до EOF
       begin
           read(f,c);
           write(c);
       end;
       close (f);
   end;


procedure obrabotka(var f:text);

var
    c:char;
    s:string;
    len,ctd:integer;
begin
{$I-}
reset(f);
{$I+}
ctd:=0;
    while not eof(f) do //ввод данных до EOF
        begin
            read(f,c);
            if c<>' ' then
                s:=s+c;
            if c=' '
                then
                begin
                    if ((s[length(s)] = 'd') and (s[1] = 'z')) then
                        ctd:=ctd+1;
                    s:='';
                end;
        end;
        if ctd = 0 then
            write('We have not letters, which starts by z and end by d');
        if ctd<>0 then
            write('We have ',ctd,' letters');
        close (f);
    end;
end.
