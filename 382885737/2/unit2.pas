unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
type
  str=string[20];
  pharmacy=record
  nameOfDrug,nameOfSeller: string[20];
  dateOB,dateOD: string[6];
  internal:boolean;
  end;
  tmas=array[1..20] of pharmacy;
  fileOfPharmacy=file of pharmacy;
  procedure readFile(var arr:tmas; var n:integer; var A:fileOfPharmacy);
  procedure createFile(var arr:tmas;var n:integer; var A:fileOfPharmacy);
  procedure poisk (arr:tmas; n:integer; var c:pharmacy);
  procedure addRecord(var arr:tmas; var n:integer);
  procedure delRecord(var arr:tmas; var n:integer);
  procedure correctRecord(var arr:tmas; n:integer);
  procedure exit(var arr:tmas; var n:integer;var A:fileOfPharmacy);
implementation
 procedure readFile(var arr:tmas; var n:integer;var A:fileOfPharmacy);
 var i:integer;
   c: pharmacy;
   begin
        i:=0;
        {$I-} reset(A);  {$I+}
        if IOResult <> 0 then
        begin
             ShowMessage('File not found, create first');
        end
        else
            begin
              Reset(A);
              while not EOF(A) do
              begin
                i:=i+1;
                Read(A, c);
                arr[i]:=c;
              end;
              Close(A);
              ShowMessage('Arr read');
            end;
   end;
 procedure createFile(var arr:tmas; var n:integer;var A:fileOfPharmacy);
 var i:integer;
   c:pharmacy;
   begin
        Assign(A, 'Alpha.dat');
        Rewrite(A);
        for i:=1 to n do
            arr[i]:=c;
        n:=0;
        ShowMessage('File created');
   end;

 procedure poisk (arr:tmas; n:integer; var c:pharmacy);
 var i:integer;
   s:string;
   tmp:pharmacy;
   begin
        s:='';
        for i:=1 to n do
           if tmp.dateOB>s then begin s:=tmp.dateOB; c:=tmp; end;
   end;

 procedure addRecord(var arr:tmas; var n:integer);
 var i:integer;
     c:pharmacy;
     s:string;
   begin
        c.nameOfDrug:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ ПРЕПАРАТА','');
        c.nameOfSeller:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ ПРОДАВЦА','');
        c.dateOB:=inputbox('title', 'ВВЕДИТЕ ДАТУ СОЗДАНИЯ(ddmmyy):','');
        c.dateOD:=inputbox('title', 'ВВЕДИТЕ ДАТУ ПРОСРОЧКИ(ddmmyy):','');
        s:=inputbox('title', 'ВВОД ВНУТРИВЕННО(y/n)','');
        while (s<>'y') and (s<>'n') do
              s:=inputbox('title', 'ВВОД ВНУТРИВЕННО(y/n)','');
        c.internal:=False;
        if s='y' then c.internal := True;
        arr[n]:=c;
        n:=n+1;

   end;
 procedure delRecord(var arr:tmas; var n:integer);
 var i,j:integer;
     s:string;
   begin
        s:=inputbox('title', 'Введите название, которое надо удалить', '');
        for i:=1 to n do begin
          if arr[i].nameOfDrug=s then
             for j:=i to n-1 do begin
               arr[j]:=arr[j+1];
             end;
        end;
   end;
 procedure correctRecord(var arr:tmas; n:integer);
 var i:integer;
     c:pharmacy;
     s:string;
   begin
        s:=inputbox('title', 'Введите название, которое надо корректировать', '');
        for i:=1 to n do begin
          if arr[i].nameOfDrug=s then begin
             c.nameOfDrug:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ ПРЕПАРАТА','');
             c.nameOfSeller:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ ПРОДАВЦА','');
             c.dateOB:=inputbox('title', 'ВВЕДИТЕ ДАТУ СОЗДАНИЯ(ddmmyy):','');
             c.dateOD:=inputbox('title', 'ВВЕДИТЕ ДАТУ ПРОСРОЧКИ(ddmmyy):','');
             s:=inputbox('title', 'ВВОД ВНУТРИВЕННО(y/n)','');
             while (s<>'y') and (s<>'n') do
                   s:=inputbox('title', 'ВВОД ВНУТРИВЕННО(y/n)','');
             c.internal:=False;
             if s='y' then c.internal := True;
                arr[i]:=c;
                end;
        end;
   end;

 procedure exit(var arr:tmas; var n:integer;var A:fileOfPharmacy);
 var i:integer;
   begin
        Assign(A, 'Alpha.dat');
        rewrite(a);
        for i:=1 to n do begin
            write(a, arr[i]);
        end;
        showmessage('Работа завершена');
        halt;
   end;
end.

