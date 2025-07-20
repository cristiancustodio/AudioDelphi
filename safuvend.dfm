object fm_Venda: Tfm_Venda
  Left = 0
  Top = 160
  Width = 800
  Height = 412
  Caption = 'Venda de aparelho ou servi'#231'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel7: TBevel
    Left = 4
    Top = 5
    Width = 784
    Height = 354
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 86
    Top = 51
    Width = 42
    Height = 13
    Caption = 'Paciente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 361
    Top = 25
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = ed_DatNot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label26: TLabel
    Left = 91
    Top = 25
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = ed_NumNot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel13: TBevel
    Left = 104
    Top = 111
    Width = 449
    Height = 3
    Shape = bsTopLine
  end
  object Label6: TLabel
    Left = 219
    Top = 25
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object Label3: TLabel
    Left = 77
    Top = 75
    Width = 51
    Height = 13
    Caption = 'Comprador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel11: TBevel
    Left = 438
    Top = 327
    Width = 99
    Height = 18
  end
  object Label8: TLabel
    Left = 442
    Top = 329
    Width = 27
    Height = 13
    Caption = 'Total:'
  end
  object DBText1: TDBText
    Left = 474
    Top = 329
    Width = 58
    Height = 15
    Alignment = taRightJustify
    DataField = 'VEValVen'
    DataSource = ds_Venda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Bevel12: TBevel
    Left = 475
    Top = 328
    Width = 2
    Height = 16
    Shape = bsLeftLine
  end
  object Label11: TLabel
    Left = 298
    Top = 330
    Width = 40
    Height = 13
    Caption = 'Des/Acr'
    FocusControl = ed_DesAcr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 616
    Top = 111
    Width = 155
    Height = 3
    Shape = bsTopLine
  end
  object Label4: TLabel
    Left = 569
    Top = 103
    Width = 47
    Height = 13
    Caption = 'Parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 75
    Top = 103
    Width = 29
    Height = 13
    Caption = 'Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 509
    Top = 75
    Width = 54
    Height = 13
    Caption = 'Pagamento'
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 359
    Width = 788
    Height = 24
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 9
    Top = 13
    Width = 41
    Height = 338
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 10
    object bt_Incluir: TSpeedButton
      Left = 4
      Top = 33
      Width = 32
      Height = 26
      Hint = '| Incluir registro - Ctr+N'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_IncluirClick
    end
    object bt_Salvar: TSpeedButton
      Left = 4
      Top = 7
      Width = 32
      Height = 26
      Hint = '| Salvar registro - Ctr+S'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_SalvarClick
    end
    object bt_Cancelar: TSpeedButton
      Left = 4
      Top = 85
      Width = 32
      Height = 26
      Hint = '| Cancelar altera'#231#245'es - ESC'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_CancelarClick
    end
    object bt_Deletar: TSpeedButton
      Left = 4
      Top = 111
      Width = 32
      Height = 26
      Hint = '| Excluir registro'
      Caption = '...'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object bt_Procurar: TSpeedButton
      Left = 4
      Top = 144
      Width = 32
      Height = 26
      Hint = '| Localiza venda ou servi'#231'o'
      Caption = '...'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object bt_Imprimir: TSpeedButton
      Left = 4
      Top = 170
      Width = 32
      Height = 26
      Hint = '| Imprimir relat'#243'rios - F8'
      Caption = '...'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object bt_Sair: TSpeedButton
      Left = 4
      Top = 294
      Width = 32
      Height = 26
      Hint = '| Fechar formul'#225'rio- Alt+F4'
      Caption = 'X'
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Technic'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Bevel4: TBevel
      Left = 7
      Top = 199
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel5: TBevel
      Left = 7
      Top = 139
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object bt_Anterior: TSpeedButton
      Left = 4
      Top = 236
      Width = 32
      Height = 26
      Hint = '| Registro anterior - Page Up'
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Wingdings'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_AnteriorClick
    end
    object bt_Proximo: TSpeedButton
      Left = 4
      Top = 262
      Width = 32
      Height = 26
      Hint = '| Registro seguinte - Page Down'
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Wingdings'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_ProximoClick
    end
    object Bevel1: TBevel
      Left = 7
      Top = 322
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel8: TBevel
      Left = 7
      Top = 3
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel10: TBevel
      Left = 7
      Top = 291
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel6: TBevel
      Left = 7
      Top = 232
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object bt_Anular: TSpeedButton
      Left = 4
      Top = 59
      Width = 32
      Height = 26
      Hint = '| Anular matr'#237'cula'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
  end
  object lc_Paciente: TDBLookupComboBox
    Left = 135
    Top = 47
    Width = 329
    Height = 21
    DataField = 'VECodPac'
    DataSource = ds_Venda
    KeyField = 'PCCodPac'
    ListField = 'PCNome'
    ListSource = dm_Geral.ds_Paciente
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnCloseUp = lc_PacienteCloseUp
    OnEnter = lc_PacienteEnter
  end
  object ed_DatNot: TDBEdit
    Left = 391
    Top = 21
    Width = 73
    Height = 21
    DataField = 'VEDatVen'
    DataSource = ds_Venda
    MaxLength = 10
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object ed_NumNot: TDBEdit
    Left = 135
    Top = 21
    Width = 73
    Height = 21
    DataField = 'VENumNot'
    DataSource = ds_Venda
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object dg_TMPF: TwwDBGrid
    Left = 76
    Top = 122
    Width = 478
    Height = 197
    ControlType.Strings = (
      'IV_Aparelho;CustomEdit;wwDBLookupCombo1;F'
      'IV_Servico;CustomEdit;wwDBLookupCombo2;F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Ctl3D = True
    DataSource = ds_TEMPF
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object cb_TipNot: TDBComboBox
    Left = 245
    Top = 20
    Width = 99
    Height = 22
    Style = csOwnerDrawFixed
    DataField = 'VETipVen'
    DataSource = ds_Venda
    ItemHeight = 16
    Items.Strings = (
      'Venda'
      'Servi'#231'o')
    TabOrder = 1
    OnClick = cb_TipNotClick
  end
  object lc_Comprador: TDBLookupComboBox
    Left = 135
    Top = 71
    Width = 329
    Height = 21
    DataField = 'VECodCmp'
    DataSource = ds_Venda
    KeyField = 'PCCodPac'
    ListField = 'PCNome'
    ListSource = dm_Geral.ds_Comprador
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnEnter = lc_CompradorEnter
  end
  object ed_DesAcr: TDBEdit
    Left = 343
    Top = 326
    Width = 73
    Height = 21
    DataField = 'VEDesAcr'
    DataSource = ds_Venda
    MaxLength = 10
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    OnExit = ed_DesAcrExit
  end
  object dg_TMPG: TwwDBGrid
    Left = 568
    Top = 122
    Width = 209
    Height = 197
    Selected.Strings = (
      'Nro'#9'1'#9'Nro'
      'Data'#9'11'#9'Vencimento'
      'Valor'#9'8'#9'Valor')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    DataSource = ds_TMPG
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object wwDBLookupCombo1: TwwDBLookupCombo
    Left = 712
    Top = 72
    Width = 65
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'APDescricao'#9'40'#9'Descri'#231#227'o'#9#9
      'APModelo'#9'30'#9'Modelo'#9#9)
    DataField = 'IV_Aparelho'
    DataSource = ds_ItemVenda
    LookupTable = dm_Geral.tb_Aparelho
    LookupField = 'APCodApa'
    Options = [loColLines, loRowLines]
    TabOrder = 11
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object wwDBLookupCombo2: TwwDBLookupCombo
    Left = 712
    Top = 96
    Width = 65
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'SECodSer'#9'10'#9'SECodSer'#9#9
      'SEDescricao'#9'40'#9'SEDescricao'#9#9)
    DataField = 'IVCodSer'
    DataSource = ds_ItemVenda
    LookupTable = dm_Geral.tb_Servico
    LookupField = 'SECodSer'
    Options = [loColLines, loRowLines]
    TabOrder = 12
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dg_Item: TwwDBGrid
    Left = 76
    Top = 122
    Width = 478
    Height = 197
    TabStop = False
    ControlType.Strings = (
      'IV_Aparelho;CustomEdit;wwDBLookupCombo1;F'
      'IV_Servico;CustomEdit;wwDBLookupCombo2;F')
    Selected.Strings = (
      'IV_Aparelho'#9'24'#9'Aparelho'
      'IV_ModeloApa'#9'14'#9'Modelo'
      'IV_Servico'#9'30'#9'Servi'#231'o'
      'IVSerie'#9'10'#9'S'#233'rie'
      'IVDatVal'#9'11'#9'Validade'
      'IVValor'#9'10'#9'Valor')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds_ItemVenda
    KeyOptions = [dgAllowDelete]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 13
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object pn_TotPar: TPanel
    Left = 663
    Top = 325
    Width = 119
    Height = 22
    BevelOuter = bvNone
    TabOrder = 14
    object Bevel9: TBevel
      Left = 2
      Top = 2
      Width = 99
      Height = 18
    end
    object Label7: TLabel
      Left = 7
      Top = 5
      Width = 27
      Height = 13
      Caption = 'Total:'
    end
    object lb_TotPar: TLabel
      Left = 89
      Top = 5
      Width = 9
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Bevel14: TBevel
      Left = 183
      Top = 10
      Width = 2
      Height = 16
      Shape = bsLeftLine
    end
    object Bevel2: TBevel
      Left = 41
      Top = 3
      Width = 2
      Height = 16
      Shape = bsLeftLine
    end
  end
  object dg_Duplicata: TwwDBGrid
    Left = 568
    Top = 122
    Width = 209
    Height = 197
    TabStop = False
    Selected.Strings = (
      'DUNumPar'#9'1'#9'Nro'
      'DUDatVen'#9'11'#9'Vencimento'
      'DUValDup'#9'8'#9'Valor')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    DataSource = ds_Duplicata
    KeyOptions = [dgAllowDelete]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 15
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    UseTFields = False
  end
  object cb_TipPgt: TDBComboBox
    Left = 568
    Top = 71
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    Items.Strings = (
      'A Vista'
      'Parcelado')
    TabOrder = 5
  end
  object tb_Venda: TTable
    BeforePost = tb_VendaBeforePost
    AfterPost = tb_VendaAfterPost
    AfterScroll = tb_VendaAfterScroll
    OnPostError = tb_VendaPostError
    IndexFieldNames = 'VENumNot'
    TableName = 'SAFAVE.DB'
    Left = 730
    Top = 7
    object tb_VendaVENumNot: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'VENumNot'
      Required = True
    end
    object tb_VendaVECodPac: TIntegerField
      DisplayLabel = 'Paciente'
      FieldName = 'VECodPac'
    end
    object tb_VendaVECodCmp: TIntegerField
      DisplayLabel = 'Comprador'
      FieldName = 'VECodCmp'
    end
    object tb_VendaVETipVen: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'VETipVen'
      Size = 7
    end
    object tb_VendaVEDatVen: TDateField
      DisplayLabel = 'Data'
      FieldName = 'VEDatVen'
    end
    object tb_VendaVEValVen: TFloatField
      FieldName = 'VEValVen'
      DisplayFormat = '###,##0.00'
    end
    object tb_VendaVEDesAcr: TFloatField
      DefaultExpression = '0'
      FieldName = 'VEDesAcr'
      DisplayFormat = '###,##0.00'
    end
    object tb_VendaVEDatCan: TDateField
      FieldName = 'VEDatCan'
    end
  end
  object ds_Venda: TDataSource
    DataSet = tb_Venda
    OnStateChange = ds_VendaStateChange
    Left = 758
    Top = 7
  end
  object tb_ItemVenda: TTable
    IndexFieldNames = 'IVNumNot;IVNumSeq'
    MasterFields = 'VENumNot'
    MasterSource = ds_Venda
    TableName = 'SAFAIV.DB'
    Left = 730
    Top = 35
    object tb_ItemVendaIV_Aparelho: TStringField
      DisplayLabel = 'Aparelho'
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'IV_Aparelho'
      LookupDataSet = dm_Geral.tb_Aparelho
      LookupKeyFields = 'APCodApa'
      LookupResultField = 'APDescricao'
      KeyFields = 'IVCodApa'
      Size = 30
      Lookup = True
    end
    object tb_ItemVendaIV_ModeloApa: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'IV_ModeloApa'
      LookupDataSet = dm_Geral.tb_Aparelho
      LookupKeyFields = 'APCodApa'
      LookupResultField = 'APModelo'
      KeyFields = 'IVCodApa'
      Lookup = True
    end
    object tb_ItemVendaIV_Servico: TStringField
      DisplayLabel = 'Servi'#231'o'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'IV_Servico'
      LookupDataSet = dm_Geral.tb_Servico
      LookupKeyFields = 'SECodSer'
      LookupResultField = 'SEDescricao'
      KeyFields = 'IVCodSer'
      Size = 40
      Lookup = True
    end
    object tb_ItemVendaIVSerie: TStringField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 10
      FieldName = 'IVSerie'
      Size = 10
    end
    object tb_ItemVendaIVDatVal: TDateField
      DisplayLabel = 'Validade'
      DisplayWidth = 11
      FieldName = 'IVDatVal'
    end
    object tb_ItemVendaIVValor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'IVValor'
      DisplayFormat = '###,##0.00'
    end
    object tb_ItemVendaIVCodSer: TIntegerField
      DisplayLabel = 'Servi'#231'o'
      DisplayWidth = 10
      FieldName = 'IVCodSer'
      Visible = False
    end
    object tb_ItemVendaIVCodApa: TIntegerField
      DisplayLabel = 'Aparelho'
      DisplayWidth = 10
      FieldName = 'IVCodApa'
      Visible = False
    end
    object tb_ItemVendaIVNumNot: TIntegerField
      DisplayWidth = 10
      FieldName = 'IVNumNot'
      Visible = False
    end
    object tb_ItemVendaIVNumSeq: TIntegerField
      DisplayWidth = 10
      FieldName = 'IVNumSeq'
      Visible = False
    end
  end
  object ds_ItemVenda: TDataSource
    DataSet = tb_ItemVenda
    Left = 758
    Top = 35
  end
  object tb_TMPF: TTable
    BeforeOpen = tb_TMPFBeforeOpen
    AfterClose = tb_TMPFAfterClose
    AfterPost = tb_TMPFAfterPost
    AfterDelete = tb_TMPFAfterDelete
    OnNewRecord = tb_TMPFNewRecord
    FieldDefs = <
      item
        Name = 'IVCodApa'
        DataType = ftInteger
      end
      item
        Name = 'IVCodSer'
        DataType = ftInteger
      end
      item
        Name = 'IVSerie'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IVDatVal'
        DataType = ftDate
      end
      item
        Name = 'IVValor'
        DataType = ftFloat
      end
      item
        Name = 'IVNumSeq'
        DataType = ftInteger
      end>
    StoreDefs = True
    Left = 666
    Top = 35
    object tb_TMPFIV_Aparelho: TStringField
      DisplayLabel = 'Aparelho'
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'IV_Aparelho'
      LookupDataSet = dm_Geral.tb_Aparelho
      LookupKeyFields = 'APCodApa'
      LookupResultField = 'APDescricao'
      KeyFields = 'IVCodApa'
      Size = 30
      Lookup = True
    end
    object tb_TMPFIV_ModeloApa: TStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'IV_ModeloApa'
      LookupDataSet = dm_Geral.tb_Aparelho
      LookupKeyFields = 'APCodApa'
      LookupResultField = 'APModelo'
      KeyFields = 'IVCodApa'
      Lookup = True
    end
    object tb_TMPFIV_Servico: TStringField
      DisplayLabel = 'Servi'#231'o'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'IV_Servico'
      LookupDataSet = dm_Geral.tb_Servico
      LookupKeyFields = 'SECodSer'
      LookupResultField = 'SEDescricao'
      KeyFields = 'IVCodSer'
      Visible = False
      Size = 40
      Lookup = True
    end
    object tb_TMPFIVSerie: TStringField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 10
      FieldName = 'IVSerie'
      Size = 10
    end
    object tb_TMPFIVDatVal: TDateField
      DisplayLabel = 'Validade'
      DisplayWidth = 11
      FieldName = 'IVDatVal'
    end
    object tb_TMPFIVValor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'IVValor'
      DisplayFormat = '###,##0.00'
    end
    object tb_TMPFIVCodSer: TIntegerField
      DisplayLabel = 'Servi'#231'o'
      DisplayWidth = 10
      FieldName = 'IVCodSer'
      Visible = False
    end
    object tb_TMPFIVCodApa: TIntegerField
      DisplayLabel = 'Aparelho'
      DisplayWidth = 10
      FieldName = 'IVCodApa'
      Visible = False
    end
    object tb_TMPFIVNumSeq: TIntegerField
      DisplayWidth = 10
      FieldName = 'IVNumSeq'
      Visible = False
    end
  end
  object ds_TEMPF: TDataSource
    DataSet = tb_TMPF
    Left = 694
    Top = 35
  end
  object ds_TMPG: TDataSource
    DataSet = tb_TMPG
    Left = 694
    Top = 63
  end
  object tb_TMPG: TTable
    BeforeOpen = tb_TMPFBeforeOpen
    AfterClose = tb_TMPFAfterClose
    AfterPost = tb_TMPGAfterPost
    AfterDelete = tb_TMPGAfterDelete
    OnNewRecord = tb_TMPGNewRecord
    OnPostError = tb_TMPGPostError
    FieldDefs = <
      item
        Name = 'Nro'
        DataType = ftInteger
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'iNro'
        Fields = 'Nro'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'iData'
        Fields = 'Data'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'Data'
    StoreDefs = True
    Left = 666
    Top = 63
    object tb_TMPGNro: TIntegerField
      DisplayWidth = 8
      FieldName = 'Nro'
    end
    object tb_TMPGData: TDateField
      DisplayWidth = 11
      FieldName = 'Data'
    end
    object tb_TMPGValor: TFloatField
      DisplayWidth = 8
      FieldName = 'Valor'
      DisplayFormat = '###,##0.00'
    end
  end
  object qr_Duplicata: TwwQuery
    AfterOpen = qr_DuplicataAfterOpen
    DataSource = ds_Venda
    SQL.Strings = (
      'SELECT DUNumPar, DUDatVen, DUValDup'
      '  FROM SAFADU'
      ' WHERE DUNumNot = :VENumNot'
      'ORDER BY DUDatVen')
    ValidateWithMask = True
    Left = 584
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VENumNot'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object ds_Duplicata: TwwDataSource
    DataSet = qr_Duplicata
    Left = 612
    Top = 63
  end
  object ActionList1: TActionList
    Left = 614
    Top = 92
    object ac_CtrlN: TAction
      Caption = 'ac_CtrlN'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = ac_CtrlNExecute
    end
    object ac_Esc: TAction
      Caption = 'ac_Esc'
      ShortCut = 27
      OnExecute = ac_EscExecute
    end
    object ac_CtrlS: TAction
      Caption = 'ac_CtrlS'
      ShortCut = 16467
      OnExecute = ac_CtrlSExecute
    end
    object ac_CtrlL: TAction
      Caption = 'ac_CtrlL'
      ShortCut = 16460
    end
    object ac_CtrlA: TAction
      Caption = 'ac_CtrlA'
      ShortCut = 16449
    end
    object ac_PgUp: TAction
      Caption = 'ac_PgUp'
      ShortCut = 33
      OnExecute = ac_PgUpExecute
    end
    object ac_PgDown: TAction
      Caption = 'ac_PgDown'
      ShortCut = 34
      OnExecute = ac_PgDownExecute
    end
    object ac_F8: TAction
      Caption = 'ac_F8'
      ShortCut = 119
    end
  end
end
