unit exclusaoPonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    tituloExclusao: TLabel;
    dataExclusao: TMaskEdit;
    btnExclusao: TButton;
    procedure btnExclusaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses banco;

procedure TForm2.btnExclusaoClick(Sender: TObject);
begin
banco.DataModule1.FDdelete.Close;
banco.DataModule1.FDdelete.SQL.Clear;
banco.DataModule1.FDdelete.SQL.Add('delete from ponto where PT_DATA = :DATA');
banco.DataModule1.FDdelete.ParamByName('DATA').AsDate := StrToDate(dataExclusao.Text);
banco.DataModule1.FDdelete.ExecSQL;

banco.DataModule1.FDponto.Close;
banco.DataModule1.FDponto.Open;

Close;
end;

end.
