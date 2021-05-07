unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type
point = record
        x,y:integer;
        end;
  arr=array[1..20] of point;
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private

  public
  end;

var
  Form1: TForm1;
  n:integer;
  tmas:arr;

implementation



{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
  tmp:Point;
begin
       n:=strtoint(edit1.text);
       for i:=1 to n do begin
          tmas[i].x:=strtoint(inputbox('','Введите значение x '+inttostr(i) + ' точки','10'));
          tmas[i].y:=strtoint(inputbox('','Введите значение y '+inttostr(i) + ' точки','10'));
       end;
       StringGrid1.RowCount:=n+1;
       StringGrid1.ColCount:=2;
       for i:=1 to n do begin
          StringGrid1.cells[0,i]:=inttostr(tmas[i].x);
          StringGrid1.cells[1,i]:=inttostr(tmas[i].y);
       end;
       for i:=1 to n-1 do begin
       {Внутренний цикл уже перебирает элементы и сравнивает между собой.}
       for j:=1 to n-i do begin
       {Если элемент, больше следующего, то меняем местами.}
       if tmas[j].y>tmas[j+1].y then begin
          tmp:=tmas[j];
          tmas[j]:=tmas[j+1];
          tmas[j+1]:=tmp;
       end;
       end;
       end;
       StringGrid2.RowCount:=n+1;
       StringGrid2.ColCount:=2;
       for i:=1 to n do begin
          StringGrid2.cells[0,i]:=inttostr(tmas[i].x);
          StringGrid2.cells[1,i]:=inttostr(tmas[i].y);
       end;
end;

end.

