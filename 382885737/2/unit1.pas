unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var arr:tmas;
 n:integer;
 A:fileofpharmacy;
 c:pharmacy;


procedure TForm1.MenuItem1Click(Sender: TObject);
var i:integer;
begin
    readFile(arr, n, a);
    Combobox1.Clear;
    for i:=1 to n do begin
      Combobox1.Items.add(arr[i].nameOfDrug);
    end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
    createFile(arr, n, a);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
    poisk(arr, n, c);
    showmessage(c.nameOfDrug);
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var i:integer;
begin
  addRecord(arr, n);
  Combobox1.Clear;
  for i:=1 to n do begin
      Combobox1.Items.add(arr[i].nameOfDrug);//почему то косячит с первым вводом
    end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var i:integer;
begin


end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
   exit(arr, n, a);
end;



end.

