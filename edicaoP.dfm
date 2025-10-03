object edicao: Tedicao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'edicao'
  ClientHeight = 386
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 386
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 1
      Top = 1
      Width = 439
      Height = 24
      Align = alTop
      Alignment = taCenter
      Caption = 'EDITE SEU PONTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 187
    end
    object Label8: TLabel
      Left = 128
      Top = 68
      Width = 45
      Height = 25
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 92
      Top = 124
      Width = 110
      Height = 25
      Caption = 'Inicio Manh'#227
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 92
      Top = 163
      Width = 104
      Height = 25
      Caption = 'Final Manh'#227
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 92
      Top = 227
      Width = 97
      Height = 25
      Caption = 'Inicio Tarde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 92
      Top = 258
      Width = 91
      Height = 25
      Caption = 'Final Tarde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edicaoData: TMaskEdit
      Left = 208
      Top = 65
      Width = 120
      Height = 33
      EditMask = '!99/99/00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      Text = '  /  /  '
      OnKeyPress = edicaoDataKeyPress
    end
    object edicaoFinalManha: TMaskEdit
      Left = 208
      Top = 160
      Width = 117
      Height = 33
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 1
      Text = '  :  :  '
      OnKeyPress = edicaoFinalManhaKeyPress
    end
    object edicaoFinalTarde: TMaskEdit
      Left = 208
      Top = 255
      Width = 117
      Height = 33
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 2
      Text = '  :  :  '
      OnKeyPress = edicaoFinalTardeKeyPress
    end
    object edicaoInicioManha: TMaskEdit
      Left = 208
      Top = 121
      Width = 117
      Height = 33
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 3
      Text = '  :  :  '
      OnKeyPress = edicaoInicioManhaKeyPress
    end
    object edicaoInicioTarde: TMaskEdit
      Left = 207
      Top = 216
      Width = 117
      Height = 33
      EditMask = '!90:00:00>;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 4
      Text = '  :  :  '
      OnKeyPress = edicaoInicioTardeKeyPress
    end
    object Button2: TButton
      Left = 1
      Top = 339
      Width = 439
      Height = 46
      Align = alBottom
      Caption = 'EDITAR'
      TabOrder = 5
      OnClick = Button2Click
      OnKeyPress = Button2KeyPress
    end
  end
end
