object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\Rafael.Girardi\Desktop\Delphi\controlePonto\fbclient.dl' +
      'l'
    Left = 96
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 160
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 224
    Top = 80
  end
  object FDuser: TFDQuery
    Connection = FDConnection1
    Left = 520
    Top = 48
  end
  object FDponto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from ponto order by PT_DATA asc')
    Left = 520
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = FDponto
    Left = 224
    Top = 168
  end
  object FDcadastroPonto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 520
    Top = 200
  end
  object FDconsulta: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 520
    Top = 280
  end
  object FDdelete: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 520
    Top = 352
  end
  object FDtotalHoras: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT' +
        '_TOTAL)) AS total_minutos, '
      
        'CAST(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_T' +
        'OTAL))/60 AS VARCHAR(2)) || '#39':'#39' || '
      
        'LPAD(MOD(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM ' +
        'PT_TOTAL)),60),2,'#39'0'#39') AS total_horas, COUNT'
      
        '(*)*8*60 AS carga_minutos, CAST(COUNT(*)*8 AS VARCHAR(2)) || '#39':0' +
        '0'#39' AS carga_horas, (SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT'
      
        '(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60)) AS saldo_minutos, CASE ' +
        'WHEN (SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_' +
        'TOTAL))-'
      
        '(COUNT(*)*8*60))<0 THEN '#39'-'#39' ELSE '#39#39' END || CAST(ABS(SUM(EXTRACT(' +
        'HOUR FROM PT_TOTAL)*60+EXTRACT(MINUTE FROM PT_TOTAL))-(COUNT(*)*' +
        '8*60))/60 AS VARCHAR(2)) '
      
        '|| '#39':'#39' || LPAD(MOD(ABS(SUM(EXTRACT(HOUR FROM PT_TOTAL)*60+EXTRAC' +
        'T(MINUTE FROM PT_TOTAL))-(COUNT(*)*8*60)),60),2,'#39'0'#39') AS saldo_ho' +
        'ras FROM ponto'
      '')
    Left = 520
    Top = 424
  end
  object DataSource2: TDataSource
    DataSet = FDtotalHoras
    Left = 224
    Top = 232
  end
end
