unit formPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, DateUtils, Vcl.Mask;

type
  TFPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Button4: TButton;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Button3: TButton;
    Button5: TButton;
    FlowPanel1: TFlowPanel;
    FlowPanel2: TFlowPanel;
    FlowPanel3: TFlowPanel;
    FlowPanel4: TFlowPanel;
    FlowPanel5: TFlowPanel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button4KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses formlogin, banco, cadatroPonto, formExclusao, edicaoPonto, edicaoP, rel;


procedure TFPrincipal.Button1Click(Sender: TObject);
var
lcadastro : cadatroPonto.TCadastroPonto;
begin
lcadastro := TCadastroPonto.Create(nil);

try
lcadastro.ShowModal;

DataModule1.FDponto.Close;
DataModule1.FDponto.SQL.Clear;
DataModule1.FDponto.sql.Add('select * from ponto order by PT_DATA asc');
DataModule1.FDponto.Open;

finally
  lcadastro.Free;
end;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
    DataModule1.FDconsulta.Close;
    DataModule1.FDconsulta.SQL.Clear;
    DataModule1.FDconsulta.SQL.Text :=
 'SELECT SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL)) AS total_minutos, CAST(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))/60 AS VARCHAR(2)) || '':'' || LPAD(MOD(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL)),60),2,''0'') AS total_horas, COUNT(*)*8*60 AS carga_minutos, CAST(COUNT(*)*8 AS VARCHAR(2)) || '':00'' AS carga_horas, (SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60)) AS saldo_minutos, CASE WHEN (SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60))<0 THEN ''-'' ELSE '''' END || CAST(ABS(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60))/60 AS VARCHAR(2)) || '':'' || LPAD(MOD(ABS(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60)),60),2,''0'') AS saldo_horas FROM ponto';

DataModule1.FDconsulta.Open;
    Label1.Caption := DataModule1.FDconsulta.FieldByName('saldo_horas').AsString;
    end;

procedure TFPrincipal.Button3Click(Sender: TObject);
var
exclusao : formExclusao.TExclusao;
begin
exclusao := formExclusao.TExclusao.Create(nil);
try

exclusao.ShowModal;

finally
exclusao.Free;
end;

end;

procedure TFPrincipal.Button4Click(Sender: TObject);
begin
    DataModule1.FDponto.Close;
    DataModule1.FDponto.SQL.Clear;
    DataModule1.FDponto.SQL.Text := 'select * from ponto where PT_DATA between :data1 and :data2 order by PT_DATA asc';
    DataModule1.FDponto.ParamByName('data1').AsDate := StrToDate(MaskEdit2.Text);
    DataModule1.FDponto.ParamByName('data2').AsDate := StrToDate(MaskEdit3.Text);
    DataModule1.FDponto.Open;
end;



procedure TFPrincipal.Button4KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button4.Click;
end;

procedure TFPrincipal.Button5Click(Sender: TObject);
begin

DataModule1.FDtotalHoras.Close;
DataModule1.FDtotalHoras.SQL.Clear;
DataModule1.FDtotalHoras.SQL.Text :=
 'SELECT SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL)) AS total_minutos, CAST(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))/60 AS VARCHAR(2)) || '':'' || LPAD(MOD(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL)),60),2,''0'') AS total_horas, COUNT(*)*8*60 AS carga_minutos, CAST(COUNT(*)*8 AS VARCHAR(2)) || '':00'' AS carga_horas, (SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60)) AS saldo_minutos, CASE WHEN (SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60))<0 THEN ''-'' ELSE '''' END || CAST(ABS(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60))/60 AS VARCHAR(2)) || '':'' || LPAD(MOD(ABS(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60)),60),2,''0'') AS saldo_horas FROM ponto';

DataModule1.FDtotalHoras.Open;
rel.relatorio.RLReport1.PreviewModal;
end;

procedure TFPrincipal.DBGrid1DblClick(Sender: TObject);
var
FormEdicao : TEdicao;
begin



FormEdicao :=  TEdicao.Create(nil);


try

FormEdicao.getRegistro(DataModule1.FDponto.FieldByName('PT_DATA').AsDateTime);
FormEdicao.ShowModal;

finally
  FormEdicao.Free;
end;


end;

procedure TFPrincipal.FormCreate(Sender: TObject);

begin


  try
    DataModule1.FDponto.Close;
    DataModule1.FDponto.SQL.Clear;
    DataModule1.FDponto.SQL.Text := 'select * from ponto order by PT_DATA asc';
    DataModule1.FDponto.Open;


  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;





procedure TFPrincipal.FormResize(Sender: TObject);
begin
DBGrid1.Columns[0].Width := Round(DBGrid1.ClientWidth * 0.15);
DBGrid1.Columns[1].Width := Round(DBGrid1.ClientWidth * 0.15);
DBGrid1.Columns[2].Width := Round(DBGrid1.ClientWidth * 0.15);
DBGrid1.Columns[3].Width := Round(DBGrid1.ClientWidth * 0.15);
DBGrid1.Columns[4].Width := Round(DBGrid1.ClientWidth * 0.15);
DBGrid1.Columns[5].Width := Round(DBGrid1.ClientWidth * 0.15);



DBGrid1.Height := DBGrid1.ClientHeight;

end;

procedure TFPrincipal.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
MaskEdit3.SetFocus;
end;

procedure TFPrincipal.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if key = char(#13) then
Button4.SetFocus;
end;



end.
