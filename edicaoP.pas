unit edicaoP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, DateUtils;

type
  TEdicao = class(TForm)
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edicaoData: TMaskEdit;
    edicaoFinalManha: TMaskEdit;
    edicaoFinalTarde: TMaskEdit;
    edicaoInicioManha: TMaskEdit;
    edicaoInicioTarde: TMaskEdit;
    Button2: TButton;

    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edicaoInicioManhaKeyPress(Sender: TObject; var Key: Char);
    procedure edicaoDataKeyPress(Sender: TObject; var Key: Char);
    procedure edicaoFinalManhaKeyPress(Sender: TObject; var Key: Char);
    procedure edicaoInicioTardeKeyPress(Sender: TObject; var Key: Char);
    procedure edicaoFinalTardeKeyPress(Sender: TObject; var Key: Char);
    procedure Button2KeyPress(Sender: TObject; var Key: Char);
  private
    FDataRegistro: TDate;
    { Private declarations }
  public
    property DataRegistro: TDate read FDataRegistro write FDataRegistro;
    procedure getRegistro(AData : TDate);
  end;


implementation

{$R *.dfm}

uses banco, cadatroPonto;



{ TEdicao }





procedure TEdicao.Button2KeyPress(Sender: TObject; var Key: Char);
begin
Button2.Click;
end;

procedure TEdicao.edicaoDataKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
edicaoInicioManha.SetFocus;
end;

procedure TEdicao.edicaoFinalManhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
edicaoInicioTarde.SetFocus;
end;

procedure TEdicao.edicaoFinalTardeKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button2.SetFocus;
end;

procedure TEdicao.edicaoInicioManhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
edicaoFinalManha.SetFocus;
end;

procedure TEdicao.edicaoInicioTardeKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
edicaoFinalTarde.SetFocus;
end;

procedure TEdicao.FormShow(Sender: TObject);
begin
  edicaoData.SetFocus;
  WindowState := wsNormal;

  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TEdicao.Button2Click(Sender: TObject);
var
  HInicioManha, HFinalManha, HInicioTarde, HFinalTarde: TTime;
begin

  HInicioManha :=CadastroPonto.AjustarHoraComTolerancia(StrToTime(edicaoInicioManha.Text), EncodeTime(9,0,0,0), 5);
  HFinalManha  :=CadastroPonto.AjustarHoraComTolerancia(StrToTime(edicaoFinalManha.Text),  EncodeTime(13,0,0,0), 5);
  HInicioTarde :=CadastroPonto.AjustarHoraComTolerancia(StrToTime(edicaoInicioTarde.Text), EncodeTime(14,0,0,0), 5);
  HFinalTarde  :=CadastroPonto.AjustarHoraComTolerancia(StrToTime(edicaoFinalTarde.Text),  EncodeTime(18,0,0,0), 5);

  banco.DataModule1.FDcadastroPonto.Close;
  banco.DataModule1.FDcadastroPonto.SQL.Clear;
  banco.DataModule1.FDcadastroPonto.SQL.Add(
    'update ponto set PT_INICIOMANHA = :INICIOMANHA, PT_FINALMANHA = :FINALMANHA, ' +
    'PT_INICIOTARDE = :INICIOTARDE, PT_FINALTARDE = :FINALTARDE, PT_TOTAL = :TOTAL ' +
    'where PT_DATA = :DATA');

  banco.DataModule1.FDcadastroPonto.ParamByName('DATA').AsDate := StrToDate(edicaoData.Text);
  banco.DataModule1.FDcadastroPonto.ParamByName('INICIOMANHA').AsTime := HInicioManha;
  banco.DataModule1.FDcadastroPonto.ParamByName('FINALMANHA').AsTime  := HFinalManha;
  banco.DataModule1.FDcadastroPonto.ParamByName('INICIOTARDE').AsTime := HInicioTarde;
  banco.DataModule1.FDcadastroPonto.ParamByName('FINALTARDE').AsTime  := HFinalTarde;


  banco.DataModule1.FDcadastroPonto.ParamByName('TOTAL').AsTime :=
    (HFinalManha - HInicioManha) + (HFinalTarde - HInicioTarde);

  banco.DataModule1.FDcadastroPonto.ExecSQL;

  ShowMessage('Ponto editado com sucesso!');

  edicaoData.SetFocus;

banco.DataModule1.FDponto.Close;
banco.DataModule1.FDponto.Open;

close;
end;



procedure TEdicao.getRegistro(AData: TDate);
begin


banco.DataModule1.FDconsulta.close;
banco.DataModule1.FDconsulta.SQL.Clear;
banco.DataModule1.FDconsulta.SQL.add('select * from ponto where PT_DATA = :DATA');
banco.DataModule1.FDconsulta.ParamByName('DATA').AsDate := AData;
banco.DataModule1.FDconsulta.Open;

edicaoData.text := (banco.DataModule1.FDconsulta.FieldByName('PT_DATA')).AsString ;
edicaoInicioManha.text := (banco.DataModule1.FDconsulta.FieldByName('PT_INICIOMANHA')).AsString ;
edicaoFinalManha.text := (banco.DataModule1.FDconsulta.FieldByName('PT_FINALMANHA')).AsString ;
edicaoInicioTarde.text := (banco.DataModule1.FDconsulta.FieldByName('PT_INICIOTARDE')).AsString ;
edicaoFinalTarde.text := (banco.DataModule1.FDconsulta.FieldByName('PT_FINALTARDE')).AsString ;

end;

end.
