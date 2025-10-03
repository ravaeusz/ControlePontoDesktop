program ControlePonto;

uses
  Vcl.Forms,
  formPrincipal in 'formPrincipal.pas' {FPrincipal},
  formlogin in 'formlogin.pas' {FLogin},
  banco in 'banco.pas' {DataModule1: TDataModule},
  cadatroPonto in 'cadatroPonto.pas' {CadastroPonto},
  formExclusao in 'formExclusao.pas' {Exclusao},
  edicaoP in 'edicaoP.pas' {edicao},
  rel in 'rel.pas' {relatorio};

{$R *.res}



var
FLogin : TFLogin;
FPrincipal : TFPrincipal;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  FLogin := TFLogin.Create(nil);
  FLogin.ShowModal;


  try


    if FLogin.Sucess = true then
    begin

      Application.CreateForm(TFPrincipal, FPrincipal);
      Application.CreateForm(Trelatorio, relatorio);
      Application.Run;
      FLogin.Close;
    end
    else
      Application.Terminate;
  finally
    FLogin.Free;
  end;


  Application.Run;
end.
