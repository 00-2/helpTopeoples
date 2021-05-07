unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Rabota: TButton;
    Zapolnit: TButton;
    Dobavit: TButton;
    Udalit: TButton;
    ComboBox: TComboBox;
    Edit: TEdit;
    ListBox: TListBox;
    procedure RabotaClick(Sender: TObject);
    procedure ZapolnitClick(Sender: TObject);
    procedure DobavitClick(Sender: TObject);
    procedure UdalitClick(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ZapolnitClick(Sender: TObject);
begin
  ComboBox.Items.Clear;             //Delete all existing strings
  ComboBox.Items.Add('1');
  ComboBox.Items.Add('12');
  ComboBox.Items.Add('1');
  ComboBox.Items.Add('1234');
end;

procedure TForm1.RabotaClick(Sender: TObject);
var i,j,k,minLength,maxLength:integer;
  tmp:string;
  arrMin,arrMax:array[1..10] of integer;
begin
   minLength:=length(Combobox.Items[0]);
   maxLength:=length(Combobox.Items[0]);
   for i:=1 to Combobox.Items.Capacity-1 do begin
       {Находим значения минимальной и максимальной длины
       А
       ФБ
       ФИВ
       макс - 3, мин - 1
       }
       if length(Combobox.Items[i])<minLength then minLength:=length(Combobox.Items[i]);
       if length(Combobox.Items[i])>maxLength then maxlength:=length(Combobox.Items[i]);
    end;
   writeln('min:', minLength);
   writeln('max:', maxLength);

   k:=1;
   j:=1;
   for i:=0 to Combobox.Items.Capacity-1 do begin
       {В массив arrMin сохраняем индексы эл-ов с мин длиной, в arrMax - с макс длиной}
       if length(Combobox.Items[i])=minLength then begin arrMin[k]:=i; k:=k+1;end;
       if length(Combobox.Items[i])=maxLength then begin arrMax[j]:=i; j:=j+1;end;
    end;

   if k<j then begin
      for i:=1 to k-1 do begin
           tmp:=Combobox.Items[arrMin[i]];
           Combobox.Items[arrMin[i]]:=Combobox.Items[arrMax[i]];
           Combobox.Items[arrMax[i]]:=tmp;
       end;
   end
   else  begin
       for i:= 1 to j-1 do begin
           tmp:=Combobox.Items[arrMax[i]];
           Combobox.Items[arrMax[i]]:=Combobox.Items[arrMin[i]];
           Combobox.Items[arrMin[i]]:=tmp;
       end;
   end;
   for i:=0 to Combobox.Items.Capacity-1 do begin
       ListBox.Items.Add(Combobox.Items[i]);
   end;
end;

procedure TForm1.DobavitClick(Sender: TObject);
var editText:string;
begin
   editText:=edit.text;//текст из edit
   ComboBox.Items.Add(editText);
end;

procedure TForm1.UdalitClick(Sender: TObject);
var editText:string;
    index:integer;
begin
   editText:=edit.text;//текст из edit
   index:=Combobox.Items.IndexOf(editText);//находит позицию текста из edita, -1, если такого нет
   if not(index = -1) then
      ComboBox.Items.Delete(index)
   else showmessage('ТАКОГО НЕТ');
end;


end.

