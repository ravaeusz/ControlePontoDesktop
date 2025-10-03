object CadastroPonto: TCadastroPonto
  Left = 715
  Top = 242
  BorderStyle = bsSingle
  Caption = 'Cadastro Ponto'
  ClientHeight = 387
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 401
    Height = 30
    Align = alTop
    Alignment = taCenter
    Caption = 'CADASTRE SEU PONTO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 223
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 401
    Height = 357
    Align = alClient
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 32
    Top = 36
    Width = 329
    Height = 325
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 36
      Width = 117
      Height = 48
      Caption = 'Selecione a '#13#10'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 21
      Top = 100
      Width = 119
      Height = 24
      Caption = 'Inicio Manh'#227
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 22
      Top = 135
      Width = 114
      Height = 24
      Caption = 'Final Manh'#227
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 184
      Width = 108
      Height = 24
      Caption = 'Inicio Tarde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 219
      Width = 103
      Height = 24
      Caption = 'Final Tarde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 1
      Top = 272
      Width = 327
      Height = 52
      Align = alBottom
      Caption = 'Cadastrar'
      TabOrder = 0
      OnClick = Button1Click
      OnKeyPress = Button1KeyPress
    end
    object data: TMaskEdit
      Left = 160
      Top = 48
      Width = 152
      Height = 38
      EditMask = '!99/99/00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 1
      Text = '  /  /  '
      OnKeyPress = dataKeyPress
    end
    object inicioManha: TMaskEdit
      Left = 160
      Top = 92
      Width = 150
      Height = 38
      EditMask = '!90:00:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 2
      Text = '  :  :  '
      OnKeyPress = inicioManhaKeyPress
    end
    object finalManha: TMaskEdit
      Left = 160
      Top = 135
      Width = 150
      Height = 38
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 3
      Text = '  :  :  '
      OnKeyPress = finalManhaKeyPress
    end
    object finalTarde: TMaskEdit
      Left = 160
      Top = 223
      Width = 150
      Height = 38
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 4
      Text = '  :  :  '
      OnKeyPress = finalTardeKeyPress
    end
    object inicioTarde: TMaskEdit
      Left = 160
      Top = 179
      Width = 149
      Height = 38
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 5
      Text = '  :  :  '
      OnKeyPress = inicioTardeKeyPress
    end
  end
end
