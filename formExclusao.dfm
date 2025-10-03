object Exclusao: TExclusao
  Left = 732
  Top = 363
  BorderStyle = bsDialog
  Caption = 'Exclusao'
  ClientHeight = 145
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 145
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 96
    ExplicitTop = 40
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 315
      Height = 32
      Align = alTop
      Alignment = taCenter
      Caption = 'SELECIONE A DATA PARA EXCLUS'#195'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 32
      Top = 56
      Width = 120
      Height = 29
      EditMask = '!99/99/00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      Text = '  /  /  '
      OnKeyPress = MaskEdit1KeyPress
    end
    object Button1: TButton
      Left = 176
      Top = 56
      Width = 81
      Height = 32
      Caption = 'EXCLUIR'
      TabOrder = 1
      OnClick = Button1Click
      OnKeyPress = Button1KeyPress
    end
    object Button2: TButton
      Left = 176
      Top = 94
      Width = 113
      Height = 32
      Caption = 'EXCLUIR TODOS'
      TabOrder = 2
      OnClick = Button2Click
      OnKeyPress = Button1KeyPress
    end
  end
end
