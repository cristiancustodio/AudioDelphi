object fm_Busca: Tfm_Busca
  Left = 289
  Top = 204
  Width = 702
  Height = 310
  Caption = 'Busca Geral'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    686
    274)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 5
    Top = 5
    Width = 675
    Height = 264
    Shape = bsFrame
    Style = bsRaised
  end
  object lblBusca: TLabel
    Left = 39
    Top = 20
    Width = 30
    Height = 13
    Caption = 'Busca'
  end
  object bt_Confirma: TSpeedButton
    Left = 329
    Top = 34
    Width = 23
    Height = 23
    Anchors = [akTop, akRight]
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = bt_ConfirmaClick
  end
  object Panel1: TPanel
    Left = 633
    Top = 192
    Width = 41
    Height = 64
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bt_Sair: TSpeedButton
      Left = 4
      Top = 32
      Width = 32
      Height = 26
      Hint = '| Fechar - Alt+F4'
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Technic'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_SairClick
    end
    object bt_Ok: TSpeedButton
      Left = 4
      Top = 6
      Width = 32
      Height = 26
      Hint = '| Confirmar - Enter'
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Technic'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_OkClick
    end
  end
  object edBusca: TEdit
    Left = 39
    Top = 35
    Width = 286
    Height = 21
    TabOrder = 1
    OnChange = edBuscaChange
  end
  object dg_Busca: TDBGrid
    Left = 40
    Top = 72
    Width = 586
    Height = 184
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dg_BuscaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 477
        Visible = True
      end>
  end
  object DataSource: TDataSource
    DataSet = ADOQuery
    Left = 612
    Top = 11
  end
  object ADOQuery: TADOQuery
    Connection = dm_Geral.ADOConnection
    Parameters = <>
    Left = 584
    Top = 11
  end
  object ActionList1: TActionList
    Left = 584
    Top = 39
    object ac_Enter: TAction
      Caption = 'ac_Enter'
      ShortCut = 13
      OnExecute = ac_EnterExecute
    end
    object ac_Esc: TAction
      Caption = 'ac_Esc'
      ShortCut = 27
      OnExecute = ac_EscExecute
    end
  end
end
