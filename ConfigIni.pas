unit ConfigIni;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,System.IniFiles ;

type
  TForm1 = class(TForm)
  private
    FUser: String;
    FServer: String;
    FSenha: string;
    FPorta: string;
    FDatabase: string;
    { Private declarations }
  public
  property User: String read FUser write FUser;
  property Server: String read FServer write FServer;
  property Senha: string read FSenha write FSenha;
  property Porta: string read FPorta write FPorta;
  property Database: string read FDatabase write FDatabase;
  procedure lerIni;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses banco;

{ TForm1 }



procedure TForm1.lerIni;
var
ini : TIniFile;

Servidor, Banco, Usuario, Senha, Porta: string;
begin
ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'connect.ini');
try

  FServer := ini.ReadString('DATABASE', 'Server', '');
  FDatabase    := ini.ReadString('DATABASE', 'Database', '');
  FUser  := ini.ReadString('DATABASE', 'User_Name', '');
  FSenha    := ini.ReadString('DATABASE', 'Password', '');
  FPorta    := ini.ReadString('DATABASE', 'Port', '');
finally
  ini.Free;
end;
end;

end.
