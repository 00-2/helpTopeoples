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
var i,j:integer;
  tmp:string;
  flag:boolean;
begin
   for i:=0 to Combobox.Items.Capacity-1 do begin
       Flag:=True;
       tmp:=Combobox.Items[i];
       for j:=2 to length(tmp) do begin
           if tmp[j-1]<>tmp[j] then
              flag:=False;
       end;
       if flag=True then ListBox.Items.Add(Combobox.Items[i]);
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

