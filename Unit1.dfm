object fGACT: TfGACT
  Left = 214
  Top = 163
  Caption = 'Get And Clear Table [GACT]'
  ClientHeight = 441
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 585
    Height = 407
    Align = alLeft
    Caption = 'SQL Script for View Data in TABLE'
    TabOrder = 0
    ExplicitHeight = 406
    object Splitter1: TSplitter
      Left = 249
      Top = 15
      Height = 352
      ExplicitLeft = 147
      ExplicitHeight = 362
    end
    object Panel2: TPanel
      Left = 2
      Top = 367
      Width = 581
      Height = 38
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitTop = 366
      object Label1: TLabel
        Left = 331
        Top = 1
        Width = 98
        Height = 13
        Caption = 'Cleaning type tables.'
      end
      object bRunSQL: TButton
        Left = 4
        Top = 3
        Width = 75
        Height = 17
        Hint = 'Run SQL scripts'
        Caption = 'Run -=> SQL'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bRunSQLClick
      end
      object Button1: TButton
        Left = 78
        Top = 3
        Width = 114
        Height = 17
        Hint = 'Clearing all tables except for isolated.'
        Caption = 'DELETE ALLTABLES'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object Button3: TButton
        Left = 4
        Top = 19
        Width = 94
        Height = 17
        Hint = 'Cleaning the line of the current table'
        Caption = 'Delete From Row'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = Button3Click
      end
      object ComboBox1: TComboBox
        Left = 330
        Top = 15
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Default'
        Items.Strings = (
          'Default'
          'DISABLE/EABLE Triggers')
      end
      object Button2: TButton
        Left = 191
        Top = 3
        Width = 135
        Height = 17
        Hint = 'Flow data saves the current table.'
        Caption = 'Create Script=>Save in File'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = Button2Click
      end
      object bSaveToFile: TButton
        Left = 97
        Top = 19
        Width = 122
        Height = 17
        Hint = 'Saves the contents of the window "Complete Script"'
        Caption = 'Save -=> File <=- Script'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = bSaveToFileClick
      end
      object bCreate: TButton
        Left = 218
        Top = 19
        Width = 108
        Height = 17
        Hint = 'Generate script insertion.'
        Caption = 'Create Insert Script'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = bCreateClick
      end
    end
    object mSQL: TMemo
      Left = 252
      Top = 15
      Width = 331
      Height = 352
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 1
      ExplicitHeight = 351
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 15
      Width = 247
      Height = 352
      Align = alLeft
      Caption = 'Table/Field'
      TabOrder = 2
      ExplicitHeight = 351
      object Splitter2: TSplitter
        Left = 2
        Top = 205
        Width = 243
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 192
        ExplicitWidth = 141
      end
      object cxGridTables: TcxGrid
        Left = 2
        Top = 15
        Width = 243
        Height = 190
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 189
        object cxGridTablesDBTableView1: TcxGridDBTableView
          OnDblClick = cxGridTablesDBTableView1DblClick
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsTables
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridTablesDBTableView1TableName: TcxGridDBColumn
            DataBinding.FieldName = 'TableName'
            Options.Editing = False
            Options.Filtering = False
            Width = 76
          end
          object cxGridTablesDBTableView1RowCounts: TcxGridDBColumn
            DataBinding.FieldName = 'RowCounts'
            Options.Editing = False
            Options.Filtering = False
            Width = 67
          end
          object cxGridTablesDBTableView1TableSchema: TcxGridDBColumn
            DataBinding.FieldName = 'TableSchema'
            Options.Editing = False
            Options.Filtering = False
            Width = 58
          end
        end
        object cxGridTablesLevel1: TcxGridLevel
          GridView = cxGridTablesDBTableView1
        end
      end
      object cxGridFields: TcxGrid
        Left = 2
        Top = 208
        Width = 243
        Height = 142
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 207
        object cxGridFieldsDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsFields
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridFieldsDBTableView1name: TcxGridDBColumn
            DataBinding.FieldName = 'name'
            Options.Editing = False
            Options.Filtering = False
          end
          object cxGridFieldsDBTableView1type: TcxGridDBColumn
            DataBinding.FieldName = 'type'
            Options.Editing = False
            Options.Filtering = False
          end
          object cxGridFieldsDBTableView1Length: TcxGridDBColumn
            DataBinding.FieldName = 'Length'
            Options.Editing = False
            Options.Filtering = False
          end
          object cxGridFieldsDBTableView1ident: TcxGridDBColumn
            DataBinding.FieldName = 'ident'
            Options.Editing = False
            Options.Filtering = False
          end
          object cxGridFieldsDBTableView1nullable: TcxGridDBColumn
            DataBinding.FieldName = 'nullable'
            Options.Editing = False
            Options.Filtering = False
          end
          object cxGridFieldsDBTableView1row: TcxGridDBColumn
            DataBinding.FieldName = 'row'
            Visible = False
            Options.Editing = False
            Options.Filtering = False
          end
          object cxGridFieldsDBTableView1sel: TcxGridDBColumn
            DataBinding.FieldName = 'sel'
            Options.Filtering = False
          end
        end
        object cxGridFieldsLevel1: TcxGridLevel
          GridView = cxGridFieldsDBTableView1
        end
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 585
    Top = 0
    Width = 330
    Height = 407
    Align = alClient
    Caption = 'Result/VIEW'
    TabOrder = 1
    ExplicitWidth = 326
    ExplicitHeight = 406
    object Splitter3: TSplitter
      Left = 2
      Top = 226
      Width = 326
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 236
      ExplicitWidth = 436
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 326
      Height = 211
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 229
      Width = 326
      Height = 176
      Align = alBottom
      Caption = 'Complete Script'
      TabOrder = 1
      ExplicitTop = 228
      ExplicitWidth = 322
      object Memo1: TMemo
        Left = 2
        Top = 15
        Width = 322
        Height = 159
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitWidth = 318
      end
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 407
    Width = 915
    Height = 15
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 406
    ExplicitWidth = 911
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 915
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
    ExplicitTop = 421
    ExplicitWidth = 911
  end
  object XPManifest1: TXPManifest
    Left = 568
    Top = 120
  end
  object Timer1: TTimer
    Left = 596
    Top = 84
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.sql'
    Filter = 'SQL|*.sql'
    Title = 'Save SQL Script'
    Left = 568
    Top = 84
  end
  object MSConnection1: TUniConnection
    ProviderName = 'SQL Server'
    Port = 1433
    Database = 'Obraz30'
    SpecificOptions.Strings = (
      'SQL Server.ApplicationName=GET_SQL')
    Options.ConvertEOL = True
    Options.EnableBCD = True
    Options.EnableFMTBCD = True
    DefaultTransaction = UniTransaction1
    Username = 'sa'
    Server = '.'
    Connected = True
    ConnectDialog = MSConnectDialog1
    AfterConnect = MSConnection1AfterConnect
    Left = 264
    Top = 32
    EncryptedPassword = 'DEFF9CFFCDFF8FFF8EFFCCFF91FF'
  end
  object MSConnectDialog1: TUniConnectDialog
    DatabaseLabel = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
    PortLabel = #1055#1086#1088#1090
    ProviderLabel = #1055#1088#1086#1074#1072#1081#1076#1077#1088
    SavePassword = True
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077
    UsernameLabel = #1048#1084#1103
    PasswordLabel = #1055#1072#1088#1086#1083#1100
    ServerLabel = #1057#1077#1088#1074#1077#1088
    ConnectButton = #1057#1086#1077#1076#1080#1085#1080#1090#1100
    CancelButton = #1054#1090#1084#1077#1085#1072
    LabelSet = lsRussian
    Left = 296
    Top = 32
  end
  object MSQuery1: TUniQuery
    Connection = MSConnection1
    SQL.Strings = (
      'select @@VERSION')
    Left = 264
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = MSQuery1
    Left = 384
    Top = 80
  end
  object msTables: TUniQuery
    Connection = MSConnection1
    SQL.Strings = (
      'SELECT '
      '    TableName = t.NAME,'
      '    RowCounts = p.rows,'
      '    TableSchema = s.Name'
      'FROM '
      '    sys.tables t'
      'INNER JOIN '
      '    sys.schemas s ON t.schema_id = s.schema_id'
      'INNER JOIN      '
      '    sys.indexes i ON t.OBJECT_ID = i.object_id'
      'INNER JOIN '
      
        '    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id' +
        ' = p.index_id'
      'WHERE '
      '    t.is_ms_shipped = 0'
      'GROUP BY'
      '    t.NAME, s.Name, p.Rows'
      'ORDER BY '
      '    s.Name, t.Name')
    Left = 128
    Top = 64
    object msTablesTableName: TWideStringField
      FieldName = 'TableName'
      Size = 128
    end
    object msTablesRowCounts: TLargeintField
      FieldName = 'RowCounts'
      ReadOnly = True
    end
    object msTablesTableSchema: TWideStringField
      FieldName = 'TableSchema'
      ReadOnly = True
      Size = 128
    end
  end
  object dsTables: TDataSource
    DataSet = msTables
    Left = 88
    Top = 64
  end
  object msFields: TUniQuery
    Connection = MSConnection1
    SQL.Strings = (
      '/*declare @TableName varchar (40)'
      'set @TableName = :TableName'
      ''
      
        'declare @row int, @name varchar(40),@type varchar(40), @Length i' +
        'nt, @ident bit, @nullable bit'
      'declare cFields cursor FOR'
      
        'select c.column_id ,c.name, TYPE_NAME(c.system_type_id) as type,' +
        ' c.max_length, c.is_identity, c.is_nullable'
      ' from sys.columns c'
      ' join sys.objects o on c.object_id = o.object_id'
      'where o.name = @TableName '
      'open cFields'
      
        'FETCH NEXT FROM cFields INTO @row, @name, @type, @Length , @iden' +
        't, @nullable'
      'WHILE @@FETCH_STATUS = 0  '
      'BEGIN'
      
        #9'insert #Fields values (@row, @name, @type, @Length , @ident, @n' +
        'ullable, 1)'
      
        #9'FETCH NEXT FROM cFields INTO @row, @name, @type, @Length , @ide' +
        'nt, @nullable'
      'END'
      'CLOSE cFields'
      'DEALLOCATE cFields;'
      ''
      'select * from #Fields;*/'
      ''
      
        'select c.column_id as '#39'row'#39' ,c.name as name, TYPE_NAME(c.system_' +
        'type_id) as type, c.max_length as Length, c.is_identity as ident' +
        ', c.is_nullable as nullable, Cast(1 as bit) as  sel'
      ' from sys.columns c'
      ' join sys.objects o on c.object_id = o.object_id'
      'where o.name = :TableName')
    IndexFieldNames = 'row'
    Left = 352
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TableName'
        Value = nil
      end>
    object msFieldsrow: TIntegerField
      FieldName = 'row'
      Required = True
    end
    object msFieldsname: TWideStringField
      FieldName = 'name'
      Size = 128
    end
    object msFieldstype: TWideStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 128
    end
    object msFieldsLength: TSmallintField
      FieldName = 'Length'
      Required = True
    end
    object msFieldsident: TBooleanField
      FieldName = 'ident'
      ReadOnly = True
      Required = True
    end
    object msFieldsnullable: TBooleanField
      FieldName = 'nullable'
      ReadOnly = True
    end
    object msFieldssel: TBooleanField
      FieldName = 'sel'
      ReadOnly = True
    end
  end
  object dsFields: TDataSource
    DataSet = vtFields
    Left = 226
    Top = 191
  end
  object MSScript1: TUniScript
    SQL.Strings = (
      'IF OBJECT_ID('#39'tempdb..#Fields'#39') IS NOT NULL'
      #9'delete #Fields;'
      #9'--Drop Table #Fields'
      'IF OBJECT_ID('#39'tempdb..#Fields'#39') IS NULL'
      
        #9'Create Table #Fields (row int ,name varchar(40),type varchar(40' +
        '), Length int, ident bit, nullable bit, sel bit);'
      '--select * from #Fields;'
      'declare @TableName varchar (40)'
      'set @TableName = :TableName'
      ''
      
        'declare @row int, @name varchar(40),@type varchar(40), @Length i' +
        'nt, @ident bit, @nullable bit'
      'declare cFields cursor FOR'
      
        'select c.column_id ,c.name, TYPE_NAME(c.system_type_id) as type,' +
        ' c.max_length, c.is_identity, c.is_nullable'
      ' from sys.columns c'
      ' join sys.objects o on c.object_id = o.object_id'
      'where o.name = @TableName '
      'open cFields'
      
        'FETCH NEXT FROM cFields INTO @row, @name, @type, @Length , @iden' +
        't, @nullable'
      'WHILE @@FETCH_STATUS = 0  '
      'BEGIN'
      
        #9'insert #Fields values (@row, @name, @type, @Length , @ident, @n' +
        'ullable, 1)'
      
        #9'FETCH NEXT FROM cFields INTO @row, @name, @type, @Length , @ide' +
        'nt, @nullable'
      'END'
      'CLOSE cFields'
      'DEALLOCATE cFields;')
    Connection = MSConnection1
    Transaction = UniTransaction1
    Left = 424
    Top = 168
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 312
    Top = 296
  end
  object PostgreSQLUniProvider1: TPostgreSQLUniProvider
    Left = 312
    Top = 240
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = MSConnection1
    Left = 264
    Top = 128
  end
  object vtFields: TVirtualTable
    FieldDefs = <
      item
        Name = 'row'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftWideString
        Size = 128
      end
      item
        Name = 'type'
        DataType = ftWideString
        Size = 128
      end
      item
        Name = 'Length'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ident'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'nullable'
        DataType = ftBoolean
      end
      item
        Name = 'sel'
        DataType = ftBoolean
      end>
    Left = 288
    Top = 192
    Data = {
      040007000300726F77030000000000000004006E616D65180080000000000004
      0074797065180080000000000006004C656E6774680200000000000000050069
      64656E74050000000000000008006E756C6C61626C6505000000000000000300
      73656C0500000000000000000000000000}
    object vtFieldsrow: TIntegerField
      FieldName = 'row'
      Required = True
    end
    object vtFieldsname: TWideStringField
      FieldName = 'name'
      Size = 128
    end
    object vtFieldstype: TWideStringField
      FieldName = 'type'
      Size = 128
    end
    object vtFieldsLength: TSmallintField
      FieldName = 'Length'
      Required = True
    end
    object vtFieldsident: TBooleanField
      FieldName = 'ident'
      Required = True
    end
    object vtFieldsnullable: TBooleanField
      FieldName = 'nullable'
    end
    object vtFieldssel: TBooleanField
      FieldName = 'sel'
    end
  end
end
