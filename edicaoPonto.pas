unit edicaoPonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TEdicao = class(TForm)
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    procedure carregarRegistro(AData : TDate);
  private
    FData: TDate;
  public
    property dataRegistro : TDate read FData write FData;
  end;

var
  Edicao: TEdicao;

implementation

{$R *.dfm}

uses banco;

procedure TEdicao.carregarRegistro(AData: TDate);
begin
banco.DataModule1.FDconsulta.Close;
banco.DataModule1.FDconsulta.SQL.Clear;
banco.DataModule1.FDconsulta.SQL.Add('select * from ponto where PT_DATA = :DATA');
banco.DataModule1.FDconsulta.ParamByName('DATA').AsDate := AData;
banco.DataModule1.FDconsulta.Open;

MaskEdit5.text := (banco.DataModule1.FDconsulta.FieldByName('PT_INICIOMANHA').ToString);

end;

end.
