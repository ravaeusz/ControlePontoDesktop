unit formExclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TExclusao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Exclusao: TExclusao;

implementation

{$R *.dfm}

uses banco;

procedure TExclusao.Button1Click(Sender: TObject);
begin

banco.DataModule1.FDconsulta.Close;
banco.DataModule1.FDconsulta.SQL.Clear;

banco.DataModule1.FDconsulta.SQL.Add('select * from ponto where PT_DATA = :DATA');
banco.DataModule1.FDconsulta.ParamByName('DATA').AsDate := StrToDate(MaskEdit1.Text);
banco.DataModule1.FDconsulta.Open;


if not banco.DataModule1.FDconsulta.IsEmpty then
begin
banco.DataModule1.FDdelete.Close;
banco.DataModule1.FDdelete.SQL.Clear;
banco.DataModule1.FDdelete.SQL.Add('delete from ponto where PT_DATA = :DATA');
banco.DataModule1.FDdelete.ParamByName('DATA').AsDate := StrToDate(MaskEdit1.Text);
banco.DataModule1.FDdelete.ExecSQL;

ShowMessage('Ponto do dia : ' + MaskEdit1.Text + ' excluido com sucesso');

banco.DataModule1.FDponto.Close;
banco.DataModule1.FDponto.Open;

close;
end
else

ShowMessage('Data ' + MaskEdit1.Text + ' não existe no banco de dados');

end;



procedure TExclusao.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button1.SetFocus;
end;

procedure TExclusao.Button1KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button1.Click;
end;

procedure TExclusao.Button2Click(Sender: TObject);
var
resultado : integer;
begin

resultado := MessageDlg('Deseja excluir todos os registros?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);

if resultado = 6 then

begin
banco.DataModule1.FDdelete.Close;
banco.DataModule1.FDdelete.SQL.Clear;
banco.DataModule1.FDdelete.SQL.Add('delete from ponto');
banco.DataModule1.FDdelete.ExecSQL;


ShowMessage('Todos os pontos foram excluídos');

banco.DataModule1.FDponto.Close;
banco.DataModule1.FDponto.Open;

close;
end ;




end;

end.
