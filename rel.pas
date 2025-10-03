unit rel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  Trelatorio = class(TForm)
    RLReport1: TRLReport;
    cabecalho: TRLBand;
    titulo: TRLBand;
    colunas: TRLBand;
    details: TRLBand;
    data: TRLSystemInfo;
    horas: TRLSystemInfo;
    pages: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    footer: TRLBand;
    RLLabel8: TRLLabel;
    RLDBText7: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relatorio: Trelatorio;

implementation

{$R *.dfm}

uses banco;

end.
