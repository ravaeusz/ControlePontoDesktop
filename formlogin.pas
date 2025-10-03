unit formlogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    private
    FSucess : boolean ;
  public
    property Sucess : boolean read FSucess write FSucess;
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses banco, Connect, ConfigIni;

procedure TFLogin.Button1Click(Sender: TObject);
var
lsql : banco.TDataModule1;
begin
lsql := banco.TDataModule1.Create(nil);

Sucess := false;

lsql.FDuser.Close;
lsql.FDuser.SQL.Text := 'SELECT * FROM "USER" where US_NOME = :nome and US_SENHA = :senha';
lsql.FDuser.ParamByName('nome').AsString := Edit1.Text;
lsql.FDuser.ParamByName('senha').AsInteger := StrToInt(Edit2.Text);
lsql.FDuser.Open;


if not lsql.FDuser.IsEmpty then
begin
Sucess := true;
close;
end
else
ShowMessage('Usuário não existe');
Edit1.SetFocus;

end;


procedure TFLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
edit2.SetFocus;

end;

procedure TFLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button1.SetFocus;

end;

procedure TFLogin.Button1KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button1.Click;
end;



procedure TFLogin.FormCreate(Sender: TObject);
begin

try



finally

end;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
Edit1.SetFocus;

end;



end.
