object Form2: TForm2
  Left = 630
  Top = 398
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 109
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object tituloExclusao: TLabel
    Left = 0
    Top = 0
    Width = 333
    Height = 22
    Align = alTop
    Alignment = taCenter
    Caption = 'SELECIONE A DATA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 183
  end
  object btnExclusao: TButton
    Left = 199
    Top = 50
    Width = 82
    Height = 30
    Caption = 'EXCLUIR'
    TabOrder = 0
    OnClick = btnExclusaoClick
  end
  object dataExclusao: TMaskEdit
    Left = 56
    Top = 51
    Width = 136
    Height = 26
    EditMask = '!99/99/00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    TabOrder = 1
    Text = '  /  /  '
  end
end
