unit Connect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles, Vcl.StdCtrls;

type
  TTConn = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LerConn;
    procedure ConectarBanco;
  end;

var
  TConn: TTConn;

implementation

{$R *.dfm}

uses banco;

{ TTConn }

procedure TTConn.FormCreate(Sender: TObject);
begin
ConectarBanco;

end;

procedure TTConn.LerConn;
var
ini : TIniFile;
Servidor, Banco, User, Password : String;
begin

LerConn;

ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'connect.ini');

try

Servidor := ini.ReadString('DATABASE', 'Server', 'localhost');
Banco := ini.ReadString('DATABASE', 'Database', '');
User := ini.ReadString('DATABASE', 'User', '');
Password := ini.ReadString('DATABASE', 'Password', '');


finally
  ini.Free;
end;

end;

procedure TTConn.ConectarBanco;
var
ini : TIniFile;
CaminhoIni : string;
begin
CaminhoIni := ExtractFilePath(ParamStr(0)) + 'connect.ini';
ini := TIniFile.Create(CaminhoIni);


banco.DataModule1.FDConnection1.Params.Clear;
banco.DataModule1.FDConnection1.DriverName := 'FB';
banco.DataModule1.FDConnection1.Params.Add('Database=' + ini.ReadString('DATABASE', 'Database', ''));
banco.DataModule1.FDConnection1.Params.Add('User_name=' + ini.ReadString('DATABASE', 'User', ''));
banco.DataModule1.FDConnection1.Params.Add('Password=' + ini.ReadString('DATABASE', 'Password', ''));
banco.DataModule1.FDConnection1.Params.Add('Server=' + ini.ReadString('DATABASE', 'Server', 'localhost'));
banco.DataModule1.FDConnection1.Params.Add('Port=' + ini.ReadString('DATABASE', 'Port', '44680' ));
banco.DataModule1.FDConnection1.Connected := True;

end;


end.
