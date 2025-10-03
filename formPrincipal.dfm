object FPrincipal: TFPrincipal
  Left = 613
  Top = 260
  BorderStyle = bsSingle
  Caption = 'Controle Ponto'
  ClientHeight = 353
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 49
    Align = alTop
    Color = clWhite
    Padding.Left = 5
    Padding.Top = 10
    Padding.Right = 5
    Padding.Bottom = 10
    ParentBackground = False
    TabOrder = 0
    object Button1: TButton
      Left = 440
      Top = 11
      Width = 103
      Height = 27
      Align = alRight
      Caption = 'Cadastrar Ponto'
      TabOrder = 1
      OnClick = Button1Click
      ExplicitLeft = 445
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    object Button4: TButton
      Left = 216
      Top = 11
      Width = 97
      Height = 27
      Align = alLeft
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = Button4Click
      OnKeyPress = Button4KeyPress
      ExplicitLeft = 205
      ExplicitTop = 9
    end
    object MaskEdit2: TMaskEdit
      Left = 6
      Top = 11
      Width = 86
      Height = 27
      Align = alLeft
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 3
      Text = '  /  /  '
      OnKeyPress = MaskEdit2KeyPress
      ExplicitLeft = 20
    end
    object MaskEdit3: TMaskEdit
      Left = 111
      Top = 11
      Width = 86
      Height = 27
      Align = alLeft
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 4
      Text = '  /  /  '
      OnKeyPress = MaskEdit3KeyPress
      ExplicitTop = 16
    end
    object FlowPanel1: TFlowPanel
      Left = 92
      Top = 11
      Width = 19
      Height = 27
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      ExplicitLeft = 87
    end
    object FlowPanel2: TFlowPanel
      Left = 197
      Top = 11
      Width = 19
      Height = 27
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 6
      ExplicitLeft = 198
      ExplicitTop = 16
    end
    object FlowPanel3: TFlowPanel
      Left = 313
      Top = 11
      Width = 127
      Height = 27
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 319
      ExplicitTop = 16
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 549
    Height = 304
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 41
    ExplicitWidth = 553
    ExplicitHeight = 312
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 547
      Height = 247
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataModule1.DataSource1
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PT_DATA'
          ImeName = 'Portuguese (Brazilian ABNT)'
          Title.Caption = 'Data'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PT_INICIOMANHA'
          Title.Caption = 'Inicio Manh'#227
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PT_FINALMANHA'
          Title.Caption = 'Final Manh'#227
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PT_INICIOTARDE'
          Title.Caption = 'Inicio Tarde'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PT_FINALTARDE'
          Title.Caption = 'Final Tarde'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PT_TOTAL'
          Title.Caption = 'Total'
          Width = 71
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 248
      Width = 547
      Height = 55
      Align = alBottom
      Color = clWhite
      Padding.Left = 5
      Padding.Top = 10
      Padding.Right = 5
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 374
        Top = 11
        Width = 4
        Height = 33
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 405
        ExplicitTop = 8
        ExplicitHeight = 21
      end
      object Label2: TLabel
        Left = 271
        Top = 11
        Width = 103
        Height = 33
        Align = alRight
        Caption = 'Total de horas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 274
        ExplicitTop = 6
        ExplicitHeight = 39
      end
      object Button3: TButton
        Left = 6
        Top = 11
        Width = 97
        Height = 33
        Align = alLeft
        Caption = 'Excluir data'
        TabOrder = 0
        OnClick = Button3Click
        ExplicitLeft = -6
        ExplicitTop = 6
        ExplicitHeight = 39
      end
      object Button2: TButton
        Left = 169
        Top = 11
        Width = 97
        Height = 33
        Align = alLeft
        Caption = 'Consultar horas'
        TabOrder = 1
        OnClick = Button2Click
        ExplicitLeft = 163
        ExplicitTop = 6
        ExplicitHeight = 25
      end
      object Button5: TButton
        Left = 444
        Top = 11
        Width = 97
        Height = 33
        Align = alRight
        Caption = 'Imprimir'
        TabOrder = 2
        OnClick = Button5Click
        ExplicitTop = 6
        ExplicitHeight = 25
      end
      object FlowPanel4: TFlowPanel
        Left = 378
        Top = 11
        Width = 66
        Height = 33
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        ExplicitLeft = 385
        ExplicitTop = 6
        ExplicitHeight = 39
      end
      object FlowPanel5: TFlowPanel
        Left = 103
        Top = 11
        Width = 66
        Height = 33
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        ExplicitLeft = 92
        ExplicitTop = 6
        ExplicitHeight = 39
      end
    end
  end
end
