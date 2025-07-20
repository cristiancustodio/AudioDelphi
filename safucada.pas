//Colocar uma grid para mostrar os contatos

unit safucada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, StdCtrls, ToolWin, Buttons, DBCtrls, Mask,
  Grids, DBGrids, Db, DBTables, ActnList, DBActns, Bde, ADODB, wwriched,
  wwdbedit, Wwdotdot, Wwdbcomb, printers , RichEdit, Menus, wwdblook,
  Wwdatsrc, Wwdbigrd, Wwdbgrid;

type
  Tfm_Cadastro = class(TForm)
    pg_Cadastro: TPageControl;
    pg_Empresa: TTabSheet;
    pg_Pacientes: TTabSheet;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    bt_Incluir: TSpeedButton;
    bt_Salvar: TSpeedButton;
    bt_Cancelar: TSpeedButton;
    bt_Deletar: TSpeedButton;
    bt_Procurar: TSpeedButton;
    bt_Imprimir: TSpeedButton;
    bt_Sair: TSpeedButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    tb_Convenio: TADOQuery;
    ds_Convenio: TDataSource;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    ActionList1: TActionList;
    ac_CtrN: TAction;
    ac_Esc: TAction;
    ac_CtrS: TAction;
    ac_Busca: TAction;
    pg_Convenio: TTabSheet;
    pg_Patologia: TTabSheet;
    pg_Meatoscopia: TTabSheet;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    pg_Usuario: TTabSheet;
    Bevel23: TBevel;
    Bevel24: TBevel;
    tb_ConvenioCVCodCon: TIntegerField;
    tb_ConvenioCVDescricao: TStringField;
    Label1: TLabel;
    ed_CodCon: TDBEdit;
    Label2: TLabel;
    ed_DesCon: TDBEdit;
    tb_Patologia: TADOQuery;
    ds_Patologia: TDataSource;
    tb_PatologiaPTCodPat: TIntegerField;
    tb_PatologiaPTDescricao: TStringField;
    Label3: TLabel;
    ed_CodPat: TDBEdit;
    Label4: TLabel;
    ed_DesPat: TDBEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    tb_Paciente: TADOQuery;
    ds_Paciente: TDataSource;
    tb_PacientePCCodPac: TIntegerField;
    tb_PacientePCNome: TStringField;
    tb_PacientePCSexo: TStringField;
    tb_PacientePCDatNas: TDateField;
    tb_PacientePCEndereco: TStringField;
    tb_PacientePCBairro: TStringField;
    tb_PacientePCCidade: TStringField;
    tb_PacientePCCep: TStringField;
    tb_PacientePCUf: TStringField;
    tb_PacientePCFone: TStringField;
    tb_PacientePCIndicacao: TStringField;
    tb_PacientePCTipDoc: TStringField;
    tb_PacientePCNumDoc: TStringField;
    tb_PacientePCMesAnoAdm: TStringField;
    tb_PacientePCCodEmp: TIntegerField;
    tb_PacientePC_Idade: TStringField;
    tb_Empresa: TADOQuery;
    ds_Empresa: TDataSource;
    tb_EmpresaEMCodEmp: TIntegerField;
    tb_EmpresaEMRazao: TStringField;
    tb_EmpresaEMFantasia: TStringField;
    tb_EmpresaEMEndereco: TStringField;
    tb_EmpresaEMBairro: TStringField;
    tb_EmpresaEMCidade: TStringField;
    tb_EmpresaEMCep: TStringField;
    tb_EmpresaEMUf: TStringField;
    tb_EmpresaEMFone: TStringField;
    tb_EmpresaEMFax: TStringField;
    tb_EmpresaEMContato: TStringField;
    tb_EmpresaEMFoneCon: TStringField;
    tb_EmpresaEMMesNovCon: TIntegerField;
    Label24: TLabel;
    ed_CodEmp: TDBEdit;
    Label25: TLabel;
    ed_DesEmp: TDBEdit;
    Label26: TLabel;
    DBEdit3: TDBEdit;
    Label27: TLabel;
    DBEdit9: TDBEdit;
    Label28: TLabel;
    DBEdit16: TDBEdit;
    Label29: TLabel;
    DBEdit17: TDBEdit;
    Label30: TLabel;
    DBEdit18: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit20: TDBEdit;
    Label33: TLabel;
    DBEdit21: TDBEdit;
    Label34: TLabel;
    DBEdit22: TDBEdit;
    Label35: TLabel;
    DBEdit23: TDBEdit;
    Label36: TLabel;
    DBEdit24: TDBEdit;
    DBComboBox3: TDBComboBox;
    Label37: TLabel;
    tb_Usuario: TADOQuery;
    ds_Usuario: TDataSource;
    tb_UsuarioUSCodUsu: TIntegerField;
    tb_UsuarioUSNome: TStringField;
    tb_UsuarioUSFuncao: TStringField;
    tb_UsuarioUSNomAbr: TStringField;
    Label38: TLabel;
    ed_CodUsu: TDBEdit;
    Label39: TLabel;
    ed_DesUsu: TDBEdit;
    Label40: TLabel;
    DBEdit19: TDBEdit;
    Label41: TLabel;
    tb_Meatoscopia: TADOQuery;
    ds_Meatoscopia: TDataSource;
    tb_MeatoscopiaMTCodMea: TIntegerField;
    tb_MeatoscopiaMTDescricao: TStringField;
    Label44: TLabel;
    ed_CodMea: TDBEdit;
    Label45: TLabel;
    ed_DesMea: TDBEdit;
    ds_Funcao: TDataSource;
    tb_Funcao: TADOQuery;
    pg_Funcao: TTabSheet;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Label47: TLabel;
    ed_CodFnc: TDBEdit;
    Label48: TLabel;
    ed_DesFnc: TDBEdit;
    tb_FuncaoFCCodFnc: TIntegerField;
    tb_FuncaoFCDescricao: TStringField;
    tb_PacientePCCodFnc: TIntegerField;
    ac_PgUp: TAction;
    ac_PgDown: TAction;
    ac_F8: TAction;
    tb_PacientePCMesNovCon: TIntegerField;
    bt_Alterar: TSpeedButton;
    ac_CtrA: TAction;
    dg_Consulta: TDBGrid;
    tb_Comprador: TADOQuery;
    ds_Comprador: TDataSource;
    pg_Fornecedor: TTabSheet;
    pg_Despesa: TTabSheet;
    Bevel25: TBevel;
    Bevel26: TBevel;
    Bevel27: TBevel;
    Bevel28: TBevel;
    pg_Comprador: TTabSheet;
    Bevel21: TBevel;
    Bevel22: TBevel;
    tb_Fornecedor: TADOQuery;
    ds_Fornecedor: TDataSource;
    tb_FornecedorFOCodFor: TIntegerField;
    tb_FornecedorFONome: TStringField;
    tb_FornecedorFOEndereco: TStringField;
    tb_FornecedorFOBairro: TStringField;
    tb_FornecedorFOCidade: TStringField;
    tb_FornecedorFOCep: TStringField;
    tb_FornecedorFOUF: TStringField;
    tb_FornecedorFOCGC: TStringField;
    tb_FornecedorFOInscricao: TStringField;
    tb_FornecedorFOTelefone: TStringField;
    tb_FornecedorFOTelex: TStringField;
    tb_FornecedorFOFax: TStringField;
    tb_FornecedorFOContato: TStringField;
    Label58: TLabel;
    ed_CodFor: TDBEdit;
    Label59: TLabel;
    ed_NomFor: TDBEdit;
    Label60: TLabel;
    DBEdit30: TDBEdit;
    Label61: TLabel;
    DBEdit34: TDBEdit;
    Label62: TLabel;
    DBEdit35: TDBEdit;
    Label63: TLabel;
    DBEdit36: TDBEdit;
    Label64: TLabel;
    Label65: TLabel;
    DBEdit38: TDBEdit;
    Label66: TLabel;
    DBEdit39: TDBEdit;
    Label67: TLabel;
    DBEdit40: TDBEdit;
    Label68: TLabel;
    DBEdit41: TDBEdit;
    Label69: TLabel;
    DBEdit42: TDBEdit;
    Label70: TLabel;
    DBEdit43: TDBEdit;
    DBComboBox5: TDBComboBox;
    tb_Despesa: TADOQuery;
    ds_Despesa: TDataSource;
    Label71: TLabel;
    Label72: TLabel;
    ed_CodDes: TDBEdit;
    ed_DesDes: TDBEdit;
    tb_DespesaDECodDes: TIntegerField;
    tb_DespesaDEDescricao: TStringField;
    tb_PacientePCBooUsaApa: TStringField;
    pg_Aparelho: TTabSheet;
    pg_Marca: TTabSheet;
    Bevel29: TBevel;
    Bevel30: TBevel;
    tb_Marca: TADOQuery;
    ds_Marca: TDataSource;
    tb_MarcaMACodMar: TIntegerField;
    tb_MarcaMADescricao: TStringField;
    Label75: TLabel;
    Label76: TLabel;
    ed_CodMar: TDBEdit;
    ed_DesMar: TDBEdit;
    Bevel31: TBevel;
    Bevel32: TBevel;
    Label77: TLabel;
    Label78: TLabel;
    ed_CodApa: TDBEdit;
    ed_DesApa: TDBEdit;
    DBEdit37: TDBEdit;
    Label79: TLabel;
    tb_Aparelho: TADOQuery;
    ds_Aparelho: TDataSource;
    tb_AparelhoAPCodApa: TIntegerField;
    tb_AparelhoAPDescricao: TStringField;
    tb_AparelhoAPModelo: TStringField;
    pn_Controle: TPanel;
    DBGrid3: TDBGrid;
    pn_TMPA: TPanel;
    dg_TMPA: TDBGrid;
    tb_TMPA: TADOQuery;
    ds_TMPA: TDataSource;
    tb_AparelhoAPCodMar: TIntegerField;
    tb_Controle: TADOQuery;
    ds_Controle: TDataSource;
    tb_ControleCOCodApa: TIntegerField;
    tb_ControleCOCodCon: TIntegerField;
    tb_ControleCODescricao: TStringField;
    tb_ControleCOControle: TStringField;
    tb_ControleCOUniMed: TStringField;
    tb_TMPACodCon: TIntegerField;
    tb_TMPADescricao: TStringField;
    tb_TMPAControle: TStringField;
    tb_TMPAUniMed: TStringField;
    tb_EmpresaEMMesAnoIni: TStringField;
    Label81: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label74: TLabel;
    Label82: TLabel;
    DBEdit14: TDBEdit;
    ed_NomCom: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBComboBox4: TDBComboBox;
    tb_CompradorPCCodPac: TIntegerField;
    tb_CompradorPCNome: TStringField;
    tb_CompradorPCEndereco: TStringField;
    tb_CompradorPCBairro: TStringField;
    tb_CompradorPCCidade: TStringField;
    tb_CompradorPCCep: TStringField;
    tb_CompradorPCUf: TStringField;
    tb_CompradorPCFone: TStringField;
    tb_CompradorPCTipDoc: TStringField;
    tb_CompradorPCNumDoc: TStringField;
    tb_CompradorPCTipPac: TIntegerField;
    tb_PacientePCTipPac: TIntegerField;
    tb_Servico: TADOQuery;
    tb_ServicoSECodSer: TIntegerField;
    tb_ServicoSEDescricao: TStringField;
    ds_Servico: TDataSource;
    pg_Servico: TTabSheet;
    Bevel33: TBevel;
    Bevel34: TBevel;
    ed_CodSer: TDBEdit;
    Label46: TLabel;
    Label51: TLabel;
    ed_DesSer: TDBEdit;
    lblMarcaLabel: TLabel;
    ed_MarcaCodigo: TDBEdit;
    lblMarca: TLabel;
    tb_ControleUpdate: TADOQuery;
    tb_ControleUpdateCOCodApa: TIntegerField;
    tb_ControleUpdateCOCodCon: TIntegerField;
    tb_ControleUpdateCODescricao: TStringField;
    tb_ControleUpdateCOControle: TStringField;
    tb_ControleUpdateCOUniMed: TStringField;
    qr_Consulta: TADOQuery;
    ds_Consulta: TDataSource;
    tb_PacientePCCodSet: TIntegerField;
    tb_PacientePCFONCEL: TStringField;
    tb_PacientePCFONCON: TStringField;
    tb_EmpresaEMCGC: TStringField;
    tb_EmpresaEMInscricao: TStringField;
    tb_EmpresaEMCAIPOS: TStringField;
    tb_EmpresaEMMEIPAG: TStringField;
    tb_EmpresaEMEmail: TStringField;
    tb_EmpresaEMEncPor: TStringField;
    Label80: TLabel;
    DBEdit44: TDBEdit;
    Label83: TLabel;
    DBEdit47: TDBEdit;
    Label84: TLabel;
    DBEdit48: TDBEdit;
    Label85: TLabel;
    DBEdit49: TDBEdit;
    Label86: TLabel;
    DBEdit50: TDBEdit;
    Label87: TLabel;
    DBEdit51: TDBEdit;
    pg_CadastroPaciente: TPageControl;
    pg_Paciente: TTabSheet;
    d: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    lblEmpresaLabel: TLabel;
    Label23: TLabel;
    lb_IdadePac: TDBText;
    lblFuncaoLabel: TLabel;
    Label20: TLabel;
    Label50: TLabel;
    lblFuncao: TLabel;
    lblEmpresa: TLabel;
    Label22: TLabel;
    Label49: TLabel;
    Label73: TLabel;
    ed_CodPac: TDBEdit;
    ed_DesPac: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    edFuncaoCodigo: TDBEdit;
    edEmpresaCodigo: TDBEdit;
    cb_SetorPaciente: TDBLookupComboBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    pg_Anotacao: TTabSheet;
    RichEdit1: TwwDBRichEdit;
    FormatBarAnotacao: TPanel;
    ToolbarAnotacao: TPanel;
    PrintButton: TSpeedButton;
    FindButton: TSpeedButton;
    CutButton: TSpeedButton;
    CopyButton: TSpeedButton;
    UndoButton: TSpeedButton;
    PasteButton: TSpeedButton;
    ToolbarBevel1: TBevel;
    Bevel11: TBevel;
    FontNameCombo: TwwDBComboBox;
    FontSizeCombo: TwwDBComboBox;
    BoldButton: TSpeedButton;
    ItalicButton: TSpeedButton;
    UnderlineButton: TSpeedButton;
    ColorButton: TSpeedButton;
    Bevel6: TBevel;
    LeftButton: TSpeedButton;
    CenterButton: TSpeedButton;
    RightButton: TSpeedButton;
    JustifyButton: TSpeedButton;
    BulletButton: TSpeedButton;
    Bevel7: TBevel;
    HighlightButton: TSpeedButton;
    PrintDialog1: TPrintDialog;
    PopupMenu1: TPopupMenu;
    Black1: TMenuItem;
    Green1: TMenuItem;
    Red1: TMenuItem;
    Blue1: TMenuItem;
    Yellow1: TMenuItem;
    Purple1: TMenuItem;
    Teal1: TMenuItem;
    Gray1: TMenuItem;
    Silver1: TMenuItem;
    Red2: TMenuItem;
    Lime1: TMenuItem;
    Yellow2: TMenuItem;
    Blue2: TMenuItem;
    Fuchsia1: TMenuItem;
    Aqua1: TMenuItem;
    White1: TMenuItem;
    tb_PacientePCAnotacao: TMemoField;
    pg_PacienteContato: TTabSheet;
    Bevel10: TBevel;
    Label88: TLabel;
    tb_PacienteContato: TADOQuery;
    ds_PacienteContato: TwwDataSource;
    tb_PacienteContatoPCCOSequencia: TIntegerField;
    tb_PacienteContatoPCCOCodPac: TIntegerField;
    tb_PacienteContatoPCCOTipo: TIntegerField;
    tb_PacienteContatoPCCOContato: TStringField;
    Label89: TLabel;
    ed_FonePacienteContato: TDBEdit;
    Label90: TLabel;
    DBEdit53: TDBEdit;
    cb_PacienteContatoTipoContato: TwwDBLookupCombo;
    tb_PacienteContatoPCCOFone1: TStringField;
    tb_PacienteContatoPCCOFone2: TStringField;
    tb_PacienteContatoPCCOFone3: TStringField;
    Label91: TLabel;
    DBEdit52: TDBEdit;
    Label92: TLabel;
    DBEdit54: TDBEdit;
    DBText1: TDBText;
    Label93: TLabel;
    qr_PacienteContatoGrade: TADOQuery;
    ds_qr_PacienteContatoGrade: TDataSource;
    wwDBGrid1: TwwDBGrid;
    qr_PacienteContatoGradePCCOTipo: TIntegerField;
    qr_PacienteContatoGradePCCOContato: TStringField;
    qr_PacienteContatoGradePCCOFone1: TStringField;
    qr_PacienteContatoGradePCCOFone2: TStringField;
    qr_PacienteContatoGradePCCOFone3: TStringField;
    qr_PacienteContatoGradeTPCONome: TStringField;
    qr_PacienteContatoGradePCCOSequencia: TIntegerField;
    wwDBComboBox1: TwwDBComboBox;
    Label43: TLabel;
    Label42: TLabel;
    ed_Senha: TEdit;
    ed_ConfirmaSenha: TEdit;
    tb_UsuarioUSSenha: TStringField;
    FUNCTION  CLCRIPTO(const vm_ParMem, vm_ParCha: String): String;
    procedure bt_SairClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure tb_ConvenioAfterScroll(DataSet: TDataSet);
    procedure tb_ConvenioPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure bt_IncluirClick(Sender: TObject);
    procedure TabSheetShow(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_DeletarClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure ac_CtrNExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ac_CtrSExecute(Sender: TObject);
    procedure bt_ProcurarClick(Sender: TObject);
    procedure ac_BuscaExecute(Sender: TObject);
    procedure tb_PatologiaAfterScroll(DataSet: TDataSet);
    procedure tb_PatologiaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure tb_PacienteAfterScroll(DataSet: TDataSet);
    procedure tb_TableBeforePost(DataSet: TDataSet);
    procedure tb_PacientePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure pn_CodPacClick(Sender: TObject);
    procedure tb_PacienteCalcFields(DataSet: TDataSet);
    procedure tb_EmpresaAfterScroll(DataSet: TDataSet);
    procedure tb_EmpresaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure OutroEstado(Sender: TObject);
    procedure tb_UsuarioAfterScroll(DataSet: TDataSet);
    procedure tb_UsuarioBeforePost(DataSet: TDataSet);
    procedure tb_UsuarioPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure tb_MeatoscopiaAfterScroll(DataSet: TDataSet);
    procedure tb_MeatoscopiaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure tb_FuncaoAfterScroll(DataSet: TDataSet);
    procedure tb_FuncaoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cb_FuncaoEnter(Sender: TObject);
    procedure tb_PacientePCDatNasSetText(Sender: TField;
      const Text: String);
    procedure tb_ConvenioAfterPost(DataSet: TDataSet);
    procedure ac_F8Execute(Sender: TObject);
    procedure bt_AlterarClick(Sender: TObject);
    procedure ac_CtrAExecute(Sender: TObject);
    procedure ed_DesPacKeyPress(Sender: TObject; var Key: Char);
    procedure ed_DesPacExit(Sender: TObject);
    procedure tb_CompradorAfterScroll(DataSet: TDataSet);
    procedure tb_CompradorPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_FornecedorAfterScroll(DataSet: TDataSet);
    procedure tb_FornecedorPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_MarcaAfterScroll(DataSet: TDataSet);
    procedure tb_MarcaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_AparelhoAfterScroll(DataSet: TDataSet);
    procedure tb_AparelhoBeforePost(DataSet: TDataSet);
    procedure lc_MarcaApaEnter(Sender: TObject);
    procedure tb_ControleAfterScroll(DataSet: TDataSet);
    procedure tb_TMPAAfterClose(DataSet: TDataSet);
    procedure tb_TMPABeforeOpen(DataSet: TDataSet);
    procedure tb_TMPABeforePost(DataSet: TDataSet);
    procedure tb_TMPAPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_AparelhoAfterEdit(DataSet: TDataSet);
    procedure tb_AparelhoAfterPost(DataSet: TDataSet);
    procedure dg_TMPAColExit(Sender: TObject);
    procedure tb_AparelhoBeforeDelete(DataSet: TDataSet);
    procedure tb_ServicoAfterScroll(DataSet: TDataSet);
    procedure tb_ServicoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure lblFuncaoLabelClick(Sender: TObject);
    procedure edFuncaoCodigoExit(Sender: TObject);
    procedure lblEmpresaLabelClick(Sender: TObject);
    procedure edEmpresaCodigoExit(Sender: TObject);
    procedure tb_EmpresaBeforeOpen(DataSet: TDataSet);
    procedure tb_PacienteBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tb_ConvenioBeforeOpen(DataSet: TDataSet);
    procedure tb_PatologiaBeforeOpen(DataSet: TDataSet);
    procedure tb_MeatoscopiaBeforeOpen(DataSet: TDataSet);
    procedure tb_FuncaoBeforeOpen(DataSet: TDataSet);
    procedure tb_MarcaBeforeOpen(DataSet: TDataSet);
    procedure tb_CompradorBeforeOpen(DataSet: TDataSet);
    procedure tb_FornecedorBeforeOpen(DataSet: TDataSet);
    procedure tb_DespesaBeforeOpen(DataSet: TDataSet);
    procedure tb_ServicoBeforeOpen(DataSet: TDataSet);
    procedure tb_AparelhoBeforeOpen(DataSet: TDataSet);
    procedure lblMarcaLabelClick(Sender: TObject);
    procedure tb_UsuarioBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edFuncaoCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edEmpresaCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_MarcaCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFuncaoCodigoEnter(Sender: TObject);
    procedure edEmpresaCodigoEnter(Sender: TObject);
    procedure ed_MarcaCodigoEnter(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure RightButtonClick(Sender: TObject);
    procedure CenterButtonClick(Sender: TObject);
    procedure LeftButtonClick(Sender: TObject);
    procedure BulletButtonClick(Sender: TObject);
    procedure RefreshControls;
    procedure Print1Click(Sender: TObject);
    procedure FindButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure HighlightButtonClick(Sender: TObject);
    procedure pg_AnotacaoShow(Sender: TObject);
    procedure FontNameComboCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FontSizeComboCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure ColorButtonClick(Sender: TObject);
    procedure ColorClick(Sender: TObject);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1SelectionChange(Sender: TObject);
    procedure tb_PacienteContatoBeforeOpen(DataSet: TDataSet);
    procedure tb_PacienteContatoBeforePost(DataSet: TDataSet);
    procedure tb_PacienteContatoAfterInsert(DataSet: TDataSet);
    procedure qr_PacienteContatoGradeAfterScroll(DataSet: TDataSet);
    procedure tb_PacienteContatoAfterPost(DataSet: TDataSet);
    procedure tb_PacienteContatoAfterDelete(DataSet: TDataSet);
  private
    tempDown: boolean;
    OrigRichEdit: TwwCustomRichEdit;
    PROCEDURE MostrarFuncao(vm_ParCodigo: Integer);
    PROCEDURE MostrarMarca(vm_ParCodigo: Integer);
    PROCEDURE MostrarEmpresa(vm_ParCodigo: Integer);
    FUNCTION MaiorCodigo(vm_ParCampoChave, vm_ParTabela : String; vm_ParFiltro: String = ''): Integer;
    procedure SetRichEditFontName(Value: string);
    { Private declarations }
  public
    { Public declarations }
  end;

CONST eKeyViol=9729;

var
  fm_Cadastro: Tfm_Cadastro;
  vm_ObjTable : TDataSet; // Tabela atual da barra de ferramenta
  vm_ObjSource: TDataSource; // DataSource atual da barra de ferramenta
  vm_ObjFieldKey: TField; // Campo Chave
  vm_StrTableDB: String; // Nome da tabela no banco de dados
  vm_ObjTabSheet: TTabSheet;
  vm_ObjEdit: TWinControl;
  vm_ObjFieldNom: TField;
  vm_VetObjPaciente: ARRAY OF TObject;
  vm_VetObjEmpresa: ARRAY OF TObject;
  vm_VetObjConvenio: ARRAY OF TObject;
  vm_VetObjPatologia: ARRAY OF TObject;
  vm_VetObjMeatoscopia: ARRAY OF TObject;
  vm_VetObjFuncao: ARRAY OF TObject;
  I:Integer;


implementation

Uses SafuMenu, SaffGera, safurela, SafdGera, funcoes, Safubusc, Math,
  Variants;

{$R *.DFM}

PROCEDURE Tfm_Cadastro.MostrarFuncao(vm_ParCodigo: Integer);
BEGIN
  lblFuncao.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safafc', 'FCCodFnc', 'FCDescricao');
  if (lblFuncao.Caption = '') and (tb_Paciente.State IN [dsEdit, dsInsert]) then
     tb_PacientePCCodFnc.Clear;
END;

PROCEDURE Tfm_Cadastro.MostrarEmpresa(vm_ParCodigo: Integer);
VAR vm_Mes : Variant;
    vm_StrMeioPagto : String;
BEGIN
  lblEmpresa.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safaem', 'EMCodEmp', 'EMRazao');

  vm_StrMeioPagto := safubusc.GetDescricao(vm_ParCodigo, 'safaem', 'EMCodEmp', 'EMMeiPag');

  if vm_StrMeioPagto <> EmptyStr then
     lblEmpresa.Caption := lblEmpresa.Caption + '     Meio Pagto: ' + vm_StrMeioPagto;

  if (tb_Paciente.State in [dsEdit, dsInsert]) then
  begin
     if (lblEmpresa.Caption = '') then
        tb_PacientePCCodEmp.Clear
     else
     begin
        vm_Mes := ObtemValorBD('select EMMesNovCon from safaem where EMCodEmp = '+tb_PacientePCCodEmp.AsString, dm_Geral.ADOConnection);
        if Not VarIsNull(vm_Mes) then
           tb_PacientePCMesNovCon.Value := vm_Mes;
     end;
  end;
END;

PROCEDURE Tfm_Cadastro.MostrarMarca(vm_ParCodigo: Integer);
BEGIN
  lblMarca.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safama', 'MACodMar', 'MADescricao');
  if (lblMarca.Caption = '') and (tb_Aparelho.State in [dsEdit, dsInsert]) then
     tb_AparelhoAPCodMar.Clear;
END;

FUNCTION Tfm_Cadastro.MaiorCodigo(vm_ParCampoChave, vm_ParTabela : String; vm_ParFiltro: String = ''): Integer;
var codemp: Integer;
    oQuery: TADOQuery;
BEGIN

  try

    oQuery := TADOQuery.Create(Nil);

    oQuery.Connection :=  dm_Geral.ADOConnection;

    oQuery.SQL.Text := 'select max( ' + vm_ParCampoChave + ' ) from ' + vm_ParTabela + ' ' + vm_ParFiltro;

    oQuery.Open;

    Result := oQuery.Fields[0].AsInteger;

  finally
    oQuery.Close;
    oQuery.Free;
  end;

END;


{
PROCEDURE Tfm_Cadastro.OutroEstado(Sender: TObject);
VAR I:Integer;
    vm_BooEdit   :Boolean;
    vm_BooInsert :Boolean;
    vm_BooBrowse :Boolean;
BEGIN

// Evento compartilhado

IF (vm_ObjTable = Nil)                              OR
   ((Sender As TDataSource).DataSet <> vm_ObjTable) THEN
   Exit;

vm_BooEdit   := (Sender As TDataSource).State = dsEdit;
vm_BooInsert := (Sender As TDataSource).State = dsInsert;
vm_BooBrowse := (Sender As TDataSource).State = dsBrowse;

FOR I:=0 TO Self.ComponentCount-1 DO
    BEGIN

    IF TControl(Self.Components[I]).Parent = vm_ObjTabSheet THEN
       BEGIN

       IF (Self.Components[I].ClassType = TDBEdit) OR
          (Self.Components[I].ClassType = TDBLookupComboBox) OR
          (Self.Components[I].ClassType = TDBComboBox) OR
          (Self.Components[I].ClassType = TDBCheckBox) OR
          (Self.Components[I].ClassType = TEdit) THEN
          BEGIN
          IF TWinControl(Self.Components[I]).TabOrder = 0 THEN
             TWinControl(Self.Components[I]).Enabled := vm_BooInsert
          ELSE
             TWinControl(Self.Components[I]).Enabled := (vm_BooEdit OR vm_BooInsert);
          END;

       IF (Self.Components[I].ClassType = TDBGrid) THEN
          BEGIN
          TWinControl(Self.Components[I]).Enabled := vm_BooBrowse;
          END;

       END;

    END;

bt_Salvar.Enabled   := (vm_BooEdit OR vm_BooInsert);
bt_Incluir.Enabled  := vm_BooBrowse;
bt_Alterar.Enabled  := vm_BooBrowse;
bt_Cancelar.Enabled := (vm_BooEdit OR vm_BooInsert);
bt_Deletar.Enabled  := vm_BooBrowse;
bt_Procurar.Enabled := vm_BooBrowse;
bt_Imprimir.Enabled := vm_BooBrowse;
bt_Anterior.Enabled := vm_BooBrowse;
bt_Proximo.Enabled  := vm_BooBrowse;

dg_Consulta.Visible := False;

END;
}


PROCEDURE Tfm_Cadastro.OutroEstado(Sender: TObject);
VAR I:Integer;
    vm_BooEdit   :Boolean;
    vm_BooInsert :Boolean;
    vm_BooBrowse :Boolean;
BEGIN

// Evento compartilhado

IF (vm_ObjTable = Nil)                              OR
   ((Sender As TDataSource).DataSet <> vm_ObjTable) THEN
   Exit;

vm_BooEdit   := (Sender As TDataSource).State = dsEdit;
vm_BooInsert := (Sender As TDataSource).State = dsInsert;
vm_BooBrowse := (Sender As TDataSource).State = dsBrowse;

FOR I:=0 TO Self.ComponentCount-1 DO
    BEGIN

    IF (TControl(Self.Components[I]).Parent = vm_ObjTabSheet) or
       (TControl(Self.Components[I]).Parent = FormatBarAnotacao) or
       (TControl(Self.Components[I]).Parent = ToolbarAnotacao) THEN
       BEGIN

       IF (Self.Components[I]).ClassType = TPanel THEN
           BEGIN

           IF Copy(Self.Components[I].Name,1,6) = 'pn_TMP' THEN
              BEGIN
              TWinControl(Self.Components[I]).Visible := (vm_BooInsert OR vm_BooEdit);
              IF (vm_BooInsert OR vm_BooEdit) THEN
                 BEGIN
                 TTable(FindComponent('tb_'+Copy(Self.Components[I].Name,4,4))).Active := False;
                 TTable(FindComponent('tb_'+Copy(Self.Components[I].Name,4,4))).Active := (vm_BooInsert OR vm_BooEdit);
                 END;
              END;

           END;


       IF (Self.Components[I].ClassType = TDBEdit) OR
          (Self.Components[I].ClassType = TDBLookupComboBox) OR
          (Self.Components[I].ClassType = TwwDBComboBox) OR
          (Self.Components[I].ClassType = TDBComboBox) OR
          (Self.Components[I].ClassType = TDBCheckBox) OR
          (Self.Components[I].ClassType = TCheckBox)   OR
          (Self.Components[I].ClassType = TDBMemo)     OR
          (Self.Components[I].ClassType = TwwDBRichEdit)     OR
          (Self.Components[I].ClassType = TwwDBLookupCombo)  OR
          (Self.Components[I].ClassType = TEdit)       THEN

          BEGIN
          IF (TWinControl(Self.Components[I]).TabOrder  = 0)           AND
             (Copy(TWinControl(Self.Components[I]).Name,4,3) = 'Cod') THEN
             TWinControl(Self.Components[I]).Enabled := vm_BooInsert
          ELSE
             TWinControl(Self.Components[I]).Enabled := (vm_BooEdit OR vm_BooInsert);
          END;

       IF (Self.Components[I].ClassType = TDBGrid) THEN
          BEGIN
          TWinControl(Self.Components[I]).Enabled := vm_BooBrowse;
          END;


       IF (Self.Components[I].ClassType = TSpeedButton) THEN
          BEGIN
          TWinControl(Self.Components[I]).Enabled := (vm_BooEdit OR vm_BooInsert);
          END;

       END;

    END;

bt_Salvar.Enabled   := (vm_BooEdit OR vm_BooInsert);
bt_Incluir.Enabled  := vm_BooBrowse;
bt_Alterar.Enabled  := vm_BooBrowse;
bt_Cancelar.Enabled := (vm_BooEdit OR vm_BooInsert);
bt_Deletar.Enabled  := vm_BooBrowse;
bt_Procurar.Enabled := vm_BooBrowse and (Sender <> ds_PacienteContato);
bt_Imprimir.Enabled := vm_BooBrowse;

dg_Consulta.Visible := False;

lblFuncaoLabel.Enabled := Not vm_BooBrowse;
lblEmpresaLabel.Enabled := Not vm_BooBrowse;
lblMarcaLabel.Enabled := Not vm_BooBrowse;

if (Sender = ds_Paciente) then
begin
    pg_PacienteContato.TabVisible := Not vm_BooInsert;
end;

if (Sender = ds_PacienteContato) then
begin
    pg_Paciente.TabVisible := Not vm_BooInsert;
    pg_Anotacao.TabVisible := Not vm_BooInsert;
end;


END;



FUNCTION Tfm_Cadastro.CLCRIPTO(const vm_ParMem, vm_ParCha : String) : String;
var vm_TamCha           : Integer;
    vm_TamMem           : Integer;
    vm_Contad           : Integer;
    vm_MemCri,vm_TemMem : String[10];
    S,vm_VarMem         : String;
    vt_AscMem           : array[1..10] of Integer;
    vm_ASC              : String[97];
    I                   : Byte;

begin

vm_TamCha := length(vm_ParMem);
vm_TamMem := 0;
vm_Contad := 0;
vm_MemCri := '';
vm_VarMem := vm_ParMem;
S         := '';

{ vm_ASC = SPACE(105) }
FOR I:=1 TO 96 DO
    S:=S+' ';
vm_ASC      := S;

vm_ASC[001] := '!';
vm_ASC[002] := '#';
vm_ASC[003] := '$';
vm_ASC[004] := '%';
vm_ASC[005] := '&';
vm_ASC[006] := '(';
vm_ASC[007] := '*';
vm_ASC[008] := '+';
vm_ASC[009] := ',';
vm_ASC[010] := '-';
vm_ASC[011] := '.';
vm_ASC[012] := '/';
vm_ASC[013] := '0';
vm_ASC[014] := '1';
vm_ASC[015] := '2';
vm_ASC[016] := '3';
vm_ASC[017] := '4';
vm_ASC[018] := '5';
vm_ASC[019] := '6';
vm_ASC[020] := '7';
vm_ASC[021] := '8';
vm_ASC[022] := '9';
vm_ASC[023] := ':';
vm_ASC[024] := ';';
vm_ASC[025] := '<';
vm_ASC[026] := '=';
vm_ASC[027] := '>';
vm_ASC[028] := '?';
vm_ASC[029] := '@';
vm_ASC[030] := 'A';
vm_ASC[031] := 'B';
vm_ASC[032] := 'C';
vm_ASC[033] := 'D';
vm_ASC[034] := 'E';
vm_ASC[035] := 'F';
vm_ASC[036] := 'G';
vm_ASC[037] := 'H';
vm_ASC[038] := 'I';
vm_ASC[039] := 'J';
vm_ASC[040] := 'K';
vm_ASC[041] := 'L';
vm_ASC[042] := 'M';
vm_ASC[043] := 'N';
vm_ASC[044] := 'O';
vm_ASC[045] := 'P';
vm_ASC[046] := 'Q';
vm_ASC[047] := 'R';
vm_ASC[048] := 'S';
vm_ASC[049] := 'T';
vm_ASC[050] := 'U';
vm_ASC[051] := 'V';
vm_ASC[052] := 'W';
vm_ASC[053] := 'X';
vm_ASC[054] := 'Y';
vm_ASC[055] := 'Z';
vm_ASC[056] := '[';
vm_ASC[057] := '\';
vm_ASC[058] := ']';
vm_ASC[059] := '^';
vm_ASC[060] := '_';
vm_ASC[061] := 'a';
vm_ASC[062] := 'b';
vm_ASC[063] := 'c';
vm_ASC[064] := 'd';
vm_ASC[065] := 'e';
vm_ASC[066] := 'f';
vm_ASC[067] := 'g';
vm_ASC[068] := 'h';
vm_ASC[069] := 'i';
vm_ASC[070] := 'j';
vm_ASC[071] := 'k';
vm_ASC[072] := 'l';
vm_ASC[073] := 'm';
vm_ASC[074] := 'n';
vm_ASC[075] := 'o';
vm_ASC[076] := 'p';
vm_ASC[077] := 'q';
vm_ASC[078] := 'r';
vm_ASC[079] := 's';
vm_ASC[080] := 't';
vm_ASC[081] := 'u';
vm_ASC[082] := 'v';
vm_ASC[083] := 'w';
vm_ASC[084] := 'x';
vm_ASC[085] := 'y';
vm_ASC[086] := 'z';
vm_ASC[087] := 'ç';
vm_ASC[088] := '{';
vm_ASC[089] := '|';
vm_ASC[090] := '}';
vm_ASC[091] := '~';
vm_ASC[092] := 'á';
vm_ASC[093] := 'é';
vm_ASC[094] := 'í';
vm_ASC[095] := 'ó';
vm_ASC[096] := 'ú';


FOR vm_Contad := 1 TO vm_TamCha DO
    BEGIN
    vt_AscMem[vm_Contad] := pos(copy(vm_ParCha, vm_Contad, 1),vm_ASC);
    END;

FOR vm_Contad := 1 TO vm_TamCha DO
    BEGIN
    FOR vm_TamMem := 1 TO length(vm_VarMem) DO
        IF vm_TamMem >= vm_TamCha THEN
           vm_MemCri := vm_MemCri + vm_ASC[(pos(copy(vm_VarMem, vm_TamMem, 1),vm_ASC)+
                        vt_AscMem[1+(vm_TamMem mod vm_TamCha)])  mod 96]
        ELSE
           vm_MemCri := vm_MemCri + vm_ASC[(pos(copy(vm_VarMem, vm_TamMem, 1),vm_ASC)+
                        vt_AscMem[vm_TamMem mod vm_TamCha])      mod 96];
    vm_TemMem := vm_MemCri;
    vm_VarMem := vm_MemCri;
    vm_MemCri := '';
    END;

CLCRIPTO:=vm_TemMem;

end;


procedure Tfm_Cadastro.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_Cadastro.bt_SalvarClick(Sender: TObject);
begin

 vm_ObjTable.UpdateRecord;

 vm_ObjTable.Post;
 Mensagem(vm_ObjFieldKey.DisplayLabel+' '+vm_ObjFieldKey.AsString+
          ' salvo com sucesso',StatusBar,False);

end;

procedure Tfm_Cadastro.tb_ConvenioAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_ConvenioPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;


procedure Tfm_Cadastro.bt_IncluirClick(Sender: TObject);
begin
vm_ObjTable.Insert;
if vm_ObjEdit.CanFocus then vm_ObjEdit.SetFocus;
Mensagem('Incluindo um novo registro!',StatusBar,False);
end;


procedure Tfm_Cadastro.TabSheetShow(Sender: TObject);
begin

// Evento compartilhado

vm_ObjTable    := Nil;
vm_ObjSource   := Nil;
vm_ObjFieldKey := Nil;
vm_ObjFieldNom := Nil;

vm_ObjTabSheet := TTabSheet(Sender);

IF (Sender = pg_Pacientes) or (Sender = pg_Paciente) or (Sender = pg_Anotacao) THEN
   BEGIN

     if pg_CadastroPaciente.ActivePage = pg_PacienteContato then
     begin

       vm_ObjTable    := tb_PacienteContato;
       vm_ObjSource   := ds_PacienteContato;
       vm_ObjFieldKey := tb_PacienteContatoPCCOSequencia;
       vm_ObjFieldNom := nil; //dm_Geral.tb_PacientePCNome;
       vm_ObjEdit     := cb_PacienteContatoTipoContato;
       vm_StrTableDB  := 'SAFAPCCO';
       OutroEstado(vm_ObjSource);


     end
     else
     begin
     
       vm_ObjTable    := tb_Paciente;
       vm_ObjSource   := ds_Paciente;
       vm_ObjFieldKey := tb_PacientePCCodPac;
       vm_ObjFieldNom := dm_Geral.tb_PacientePCNome;
       vm_ObjEdit     := ed_DesPac;
       vm_StrTableDB  := 'SAFAPC';

       if (Sender = pg_Anotacao) then
         vm_ObjTabSheet := pg_Anotacao
       else
         vm_ObjTabSheet := pg_Paciente;

       OutroEstado(vm_ObjSource);

     end;

   END;

IF Sender = pg_Paciente THEN
   BEGIN
   vm_ObjTable    := tb_Paciente;
   vm_ObjSource   := ds_Paciente;
   vm_ObjFieldKey := tb_PacientePCCodPac;
   vm_ObjFieldNom := dm_Geral.tb_PacientePCNome;
   vm_ObjEdit     := ed_DesPac;
   vm_StrTableDB  := 'SAFAPC';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_PacienteContato THEN
   BEGIN
   vm_ObjTable    := tb_PacienteContato;
   vm_ObjSource   := ds_PacienteContato;
   vm_ObjFieldKey := tb_PacienteContatoPCCOSequencia;
   vm_ObjFieldNom := nil; //dm_Geral.tb_PacientePCNome;
   vm_ObjEdit     := cb_PacienteContatoTipoContato;
   vm_StrTableDB  := 'SAFAPCCO';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Convenio THEN
   BEGIN
   vm_ObjTable    := tb_Convenio;
   vm_ObjSource   := ds_Convenio;
   vm_ObjFieldKey := tb_ConvenioCVCodCon;
   vm_ObjFieldNom := dm_Geral.tb_ConvenioCVDescricao;
   vm_ObjEdit     := ed_DesCon;
   vm_StrTableDB  := 'SAFACV';
   OutroEstado(vm_ObjSource);
   END;

IF Sender =  pg_Patologia THEN
   BEGIN
   vm_ObjTable    := tb_Patologia;
   vm_ObjSource   := ds_Patologia;
   vm_ObjFieldKey := tb_PatologiaPTCodPat;
   vm_ObjFieldNom := dm_Geral.tb_PatologiaPTDescricao;
   vm_ObjEdit     := ed_DesPat;
   vm_StrTableDB  := 'SAFAPT';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Empresa THEN
   BEGIN
   vm_ObjTable    := tb_Empresa;
   vm_ObjSource   := ds_Empresa;
   vm_ObjFieldKey := tb_EmpresaEMCodEmp;
   vm_ObjFieldNom := dm_Geral.tb_EmpresaEMRazao;
   vm_ObjEdit     := ed_DesEmp;
   vm_StrTableDB  := 'SAFAEM';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Usuario THEN
   BEGIN
   vm_ObjTable    := tb_Usuario;
   vm_ObjSource   := ds_Usuario;
   vm_ObjFieldKey := tb_UsuarioUSCodUsu;
   vm_ObjFieldNom := dm_Geral.tb_UsuarioUSNome;
   vm_ObjEdit     := ed_DesUsu;
   vm_StrTableDB  := 'SAFAUS';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Meatoscopia THEN
   BEGIN
   vm_ObjTable    := tb_Meatoscopia;
   vm_ObjSource   := ds_Meatoscopia;
   vm_ObjFieldKey := tb_MeatoscopiaMTCodMea;
   vm_ObjFieldNom := dm_Geral.tb_MeatoscopiaMTDescricao;
   vm_ObjEdit     := ed_DesMea;
   vm_StrTableDB  := 'SAFAMT';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Funcao THEN
   BEGIN
   vm_ObjTable    := tb_Funcao;
   vm_ObjSource   := ds_Funcao;
   vm_ObjFieldKey := tb_FuncaoFCCodFnc;
   vm_ObjFieldNom := dm_Geral.tb_FuncaoFCDescricao;
   vm_ObjEdit     := ed_DesFnc;
   vm_StrTableDB  := 'SAFAFC';
   OutroEstado(vm_ObjSource);
   END;

IF Sender =  pg_Comprador THEN
   BEGIN
   vm_ObjTable    := tb_Comprador;
   vm_ObjSource   := ds_Comprador;
   vm_ObjFieldKey := tb_CompradorPCCodPac;
   vm_ObjFieldNom := dm_Geral.tb_CompradorPCNome;
   vm_ObjEdit     := ed_NomCom;
   vm_StrTableDB  := 'SAFAPC';
   OutroEstado(vm_ObjSource);
   END;


IF Sender =  pg_Fornecedor THEN
   BEGIN
   vm_ObjTable    := tb_Fornecedor;
   vm_ObjSource   := ds_Fornecedor;
   vm_ObjFieldKey := tb_FornecedorFOCodFor;
   vm_ObjFieldNom := dm_Geral.tb_FornecedorFONome;
   vm_ObjEdit     := ed_NomFor;
   vm_StrTableDB  := 'SAFAFO';
   OutroEstado(vm_ObjSource);
   END;

IF Sender =  pg_Despesa THEN
   BEGIN
   vm_ObjTable    := tb_Despesa;
   vm_ObjSource   := ds_Despesa;
   vm_ObjFieldKey := tb_DespesaDECodDes;
   vm_ObjFieldNom := dm_Geral.tb_DespesaDEDescricao;
   vm_ObjEdit     := ed_DesDes;
   vm_StrTableDB  := 'SAFADE';
   OutroEstado(vm_ObjSource);
   END;

IF Sender =  pg_Marca THEN
   BEGIN
   vm_ObjTable    := tb_Marca;
   vm_ObjSource   := ds_Marca;
   vm_ObjFieldKey := tb_MarcaMACodMar;
   vm_ObjFieldNom := dm_Geral.tb_MarcaMADescricao;
   vm_ObjEdit     := ed_DesMar;
   vm_StrTableDB  := 'SAFAMA';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Aparelho THEN
   BEGIN
   vm_ObjTable    := tb_Aparelho;
   vm_ObjSource   := ds_Aparelho;
   vm_ObjFieldKey := tb_AparelhoAPCodApa;
   vm_ObjFieldNom := dm_Geral.tb_AparelhoAPDescricao;
   vm_ObjEdit     := ed_DesApa;
   vm_StrTableDB  := 'SAFAAP';
   OutroEstado(vm_ObjSource);
   END;

IF Sender = pg_Servico THEN
   BEGIN
   vm_ObjTable    := tb_Servico;
   vm_ObjSource   := ds_Servico;
   vm_ObjFieldKey := tb_ServicoSECodSer;
   vm_ObjFieldNom := dm_Geral.tb_ServicoSEDescricao;
   vm_ObjEdit     := ed_DesSer;
   vm_StrTableDB  := 'SAFASE';
   OutroEstado(vm_ObjSource);
   END;

end;

procedure Tfm_Cadastro.bt_CancelarClick(Sender: TObject);
begin
vm_ObjTable.Cancel;
Mensagem('As alterações foram canceladas',StatusBar,False);
end;

procedure Tfm_Cadastro.bt_DeletarClick(Sender: TObject);
VAR vm_Status:String;
begin

IF MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN
   vm_Status := vm_ObjFieldKey.DisplayLabel+' '+vm_ObjFieldKey.AsString+' excluído com sucesso';
   vm_ObjTable.Delete;
   Mensagem(vm_Status,StatusBar,False);
   END;

end;

procedure Tfm_Cadastro.bt_ImprimirClick(Sender: TObject);
begin

IF fm_Relatorio = nil THEN
   Application.CreateForm(Tfm_Relatorio, fm_Relatorio);


IF pg_Cadastro.ActivePage = pg_Paciente THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 0;
   fm_Relatorio.ShowModal;
   END;

IF pg_Cadastro.ActivePage = pg_Empresa THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 1;
   fm_Relatorio.ShowModal;
   END;

IF pg_Cadastro.ActivePage = pg_Convenio THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 2;
   fm_Relatorio.ShowModal;
   END;

IF pg_Cadastro.ActivePage = pg_Patologia THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 3;
   fm_Relatorio.ShowModal;
   END;


IF pg_Cadastro.ActivePage = pg_Meatoscopia THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 4;
   fm_Relatorio.ShowModal;
   END;


IF pg_Cadastro.ActivePage = pg_Funcao THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 5;
   fm_Relatorio.ShowModal;
   END;

IF pg_Cadastro.ActivePage = pg_Comprador THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 6;
   fm_Relatorio.ShowModal;
   END;

IF pg_Cadastro.ActivePage = pg_Servico THEN
   BEGIN
   fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Cadastro;
   fm_Relatorio.cb_Cadastro.ItemIndex   := 7;
   fm_Relatorio.ShowModal;
   END;

end;

procedure Tfm_Cadastro.ac_CtrNExecute(Sender: TObject);
begin
IF bt_Incluir.Enabled = True THEN
   bt_IncluirClick(bt_Incluir);
end;

procedure Tfm_Cadastro.ac_EscExecute(Sender: TObject);
begin
IF bt_Cancelar.Enabled = True THEN
   bt_CancelarClick(bt_Cancelar);
end;

procedure Tfm_Cadastro.ac_CtrSExecute(Sender: TObject);
begin
IF bt_Salvar.Enabled = True THEN
   bt_SalvarClick(bt_Salvar);
end;

procedure Tfm_Cadastro.bt_ProcurarClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, vm_StrTableDB , vm_ObjFieldKey.FieldName, vm_ObjFieldNom.FieldName) DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      vm_ObjTable.Close;
      TADOQuery(vm_ObjTable).Parameters.ParamByName(UpperCase(vm_ObjFieldKey.FieldName)).Value := Codigo;
      vm_ObjTable.Open;
    END;
  END;


end;


procedure Tfm_Cadastro.ac_BuscaExecute(Sender: TObject);
begin
IF bt_Procurar.Enabled = True THEN
   bt_ProcurarClick(bt_Procurar);
end;

procedure Tfm_Cadastro.tb_PatologiaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_PatologiaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;


procedure Tfm_Cadastro.tb_PacienteAfterScroll(DataSet: TDataSet);
begin
  RefreshTable(DataSet);
  MostrarFuncao(tb_PacientePCCodFnc.AsInteger);
  MostrarEmpresa(tb_PacientePCCodEmp.AsInteger);

  qr_PacienteContatoGrade.Close;
  qr_PacienteContatoGrade.SQL.Text := ' select SAFAPCCO.*, SAFATPCO.TPCONome from SAFAPCCO join SAFATPCO on SAFAPCCO.PCCOTipo = SAFATPCO.TPCOTipo '+
                                      ' where PCCOCodPac = :PCCOCodPac order by PCCOContato';
  qr_PacienteContatoGrade.Parameters.ParamByName('PCCOCodPac').Value := tb_PacientePCCodPac.Value;
  qr_PacienteContatoGrade.Open;

  if qr_PacienteContatoGrade.IsEmpty then
    qr_PacienteContatoGradeAfterScroll(DataSet);


{
  IF (tb_PacienteContato.SQL.Text <> '') and (tb_Paciente.State in [dsBrowse]) THEN
  BEGIN

    tb_PacienteContato.Close;
    tb_PacienteContato.Parameters.ParamByName('PCCOSEQUENCIA').Value := MaiorCodigo('PCCOSequencia', 'SAFAPCCO', ' where PCCOCodPac = '+tb_PacientePCCodPac.AsString);
    tb_PacienteContato.Open;
  END;
}
end;

// Evento Compartilhado
procedure Tfm_Cadastro.tb_TableBeforePost(DataSet: TDataSet);
VAR oQuery    : TADOQuery;
begin

IF vm_ObjFieldKey = Nil THEN
   Exit;

IF vm_ObjFieldKey.IsNull = True THEN
   BEGIN

      oQuery := TADOQuery.Create(Nil);

      oQuery.Connection :=  dm_Geral.ADOConnection;

      oQuery.SQL.Text := 'select max( ' + vm_ObjFieldKey.FieldName + ' ) from ' + vm_StrTableDB;

      oQuery.Open;

      vm_ObjFieldKey.Value := oQuery.Fields[0].AsInteger + 1;

      oQuery.Close;
      oQuery.Free;

   END;

end;

procedure Tfm_Cadastro.tb_PacientePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;


procedure Tfm_Cadastro.pn_CodPacClick(Sender: TObject);
begin

{
IF (Sender As TPanel).Name = 'pn_CodPac' THEN
   BEGIN
   pn_CodPac.Caption := '*Paciente';
   pn_DesPac.Caption := 'Nome';
   tb_Paciente.IndexFieldNames := 'PCCodPac';
   END;

IF (Sender As TPanel).Name = 'pn_DesPac' THEN
   BEGIN
   pn_CodPac.Caption := 'Paciente';
   pn_DesPac.Caption := '*Nome';
   tb_Paciente.IndexFieldNames := 'PCNome';
   END;
}

end;

procedure Tfm_Cadastro.tb_PacienteCalcFields(DataSet: TDataSet);
VAR vm_AnoAtu,vm_MesAtu,vm_DiaAtu:Word;
    vm_AnoNas,vm_MesNas,vm_DiaNas:Word;
    vm_IdadeMes:LongInt;
    vm_AtualMes:LongInt;
begin

IF tb_PacientePCDatNas.IsNull = False THEN
   BEGIN
   DecodeDate(Date,vm_AnoAtu,vm_MesAtu,vm_DiaAtu);
   DecodeDate(tb_PacientePCDatNas.Value,vm_AnoNas,vm_MesNas,vm_DiaNas);
   vm_IdadeMes := (vm_AnoNas*12)+vm_MesNas;
   vm_AtualMes := (vm_AnoAtu*12)+vm_MesAtu;
   tb_PacientePC_Idade.Value :=
               FormatFloat('#00',Int((vm_AtualMes-vm_IdadeMes)/12))+' anos e ' +
               FormatFloat('00',Frac((vm_AtualMes-vm_IdadeMes)/12)*12)+' meses';
   END

end;

procedure Tfm_Cadastro.tb_EmpresaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_EmpresaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;



procedure Tfm_Cadastro.tb_UsuarioAfterScroll(DataSet: TDataSet);
begin

ed_Senha.Text         := '';
ed_ConfirmaSenha.Text := '';

RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_UsuarioBeforePost(DataSet: TDataSet);
VAR S:String;
    vm_ObjDM  : TTable;
    vm_Indice : String;
begin


IF ed_Senha.Text <> ed_ConfirmaSenha.Text THEN
   BEGIN
   MessageDlg('As Senhas Digitadas Não São Iguais, Tente Digitá-las Novamente!',
                 mtinformation,[mbok],0);
   ed_Senha.SetFocus;
   SysUtils.Abort;
   END;

IF ed_Senha.Text <> '' THEN
   BEGIN
   S:= CLCRIPTO(ed_Senha.Text, 'CRTEC');
   tb_UsuarioUSSenha.Text := S;
   END;

tb_TableBeforePost(DataSet);

{
IF vm_ObjFieldKey = Nil THEN
   Exit;

vm_ObjDM  := TTable(dm_Geral.FindComponent(DataSet.Name));

IF vm_ObjFieldKey.IsNull = True THEN
   BEGIN
   IF vm_ObjDM.IsEmpty = True THEN
      vm_ObjFieldKey.Value := 1
   ELSE
      BEGIN
      vm_Indice := vm_ObjDM.IndexFieldNames;
      vm_ObjDM.IndexFieldNames := vm_ObjDM.Fields[0].FieldName;
      vm_ObjDM.Last;
      vm_ObjFieldKey.Value     := vm_ObjDM.Fields[0].Value+1;
      vm_ObjDM.IndexFieldNames := vm_Indice;
      END;
   END;
}

end;

procedure Tfm_Cadastro.tb_UsuarioPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;

procedure Tfm_Cadastro.tb_MeatoscopiaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_MeatoscopiaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;


procedure Tfm_Cadastro.tb_FuncaoAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_FuncaoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;

procedure Tfm_Cadastro.cb_FuncaoEnter(Sender: TObject);
begin
//dm_Geral.tb_Funcao.IndexFieldNames := 'FCDescricao';
end;

procedure Tfm_Cadastro.tb_PacientePCDatNasSetText(Sender: TField;
  const Text: String);
begin

IF (Text = '') OR (Text = '  /  /    ') THEN
   BEGIN
   Sender.Clear;
   tb_PacientePC_Idade.Clear;
   END
ELSE
   (Sender As TDateField).AsString := Text;

end;

procedure Tfm_Cadastro.tb_ConvenioAfterPost(DataSet: TDataSet);
begin

// Evento compartilhado

//DbiSaveChanges(TTable(DataSet).Handle);

end;

procedure Tfm_Cadastro.ac_F8Execute(Sender: TObject);
begin
IF bt_Imprimir.Enabled = True THEN
   bt_ImprimirClick(Sender);
end;


procedure Tfm_Cadastro.bt_AlterarClick(Sender: TObject);
begin
vm_ObjTable.Edit;
if vm_ObjEdit.CanFocus then vm_ObjEdit.SetFocus;
Mensagem('Alterando registro!',StatusBar,False);
end;

procedure Tfm_Cadastro.ac_CtrAExecute(Sender: TObject);
begin
IF bt_Alterar.Enabled = True THEN
   bt_AlterarClick(bt_Alterar);
end;

procedure Tfm_Cadastro.ed_DesPacKeyPress(Sender: TObject; var Key: Char);
VAR vm_Expressao:String;
begin

vm_Expressao := UpperCase(TCustomMaskEdit(Sender).Text+Key);

IF ((Key>='A') AND (Key<='Z')) OR ((Key>='a') AND (Key<='z')) THEN
   BEGIN
     qr_Consulta.SQL.Text := 'select ' + vm_ObjFieldNom.FieldName + ' from ' + vm_StrTableDB + ' where ' + vm_ObjFieldNom.FieldName + ' like ''' + vm_Expressao + '%''';
     qr_Consulta.Open;

     IF (qr_Consulta.RecordCount > 0) THEN
        BEGIN
          IF dg_Consulta.Visible = False THEN
             BEGIN
             dg_Consulta.Columns[0].FieldName := vm_ObjFieldNom.FieldName;
             dg_Consulta.Parent :=  vm_ObjTabSheet;
             dg_Consulta.Left   :=  TControl(Sender).Left;
             dg_Consulta.Top    :=  TControl(Sender).Top+TControl(Sender).Height;
             dg_Consulta.Width  :=  TControl(Sender).Width;
             dg_Consulta.Height :=  145;
             dg_Consulta.Visible:= True;
             IF vm_ObjTable.State = dsInsert THEN bt_Salvar.Enabled  := False;
             END;
        END
      ELSE
        BEGIN
          dg_Consulta.Visible:= False;
          bt_Salvar.Enabled  := True;
        END;
   END
ELSE
   BEGIN
   qr_Consulta.Close;
   dg_Consulta.Visible := False;
   bt_Salvar.Enabled   := True;
   END;

end;

procedure Tfm_Cadastro.ed_DesPacExit(Sender: TObject);
begin

// Evento compartilhado

dg_Consulta.Visible := False;

end;

procedure Tfm_Cadastro.tb_CompradorAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_CompradorPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;


end;

procedure Tfm_Cadastro.tb_FornecedorAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_FornecedorPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;

procedure Tfm_Cadastro.tb_MarcaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_MarcaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value +1;
      Action := daRetry;
      END;
   END;

end;

procedure Tfm_Cadastro.tb_AparelhoAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
MostrarMarca(tb_AparelhoAPCodMar.AsInteger);
end;

procedure Tfm_Cadastro.tb_AparelhoBeforePost(DataSet: TDataSet);
VAR vm_ObjDM  : TTable;
    vm_Indice : String;
    cErro     : String;
begin

// tb_TMPA.UpdateRecord;
//
// cErro := PodeExcluir(tb_TMPA, tb_Controle, 'Controle', 'CODescricao',
//                      ['','CodCon'], ['COCodApa','COCodCon'],
//                      ['SAFAIC'],['ICCodApa;ICCodCon'],['Testagens']);
//
// if cErro <> '' then begin
//    ShowMessage(cErro);
//    SysUtils.Abort;
// end;

tb_TableBeforePost(DataSet);

end;

procedure Tfm_Cadastro.lc_MarcaApaEnter(Sender: TObject);
begin
dm_Geral.tb_Marca.IndexFieldNames := 'MADescricao';
end;

procedure Tfm_Cadastro.tb_ControleAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_TMPAAfterClose(DataSet: TDataSet);
begin
//DeletarTMP(DataSet);
end;

procedure Tfm_Cadastro.tb_TMPABeforeOpen(DataSet: TDataSet);
begin
CriarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Cadastro.tb_TMPABeforePost(DataSet: TDataSet);
begin
IF tb_TMPACodCon.IsNull = True THEN
   tb_TMPACodCon.Value := tb_TMPA.RecordCount+1;
end;

procedure Tfm_Cadastro.tb_TMPAPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   tb_TMPACodCon.Value := tb_TMPACodCon.Value +1;
   Action := daRetry;
   END;

end;

procedure Tfm_Cadastro.tb_AparelhoAfterEdit(DataSet: TDataSet);
begin

tb_Controle.First;

WHILE tb_Controle.Eof = False DO
  BEGIN
  tb_TMPA.Insert;
  tb_TMPACodCon.Value     := tb_ControleCOCodCon.Value;
  tb_TMPADescricao.Value  := tb_ControleCODescricao.Value;
  tb_TMPAControle.Value   := tb_ControleCOControle.Value;
  tb_TMPAUniMed.Value     := tb_ControleCOUniMed.Value;
  tb_TMPA.Post;
  tb_Controle.Next;
  END;


end;

procedure Tfm_Cadastro.tb_AparelhoAfterPost(DataSet: TDataSet);
begin

//tb_Controle.First;
//WHILE tb_Controle.Eof = False DO tb_Controle.Delete;

tb_TMPA.First;

WHILE tb_TMPA.Eof = False DO
  BEGIN
  tb_ControleUpdate.Close;
  tb_ControleUpdate.Parameters.ParamByName('APCodApa').Value := tb_AparelhoAPCodApa.Value;
  tb_ControleUpdate.Parameters.ParamByName('CodCon').Value := tb_TMPACodCon.Value;
  tb_ControleUpdate.Open;

  IF tb_ControleUpdate.Eof THEN
  BEGIN
    tb_ControleUpdate.Insert;
    tb_ControleUpdateCOCodApa.Value    := tb_AparelhoAPCodApa.Value;
    tb_ControleUpdateCOCodCon.Value    := tb_TMPACodCon.Value;
  END
  ELSE
    tb_ControleUpdate.Edit;

  tb_ControleUpdateCODescricao.Value := tb_TMPADescricao.Value;
  tb_ControleUpdateCOControle.Value  := tb_TMPAControle.Value;
  tb_ControleUpdateCOUniMed.Value    := tb_TMPAUniMed.Value;
  
  tb_ControleUpdate.Post;
  
  tb_TMPA.Next;
  END;

//DbiSaveChanges(TTable(DataSet).Handle);
tb_Controle.Close; tb_Controle.Open;

end;

procedure Tfm_Cadastro.dg_TMPAColExit(Sender: TObject);
CONST VetUniMed : ARRAY[1..3] OF STRING = ('Graus',
                                            'DB',
                                            'Nível');
VAR  I:Byte;
begin

IF tb_TMPA.State IN [dsEdit,dsInsert] THEN
   BEGIN

   FOR I:=1 TO 3 DO
       BEGIN
       IF (tb_TMPAUniMed.IsNull = False) AND
          (UpperCase(tb_TMPAUniMed.Value) = UpperCase(Copy(VetUniMed[I],1,Length(tb_TMPAUniMed.Value)))) THEN
          BEGIN
          tb_TMPAUniMed.Value := VetUniMed[I];
          Break;
          END;
       END;

   END;


end;

procedure Tfm_Cadastro.tb_AparelhoBeforeDelete(DataSet: TDataSet);
var cErro     : String;
begin

// ShowMessage('Aparelho não pode ser excluído.');
// SysUtils.Abort;

// cErro := PodeExcluir(Nil, tb_Aparelho, 'Aparelho', 'APDescricao',
//                      [], ['APCodApa'],
//                      ['SAFAIT','SAFAIC'],['ITCodApa','ICCodApa'],['Testagens','Testagens']);

// if cErro <> '' then begin
//    ShowMessage(cErro);
//    SysUtils.Abort;
// end else begin                              /
    tb_Controle.First;
    while tb_Controle.Eof = False do tb_Controle.Delete;
// end;

end;

procedure Tfm_Cadastro.tb_ServicoAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Cadastro.tb_ServicoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   IF vm_ObjFieldKey = Nil THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END
   ELSE
      BEGIN
      vm_ObjFieldKey.Value := vm_ObjFieldKey.Value + 1;
      Action := daRetry;
      END;
   END;

end;

procedure Tfm_Cadastro.lblFuncaoLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safafc', 'FCCodFnc', 'FCDescricao') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_PacientePCCodFnc.Value := Codigo;

      MostrarFuncao(Codigo);

    END;
  END;

end;

procedure Tfm_Cadastro.edFuncaoCodigoExit(Sender: TObject);
begin
  MostrarFuncao(tb_PacientePCCodFnc.AsInteger);
end;

procedure Tfm_Cadastro.lblEmpresaLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safaem', 'EMCodEmp', 'EMRazao') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_PacientePCCodEmp.Value := Codigo;

      MostrarEmpresa(Codigo);

    END;
  END;

end;

procedure Tfm_Cadastro.edEmpresaCodigoExit(Sender: TObject);
begin
  MostrarEmpresa(tb_PacientePCCodEmp.AsInteger);
end;


procedure Tfm_Cadastro.tb_EmpresaBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Empresa.SQL.Text = '' THEN
  BEGIN
    tb_Empresa.SQL.Text := 'select * from safaem where EMCodEmp = :EMCODEMP';

    tb_Empresa.Parameters.Clear;
    tb_Empresa.Parameters.CreateParameter( 'EMCODEMP', ftInteger, pdInput, 0, 0);
    tb_Empresa.Parameters.ParamByName('EMCODEMP').Value := MaiorCodigo('EMCodEmp', 'SAFAEM');
  END;
end;

procedure Tfm_Cadastro.tb_PacienteBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Paciente.SQL.Text = '' THEN
  BEGIN
    tb_Paciente.SQL.Text := 'select * from safapc where PCCodPac = :PCCODPAC';

    tb_Paciente.Parameters.Clear;
    tb_Paciente.Parameters.CreateParameter( 'PCCODPAC', ftInteger, pdInput, 0, 0);
    tb_Paciente.Parameters.ParamByName('PCCODPAC').Value := MaiorCodigo('PCCodPac', 'SAFAPC', 'where PCTIPPAC = 0');
  END;

end;

procedure Tfm_Cadastro.FormCreate(Sender: TObject);
begin
  Self.Top := 0;
  Self.Left := 0;

  dm_Geral.tb_Setor.Open;
  dm_Geral.tb_TipoContato.Open;

  tb_Empresa.Open;
  tb_Paciente.Open;
  tb_Convenio.Open;
  tb_Patologia.Open;
  tb_Meatoscopia.Open;
  tb_Funcao.Open;
  tb_Marca.Open;
  tb_Comprador.Open;
  tb_Fornecedor.Open;
  tb_Despesa.Open;
  tb_Servico.Open;
  tb_Aparelho.Open;
  tb_Controle.Open;
  tb_Usuario.Open;
  tb_PacienteContato.Open;


  pg_Cadastro.ActivePageIndex := 1;
  pg_CadastroPaciente.ActivePageIndex := 0;

end;

procedure Tfm_Cadastro.tb_ConvenioBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Convenio.SQL.Text = '' THEN
  BEGIN
    tb_Convenio.SQL.Text := 'select * from safacv where CVCodCon = :CVCODCON';

    tb_Convenio.Parameters.Clear;
    tb_Convenio.Parameters.CreateParameter( 'CVCODCON', ftInteger, pdInput, 0, 0);
    tb_Convenio.Parameters.ParamByName('CVCODCON').Value := MaiorCodigo('CVCodCon', 'SAFACV');
  END;

end;

procedure Tfm_Cadastro.tb_PatologiaBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Patologia.SQL.Text = '' THEN
  BEGIN
    tb_Patologia.SQL.Text := 'select * from safapt where PTCodPat = :PTCODPAT';

    tb_Patologia.Parameters.Clear;
    tb_Patologia.Parameters.CreateParameter( 'PTCODPAT', ftInteger, pdInput, 0, 0);
    tb_Patologia.Parameters.ParamByName('PTCODPAT').Value := MaiorCodigo('PTCodPat', 'SAFAPT');
  END;

end;

procedure Tfm_Cadastro.tb_MeatoscopiaBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Meatoscopia.SQL.Text = '' THEN
  BEGIN
    tb_Meatoscopia.SQL.Text := 'select * from safamt where MTCodMea = :MTCODMEA';

    tb_Meatoscopia.Parameters.Clear;
    tb_Meatoscopia.Parameters.CreateParameter( 'MTCODMEA', ftInteger, pdInput, 0, 0);
    tb_Meatoscopia.Parameters.ParamByName('MTCODMEA').Value := MaiorCodigo('MTCodMea', 'SAFAMT');
  END;

end;

procedure Tfm_Cadastro.tb_FuncaoBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Funcao.SQL.Text = '' THEN
  BEGIN
    tb_Funcao.SQL.Text := 'select * from safafc where FCCodFnc = :FCCODFNC';

    tb_Funcao.Parameters.Clear;
    tb_Funcao.Parameters.CreateParameter( 'FCCODFNC', ftInteger, pdInput, 0, 0);
    tb_Funcao.Parameters.ParamByName('FCCODFNC').Value := MaiorCodigo('FCCodFnc', 'SAFAFC');
  END;

end;

procedure Tfm_Cadastro.tb_MarcaBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Marca.SQL.Text = '' THEN
  BEGIN
    tb_Marca.SQL.Text := 'select * from safama where MACodMar = :MACODMar';

    tb_Marca.Parameters.Clear;
    tb_Marca.Parameters.CreateParameter( 'MACODMAR', ftInteger, pdInput, 0, 0);
    tb_Marca.Parameters.ParamByName('MACODMAR').Value := MaiorCodigo('MACodMar', 'SAFAMA');
  END;

end;

procedure Tfm_Cadastro.tb_CompradorBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Comprador.SQL.Text = '' THEN
  BEGIN
    tb_Comprador.SQL.Text := 'select * from safapc where PCCodPac = :PCCODPAC';

    tb_Comprador.Parameters.Clear;
    tb_Comprador.Parameters.CreateParameter( 'PCCODPAC', ftInteger, pdInput, 0, 0);
    tb_Comprador.Parameters.ParamByName('PCCODPAC').Value := MaiorCodigo('PCCodPac', 'SAFAPC', 'where PCTIPPAC = 1');
  END;

end;

procedure Tfm_Cadastro.tb_FornecedorBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Fornecedor.SQL.Text = '' THEN
  BEGIN
    tb_Fornecedor.SQL.Text := 'select * from safafo where FOCodFor = :FOCODFOR';

    tb_Fornecedor.Parameters.Clear;
    tb_Fornecedor.Parameters.CreateParameter( 'FOCODFOR', ftInteger, pdInput, 0, 0);
    tb_Fornecedor.Parameters.ParamByName('FOCODFOR').Value := MaiorCodigo('FOCodFor', 'SAFAFO');
  END;

end;

procedure Tfm_Cadastro.tb_DespesaBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Despesa.SQL.Text = '' THEN
  BEGIN
    tb_Despesa.SQL.Text := 'select * from safade where DECodDes = :DECODDES';

    tb_Despesa.Parameters.Clear;
    tb_Despesa.Parameters.CreateParameter( 'DECODDES', ftInteger, pdInput, 0, 0);
    tb_Despesa.Parameters.ParamByName('DECODDES').Value := MaiorCodigo('DECodDes', 'SAFADE');
  END;

end;

procedure Tfm_Cadastro.tb_ServicoBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Servico.SQL.Text = '' THEN
  BEGIN
    tb_Servico.SQL.Text := 'select * from safase where SECodSer = :SECODSER';

    tb_Servico.Parameters.Clear;
    tb_Servico.Parameters.CreateParameter( 'SECODSER', ftInteger, pdInput, 0, 0);
    tb_Servico.Parameters.ParamByName('SECODSER').Value := MaiorCodigo('SECodSer', 'SAFASE');
  END;

end;

procedure Tfm_Cadastro.tb_AparelhoBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Aparelho.SQL.Text = '' THEN
  BEGIN
    tb_Aparelho.SQL.Text := 'select * from safaap where APCodApa = :APCODAPA';

    tb_Aparelho.Parameters.Clear;
    tb_Aparelho.Parameters.CreateParameter( 'APCODAPA', ftInteger, pdInput, 0, 0);
    tb_Aparelho.Parameters.ParamByName('APCODAPA').Value := MaiorCodigo('APCodApa', 'SAFAAP');
  END;

end;

procedure Tfm_Cadastro.lblMarcaLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safama', 'MACodMar', 'MADescricao') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_AparelhoAPCodMar.Value := Codigo;

      MostrarMarca(Codigo);

    END;
  END;

end;

procedure Tfm_Cadastro.tb_UsuarioBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Usuario.SQL.Text = '' THEN
  BEGIN
    tb_Usuario.SQL.Text := 'select * from Safaus where USCodUsu = :USCODUSU';

    tb_Usuario.Parameters.Clear;
    tb_Usuario.Parameters.CreateParameter( 'USCODUSU', ftInteger, pdInput, 0, 0);
    tb_Usuario.Parameters.ParamByName('USCODUSU').Value := MaiorCodigo('USCodUsu', 'SAFAUS');
  END;

end;

procedure Tfm_Cadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  dm_Geral.tb_Setor.Close;
  dm_Geral.tb_TipoContato.Close;

  Action := caFree;
  fm_Cadastro := nil;
end;

procedure Tfm_Cadastro.edFuncaoCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblFuncaoLabelClick(Sender);

end;

procedure Tfm_Cadastro.edEmpresaCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblEmpresaLabelClick(Sender);

end;

procedure Tfm_Cadastro.ed_MarcaCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblMarcaLabelClick(Sender);

end;

procedure Tfm_Cadastro.edFuncaoCodigoEnter(Sender: TObject);
begin

  IF (tb_PacientePCCodFnc.IsNull) THEN
     lblFuncaoLabelClick(Sender);

end;

procedure Tfm_Cadastro.edEmpresaCodigoEnter(Sender: TObject);
begin
  IF (tb_PacientePCCodEmp.IsNull) THEN
     lblEmpresaLabelClick(Sender);
end;

procedure Tfm_Cadastro.ed_MarcaCodigoEnter(Sender: TObject);
begin
  IF (tb_AparelhoAPCodMar.IsNull) THEN
     lblMarcaLabelClick(Sender);
end;

procedure Tfm_Cadastro.BoldButtonClick(Sender: TObject);
begin
  RichEdit1.SetStyleAttribute(fsBold, not TempDown);
{  if (TempDown) then
     richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style -[fsBold]
  else
     richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style +[fsBold];}
  RefreshControls;
end;

procedure Tfm_Cadastro.UnderlineButtonClick(Sender: TObject);
begin
  RichEdit1.SetStyleAttribute(fsUnderline, not TempDown);
{  if (TempDown) then
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style -[fsUnderline]
  else
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style +[fsUnderline];}
  RefreshControls;
end;

procedure Tfm_Cadastro.ItalicButtonClick(Sender: TObject);
begin
  RichEdit1.SetStyleAttribute(fsItalic, not TempDown);
{  if (TempDown) then
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style -[fsItalic]
  else
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style +[fsItalic];}
  RefreshControls;
end;

procedure Tfm_Cadastro.RightButtonClick(Sender: TObject);
begin
  richedit1.Paragraph.Alignment:= taRightJustify;
  RefreshControls;
end;

procedure Tfm_Cadastro.CenterButtonClick(Sender: TObject);
begin
  richedit1.Paragraph.Alignment:= taCenter;
  RefreshControls;
end;

procedure Tfm_Cadastro.LeftButtonClick(Sender: TObject);
begin
  richedit1.Paragraph.Alignment:= taLeftJustify;
  RefreshControls;
end;

procedure Tfm_Cadastro.BulletButtonClick(Sender: TObject);
begin
  RichEdit1.SetBullet(not TempDown);
  RefreshControls;
end;


procedure Tfm_Cadastro.RefreshControls;
var haveSelection, haveText: boolean;
begin
  BoldButton.down:= fsBold in richedit1.SelAttributes.Style;
  UnderlineButton.down:= fsUnderline in richedit1.SelAttributes.Style;
  ItalicButton.down:= fsItalic in richedit1.SelAttributes.Style;
  FontNameCombo.itemIndex:= FontNameCombo.items.indexOf(RichEdit1.SelAttributes.Name);
  if FontNameCombo.itemIndex<0 then begin
     FontNameCombo.text:= RichEdit1.SelAttributes.Name;
     FontNameCombo.font.color:=clRed;
  end
  else FontNameCombo.font.color:=clWindowText;
  FontSizeCombo.itemIndex:= FontSizeCombo.items.indexOf(inttostr(RichEdit1.SelAttributes.Size));

  if FontSizeCombo.itemindex = -1 then
     FontSizeCombo.Text :=inttostr(RichEdit1.SelAttributes.Size);

  BulletButton.down:= richedit1.Paragraph.Numbering = nsBullet;
  HighlightButton.Down:= (ColorToRGB(richedit1.GetTextBackgroundColor)=ColorToRGB(RichEdit1.HighlightColor));

  if ord(richedit1.Paragraph.Alignment) = PFA_FULLJUSTIFY-1 then
     JustifyButton.Down:= True
  else begin
    case richedit1.Paragraph.Alignment of
      taLeftJustify: LeftButton.Down:= True;
      taCenter: CenterButton.Down:= True;
      taRightJustify: RightButton.Down:= True;
    end;
  end;


    PasteButton.enabled:= RichEdit1.CanPaste and (not RichEdit1.readonly);
    UndoButton.enabled:= RichEdit1.CanUndo;

    haveSelection:= RichEdit1.CanCut;
    haveText:= (RichEdit1.Lines.Count>1) or
               (RichEdit1.Lines.Count=1) and (RichEdit1.Lines[0]<>'');
    CutButton.enabled:= haveSelection and (not RichEdit1.readonly);
    CopyButton.enabled:= haveSelection;
    FindButton.enabled:= haveText;

end;

procedure Tfm_Cadastro.Print1Click(Sender: TObject);
begin
   printdialog1.collate:= True;
   if printdialog1.execute then
   begin
        RichEdit1.Print('Imprimindo anotações do paciente.');
   end
end;

procedure Tfm_Cadastro.FindButtonClick(Sender: TObject);
begin
   richedit1.ExecuteFindDialog;
end;

procedure Tfm_Cadastro.CutButtonClick(Sender: TObject);
begin
   Richedit1.CutToClipboard;
end;

procedure Tfm_Cadastro.CopyButtonClick(Sender: TObject);
begin
   Richedit1.CopyToClipboard;
end;

procedure Tfm_Cadastro.PasteButtonClick(Sender: TObject);
begin
   Richedit1.PasteFromClipboard;
end;

procedure Tfm_Cadastro.UndoButtonClick(Sender: TObject);
begin
    SendMessage(RichEdit1.Handle, EM_UNDO, 0, 0);
    RefreshControls;
end;

procedure Tfm_Cadastro.HighlightButtonClick(Sender: TObject);
begin
  with (Sender as TSpeedButton) do begin
     if not Down then RichEdit1.SetTextBackgroundColor(-1)
     else RichEdit1.SetTextBackgroundColor(RichEdit1.HighlightColor);
  end;
  RefreshControls;
end;

procedure Tfm_Cadastro.pg_AnotacaoShow(Sender: TObject);
begin
  TabSheetShow(Sender);
  if FontNameCombo.Items.Count = 0 then begin
     for i:= 0 to Screen.Fonts.Count-1 do begin
        if ((RichEdit1.EffectiveEditWidth=rewWindowSize) or
            (Printer.Fonts.indexOf(Screen.Fonts[i])>=0)) and (Pos('@', Screen.Fonts[i]) = 0) then
           FontNameCombo.Items.Add(Screen.Fonts[i]);
     end;
     FontNameCombo.ItemIndex := FontNameCombo.Items.IndexOf('MS Sans Serif');
     SetRichEditFontName(FontNameCombo.Text);
     RefreshControls;
     FontSizeCombo.Text := '10';
     if RichEdit1.CanFocus then RichEdit1.SetFocus();

     //InitColorMenu;
  end;
end;

Procedure Tfm_Cadastro.SetRichEditFontName(Value: string);
var Format: TCharFormat;
begin
  if RichEdit1.selAttributes.Name=Value then exit;
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  with Format do
  begin
    dwMask:= CFM_FACE OR CFM_CHARSET;
    StrPLCopy(szFaceName, Value, SizeOf(szFaceName));
    bCharSet := RichEdit1.GetCharSetOfFontName(Value);
  end;
  SendMessage(RichEdit1.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));
end;


procedure Tfm_Cadastro.FontNameComboCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  SetRichEditFontName(FontNameCombo.Text);
  RichEdit1.SetFocus;
  RefreshControls;

end;

procedure Tfm_Cadastro.FontSizeComboCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
   if not Select then exit;
   if FontSizeCombo.text='' then exit;
   RichEdit1.SelAttributes.Size:= StrToInt(FontSizeCombo.Text);
   RichEdit1.SetFocus;
   RefreshControls;

end;

procedure Tfm_Cadastro.ColorButtonClick(Sender: TObject);
var p: TPoint;
begin

  p:= FormatBarAnotacao.ClientToScreen(Point(ColorButton.left, ColorButton.Top + ColorButton.Height));

  PopupMenu1.Popup(p.X-1, p.Y); // cristian

end;


procedure Tfm_Cadastro.ColorClick(Sender: TObject);
begin
   RichEdit1.SelAttributes.Color:= (Sender as TMenuItem).Tag;
end;

procedure Tfm_Cadastro.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if RichEdit1.readOnly then begin
     if ord(key)=vk_escape then Close;
  end
  else if ord(key)=vk_escape then begin
     if reoCloseOnEscape in RichEdit1.EditorOptions then
        Close
     else
        UndoButtonClick(Sender)
  end
  else begin
     if GetKeyState(VK_CONTROL) >=0 then exit;

     if ord(key)=(ord('B')+1-ord('A')) then begin
        TempDown:=  fsBold in richedit1.SelAttributes.Style;
        BoldButton.onClick(BoldButton);
        key:= #0;
     end
     else if ord(key)=(ord('U')+1-ord('A')) then begin
        TempDown:=  fsUnderline in richedit1.SelAttributes.Style;
        UnderlineButton.onClick(UnderlineButton);
        key:= #0;
     end
     else if ord(key)=(ord('I')+1-ord('A')) then begin
        TempDown:=  fsItalic in richedit1.SelAttributes.Style;
        ItalicButton.onClick(ItalicButton);
        key:= #0;
     end
  end

end;

procedure Tfm_Cadastro.RichEdit1SelectionChange(Sender: TObject);
begin
  RefreshControls;
end;

procedure Tfm_Cadastro.tb_PacienteContatoBeforeOpen(DataSet: TDataSet);
begin

  IF tb_PacienteContato.SQL.Text = '' THEN
  BEGIN
    tb_PacienteContato.SQL.Text := 'select * from SAFAPCCO where PCCOSequencia = :PCCOSEQUENCIA';

    tb_PacienteContato.Parameters.Clear;
    tb_PacienteContato.Parameters.CreateParameter( 'PCCOSEQUENCIA', ftInteger, pdInput, 0, 0);
    tb_PacienteContato.Parameters.ParamByName('PCCOSEQUENCIA').Value := MaiorCodigo('PCCOSequencia', 'SAFAPCCO', ' where PCCOCodPac = '+tb_PacientePCCodPac.AsString);
  END;

end;

procedure Tfm_Cadastro.tb_PacienteContatoBeforePost(DataSet: TDataSet);
VAR oQuery    : TADOQuery;
begin

IF vm_ObjFieldKey = Nil THEN
   Exit;

IF vm_ObjFieldKey.IsNull = True THEN
   BEGIN

      oQuery := TADOQuery.Create(Nil);

      oQuery.Connection :=  dm_Geral.ADOConnection;

      oQuery.SQL.Text := 'select max( ' + vm_ObjFieldKey.FieldName + ' ) from ' + vm_StrTableDB;

      oQuery.Open;

      vm_ObjFieldKey.Value := oQuery.Fields[0].AsInteger + 1;

      oQuery.Close;

      oQuery.Free;

   END;



end;

procedure Tfm_Cadastro.tb_PacienteContatoAfterInsert(DataSet: TDataSet);
begin
  tb_PacienteContatoPCCOCodPac.Value := tb_PacientePCCodPac.Value;
end;

procedure Tfm_Cadastro.qr_PacienteContatoGradeAfterScroll(
  DataSet: TDataSet);
begin

  RefreshTable(DataSet);

  IF (tb_PacienteContato.SQL.Text <> '') and (tb_Paciente.State in [dsBrowse]) and (tb_PacienteContato.State in [dsBrowse]) THEN
  BEGIN

    tb_PacienteContato.Close;
    tb_PacienteContato.Parameters.ParamByName('PCCOSEQUENCIA').Value := qr_PacienteContatoGradePCCOSequencia.Value;
    tb_PacienteContato.Open;
  END;

end;

procedure Tfm_Cadastro.tb_PacienteContatoAfterPost(DataSet: TDataSet);
begin
  tb_ConvenioAfterPost(DataSet);

  qr_PacienteContatoGrade.Close;
  qr_PacienteContatoGrade.SQL.Text := ' select SAFAPCCO.*, SAFATPCO.TPCONome from SAFAPCCO join SAFATPCO on SAFAPCCO.PCCOTipo = SAFATPCO.TPCOTipo '+
                                      ' where PCCOCodPac = :PCCOCodPac order by PCCOContato';
  qr_PacienteContatoGrade.Parameters.ParamByName('PCCOCodPac').Value := tb_PacientePCCodPac.Value;
  qr_PacienteContatoGrade.Open;

end;

procedure Tfm_Cadastro.tb_PacienteContatoAfterDelete(DataSet: TDataSet);
begin

  qr_PacienteContatoGrade.Close;
  qr_PacienteContatoGrade.SQL.Text := ' select SAFAPCCO.*, SAFATPCO.TPCONome from SAFAPCCO join SAFATPCO on SAFAPCCO.PCCOTipo = SAFATPCO.TPCOTipo '+
                                      ' where PCCOCodPac = :PCCOCodPac order by PCCOContato';
  qr_PacienteContatoGrade.Parameters.ParamByName('PCCOCodPac').Value := tb_PacientePCCodPac.Value;
  qr_PacienteContatoGrade.Open;

  if qr_PacienteContatoGrade.IsEmpty then
    qr_PacienteContatoGradeAfterScroll(DataSet);


end;

end.
