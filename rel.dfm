object relatorio: Trelatorio
  Left = 460
  Top = 104
  Caption = 'relatorio'
  ClientHeight = 602
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object RLReport1: TRLReport
    Left = -8
    Top = -16
    Width = 794
    Height = 1123
    DataSource = DataModule1.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 38
      BandType = btHeader
      object data: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 57
        Height = 38
        Align = faLeft
        Text = ''
      end
      object horas: TRLSystemInfo
        Left = 57
        Top = 0
        Width = 39
        Height = 38
        Align = faLeft
        Info = itHour
        Text = ''
      end
      object pages: TRLSystemInfo
        Left = 631
        Top = 0
        Width = 87
        Height = 38
        Align = faRight
        Info = itPageNumber
        Text = ''
      end
    end
    object titulo: TRLBand
      Left = 38
      Top = 76
      Width = 718
      Height = 85
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 245
        Top = 26
        Width = 227
        Height = 32
        Align = faCenter
        Caption = 'Controle de Ponto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object colunas: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLLabel3: TRLLabel
        Left = 499
        Top = 3
        Width = 95
        Height = 20
        Caption = 'Final Tarde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 57
        Top = 3
        Width = 56
        Height = 20
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 130
        Top = 3
        Width = 95
        Height = 20
        Caption = 'Inicio <Manh'#227
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 380
        Top = 3
        Width = 94
        Height = 20
        Caption = 'Inicio Tarde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 245
        Top = 3
        Width = 92
        Height = 20
        Caption = 'Final Manh'#227
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 620
        Top = 4
        Width = 37
        Height = 20
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
    end
    object details: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 24
      object RLDBText1: TRLDBText
        Left = 54
        Top = 5
        Width = 61
        Height = 16
        DataField = 'PT_DATA'
        DataSource = DataModule1.DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 128
        Top = 5
        Width = 97
        Height = 16
        DataField = 'PT_INICIOMANHA'
        DataSource = DataModule1.DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 245
        Top = 6
        Width = 92
        Height = 16
        DataField = 'PT_FINALMANHA'
        DataSource = DataModule1.DataSource1
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 380
        Top = 3
        Width = 94
        Height = 16
        DataField = 'PT_INICIOTARDE'
        DataSource = DataModule1.DataSource1
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 496
        Top = 5
        Width = 98
        Height = 16
        DataField = 'PT_FINALTARDE'
        DataSource = DataModule1.DataSource1
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 620
        Top = 3
        Width = 57
        Height = 17
        DataField = 'PT_INICIOMANHA'
        DataSource = DataModule1.DataSource1
        Text = ''
      end
    end
    object footer: TRLBand
      Left = 38
      Top = 209
      Width = 718
      Height = 64
      BandType = btFooter
      object RLLabel8: TRLLabel
        Left = 380
        Top = 41
        Width = 234
        Height = 20
        Caption = 'Total  do  saldo  em  horas/minutos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Sans Serif Collection'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 620
        Top = 41
        Width = 57
        Height = 18
        DataField = 'SALDO_HORAS'
        DataSource = DataModule1.DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
end
