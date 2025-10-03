unit cadatroPonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.Mask, DateUtils;

type
  TCadastroPonto = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    data: TMaskEdit;
    inicioManha: TMaskEdit;
    finalManha: TMaskEdit;
    finalTarde: TMaskEdit;
    inicioTarde: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure dataKeyPress(Sender: TObject; var Key: Char);
    procedure inicioManhaKeyPress(Sender: TObject; var Key: Char);
    procedure finalManhaKeyPress(Sender: TObject; var Key: Char);
    procedure inicioTardeKeyPress(Sender: TObject; var Key: Char);
    procedure finalTardeKeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   function AjustarHoraComTolerancia(HoraInformada, HoraExata: TTime; ToleranciaMin: Integer): TTime  ;
  end;

var
  CadastroPonto: TCadastroPonto;

implementation

{$R *.dfm}

uses banco;

function TCadastroPonto.AjustarHoraComTolerancia(HoraInformada,
  HoraExata: TTime; ToleranciaMin: Integer): TTime;
var
  MinInformado, MinExato: Integer;
begin
  MinInformado := HourOf(HoraInformada) * 60 + MinuteOf(HoraInformada);
  MinExato := HourOf(HoraExata) * 60 + MinuteOf(HoraExata);

  if Abs(MinInformado - MinExato) <= ToleranciaMin then
    Result := HoraExata
  else
    Result := HoraInformada;
end;

procedure TCadastroPonto.Button1Click(Sender: TObject);
var
  HInicioManha, HFinalManha, HInicioTarde, HFinalTarde: TTime;
begin

banco.DataModule1.FDconsulta.Close;
banco.DataModule1.FDconsulta.SQL.Clear;

banco.DataModule1.FDconsulta.SQL.Add('select * from ponto where PT_DATA = :DATA');
banco.DataModule1.FDconsulta.ParamByName('DATA').AsDate := StrToDate(data.Text);
banco.DataModule1.FDconsulta.Open;


if banco.DataModule1.FDconsulta.IsEmpty then
begin

  HInicioManha := AjustarHoraComTolerancia(StrToTime(InicioManha.Text), EncodeTime(9,0,0,0), 5);
  HFinalManha  := AjustarHoraComTolerancia(StrToTime(FinalManha.Text),  EncodeTime(13,0,0,0), 5);
  HInicioTarde := AjustarHoraComTolerancia(StrToTime(InicioTarde.Text), EncodeTime(14,0,0,0), 5);
  HFinalTarde  := AjustarHoraComTolerancia(StrToTime(FinalTarde.Text),  EncodeTime(18,0,0,0), 5);


  banco.DataModule1.FDcadastroPonto.Close;
  banco.DataModule1.FDcadastroPonto.SQL.Clear;
  banco.DataModule1.FDcadastroPonto.SQL.Add(
  'INSERT INTO ponto (PT_DATA, PT_INICIOMANHA, PT_FINALMANHA, PT_INICIOTARDE, PT_FINALTARDE, PT_TOTAL, PT_USER)' +
  'VALUES (:DATA, :INICIOMANHA, :FINALMANHA, :INICIOTARDE, :FINALTARDE, :TOTAL, 1 ) ');

  banco.DataModule1.FDcadastroPonto.ParamByName('DATA').AsDate := StrToDate(Data.Text);
  banco.DataModule1.FDcadastroPonto.ParamByName('INICIOMANHA').AsTime := HInicioManha;
  banco.DataModule1.FDcadastroPonto.ParamByName('FINALMANHA').AsTime  := HFinalManha;
  banco.DataModule1.FDcadastroPonto.ParamByName('INICIOTARDE').AsTime := HInicioTarde;
  banco.DataModule1.FDcadastroPonto.ParamByName('FINALTARDE').AsTime  := HFinalTarde;

  banco.DataModule1.FDcadastroPonto.ParamByName('TOTAL').AsTime :=
    (HFinalManha - HInicioManha) + (HFinalTarde - HInicioTarde);

  banco.DataModule1.FDcadastroPonto.ExecSQL;

  ShowMessage('Ponto editado com sucesso!');

  data.SetFocus;

banco.DataModule1.FDponto.Close;
banco.DataModule1.FDponto.Open;

data.Text := '00/00/00';
inicioManha.Text := '00:00:00';
finalManha.Text := '00:00:00';
inicioTarde.Text := '00:00:00';
finalTarde.Text := '00:00:00';
end
else
begin
ShowMessage('Não é possivel cadatrar ponto da mesma data');
close;
end
end;


procedure TCadastroPonto.dataKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
inicioManha.SetFocus;
end;

procedure TCadastroPonto.inicioManhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
finalManha.SetFocus;
end;

procedure TCadastroPonto.finalManhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
inicioTarde.SetFocus;
end;

procedure TCadastroPonto.inicioTardeKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
finalTarde.SetFocus;
end;

procedure TCadastroPonto.finalTardeKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button1.SetFocus;
end;

procedure TCadastroPonto.FormShow(Sender: TObject);
begin
Data.SetFocus;
end;

procedure TCadastroPonto.Button1KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button1.Click;
end;



end.
