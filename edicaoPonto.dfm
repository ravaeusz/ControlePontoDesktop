object Edicao: TEdicao
  Left = 0
  Top = 0
  Caption = 'Edicao'
  ClientHeight = 377
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 377
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -8
    object MaskEdit1: TMaskEdit
      Left = 192
      Top = 120
      Width = 144
      Height = 33
      EditMask = '!90:00:00>;1;_'
      MaxLength = 8
      TabOrder = 0
      Text = '  :  :  '
    end
    object MaskEdit2: TMaskEdit
      Left = 192
      Top = 159
      Width = 144
      Height = 33
      EditMask = '!90:00:00>;1;_'
      MaxLength = 8
      TabOrder = 1
      Text = '  :  :  '
    end
    object MaskEdit3: TMaskEdit
      Left = 192
      Top = 226
      Width = 144
      Height = 33
      EditMask = '!90:00:00>;1;_'
      MaxLength = 8
      TabOrder = 2
      Text = '  :  :  '
    end
    object MaskEdit4: TMaskEdit
      Left = 192
      Top = 274
      Width = 144
      Height = 33
      EditMask = '!90:00:00>;1;_'
      MaxLength = 8
      TabOrder = 3
      Text = '  :  :  '
    end
    object MaskEdit5: TMaskEdit
      Left = 192
      Top = 56
      Width = 142
      Height = 33
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 4
      Text = '  /  /  '
    end
  end
end
