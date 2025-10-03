object fm_Cadastro: Tfm_Cadastro
  Left = 0
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastros'
  ClientHeight = 394
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pg_Cadastro: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 370
    ActivePage = pg_Usuario
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TabWidth = 60
    object pg_Usuario: TTabSheet
      Caption = 'Usu'#225'rios'
      ImageIndex = 7
      OnShow = TabSheetShow
      object Bevel23: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel24: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Label38: TLabel
        Left = 62
        Top = 42
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
        FocusControl = ed_CodUsu
      end
      object Label39: TLabel
        Left = 70
        Top = 84
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = ed_DesUsu
      end
      object Label40: TLabel
        Left = 36
        Top = 108
        Width = 62
        Height = 13
        Caption = 'Nome Abrev.'
        FocusControl = DBEdit19
      end
      object Label41: TLabel
        Left = 62
        Top = 132
        Width = 36
        Height = 13
        Caption = 'Fun'#231#227'o'
      end
      object Label43: TLabel
        Left = 22
        Top = 184
        Width = 75
        Height = 13
        Caption = 'Confirma Senha'
      end
      object Label42: TLabel
        Left = 66
        Top = 160
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object ed_CodUsu: TDBEdit
        Left = 104
        Top = 40
        Width = 64
        Height = 21
        DataField = 'USCodUsu'
        DataSource = ds_Usuario
        TabOrder = 0
      end
      object ed_DesUsu: TDBEdit
        Left = 104
        Top = 80
        Width = 353
        Height = 21
        DataField = 'USNome'
        DataSource = ds_Usuario
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
      object DBEdit19: TDBEdit
        Left = 104
        Top = 104
        Width = 233
        Height = 21
        DataField = 'USNomAbr'
        DataSource = ds_Usuario
        TabOrder = 2
      end
      object wwDBComboBox1: TwwDBComboBox
        Left = 104
        Top = 128
        Width = 121
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = False
        AllowClearKey = False
        DataField = 'USFuncao'
        DataSource = ds_Usuario
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'FINANCEIRO'
          'FONOAUDI'#211'LOGA'
          'SECRET'#193'RIA'
          'VENDAS')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object ed_Senha: TEdit
        Left = 103
        Top = 158
        Width = 109
        Height = 21
        CharCase = ecLowerCase
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = False
        TabOrder = 4
      end
      object ed_ConfirmaSenha: TEdit
        Left = 103
        Top = 182
        Width = 109
        Height = 21
        CharCase = ecLowerCase
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = False
        TabOrder = 5
      end
    end
    object pg_Pacientes: TTabSheet
      Caption = 'Pacientes'
      ImageIndex = 2
      OnShow = TabSheetShow
      object pg_CadastroPaciente: TPageControl
        Left = 0
        Top = 0
        Width = 784
        Height = 342
        ActivePage = pg_Paciente
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        object pg_Paciente: TTabSheet
          Caption = 'Paciente'
          OnShow = TabSheetShow
          object d: TBevel
            Left = 4
            Top = 6
            Width = 708
            Height = 318
            Shape = bsFrame
            Style = bsRaised
          end
          object Label7: TLabel
            Left = 56
            Top = 42
            Width = 42
            Height = 13
            Caption = 'Paciente'
            FocusControl = ed_CodPac
          end
          object Label8: TLabel
            Left = 70
            Top = 78
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = ed_DesPac
          end
          object Label9: TLabel
            Left = 74
            Top = 174
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label10: TLabel
            Left = 248
            Top = 174
            Width = 56
            Height = 13
            Caption = 'Nascimento'
            FocusControl = DBEdit4
          end
          object Label11: TLabel
            Left = 52
            Top = 102
            Width = 46
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = DBEdit5
          end
          object Label12: TLabel
            Left = 71
            Top = 126
            Width = 27
            Height = 13
            Caption = 'Bairro'
            FocusControl = DBEdit6
          end
          object Label13: TLabel
            Left = 272
            Top = 126
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = DBEdit7
          end
          object Label14: TLabel
            Left = 551
            Top = 126
            Width = 19
            Height = 13
            Caption = 'Cep'
            FocusControl = DBEdit8
          end
          object Label15: TLabel
            Left = 478
            Top = 126
            Width = 11
            Height = 13
            Caption = 'Uf'
          end
          object Label16: TLabel
            Left = 74
            Top = 150
            Width = 24
            Height = 13
            Caption = 'Fone'
            FocusControl = DBEdit10
          end
          object Label17: TLabel
            Left = 51
            Top = 198
            Width = 47
            Height = 13
            Caption = 'Indica'#231#227'o'
            FocusControl = DBEdit11
          end
          object Label18: TLabel
            Left = 259
            Top = 198
            Width = 47
            Height = 13
            Caption = 'Tipo Doc.'
            FocusControl = DBEdit12
          end
          object Label19: TLabel
            Left = 392
            Top = 198
            Width = 43
            Height = 13
            Caption = 'Nro Doc.'
            FocusControl = DBEdit13
          end
          object Label21: TLabel
            Left = 51
            Top = 271
            Width = 45
            Height = 13
            Caption = 'Admiss'#227'o'
            FocusControl = DBEdit15
          end
          object lblEmpresaLabel: TLabel
            Left = 181
            Top = 270
            Width = 41
            Height = 13
            Hint = 'F2 - Abrir Busca'
            Caption = 'Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = lblEmpresaLabelClick
          end
          object Label23: TLabel
            Left = 392
            Top = 174
            Width = 27
            Height = 13
            Caption = 'Idade'
          end
          object lb_IdadePac: TDBText
            Left = 424
            Top = 174
            Width = 113
            Height = 11
            DataField = 'PC_Idade'
            DataSource = ds_Paciente
          end
          object lblFuncaoLabel: TLabel
            Left = 62
            Top = 221
            Width = 36
            Height = 13
            Cursor = crHandPoint
            Hint = 'F2 - Abrir Busca'
            Caption = 'Fun'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = lblFuncaoLabelClick
          end
          object Label20: TLabel
            Left = 28
            Top = 295
            Width = 70
            Height = 13
            Caption = 'Nova Consulta'
            FocusControl = DBEdit1
          end
          object Label50: TLabel
            Left = 174
            Top = 295
            Width = 31
            Height = 13
            Caption = 'Meses'
          end
          object lblFuncao: TLabel
            Left = 161
            Top = 222
            Width = 36
            Height = 13
            Caption = 'Fun'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblEmpresa: TLabel
            Left = 279
            Top = 270
            Width = 41
            Height = 13
            Caption = 'Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 73
            Top = 246
            Width = 25
            Height = 13
            Caption = 'Setor'
            FocusControl = DBEdit1
          end
          object Label49: TLabel
            Left = 272
            Top = 150
            Width = 32
            Height = 13
            Caption = 'Celular'
            FocusControl = DBEdit26
          end
          object Label73: TLabel
            Left = 452
            Top = 150
            Width = 37
            Height = 13
            Caption = 'Contato'
            FocusControl = DBEdit27
          end
          object ed_CodPac: TDBEdit
            Left = 104
            Top = 40
            Width = 64
            Height = 21
            DataField = 'PCCodPac'
            DataSource = ds_Paciente
            TabOrder = 0
          end
          object ed_DesPac: TDBEdit
            Left = 104
            Top = 74
            Width = 361
            Height = 21
            BiDiMode = bdLeftToRight
            DataField = 'PCNome'
            DataSource = ds_Paciente
            ParentBiDiMode = False
            TabOrder = 1
            OnExit = ed_DesPacExit
            OnKeyPress = ed_DesPacKeyPress
          end
          object DBEdit4: TDBEdit
            Left = 312
            Top = 170
            Width = 64
            Height = 21
            DataField = 'PCDatNas'
            DataSource = ds_Paciente
            TabOrder = 11
          end
          object DBEdit5: TDBEdit
            Left = 104
            Top = 98
            Width = 244
            Height = 21
            DataField = 'PCEndereco'
            DataSource = ds_Paciente
            TabOrder = 2
          end
          object DBEdit6: TDBEdit
            Left = 104
            Top = 122
            Width = 143
            Height = 21
            DataField = 'PCBairro'
            DataSource = ds_Paciente
            TabOrder = 3
          end
          object DBEdit7: TDBEdit
            Left = 312
            Top = 122
            Width = 154
            Height = 21
            DataField = 'PCCidade'
            DataSource = ds_Paciente
            TabOrder = 4
          end
          object DBEdit8: TDBEdit
            Left = 576
            Top = 122
            Width = 89
            Height = 21
            DataField = 'PCCep'
            DataSource = ds_Paciente
            TabOrder = 6
          end
          object DBEdit10: TDBEdit
            Left = 104
            Top = 146
            Width = 101
            Height = 21
            DataField = 'PCFone'
            DataSource = ds_Paciente
            TabOrder = 7
          end
          object DBEdit11: TDBEdit
            Left = 104
            Top = 194
            Width = 143
            Height = 21
            DataField = 'PCIndicacao'
            DataSource = ds_Paciente
            TabOrder = 12
          end
          object DBEdit12: TDBEdit
            Left = 312
            Top = 194
            Width = 64
            Height = 21
            DataField = 'PCTipDoc'
            DataSource = ds_Paciente
            TabOrder = 13
          end
          object DBEdit13: TDBEdit
            Left = 440
            Top = 194
            Width = 184
            Height = 21
            DataField = 'PCNumDoc'
            DataSource = ds_Paciente
            TabOrder = 14
          end
          object DBEdit15: TDBEdit
            Left = 104
            Top = 267
            Width = 65
            Height = 21
            DataField = 'PCMesAnoAdm'
            DataSource = ds_Paciente
            TabOrder = 17
          end
          object DBComboBox1: TDBComboBox
            Left = 494
            Top = 123
            Width = 49
            Height = 19
            Style = csOwnerDrawFixed
            DataField = 'PCUf'
            DataSource = ds_Paciente
            ItemHeight = 13
            Items.Strings = (
              'AC'
              'AL'
              'AM'
              'AP'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MS'
              'MT'
              'PA'
              'PB'
              'PE'
              'PI'
              'PR'
              'RJ'
              'RN'
              'RO'
              'RR'
              'RS'
              'SC'
              'SE'
              'SP'
              'TO')
            TabOrder = 5
          end
          object DBComboBox2: TDBComboBox
            Left = 104
            Top = 170
            Width = 78
            Height = 22
            Style = csOwnerDrawFixed
            DataField = 'PCSexo'
            DataSource = ds_Paciente
            ItemHeight = 16
            Items.Strings = (
              'Masculino'
              'Feminino')
            TabOrder = 10
          end
          object DBEdit1: TDBEdit
            Left = 104
            Top = 291
            Width = 65
            Height = 21
            DataField = 'PCMesNovCon'
            DataSource = ds_Paciente
            TabOrder = 19
          end
          object DBCheckBox1: TDBCheckBox
            Left = 312
            Top = 293
            Width = 169
            Height = 17
            Caption = 'Usu'#225'rio de aparelho auditivo?'
            DataField = 'PCBooUsaApa'
            DataSource = ds_Paciente
            TabOrder = 20
            ValueChecked = 'T'
            ValueUnchecked = 'F'
          end
          object edFuncaoCodigo: TDBEdit
            Left = 104
            Top = 218
            Width = 49
            Height = 21
            Hint = 'F2 - Abrir Busca'
            DataField = 'PCCodFnc'
            DataSource = ds_Paciente
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnEnter = edFuncaoCodigoEnter
            OnExit = edFuncaoCodigoExit
            OnKeyDown = edFuncaoCodigoKeyDown
          end
          object edEmpresaCodigo: TDBEdit
            Left = 228
            Top = 267
            Width = 49
            Height = 21
            Hint = 'F2 - Abrir Busca'
            DataField = 'PCCodEmp'
            DataSource = ds_Paciente
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
            OnEnter = edEmpresaCodigoEnter
            OnExit = edEmpresaCodigoExit
            OnKeyDown = edEmpresaCodigoKeyDown
          end
          object cb_SetorPaciente: TDBLookupComboBox
            Left = 104
            Top = 242
            Width = 375
            Height = 21
            DataField = 'PCCodSet'
            DataSource = ds_Paciente
            KeyField = 'STCodSet'
            ListField = 'STDescricao'
            ListSource = dm_Geral.ds_Setor
            TabOrder = 16
          end
          object DBEdit26: TDBEdit
            Left = 312
            Top = 146
            Width = 101
            Height = 21
            DataField = 'PCFONCEL'
            DataSource = ds_Paciente
            TabOrder = 8
          end
          object DBEdit27: TDBEdit
            Left = 494
            Top = 146
            Width = 101
            Height = 21
            DataField = 'PCFONCON'
            DataSource = ds_Paciente
            TabOrder = 9
          end
        end
        object pg_Anotacao: TTabSheet
          Caption = 'Anota'#231#227'o'
          ImageIndex = 1
          OnShow = pg_AnotacaoShow
          object RichEdit1: TwwDBRichEdit
            Left = 2
            Top = 56
            Width = 712
            Height = 273
            AutoURLDetect = False
            DataField = 'PCAnotacao'
            DataSource = ds_Paciente
            PrintJobName = 'Delphi 7'
            TabOrder = 0
            OnKeyPress = RichEdit1KeyPress
            OnSelectionChange = RichEdit1SelectionChange
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muInches
            PrintMargins.Top = 1.000000000000000000
            PrintMargins.Bottom = 1.000000000000000000
            PrintMargins.Left = 1.000000000000000000
            PrintMargins.Right = 1.000000000000000000
            PrintHeader.VertMargin = 0.500000000000000000
            PrintHeader.Font.Charset = DEFAULT_CHARSET
            PrintHeader.Font.Color = clWindowText
            PrintHeader.Font.Height = -11
            PrintHeader.Font.Name = 'MS Sans Serif'
            PrintHeader.Font.Style = []
            PrintFooter.VertMargin = 0.500000000000000000
            PrintFooter.Font.Charset = DEFAULT_CHARSET
            PrintFooter.Font.Color = clWindowText
            PrintFooter.Font.Height = -11
            PrintFooter.Font.Name = 'MS Sans Serif'
            PrintFooter.Font.Style = []
            RichEditVersion = 2
            Data = {
              730000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C66305C667331365C7061720D0A7D0D0A00}
          end
          object FormatBarAnotacao: TPanel
            Left = 0
            Top = 24
            Width = 757
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object BoldButton: TSpeedButton
              Left = 313
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Flat = True
              Glyph.Data = {
                CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                0400000000005800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888880
                0000800000000880000088000880008000008800088000800000880008800080
                0000880000000880000088000880008000008800088000800000880008800080
                000080000000088000008888888888800000}
              Margin = 4
              ParentShowHint = False
              ShowHint = False
              OnClick = BoldButtonClick
            end
            object ItalicButton: TSpeedButton
              Left = 336
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 3
              Flat = True
              Glyph.Data = {
                CE000000424DCE0000000000000076000000280000000F0000000B0000000100
                0400000000005800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8880800000088888888088800088888888808888000888888880888880008888
                8880888888000888888088888880008888808888888800088880888888888000
                888088888888000000808888888888888880}
              Margin = 2
              ParentShowHint = False
              ShowHint = False
              OnClick = ItalicButtonClick
            end
            object UnderlineButton: TSpeedButton
              Left = 359
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 2
              Flat = True
              Glyph.Data = {
                EE000000424DEE0000000000000076000000280000000B0000000F0000000100
                0400000000007800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888880
                0000800000000080000088888888888000008880000088800000880088800880
                0000880088800880000088008880088000008800888008800000880088800880
                0000880088800880000088008880088000008000080000800000888888888880
                000088888888888000008888888888800000}
              Margin = 4
              ParentShowHint = False
              ShowHint = False
              OnClick = UnderlineButtonClick
            end
            object ColorButton: TSpeedButton
              Left = 382
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888880000008000800088888888880000008808880888888888880000008800
                0008000008888800000088808080BFBFB0088800000088800080808BFBF08800
                0000888808880E0808B08800000088880880808090FB0800000088888000BFB8
                08BF0800000088880BFBFBFB808B0800000088880F808FBF080F080000008888
                0B050808808B0800000088880F8080D0BFB088000000888880FBF808FB088800
                000088888800BFBF008888000000888888880000888888000000888888888888
                888888000000888888888888888888000000}
              Margin = 1
              ParentShowHint = False
              ShowHint = False
              OnClick = ColorButtonClick
            end
            object Bevel6: TBevel
              Left = 408
              Top = -1
              Width = 2
              Height = 24
            end
            object LeftButton: TSpeedButton
              Left = 413
              Top = 1
              Width = 23
              Height = 22
              GroupIndex = 4
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000C000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                0000888888888888000088888888888800000000000000080000888888888888
                0000000000008888000088888888888800000000000000080000888888888888
                0000000000008888000088888888888800000000000000080000888888888888
                0000000000008888000088888888888800008888888888880000}
              Margin = 4
              ParentShowHint = False
              ShowHint = False
              OnClick = LeftButtonClick
            end
            object CenterButton: TSpeedButton
              Left = 436
              Top = 1
              Width = 23
              Height = 22
              GroupIndex = 4
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000D000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8000888888888888800088888888888880008000000000008000888888888888
                8000888800000888800088888888888880008000000000008000888888888888
                8000888000000088800088888888888880008000000000008000888888888888
                8000888800000888800088888888888880008888888888888000}
              Margin = 4
              ParentShowHint = False
              ShowHint = False
              OnClick = CenterButtonClick
            end
            object RightButton: TSpeedButton
              Left = 459
              Top = 1
              Width = 23
              Height = 22
              GroupIndex = 4
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000D000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8000888888888888800088888888888880008000000000008000888888888888
                8000888800000000800088888888888880008000000000008000888888888888
                8000888800000000800088888888888880008000000000008000888888888888
                8000888800000000800088888888888880008888888888888000}
              Margin = 4
              ParentShowHint = False
              ShowHint = False
              OnClick = RightButtonClick
            end
            object JustifyButton: TSpeedButton
              Left = 482
              Top = 1
              Width = 23
              Height = 22
              GroupIndex = 4
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000D000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8000888888888888800088888888888880008000000000008000888888888888
                8000800000000000800088888888888880008000000000008000888888888888
                8000800000000000800088888888888880008000000000008000888888888888
                8000800000000000800088888888888880008888888888888000}
              Margin = 4
              ParentShowHint = False
              ShowHint = False
            end
            object BulletButton: TSpeedButton
              Left = 512
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 5
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888444888888888888844488000000008884448888888
                8888888888888888888888888888888888888844488888888888884448800000
                0008884448888888888888888888888888888888888888888888884448888888
                8888884448800000000888444888888888888888888888888888}
              Margin = 1
              ParentShowHint = False
              ShowHint = False
              OnClick = BulletButtonClick
            end
            object Bevel7: TBevel
              Left = 508
              Top = -1
              Width = 2
              Height = 24
            end
            object HighlightButton: TSpeedButton
              Left = 536
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 5
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
                BBBB999999999999999999000009999999999908FFF09999999999908FC70999
                999999990CC770999999999990C7270999999999990FF270999999999990FF27
                0999999999990FF0C09999999999900FC0999999999999000999}
              Margin = 1
              ParentShowHint = False
              ShowHint = False
              OnClick = HighlightButtonClick
            end
            object FontNameCombo: TwwDBComboBox
              Left = 6
              Top = 2
              Width = 241
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DropDownCount = 20
              ItemHeight = 0
              ParentShowHint = False
              ShowHint = False
              Sorted = True
              TabOrder = 0
              UnboundDataType = wwDefault
              OnCloseUp = FontNameComboCloseUp
            end
            object FontSizeCombo: TwwDBComboBox
              Left = 255
              Top = 2
              Width = 50
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                '8'
                '9'
                '10'
                '11'
                '12'
                '14'
                '16'
                '18'
                '20'
                '22'
                '24'
                '26'
                '28'
                '36'
                '48'
                '72')
              ParentShowHint = False
              ShowHint = False
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
              OnCloseUp = FontSizeComboCloseUp
            end
          end
          object ToolbarAnotacao: TPanel
            Left = 0
            Top = 0
            Width = 757
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object PrintButton: TSpeedButton
              Left = 6
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888800000000000888808888888880808800000000000008080888888BBB88
                0008088888877788080800000000000008800888888888808080800000000008
                0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
                088888880FFFFFFFF08888888000000000888888888888888888}
              Margin = 2
              ParentShowHint = False
              ShowHint = False
              OnClick = Print1Click
            end
            object FindButton: TSpeedButton
              Left = 32
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000F000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8880000008888800000008000888880800000800088888080000000000080000
                0000808000000800000000800080080000000080008008000000800000000000
                0080880800080800088088000008000008808880008880008880888080888080
                8880888000888000888088888888888888808888888888888880}
              Margin = 2
              ParentShowHint = False
              ShowHint = False
              OnClick = FindButtonClick
            end
            object CutButton: TSpeedButton
              Left = 62
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000D000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8000888008888888800088088088008880008808808088088000880880808808
                8000888000808808800088888080008880008888800088888000888888088888
                8000888880008888800088888080888880008888008008888000888808880888
                8000888808880888800088880888088880008888888888888000}
              Margin = 3
              ParentShowHint = False
              ShowHint = False
              OnClick = CutButtonClick
            end
            object CopyButton: TSpeedButton
              Left = 85
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333300000000033333330FFFFFFF033333330F000
                00F030000000FFFFFFF030FFFFF0F00000F030F00000FFFFFFF030FFFFF0F00F
                000030F00000FFFF0F0330FFFFF0FFFF003330F00F000000033330FFFF0F0333
                333330FFFF003333333330000003333333333333333333333333}
              Margin = 1
              ParentShowHint = False
              ShowHint = False
              OnClick = CopyButtonClick
            end
            object UndoButton: TSpeedButton
              Left = 139
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                F6000000424DF60000000000000076000000280000000E000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8800888888888888880088888888888888008888888888888800888888888888
                8800888888888880880080000088888088008000088888880800800088888888
                0800800808888888080080888008888088008888888000088800888888888888
                8800888888888888880088888888888888008888888888888800}
              Margin = 3
              ParentShowHint = False
              ShowHint = False
              OnClick = UndoButtonClick
            end
            object PasteButton: TSpeedButton
              Left = 108
              Top = 1
              Width = 23
              Height = 22
              AllowAllUp = True
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                888888888800000000008000000FFFFFFFF00737370F000000F00373730FFFFF
                FFF00737370F000F00000373730FFFFF0F080737370FFFFF0088037373000000
                0088073737373737308803F0000000077088077088888807308803730B00B073
                7088800000BB0000088888888000088888888888888888888888}
              Margin = 2
              ParentShowHint = False
              ShowHint = False
              OnClick = PasteButtonClick
            end
            object ToolbarBevel1: TBevel
              Left = 57
              Top = 1
              Width = 2
              Height = 22
            end
            object Bevel11: TBevel
              Left = 134
              Top = 1
              Width = 2
              Height = 22
            end
          end
        end
        object pg_PacienteContato: TTabSheet
          Caption = 'Contatos'
          ImageIndex = 2
          OnShow = TabSheetShow
          object Bevel10: TBevel
            Left = 4
            Top = 6
            Width = 708
            Height = 318
            Shape = bsFrame
            Style = bsRaised
          end
          object Label88: TLabel
            Left = 78
            Top = 70
            Width = 21
            Height = 13
            Caption = 'Tipo'
          end
          object Label89: TLabel
            Left = 66
            Top = 128
            Width = 33
            Height = 13
            Caption = 'Fone 1'
            FocusControl = ed_FonePacienteContato
          end
          object Label90: TLabel
            Left = 62
            Top = 100
            Width = 37
            Height = 13
            Caption = 'Contato'
            FocusControl = DBEdit53
          end
          object Label91: TLabel
            Left = 230
            Top = 128
            Width = 33
            Height = 13
            Caption = 'Fone 2'
            FocusControl = DBEdit52
          end
          object Label92: TLabel
            Left = 395
            Top = 128
            Width = 33
            Height = 13
            Caption = 'Fone 3'
            FocusControl = DBEdit54
          end
          object DBText1: TDBText
            Left = 107
            Top = 35
            Width = 50
            Height = 13
            AutoSize = True
            DataField = 'PCNome'
            DataSource = ds_Paciente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label93: TLabel
            Left = 57
            Top = 34
            Width = 42
            Height = 13
            Caption = 'Paciente'
          end
          object ed_FonePacienteContato: TDBEdit
            Left = 107
            Top = 125
            Width = 101
            Height = 21
            DataField = 'PCCOFone1'
            DataSource = ds_PacienteContato
            TabOrder = 2
          end
          object DBEdit53: TDBEdit
            Left = 107
            Top = 97
            Width = 433
            Height = 21
            DataField = 'PCCOContato'
            DataSource = ds_PacienteContato
            TabOrder = 1
          end
          object cb_PacienteContatoTipoContato: TwwDBLookupCombo
            Left = 107
            Top = 67
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TPCONome'#9'10'#9'TPCONome'#9#9)
            DataField = 'PCCOTipo'
            DataSource = ds_PacienteContato
            LookupTable = dm_Geral.tb_TipoContato
            LookupField = 'TPCOTipo'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
          object DBEdit52: TDBEdit
            Left = 274
            Top = 125
            Width = 101
            Height = 21
            DataField = 'PCCOFone2'
            DataSource = ds_PacienteContato
            TabOrder = 3
          end
          object DBEdit54: TDBEdit
            Left = 439
            Top = 125
            Width = 101
            Height = 21
            DataField = 'PCCOFone3'
            DataSource = ds_PacienteContato
            TabOrder = 4
          end
          object wwDBGrid1: TwwDBGrid
            Left = 48
            Top = 160
            Width = 616
            Height = 151
            Selected.Strings = (
              'TPCONome'#9'10'#9'Tipo'
              'PCCOContato'#9'37'#9'Contato'
              'PCCOFone1'#9'14'#9'Fone 1'
              'PCCOFone2'#9'14'#9'Fone 2'
              'PCCOFone3'#9'14'#9'Fone 3')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = ds_qr_PacienteContatoGrade
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 5
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
          end
        end
      end
    end
    object pg_Empresa: TTabSheet
      Caption = 'Empresas'
      ImageIndex = 1
      OnShow = TabSheetShow
      object Bevel2: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel3: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Label24: TLabel
        Left = 56
        Top = 43
        Width = 41
        Height = 13
        Caption = 'Empresa'
        FocusControl = ed_CodEmp
      end
      object Label25: TLabel
        Left = 66
        Top = 84
        Width = 31
        Height = 13
        Caption = 'Raz'#227'o'
        FocusControl = ed_DesEmp
      end
      object Label26: TLabel
        Left = 57
        Top = 108
        Width = 40
        Height = 13
        Caption = 'Fantasia'
        FocusControl = DBEdit3
      end
      object Label27: TLabel
        Left = 51
        Top = 132
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit9
      end
      object Label28: TLabel
        Left = 70
        Top = 180
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit16
      end
      object Label29: TLabel
        Left = 64
        Top = 156
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit17
      end
      object Label30: TLabel
        Left = 477
        Top = 180
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = DBEdit18
      end
      object Label31: TLabel
        Left = 485
        Top = 156
        Width = 11
        Height = 13
        Caption = 'Uf'
      end
      object Label32: TLabel
        Left = 73
        Top = 204
        Width = 24
        Height = 13
        Caption = 'Fone'
        FocusControl = DBEdit20
      end
      object Label33: TLabel
        Left = 208
        Top = 204
        Width = 17
        Height = 13
        Caption = 'Fax'
        FocusControl = DBEdit21
      end
      object Label34: TLabel
        Left = 60
        Top = 274
        Width = 37
        Height = 13
        Caption = 'Contato'
        FocusControl = DBEdit22
      end
      object Label35: TLabel
        Left = 472
        Top = 274
        Width = 24
        Height = 13
        Caption = 'Fone'
        FocusControl = DBEdit23
      end
      object Label36: TLabel
        Left = 195
        Top = 300
        Width = 70
        Height = 13
        Caption = 'Nova Consulta'
        FocusControl = DBEdit24
      end
      object Label37: TLabel
        Left = 328
        Top = 300
        Width = 31
        Height = 13
        Caption = 'Meses'
      end
      object Label81: TLabel
        Left = 70
        Top = 300
        Width = 27
        Height = 13
        Caption = 'In'#237'cio'
      end
      object Label80: TLabel
        Left = 438
        Top = 204
        Width = 58
        Height = 13
        Caption = 'Caixa Postal'
        FocusControl = DBEdit44
      end
      object Label83: TLabel
        Left = 75
        Top = 228
        Width = 22
        Height = 13
        Caption = 'CGC'
        FocusControl = DBEdit47
      end
      object Label84: TLabel
        Left = 453
        Top = 228
        Width = 43
        Height = 13
        Caption = 'Inscri'#231#227'o'
        FocusControl = DBEdit48
      end
      object Label85: TLabel
        Left = 64
        Top = 251
        Width = 28
        Height = 13
        Caption = 'e-Mail'
        FocusControl = DBEdit49
      end
      object Label86: TLabel
        Left = 413
        Top = 251
        Width = 83
        Height = 13
        Caption = 'Encaminhado por'
        FocusControl = DBEdit50
      end
      object Label87: TLabel
        Left = 442
        Top = 300
        Width = 54
        Height = 13
        Caption = 'Meio Pagto'
        FocusControl = DBEdit51
      end
      object ed_CodEmp: TDBEdit
        Left = 104
        Top = 40
        Width = 64
        Height = 21
        DataField = 'EMCodEmp'
        DataSource = ds_Empresa
        TabOrder = 0
      end
      object ed_DesEmp: TDBEdit
        Left = 104
        Top = 80
        Width = 433
        Height = 21
        DataField = 'EMRazao'
        DataSource = ds_Empresa
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 104
        Top = 104
        Width = 433
        Height = 21
        DataField = 'EMFantasia'
        DataSource = ds_Empresa
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 104
        Top = 128
        Width = 433
        Height = 21
        DataField = 'EMEndereco'
        DataSource = ds_Empresa
        TabOrder = 3
      end
      object DBEdit16: TDBEdit
        Left = 104
        Top = 176
        Width = 265
        Height = 21
        DataField = 'EMBairro'
        DataSource = ds_Empresa
        TabOrder = 6
      end
      object DBEdit17: TDBEdit
        Left = 104
        Top = 152
        Width = 265
        Height = 21
        DataField = 'EMCidade'
        DataSource = ds_Empresa
        TabOrder = 4
      end
      object DBEdit18: TDBEdit
        Left = 504
        Top = 176
        Width = 58
        Height = 21
        DataField = 'EMCep'
        DataSource = ds_Empresa
        TabOrder = 7
      end
      object DBEdit20: TDBEdit
        Left = 104
        Top = 200
        Width = 88
        Height = 21
        DataField = 'EMFone'
        DataSource = ds_Empresa
        TabOrder = 8
      end
      object DBEdit21: TDBEdit
        Left = 232
        Top = 200
        Width = 88
        Height = 21
        DataField = 'EMFax'
        DataSource = ds_Empresa
        TabOrder = 9
      end
      object DBEdit22: TDBEdit
        Left = 104
        Top = 270
        Width = 337
        Height = 21
        DataField = 'EMContato'
        DataSource = ds_Empresa
        TabOrder = 15
      end
      object DBEdit23: TDBEdit
        Left = 504
        Top = 270
        Width = 88
        Height = 21
        DataField = 'EMFoneCon'
        DataSource = ds_Empresa
        TabOrder = 16
      end
      object DBEdit24: TDBEdit
        Left = 272
        Top = 296
        Width = 49
        Height = 21
        DataField = 'EMMesNovCon'
        DataSource = ds_Empresa
        TabOrder = 18
      end
      object DBComboBox3: TDBComboBox
        Left = 504
        Top = 152
        Width = 43
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'EMUf'
        DataSource = ds_Empresa
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 104
        Top = 296
        Width = 65
        Height = 21
        DataField = 'EMMesAnoIni'
        DataSource = ds_Empresa
        ParentShowHint = False
        ShowHint = False
        TabOrder = 17
      end
      object DBEdit44: TDBEdit
        Left = 504
        Top = 200
        Width = 43
        Height = 21
        DataField = 'EMCAIPOS'
        DataSource = ds_Empresa
        TabOrder = 10
      end
      object DBEdit47: TDBEdit
        Left = 104
        Top = 224
        Width = 162
        Height = 21
        DataField = 'EMCGC'
        DataSource = ds_Empresa
        TabOrder = 11
      end
      object DBEdit48: TDBEdit
        Left = 504
        Top = 224
        Width = 171
        Height = 21
        DataField = 'EMInscricao'
        DataSource = ds_Empresa
        TabOrder = 12
      end
      object DBEdit49: TDBEdit
        Left = 104
        Top = 247
        Width = 262
        Height = 21
        DataField = 'EMEmail'
        DataSource = ds_Empresa
        TabOrder = 13
      end
      object DBEdit50: TDBEdit
        Left = 504
        Top = 247
        Width = 171
        Height = 21
        DataField = 'EMEncPor'
        DataSource = ds_Empresa
        TabOrder = 14
      end
      object DBEdit51: TDBEdit
        Left = 504
        Top = 296
        Width = 171
        Height = 21
        DataField = 'EMMEIPAG'
        DataSource = ds_Empresa
        TabOrder = 19
      end
    end
    object pg_Convenio: TTabSheet
      Caption = 'Conv'#234'nios'
      ImageIndex = 3
      OnShow = TabSheetShow
      object Bevel15: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel16: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Label1: TLabel
        Left = 62
        Top = 40
        Width = 45
        Height = 13
        Caption = 'Conv'#234'nio'
        FocusControl = ed_CodCon
      end
      object Label2: TLabel
        Left = 59
        Top = 67
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesCon
      end
      object ed_CodCon: TDBEdit
        Left = 110
        Top = 36
        Width = 64
        Height = 21
        DataField = 'CVCodCon'
        DataSource = ds_Convenio
        TabOrder = 0
      end
      object ed_DesCon: TDBEdit
        Left = 110
        Top = 63
        Width = 299
        Height = 21
        DataField = 'CVDescricao'
        DataSource = ds_Convenio
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
    end
    object pg_Patologia: TTabSheet
      Caption = 'Patologias'
      ImageIndex = 4
      OnShow = TabSheetShow
      object Bevel17: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel18: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Label3: TLabel
        Left = 62
        Top = 39
        Width = 44
        Height = 13
        Caption = 'Patologia'
        FocusControl = ed_CodPat
      end
      object Label4: TLabel
        Left = 58
        Top = 66
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesPat
      end
      object ed_CodPat: TDBEdit
        Left = 110
        Top = 36
        Width = 64
        Height = 21
        DataField = 'PTCodPat'
        DataSource = ds_Patologia
        TabOrder = 0
      end
      object ed_DesPat: TDBEdit
        Left = 110
        Top = 63
        Width = 299
        Height = 21
        DataField = 'PTDescricao'
        DataSource = ds_Patologia
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
    end
    object pg_Meatoscopia: TTabSheet
      Caption = 'Meatosc.'
      ImageIndex = 5
      OnShow = TabSheetShow
      object Bevel19: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel20: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Label44: TLabel
        Left = 44
        Top = 40
        Width = 61
        Height = 13
        Caption = 'Meatoscopia'
        FocusControl = ed_CodMea
      end
      object Label45: TLabel
        Left = 57
        Top = 67
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesMea
      end
      object ed_CodMea: TDBEdit
        Left = 110
        Top = 36
        Width = 64
        Height = 21
        DataField = 'MTCodMea'
        DataSource = ds_Meatoscopia
        TabOrder = 0
      end
      object ed_DesMea: TDBEdit
        Left = 110
        Top = 63
        Width = 395
        Height = 21
        DataField = 'MTDescricao'
        DataSource = ds_Meatoscopia
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
    end
    object pg_Funcao: TTabSheet
      Caption = 'Fun'#231#245'es'
      ImageIndex = 7
      OnShow = TabSheetShow
      object Bevel13: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel14: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Label47: TLabel
        Left = 64
        Top = 40
        Width = 43
        Height = 13
        Caption = 'Profiss'#227'o'
        FocusControl = ed_CodFnc
      end
      object Label48: TLabel
        Left = 59
        Top = 67
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesFnc
      end
      object ed_CodFnc: TDBEdit
        Left = 110
        Top = 36
        Width = 64
        Height = 21
        DataField = 'FCCodFnc'
        DataSource = ds_Funcao
        TabOrder = 0
      end
      object ed_DesFnc: TDBEdit
        Left = 110
        Top = 63
        Width = 299
        Height = 21
        DataField = 'FCDescricao'
        DataSource = ds_Funcao
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
    end
    object pg_Aparelho: TTabSheet
      Caption = 'Aparelhos'
      ImageIndex = 10
      OnShow = TabSheetShow
      object Bevel31: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel32: TBevel
        Left = 6
        Top = 1
        Width = 773
        Height = 4
        Shape = bsBottomLine
      end
      object Label77: TLabel
        Left = 56
        Top = 44
        Width = 42
        Height = 13
        Caption = 'Aparelho'
        FocusControl = ed_CodApa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label78: TLabel
        Left = 50
        Top = 71
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesApa
      end
      object Label79: TLabel
        Left = 63
        Top = 95
        Width = 35
        Height = 13
        Caption = 'Modelo'
        FocusControl = DBEdit37
      end
      object lblMarcaLabel: TLabel
        Left = 68
        Top = 118
        Width = 30
        Height = 13
        Cursor = crHandPoint
        Hint = 'F2 - Abrir Busca'
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = lblMarcaLabelClick
      end
      object lblMarca: TLabel
        Left = 161
        Top = 118
        Width = 30
        Height = 13
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ed_CodApa: TDBEdit
        Left = 104
        Top = 40
        Width = 64
        Height = 21
        DataField = 'APCodApa'
        DataSource = ds_Aparelho
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object ed_DesApa: TDBEdit
        Left = 104
        Top = 67
        Width = 311
        Height = 21
        DataField = 'APDescricao'
        DataSource = ds_Aparelho
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
      object DBEdit37: TDBEdit
        Left = 104
        Top = 91
        Width = 311
        Height = 21
        DataField = 'APModelo'
        DataSource = ds_Aparelho
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object pn_Controle: TPanel
        Left = 102
        Top = 149
        Width = 392
        Height = 155
        BevelOuter = bvNone
        Caption = 'pn_Controle'
        TabOrder = 4
        object DBGrid3: TDBGrid
          Left = 2
          Top = 1
          Width = 375
          Height = 152
          TabStop = False
          DataSource = ds_Controle
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODescricao'
              Width = 171
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUniMed'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COControle'
              Width = 88
              Visible = True
            end>
        end
      end
      object pn_TMPA: TPanel
        Left = 103
        Top = 149
        Width = 392
        Height = 155
        BevelOuter = bvNone
        Caption = 'pn_TMPA'
        TabOrder = 5
        Visible = False
        object dg_TMPA: TDBGrid
          Left = 10
          Top = 1
          Width = 375
          Height = 152
          Ctl3D = True
          DataSource = ds_TMPA
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColExit = dg_TMPAColExit
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 172
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UniMed'
              PickList.Strings = (
                'Graus'
                'DB'
                'N'#237'vel')
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Controle'
              Width = 88
              Visible = True
            end>
        end
      end
      object ed_MarcaCodigo: TDBEdit
        Left = 104
        Top = 115
        Width = 49
        Height = 21
        Hint = 'F2 - Abrir Busca'
        DataField = 'APCodMar'
        DataSource = ds_Aparelho
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = ed_MarcaCodigoEnter
        OnExit = edFuncaoCodigoExit
        OnKeyDown = ed_MarcaCodigoKeyDown
      end
    end
    object pg_Marca: TTabSheet
      Caption = 'Marcas'
      ImageIndex = 11
      OnShow = TabSheetShow
      object Bevel29: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel30: TBevel
        Left = 6
        Top = 1
        Width = 773
        Height = 4
        Shape = bsBottomLine
      end
      object Label75: TLabel
        Left = 68
        Top = 44
        Width = 30
        Height = 13
        Caption = 'Marca'
        FocusControl = ed_CodMar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label76: TLabel
        Left = 50
        Top = 71
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesMar
      end
      object ed_CodMar: TDBEdit
        Left = 104
        Top = 40
        Width = 64
        Height = 21
        DataField = 'MACodMar'
        DataSource = ds_Marca
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object ed_DesMar: TDBEdit
        Left = 104
        Top = 67
        Width = 311
        Height = 21
        DataField = 'MADescricao'
        DataSource = ds_Marca
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object pg_Comprador: TTabSheet
      Caption = 'Comprad.'
      ImageIndex = 9
      OnShow = TabSheetShow
      object Bevel22: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel21: TBevel
        Left = 6
        Top = 1
        Width = 773
        Height = 4
        Shape = bsBottomLine
      end
      object Label5: TLabel
        Left = 47
        Top = 42
        Width = 51
        Height = 13
        Caption = 'Comprador'
        FocusControl = DBEdit14
      end
      object Label6: TLabel
        Left = 70
        Top = 84
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = ed_NomCom
      end
      object Label52: TLabel
        Left = 52
        Top = 108
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit28
      end
      object Label53: TLabel
        Left = 71
        Top = 132
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit29
      end
      object Label54: TLabel
        Left = 272
        Top = 132
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit31
      end
      object Label55: TLabel
        Left = 79
        Top = 156
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = DBEdit32
      end
      object Label56: TLabel
        Left = 424
        Top = 156
        Width = 11
        Height = 13
        Caption = 'Uf'
      end
      object Label57: TLabel
        Left = 280
        Top = 156
        Width = 24
        Height = 13
        Caption = 'Fone'
        FocusControl = DBEdit33
      end
      object Label74: TLabel
        Left = 51
        Top = 182
        Width = 47
        Height = 13
        Caption = 'Tipo Doc.'
        FocusControl = DBEdit45
      end
      object Label82: TLabel
        Left = 56
        Top = 206
        Width = 43
        Height = 13
        Caption = 'Nro Doc.'
        FocusControl = DBEdit46
      end
      object DBEdit14: TDBEdit
        Left = 104
        Top = 40
        Width = 54
        Height = 21
        DataField = 'PCCodPac'
        DataSource = ds_Comprador
        TabOrder = 0
      end
      object ed_NomCom: TDBEdit
        Left = 104
        Top = 80
        Width = 351
        Height = 21
        BiDiMode = bdLeftToRight
        DataField = 'PCNome'
        DataSource = ds_Comprador
        ParentBiDiMode = False
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
      object DBEdit28: TDBEdit
        Left = 104
        Top = 104
        Width = 234
        Height = 21
        DataField = 'PCEndereco'
        DataSource = ds_Comprador
        TabOrder = 2
      end
      object DBEdit29: TDBEdit
        Left = 104
        Top = 128
        Width = 133
        Height = 21
        DataField = 'PCBairro'
        DataSource = ds_Comprador
        TabOrder = 3
      end
      object DBEdit31: TDBEdit
        Left = 312
        Top = 128
        Width = 144
        Height = 21
        DataField = 'PCCidade'
        DataSource = ds_Comprador
        TabOrder = 4
      end
      object DBEdit32: TDBEdit
        Left = 104
        Top = 152
        Width = 89
        Height = 21
        DataField = 'PCCep'
        DataSource = ds_Comprador
        TabOrder = 5
      end
      object DBEdit33: TDBEdit
        Left = 312
        Top = 152
        Width = 91
        Height = 21
        DataField = 'PCFone'
        DataSource = ds_Comprador
        MaxLength = 13
        TabOrder = 6
      end
      object DBEdit45: TDBEdit
        Left = 104
        Top = 178
        Width = 54
        Height = 21
        DataField = 'PCTipDoc'
        DataSource = ds_Comprador
        TabOrder = 8
      end
      object DBEdit46: TDBEdit
        Left = 104
        Top = 202
        Width = 174
        Height = 21
        DataField = 'PCNumDoc'
        DataSource = ds_Comprador
        TabOrder = 9
      end
      object DBComboBox4: TDBComboBox
        Left = 440
        Top = 152
        Width = 39
        Height = 19
        Style = csOwnerDrawFixed
        DataField = 'PCUf'
        DataSource = ds_Comprador
        ItemHeight = 13
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 7
      end
    end
    object pg_Fornecedor: TTabSheet
      Caption = 'Fornecedor.'
      ImageIndex = 8
      OnShow = TabSheetShow
      object Bevel25: TBevel
        Left = 6
        Top = 1
        Width = 773
        Height = 4
        Shape = bsBottomLine
      end
      object Bevel26: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Label58: TLabel
        Left = 45
        Top = 44
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
        FocusControl = ed_CodFor
      end
      object Label59: TLabel
        Left = 71
        Top = 85
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = ed_NomFor
      end
      object Label60: TLabel
        Left = 53
        Top = 133
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit30
      end
      object Label61: TLabel
        Left = 72
        Top = 157
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit34
      end
      object Label62: TLabel
        Left = 66
        Top = 109
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit35
      end
      object Label63: TLabel
        Left = 398
        Top = 133
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = DBEdit36
      end
      object Label64: TLabel
        Left = 403
        Top = 109
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      object Label65: TLabel
        Left = 77
        Top = 181
        Width = 22
        Height = 13
        Caption = 'CGC'
        FocusControl = DBEdit38
      end
      object Label66: TLabel
        Left = 232
        Top = 181
        Width = 43
        Height = 13
        Caption = 'Inscri'#231#227'o'
        FocusControl = DBEdit39
      end
      object Label67: TLabel
        Left = 375
        Top = 205
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit40
      end
      object Label68: TLabel
        Left = 73
        Top = 205
        Width = 26
        Height = 13
        Caption = 'Telex'
        FocusControl = DBEdit41
      end
      object Label69: TLabel
        Left = 256
        Top = 205
        Width = 17
        Height = 13
        Caption = 'Fax'
        FocusControl = DBEdit42
      end
      object Label70: TLabel
        Left = 62
        Top = 229
        Width = 37
        Height = 13
        Caption = 'Contato'
        FocusControl = DBEdit43
      end
      object ed_CodFor: TDBEdit
        Left = 104
        Top = 40
        Width = 64
        Height = 21
        DataField = 'FOCodFor'
        DataSource = ds_Fornecedor
        TabOrder = 0
      end
      object ed_NomFor: TDBEdit
        Left = 104
        Top = 81
        Width = 244
        Height = 21
        DataField = 'FONome'
        DataSource = ds_Fornecedor
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
      object DBEdit30: TDBEdit
        Left = 104
        Top = 129
        Width = 244
        Height = 21
        DataField = 'FOEndereco'
        DataSource = ds_Fornecedor
        TabOrder = 4
      end
      object DBEdit34: TDBEdit
        Left = 104
        Top = 153
        Width = 154
        Height = 21
        DataField = 'FOBairro'
        DataSource = ds_Fornecedor
        TabOrder = 6
      end
      object DBEdit35: TDBEdit
        Left = 104
        Top = 105
        Width = 214
        Height = 21
        DataField = 'FOCidade'
        DataSource = ds_Fornecedor
        TabOrder = 2
      end
      object DBEdit36: TDBEdit
        Left = 422
        Top = 129
        Width = 82
        Height = 21
        DataField = 'FOCep'
        DataSource = ds_Fornecedor
        TabOrder = 5
      end
      object DBEdit38: TDBEdit
        Left = 104
        Top = 177
        Width = 118
        Height = 21
        DataField = 'FOCGC'
        DataSource = ds_Fornecedor
        MaxLength = 18
        TabOrder = 7
      end
      object DBEdit39: TDBEdit
        Left = 280
        Top = 177
        Width = 100
        Height = 21
        DataField = 'FOInscricao'
        DataSource = ds_Fornecedor
        TabOrder = 8
      end
      object DBEdit40: TDBEdit
        Left = 422
        Top = 201
        Width = 82
        Height = 21
        DataField = 'FOTelefone'
        DataSource = ds_Fornecedor
        TabOrder = 11
      end
      object DBEdit41: TDBEdit
        Left = 104
        Top = 201
        Width = 82
        Height = 21
        DataField = 'FOTelex'
        DataSource = ds_Fornecedor
        TabOrder = 9
      end
      object DBEdit42: TDBEdit
        Left = 280
        Top = 201
        Width = 82
        Height = 21
        DataField = 'FOFax'
        DataSource = ds_Fornecedor
        TabOrder = 10
      end
      object DBEdit43: TDBEdit
        Left = 104
        Top = 225
        Width = 401
        Height = 21
        DataField = 'FOContato'
        DataSource = ds_Fornecedor
        TabOrder = 12
      end
      object DBComboBox5: TDBComboBox
        Left = 422
        Top = 106
        Width = 49
        Height = 19
        Style = csOwnerDrawFixed
        DataField = 'FOUF'
        DataSource = ds_Fornecedor
        ItemHeight = 13
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 3
      end
    end
    object pg_Despesa: TTabSheet
      Caption = 'Despesas'
      ImageIndex = 9
      OnShow = TabSheetShow
      object Bevel27: TBevel
        Left = 6
        Top = 1
        Width = 773
        Height = 4
        Shape = bsBottomLine
      end
      object Bevel28: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Label71: TLabel
        Left = 56
        Top = 44
        Width = 42
        Height = 13
        Caption = 'Despesa'
        FocusControl = ed_CodDes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label72: TLabel
        Left = 50
        Top = 71
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesDes
      end
      object ed_CodDes: TDBEdit
        Left = 104
        Top = 40
        Width = 64
        Height = 21
        DataField = 'DECodDes'
        DataSource = ds_Despesa
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object ed_DesDes: TDBEdit
        Left = 104
        Top = 67
        Width = 311
        Height = 21
        DataField = 'DEDescricao'
        DataSource = ds_Despesa
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object pg_Servico: TTabSheet
      Caption = 'Servi'#231'os'
      ImageIndex = 12
      OnShow = TabSheetShow
      object Bevel33: TBevel
        Left = -59
        Top = 1
        Width = 839
        Height = 4
        Shape = bsBottomLine
      end
      object Bevel34: TBevel
        Left = 6
        Top = 10
        Width = 728
        Height = 320
        Shape = bsFrame
        Style = bsRaised
      end
      object Label46: TLabel
        Left = 62
        Top = 40
        Width = 36
        Height = 13
        Caption = 'Servi'#231'o'
        FocusControl = ed_CodSer
      end
      object Label51: TLabel
        Left = 59
        Top = 67
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = ed_DesSer
      end
      object ed_CodSer: TDBEdit
        Left = 110
        Top = 36
        Width = 64
        Height = 21
        DataField = 'SECodSer'
        DataSource = ds_Servico
        TabOrder = 0
      end
      object ed_DesSer: TDBEdit
        Left = 110
        Top = 63
        Width = 299
        Height = 21
        DataField = 'SEDescricao'
        DataSource = ds_Servico
        TabOrder = 1
        OnExit = ed_DesPacExit
        OnKeyPress = ed_DesPacKeyPress
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 370
    Width = 792
    Height = 24
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 744
    Top = 34
    Width = 41
    Height = 319
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bt_Incluir: TSpeedButton
      Left = 5
      Top = 36
      Width = 32
      Height = 26
      Hint = '| Incluir Registro - Ctr+N'
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
      Left = 5
      Top = 10
      Width = 32
      Height = 26
      Hint = '| Salvar Registro - Ctr+S'
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
      Left = 5
      Top = 88
      Width = 32
      Height = 26
      Hint = '| Cancelar Altera'#231#245'es - ESC'
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
      Left = 5
      Top = 114
      Width = 32
      Height = 26
      Hint = '| Excluir Registro'
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
      OnClick = bt_DeletarClick
    end
    object bt_Procurar: TSpeedButton
      Left = 5
      Top = 148
      Width = 32
      Height = 26
      Hint = '| Procurar por um Registro  - Ctr+L'
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
      OnClick = bt_ProcurarClick
    end
    object bt_Imprimir: TSpeedButton
      Left = 5
      Top = 174
      Width = 32
      Height = 26
      Hint = '| Imprimir Relat'#243'rios'
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
      OnClick = bt_ImprimirClick
    end
    object bt_Sair: TSpeedButton
      Left = 5
      Top = 206
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
    object Bevel4: TBevel
      Left = 8
      Top = 203
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel5: TBevel
      Left = 8
      Top = 142
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel1: TBevel
      Left = 8
      Top = 234
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel8: TBevel
      Left = 8
      Top = 6
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object Bevel9: TBevel
      Left = 8
      Top = 145
      Width = 27
      Height = 8
      Shape = bsTopLine
    end
    object bt_Alterar: TSpeedButton
      Left = 5
      Top = 62
      Width = 32
      Height = 26
      Hint = '| Alterar os dados - Ctrl+A'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = bt_AlterarClick
    end
  end
  object dg_Consulta: TDBGrid
    Left = 710
    Top = 232
    Width = 26
    Height = 25
    Color = clInfoBk
    DataSource = ds_Consulta
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgIndicator, dgRowSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        Width = 335
        Visible = True
      end>
  end
  object tb_Convenio: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_ConvenioBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_ConvenioAfterScroll
    OnPostError = tb_ConvenioPostError
    Parameters = <>
    Left = 681
    Top = 118
    object tb_ConvenioCVCodCon: TIntegerField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'CVCodCon'
    end
    object tb_ConvenioCVDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CVDescricao'
      Size = 40
    end
  end
  object ds_Convenio: TDataSource
    DataSet = tb_Convenio
    OnStateChange = OutroEstado
    Left = 709
    Top = 118
  end
  object ActionList1: TActionList
    Left = 681
    Top = 230
    object ac_CtrN: TAction
      Caption = 'ac_CtrN'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = ac_CtrNExecute
    end
    object ac_Esc: TAction
      Caption = 'ac_Esc'
      ShortCut = 27
      OnExecute = ac_EscExecute
    end
    object ac_CtrS: TAction
      Caption = 'ac_CtrS'
      ShortCut = 16467
      OnExecute = ac_CtrSExecute
    end
    object ac_CtrA: TAction
      Caption = 'ac_CtrA'
      ShortCut = 16449
      OnExecute = ac_CtrAExecute
    end
    object ac_Busca: TAction
      Caption = 'ac_Busca'
      ShortCut = 16460
      OnExecute = ac_BuscaExecute
    end
    object ac_PgUp: TAction
      Caption = 'ac_PgUp'
      ShortCut = 33
    end
    object ac_PgDown: TAction
      Caption = 'ac_PgDown'
      ShortCut = 34
    end
    object ac_F8: TAction
      Caption = 'ac_F8'
      ShortCut = 119
      OnExecute = ac_F8Execute
    end
  end
  object tb_Patologia: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_PatologiaBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_PatologiaAfterScroll
    OnPostError = tb_PatologiaPostError
    Parameters = <>
    Left = 681
    Top = 146
    object tb_PatologiaPTCodPat: TIntegerField
      DisplayLabel = 'Patologia'
      DisplayWidth = 10
      FieldName = 'PTCodPat'
    end
    object tb_PatologiaPTDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 57
      FieldName = 'PTDescricao'
      Size = 40
    end
  end
  object ds_Patologia: TDataSource
    DataSet = tb_Patologia
    OnStateChange = OutroEstado
    Left = 709
    Top = 146
  end
  object tb_Paciente: TADOQuery
    Connection = dm_Geral.ADOConnection
    CursorType = ctStatic
    BeforeOpen = tb_PacienteBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_PacienteAfterScroll
    OnCalcFields = tb_PacienteCalcFields
    OnPostError = tb_PacientePostError
    Parameters = <>
    Left = 681
    Top = 62
    object tb_PacientePCCodPac: TIntegerField
      DisplayLabel = 'Paciente'
      FieldName = 'PCCodPac'
    end
    object tb_PacientePCNome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'PCNome'
      Required = True
      Size = 60
    end
    object tb_PacientePCSexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'PCSexo'
      Size = 9
    end
    object tb_PacientePCDatNas: TDateField
      DisplayLabel = 'Nascimento'
      FieldName = 'PCDatNas'
      OnSetText = tb_PacientePCDatNasSetText
      EditMask = '!99/99/9999;1;_'
    end
    object tb_PacientePCEndereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'PCEndereco'
      Size = 40
    end
    object tb_PacientePCBairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'PCBairro'
      Size = 25
    end
    object tb_PacientePCCidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'PCCidade'
      Size = 25
    end
    object tb_PacientePCCep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'PCCep'
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object tb_PacientePCUf: TStringField
      DisplayLabel = 'Uf'
      FieldName = 'PCUf'
      Size = 2
    end
    object tb_PacientePCFone: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'PCFone'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_PacientePCIndicacao: TStringField
      DisplayLabel = 'Indica'#231#227'o'
      FieldName = 'PCIndicacao'
      Size = 30
    end
    object tb_PacientePCTipDoc: TStringField
      DefaultExpression = #39'RG'#39
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'PCTipDoc'
      Size = 10
    end
    object tb_PacientePCNumDoc: TStringField
      DisplayLabel = 'Nro Doc.'
      FieldName = 'PCNumDoc'
      Size = 30
    end
    object tb_PacientePCCodFnc: TIntegerField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'PCCodFnc'
      Required = True
    end
    object tb_PacientePCMesAnoAdm: TStringField
      DisplayLabel = 'Adimiss'#227'o'
      FieldName = 'PCMesAnoAdm'
      EditMask = '99/9999'
      Size = 7
    end
    object tb_PacientePCCodEmp: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'PCCodEmp'
      Required = True
    end
    object tb_PacientePC_Idade: TStringField
      FieldKind = fkCalculated
      FieldName = 'PC_Idade'
      Calculated = True
    end
    object tb_PacientePCMesNovCon: TIntegerField
      DisplayLabel = 'Nova Consulta'
      FieldName = 'PCMesNovCon'
    end
    object tb_PacientePCBooUsaApa: TStringField
      DefaultExpression = #39'F'#39
      DisplayLabel = 'Usu'#225'rio de aparelho auditivo?'
      FieldName = 'PCBooUsaApa'
      Size = 1
    end
    object tb_PacientePCTipPac: TIntegerField
      DefaultExpression = '0'
      FieldName = 'PCTipPac'
    end
    object tb_PacientePCCodSet: TIntegerField
      FieldName = 'PCCodSet'
    end
    object tb_PacientePCFONCEL: TStringField
      FieldName = 'PCFONCEL'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_PacientePCFONCON: TStringField
      FieldName = 'PCFONCON'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_PacientePCAnotacao: TMemoField
      FieldName = 'PCAnotacao'
      BlobType = ftMemo
    end
  end
  object ds_Paciente: TDataSource
    DataSet = tb_Paciente
    OnStateChange = OutroEstado
    Left = 709
    Top = 62
  end
  object tb_Empresa: TADOQuery
    Connection = dm_Geral.ADOConnection
    CursorType = ctStatic
    BeforeOpen = tb_EmpresaBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_EmpresaAfterScroll
    OnPostError = tb_EmpresaPostError
    Parameters = <>
    Left = 681
    Top = 90
    object tb_EmpresaEMCodEmp: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMCodEmp'
    end
    object tb_EmpresaEMRazao: TStringField
      DisplayLabel = 'Raz'#227'o'
      DisplayWidth = 60
      FieldName = 'EMRazao'
      Required = True
      Size = 60
    end
    object tb_EmpresaEMFantasia: TStringField
      DisplayLabel = 'Fantasia'
      DisplayWidth = 60
      FieldName = 'EMFantasia'
      Required = True
      Size = 60
    end
    object tb_EmpresaEMEndereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'EMEndereco'
      Size = 40
    end
    object tb_EmpresaEMBairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'EMBairro'
      Size = 30
    end
    object tb_EmpresaEMCidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'EMCidade'
      Size = 30
    end
    object tb_EmpresaEMCep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'EMCep'
      EditMask = '99999\-999;1;_'
      Size = 9
    end
    object tb_EmpresaEMUf: TStringField
      DisplayLabel = 'Uf'
      FieldName = 'EMUf'
      Size = 2
    end
    object tb_EmpresaEMFone: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'EMFone'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_EmpresaEMFax: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'EMFax'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_EmpresaEMContato: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'EMContato'
      Size = 30
    end
    object tb_EmpresaEMFoneCon: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'EMFoneCon'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_EmpresaEMMesNovCon: TIntegerField
      DisplayLabel = 'Nova Consulta'
      FieldName = 'EMMesNovCon'
    end
    object tb_EmpresaEMMesAnoIni: TStringField
      DisplayLabel = 'In'#237'cio'
      FieldName = 'EMMesAnoIni'
      EditMask = '99/9999;1;_'
      Size = 7
    end
    object tb_EmpresaEMCGC: TStringField
      DisplayLabel = 'CGC'
      FieldName = 'EMCGC'
      EditMask = '99\.999\.999\/9999\-99;1;_'
      Size = 19
    end
    object tb_EmpresaEMInscricao: TStringField
      DisplayLabel = 'Inscri'#231#227'o'
      FieldName = 'EMInscricao'
      Size = 16
    end
    object tb_EmpresaEMCAIPOS: TStringField
      DisplayLabel = 'Caixa Postal'
      FieldName = 'EMCAIPOS'
      Size = 3
    end
    object tb_EmpresaEMMEIPAG: TStringField
      DisplayLabel = 'Meio Pagto'
      FieldName = 'EMMEIPAG'
      Size = 15
    end
    object tb_EmpresaEMEmail: TStringField
      DisplayLabel = 'e-Mail'
      FieldName = 'EMEmail'
      Size = 100
    end
    object tb_EmpresaEMEncPor: TStringField
      DisplayLabel = 'Encaminhado por'
      FieldName = 'EMEncPor'
      Size = 40
    end
  end
  object ds_Empresa: TDataSource
    DataSet = tb_Empresa
    OnStateChange = OutroEstado
    Left = 709
    Top = 90
  end
  object tb_Usuario: TADOQuery
    Connection = dm_Geral.ADOConnection
    CursorType = ctStatic
    BeforeOpen = tb_UsuarioBeforeOpen
    BeforePost = tb_UsuarioBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_UsuarioAfterScroll
    OnPostError = tb_UsuarioPostError
    Parameters = <>
    Left = 681
    Top = 34
    object tb_UsuarioUSCodUsu: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USCodUsu'
    end
    object tb_UsuarioUSNome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'USNome'
      Size = 40
    end
    object tb_UsuarioUSNomAbr: TStringField
      DisplayLabel = 'Nome Abrev.'
      FieldName = 'USNomAbr'
      Size = 16
    end
    object tb_UsuarioUSFuncao: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'USFuncao'
    end
    object tb_UsuarioUSSenha: TStringField
      FieldName = 'USSenha'
      Size = 10
    end
  end
  object ds_Usuario: TDataSource
    DataSet = tb_Usuario
    OnStateChange = OutroEstado
    Left = 709
    Top = 34
  end
  object tb_Meatoscopia: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_MeatoscopiaBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_MeatoscopiaAfterScroll
    OnPostError = tb_MeatoscopiaPostError
    Parameters = <>
    Left = 681
    Top = 174
    object tb_MeatoscopiaMTCodMea: TIntegerField
      DisplayLabel = 'Meatoscopia'
      DisplayWidth = 12
      FieldName = 'MTCodMea'
    end
    object tb_MeatoscopiaMTDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'MTDescricao'
      Size = 60
    end
  end
  object ds_Meatoscopia: TDataSource
    DataSet = tb_Meatoscopia
    OnStateChange = OutroEstado
    Left = 709
    Top = 174
  end
  object ds_Funcao: TDataSource
    DataSet = tb_Funcao
    OnStateChange = OutroEstado
    Left = 709
    Top = 202
  end
  object tb_Funcao: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_FuncaoBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_FuncaoAfterScroll
    OnPostError = tb_FuncaoPostError
    Parameters = <>
    Left = 681
    Top = 202
    object tb_FuncaoFCCodFnc: TIntegerField
      DisplayLabel = 'Fun'#231#227'o'
      DisplayWidth = 12
      FieldName = 'FCCodFnc'
    end
    object tb_FuncaoFCDescricao: TStringField
      DisplayLabel = 'Descric'#227'o'
      DisplayWidth = 59
      FieldName = 'FCDescricao'
      Size = 40
    end
  end
  object tb_Comprador: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_CompradorBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_CompradorAfterScroll
    OnPostError = tb_CompradorPostError
    Parameters = <>
    Left = 681
    Top = 262
    object tb_CompradorPCCodPac: TIntegerField
      DisplayLabel = 'Paciente'
      FieldName = 'PCCodPac'
    end
    object tb_CompradorPCNome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'PCNome'
      Required = True
      Size = 40
    end
    object tb_CompradorPCEndereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'PCEndereco'
      Required = True
      Size = 40
    end
    object tb_CompradorPCBairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'PCBairro'
      Required = True
      Size = 25
    end
    object tb_CompradorPCCidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'PCCidade'
      Required = True
      Size = 25
    end
    object tb_CompradorPCCep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'PCCep'
      Required = True
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object tb_CompradorPCUf: TStringField
      DisplayLabel = 'Uf'
      FieldName = 'PCUf'
      Required = True
      Size = 2
    end
    object tb_CompradorPCFone: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'PCFone'
      Required = True
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_CompradorPCTipDoc: TStringField
      DefaultExpression = #39'CGC'#39
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'PCTipDoc'
      Required = True
      Size = 10
    end
    object tb_CompradorPCNumDoc: TStringField
      DisplayLabel = 'Nro Doc.'
      FieldName = 'PCNumDoc'
      Required = True
      Size = 30
    end
    object tb_CompradorPCTipPac: TIntegerField
      DefaultExpression = '1'
      FieldName = 'PCTipPac'
    end
  end
  object ds_Comprador: TDataSource
    DataSet = tb_Comprador
    OnStateChange = OutroEstado
    Left = 709
    Top = 262
  end
  object tb_Fornecedor: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_FornecedorBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_FornecedorAfterScroll
    OnPostError = tb_FornecedorPostError
    Parameters = <>
    Left = 681
    Top = 290
    object tb_FornecedorFOCodFor: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FOCodFor'
    end
    object tb_FornecedorFONome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'FONome'
      Required = True
      Size = 40
    end
    object tb_FornecedorFOEndereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'FOEndereco'
      Size = 40
    end
    object tb_FornecedorFOBairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'FOBairro'
      Size = 25
    end
    object tb_FornecedorFOCidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'FOCidade'
      Size = 35
    end
    object tb_FornecedorFOCep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'FOCep'
      EditMask = '99999\-999;1;_'
      Size = 9
    end
    object tb_FornecedorFOUF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'FOUF'
      Size = 2
    end
    object tb_FornecedorFOCGC: TStringField
      DisplayLabel = 'CGC'
      FieldName = 'FOCGC'
      EditMask = '99.999.999/9999-99;1;_'
      Size = 19
    end
    object tb_FornecedorFOInscricao: TStringField
      DisplayLabel = 'Inscri'#231#227'o'
      FieldName = 'FOInscricao'
      Size = 16
    end
    object tb_FornecedorFOTelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FOTelefone'
      Size = 13
    end
    object tb_FornecedorFOTelex: TStringField
      DisplayLabel = 'Telex'
      FieldName = 'FOTelex'
      Size = 13
    end
    object tb_FornecedorFOFax: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FOFax'
      Size = 13
    end
    object tb_FornecedorFOContato: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'FOContato'
      Size = 30
    end
  end
  object ds_Fornecedor: TDataSource
    DataSet = tb_Fornecedor
    OnStateChange = OutroEstado
    Left = 709
    Top = 290
  end
  object tb_Despesa: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_DespesaBeforeOpen
    BeforePost = tb_TableBeforePost
    Parameters = <>
    Left = 681
    Top = 318
    object tb_DespesaDECodDes: TIntegerField
      DisplayLabel = 'Despesa'
      FieldName = 'DECodDes'
    end
    object tb_DespesaDEDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DEDescricao'
      Size = 35
    end
  end
  object ds_Despesa: TDataSource
    DataSet = tb_Despesa
    OnStateChange = OutroEstado
    Left = 709
    Top = 318
  end
  object tb_Marca: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_MarcaBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_MarcaAfterScroll
    OnPostError = tb_MarcaPostError
    Parameters = <>
    Left = 625
    Top = 34
    object tb_MarcaMACodMar: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'MACodMar'
    end
    object tb_MarcaMADescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'MADescricao'
      Required = True
      Size = 30
    end
  end
  object ds_Marca: TDataSource
    DataSet = tb_Marca
    OnStateChange = OutroEstado
    Left = 653
    Top = 34
  end
  object tb_Aparelho: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_AparelhoBeforeOpen
    AfterEdit = tb_AparelhoAfterEdit
    BeforePost = tb_AparelhoBeforePost
    AfterPost = tb_AparelhoAfterPost
    BeforeDelete = tb_AparelhoBeforeDelete
    AfterScroll = tb_AparelhoAfterScroll
    Parameters = <>
    Left = 625
    Top = 62
    object tb_AparelhoAPCodApa: TIntegerField
      DisplayLabel = 'Aparelho'
      FieldName = 'APCodApa'
    end
    object tb_AparelhoAPDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'APDescricao'
      Size = 40
    end
    object tb_AparelhoAPModelo: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'APModelo'
      Size = 30
    end
    object tb_AparelhoAPCodMar: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'APCodMar'
    end
  end
  object ds_Aparelho: TDataSource
    DataSet = tb_Aparelho
    OnStateChange = OutroEstado
    Left = 653
    Top = 62
  end
  object tb_TMPA: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_TMPABeforeOpen
    AfterClose = tb_TMPAAfterClose
    BeforePost = tb_TMPABeforePost
    OnPostError = tb_TMPAPostError
    Parameters = <>
    Left = 566
    Top = 90
    object tb_TMPACodCon: TIntegerField
      FieldName = 'CodCon'
    end
    object tb_TMPADescricao: TStringField
      FieldName = 'Descricao'
      Size = 15
    end
    object tb_TMPAControle: TStringField
      FieldName = 'Controle'
      Size = 5
    end
    object tb_TMPAUniMed: TStringField
      DisplayLabel = 'Medida'
      FieldName = 'UniMed'
      Size = 5
    end
  end
  object ds_TMPA: TDataSource
    DataSet = tb_TMPA
    Left = 594
    Top = 90
  end
  object tb_Controle: TADOQuery
    Connection = dm_Geral.ADOConnection
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_ControleAfterScroll
    DataSource = ds_Aparelho
    Parameters = <
      item
        Name = 'APCodApa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from safaco where COCodApa = :APCodApa order by COCodCo' +
        'n')
    Left = 625
    Top = 90
    object tb_ControleCOCodApa: TIntegerField
      FieldName = 'COCodApa'
    end
    object tb_ControleCOCodCon: TIntegerField
      FieldName = 'COCodCon'
    end
    object tb_ControleCODescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CODescricao'
      Size = 15
    end
    object tb_ControleCOControle: TStringField
      DisplayLabel = 'Controles'
      FieldName = 'COControle'
      Size = 5
    end
    object tb_ControleCOUniMed: TStringField
      DisplayLabel = 'Medida'
      FieldName = 'COUniMed'
      Size = 5
    end
  end
  object ds_Controle: TDataSource
    DataSet = tb_Controle
    OnStateChange = OutroEstado
    Left = 653
    Top = 90
  end
  object tb_Servico: TADOQuery
    Connection = dm_Geral.ADOConnection
    BeforeOpen = tb_ServicoBeforeOpen
    BeforePost = tb_TableBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_ServicoAfterScroll
    OnPostError = tb_ServicoPostError
    Parameters = <>
    Left = 625
    Top = 120
    object tb_ServicoSECodSer: TIntegerField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'SECodSer'
    end
    object tb_ServicoSEDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'SEDescricao'
      Size = 40
    end
  end
  object ds_Servico: TDataSource
    DataSet = tb_Servico
    OnStateChange = OutroEstado
    Left = 653
    Top = 118
  end
  object tb_ControleUpdate: TADOQuery
    Connection = dm_Geral.ADOConnection
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = tb_ControleAfterScroll
    DataSource = ds_Aparelho
    Parameters = <
      item
        Name = 'APCodApa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodCon'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from safaco where COCodApa = :APCodApa and COCodCon = :' +
        'CodCon')
    Left = 625
    Top = 201
    object tb_ControleUpdateCOCodApa: TIntegerField
      FieldName = 'COCodApa'
    end
    object tb_ControleUpdateCOCodCon: TIntegerField
      FieldName = 'COCodCon'
    end
    object tb_ControleUpdateCODescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CODescricao'
      Size = 15
    end
    object tb_ControleUpdateCOControle: TStringField
      DisplayLabel = 'Controles'
      FieldName = 'COControle'
      Size = 5
    end
    object tb_ControleUpdateCOUniMed: TStringField
      DisplayLabel = 'Medida'
      FieldName = 'COUniMed'
      Size = 5
    end
  end
  object qr_Consulta: TADOQuery
    Connection = dm_Geral.ADOConnection
    Parameters = <>
    Left = 626
    Top = 229
  end
  object ds_Consulta: TDataSource
    DataSet = qr_Consulta
    Left = 653
    Top = 229
  end
  object PrintDialog1: TPrintDialog
    Left = 627
    Top = 261
  end
  object PopupMenu1: TPopupMenu
    Left = 627
    Top = 290
    object Black1: TMenuItem
      Caption = 'Preto'
      OnClick = ColorClick
    end
    object Green1: TMenuItem
      Tag = 128
      Caption = 'Marrom'
      OnClick = ColorClick
    end
    object Red1: TMenuItem
      Tag = 32768
      Caption = 'Verde'
      OnClick = ColorClick
    end
    object Blue1: TMenuItem
      Tag = 32896
      Caption = 'Olive'
      OnClick = ColorClick
    end
    object Yellow1: TMenuItem
      Tag = 8388608
      Caption = 'Azul Escuro'
      OnClick = ColorClick
    end
    object Purple1: TMenuItem
      Tag = 8388736
      Caption = 'Rocho'
      OnClick = ColorClick
    end
    object Teal1: TMenuItem
      Tag = 8421376
      Caption = 'Verde Azulado'
      OnClick = ColorClick
    end
    object Gray1: TMenuItem
      Tag = 8421504
      Caption = 'Cinza'
      OnClick = ColorClick
    end
    object Silver1: TMenuItem
      Tag = 12632256
      Caption = 'Prata'
      OnClick = ColorClick
    end
    object Red2: TMenuItem
      Tag = 255
      Caption = 'Vermelho'
      OnClick = ColorClick
    end
    object Lime1: TMenuItem
      Tag = 65280
      Caption = 'Verde Lim'#227'o'
      OnClick = ColorClick
    end
    object Yellow2: TMenuItem
      Tag = 65535
      Caption = 'Amarelho'
      OnClick = ColorClick
    end
    object Blue2: TMenuItem
      Tag = 16711680
      Caption = 'Azul'
      OnClick = ColorClick
    end
    object Fuchsia1: TMenuItem
      Tag = 16711935
      Caption = 'Rosa Choque'
      OnClick = ColorClick
    end
    object Aqua1: TMenuItem
      Tag = 16776960
      Caption = #193'qua'
      OnClick = ColorClick
    end
    object White1: TMenuItem
      Tag = 16777215
      Caption = 'Branco'
      OnClick = ColorClick
    end
  end
  object tb_PacienteContato: TADOQuery
    Connection = dm_Geral.ADOConnection
    CursorType = ctStatic
    BeforeOpen = tb_PacienteContatoBeforeOpen
    AfterInsert = tb_PacienteContatoAfterInsert
    BeforePost = tb_PacienteContatoBeforePost
    AfterPost = tb_PacienteContatoAfterPost
    AfterDelete = tb_PacienteContatoAfterDelete
    AfterScroll = tb_ControleAfterScroll
    Parameters = <>
    Left = 625
    Top = 146
    object tb_PacienteContatoPCCOSequencia: TIntegerField
      FieldName = 'PCCOSequencia'
    end
    object tb_PacienteContatoPCCOCodPac: TIntegerField
      FieldName = 'PCCOCodPac'
    end
    object tb_PacienteContatoPCCOTipo: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'PCCOTipo'
      Required = True
    end
    object tb_PacienteContatoPCCOContato: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 60
      FieldName = 'PCCOContato'
      Size = 60
    end
    object tb_PacienteContatoPCCOFone1: TStringField
      DisplayLabel = 'Fone 1'
      FieldName = 'PCCOFone1'
      Required = True
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_PacienteContatoPCCOFone2: TStringField
      DisplayLabel = 'Fone 2'
      FieldName = 'PCCOFone2'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
    object tb_PacienteContatoPCCOFone3: TStringField
      DisplayLabel = 'Fone 3'
      FieldName = 'PCCOFone3'
      EditMask = '!\(999\)9999-9999;1;_'
      Size = 14
    end
  end
  object ds_PacienteContato: TwwDataSource
    DataSet = tb_PacienteContato
    OnStateChange = OutroEstado
    Left = 653
    Top = 146
  end
  object qr_PacienteContatoGrade: TADOQuery
    Connection = dm_Geral.ADOConnection
    CursorType = ctStatic
    BeforeOpen = tb_PacienteContatoBeforeOpen
    AfterInsert = tb_PacienteContatoAfterInsert
    BeforePost = tb_PacienteContatoBeforePost
    AfterPost = tb_ConvenioAfterPost
    AfterScroll = qr_PacienteContatoGradeAfterScroll
    Parameters = <
      item
        Name = 'PCCOCodPac'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 18457
      end>
    SQL.Strings = (
      
        'select SAFAPCCO.*, SAFATPCO.TPCONome from SAFAPCCO join SAFATPCO' +
        ' on SAFAPCCO.PCCOTipo = SAFATPCO.TPCOTipo'
      'where PCCOCodPac = :PCCOCodPac order by PCCOContato')
    Left = 566
    Top = 118
    object qr_PacienteContatoGradeTPCONome: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'TPCONome'
      Size = 10
    end
    object qr_PacienteContatoGradePCCOContato: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 37
      FieldName = 'PCCOContato'
      Size = 60
    end
    object qr_PacienteContatoGradePCCOFone1: TStringField
      DisplayLabel = 'Fone 1'
      DisplayWidth = 14
      FieldName = 'PCCOFone1'
      Size = 14
    end
    object qr_PacienteContatoGradePCCOFone2: TStringField
      DisplayLabel = 'Fone 2'
      DisplayWidth = 14
      FieldName = 'PCCOFone2'
      Size = 14
    end
    object qr_PacienteContatoGradePCCOFone3: TStringField
      DisplayLabel = 'Fone 3'
      DisplayWidth = 14
      FieldName = 'PCCOFone3'
      Size = 14
    end
    object qr_PacienteContatoGradePCCOTipo: TIntegerField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'PCCOTipo'
      Visible = False
    end
    object qr_PacienteContatoGradePCCOSequencia: TIntegerField
      FieldName = 'PCCOSequencia'
      Visible = False
    end
  end
  object ds_qr_PacienteContatoGrade: TDataSource
    DataSet = qr_PacienteContatoGrade
    Left = 594
    Top = 118
  end
end
