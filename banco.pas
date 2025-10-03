unit banco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, IniFiles;

type
  TDataModule1 = class(TDataModule)
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
    FDuser: TFDQuery;
    FDponto: TFDQuery;
    DataSource1: TDataSource;
    FDcadastroPonto: TFDQuery;
    FDconsulta: TFDQuery;
    FDdelete: TFDQuery;
    FDtotalHoras: TFDQuery;
    DataSource2: TDataSource;
    procedure DataModuleCreate(Sender: TObject);

  private
    FUser: String;
    FServer: String;
    FSenha: string;
    FPorta: string;
    FDatabase: string;
  public
  property User: String read FUser write FUser;
  property Server: String read FServer write FServer;
  property Senha: string read FSenha write FSenha;
  property Porta: string read FPorta write FPorta;
  property Database: string read FDatabase write FDatabase;
  procedure lerIni;
  procedure escreverIni;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}



{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
lerIni;
escreverIni;
end;

procedure TDataModule1.escreverIni;
begin

FDConnection1.Params.Clear;
FDConnection1.DriverName := 'FB';
FDConnection1.Params.Add('Database=' + FDatabase);
FDConnection1.Params.Add('User_Name=' + FUser);
FDConnection1.Params.Add('Password=' + FSenha);
FDConnection1.Params.Add('Server=' + FServer);
FDConnection1.Params.Add('Port=' + FPorta);

FDConnection1.Connected := True;
FDConnection1.LoginPrompt := False;

end;


procedure TDataModule1.lerIni;
var
ini : TIniFile;
begin
ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'connect.ini');

try
FServer   := ini.ReadString('DATABASE', 'Server', 'localhost');
FPorta    := ini.ReadString('DATABASE', 'Port', '');
FDatabase := ini.ReadString('DATABASE', 'Database', '');
FUser     := ini.ReadString('DATABASE', 'User', '');
FSenha    := ini.ReadString('DATABASE', 'Password', '');

finally
  ini.Free;
end;

end;

end.
