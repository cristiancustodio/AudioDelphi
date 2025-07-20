unit safuexam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, StdCtrls, ToolWin, Buttons, DBCtrls, Mask,
  Grids, DBGrids, Db, DBTables, ActnList, DBActns, Bde, Math, ADODB;

type
  Tfm_Exame = class(TForm)
    StatusBar: TStatusBar;
    PageControl: TPageControl;
    pg_Exame: TTabSheet;
    Bevel2: TBevel;
    pg_ViaAeria: TTabSheet;
    pg_ViaOssea: TTabSheet;
    pg_Grafico: TTabSheet;
    Bevel3: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Label1: TLabel;
    Bevel19: TBevel;
    Label2: TLabel;
    cb_AudiometroExame: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    ed_NumExaExame: TDBEdit;
    ed_DatExaExame: TDBEdit;
    Label6: TLabel;
    cb_TipExaExame: TDBComboBox;
    lb_IdadePac: TDBText;
    Label23: TLabel;
    lblPacienteLabel: TLabel;
    Label8: TLabel;
    ed_RepousoExame: TDBEdit;
    Bevel20: TBevel;
    lblEmpresaLabel: TLabel;
    sp_Direita: TShape;
    sp_Esquerda: TShape;
    Label20: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    sp_250d: TShape;
    sp_500d: TShape;
    sp_1d: TShape;
    sp_2d: TShape;
    sp_3d: TShape;
    sp_4d: TShape;
    sp_6d: TShape;
    sp_8d: TShape;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    sp_: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    sp_250e: TShape;
    sp_500e: TShape;
    sp_1e: TShape;
    sp_2e: TShape;
    sp_3e: TShape;
    sp_4e: TShape;
    sp_6e: TShape;
    sp_8e: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    tb_Exame: TADOQuery;
    ds_Exame: TDataSource;
    tb_ExameEXDatExa: TDateField;
    tb_ExameEXTipExa: TStringField;
    tb_ExameEXCodAud: TIntegerField;
    tb_ExameEXCodPac: TIntegerField;
    tb_ExameEXNumHorRep: TIntegerField;
    tb_ExameEXCodEmp: TIntegerField;
    Panel1: TPanel;
    bt_Incluir: TSpeedButton;
    bt_Salvar: TSpeedButton;
    bt_Cancelar: TSpeedButton;
    bt_Deletar: TSpeedButton;
    bt_Procurar: TSpeedButton;
    bt_Imprimir: TSpeedButton;
    bt_Sair: TSpeedButton;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    bt_Alterar: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label70: TLabel;
    ck_Mascarada250AD: TCheckBox;
    ck_Mascarada500AD: TCheckBox;
    ck_Mascarada1AD: TCheckBox;
    ck_Mascarada2AD: TCheckBox;
    ck_Mascarada3AD: TCheckBox;
    ck_Mascarada4AD: TCheckBox;
    ck_Mascarada8AD: TCheckBox;
    ck_Ausente250AD: TCheckBox;
    ck_Ausente500AD: TCheckBox;
    ck_Ausente1AD: TCheckBox;
    ck_Ausente2AD: TCheckBox;
    ck_Ausente3AD: TCheckBox;
    ck_Ausente4AD: TCheckBox;
    ck_Ausente8AD: TCheckBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    ck_Mascarada250AE: TCheckBox;
    ck_Mascarada500AE: TCheckBox;
    ck_Mascarada1AE: TCheckBox;
    ck_Mascarada2AE: TCheckBox;
    ck_Mascarada3AE: TCheckBox;
    ck_Mascarada4AE: TCheckBox;
    ck_Mascarada8AE: TCheckBox;
    ck_Ausente250AE: TCheckBox;
    ck_Ausente500AE: TCheckBox;
    ck_Ausente1AE: TCheckBox;
    ck_Ausente2AE: TCheckBox;
    ck_Ausente3AE: TCheckBox;
    ck_Ausente4AE: TCheckBox;
    ck_Ausente8AE: TCheckBox;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel23: TBevel;
    Bevel24: TBevel;
    Bevel25: TBevel;
    Bevel26: TBevel;
    Bevel27: TBevel;
    Bevel28: TBevel;
    Bevel29: TBevel;
    Bevel30: TBevel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    DBText1: TDBText;
    Bevel31: TBevel;
    Bevel32: TBevel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    ck_Mascarada250OD: TCheckBox;
    ck_Mascarada500OD: TCheckBox;
    ck_Mascarada1OD: TCheckBox;
    ck_Mascarada2OD: TCheckBox;
    ck_Mascarada3OD: TCheckBox;
    ck_Mascarada4OD: TCheckBox;
    ck_Mascarada8OD: TCheckBox;
    ck_Ausente250OD: TCheckBox;
    ck_Ausente500OD: TCheckBox;
    ck_Ausente1OD: TCheckBox;
    ck_Ausente2OD: TCheckBox;
    ck_Ausente3OD: TCheckBox;
    ck_Ausente4OD: TCheckBox;
    ck_Ausente8OD: TCheckBox;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    ck_Mascarada250OE: TCheckBox;
    ck_Mascarada500OE: TCheckBox;
    ck_Mascarada1OE: TCheckBox;
    ck_Mascarada2OE: TCheckBox;
    ck_Mascarada3OE: TCheckBox;
    ck_Mascarada4OE: TCheckBox;
    ck_Mascarada8OE: TCheckBox;
    ck_Ausente250OE: TCheckBox;
    ck_Ausente500OE: TCheckBox;
    ck_Ausente1OE: TCheckBox;
    ck_Ausente2OE: TCheckBox;
    ck_Ausente3OE: TCheckBox;
    ck_Ausente4OE: TCheckBox;
    ck_Ausente8OE: TCheckBox;
    Bevel33: TBevel;
    Bevel34: TBevel;
    Bevel35: TBevel;
    Bevel36: TBevel;
    Bevel37: TBevel;
    Bevel38: TBevel;
    Bevel39: TBevel;
    Bevel40: TBevel;
    Bevel41: TBevel;
    Bevel42: TBevel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    DBText3: TDBText;
    Bevel43: TBevel;
    Bevel44: TBevel;
    tb_ItemExame: TADOQuery;                               
    ds_ItemExame: TDataSource;
    tb_ItemExameIEHz: TStringField;
    tb_ItemExameIEVia: TStringField;
    tb_ItemExameIEOrelha: TStringField;
    ActionList1: TActionList;
    ac_CtrlN: TAction;
    ac_Esc: TAction;
    ac_CtrlS: TAction;
    ac_CtrlL: TAction;
    tb_ItemExameIENumExa: TIntegerField;
    tb_ItemExameIEMascarada: TBooleanField;
    tb_ItemExameIEAusente: TBooleanField;
    tb_ItemExameIEDb: TIntegerField;
    ed_250AD: TMaskEdit;
    ed_500AD: TMaskEdit;
    ed_1AD: TMaskEdit;
    ed_2AD: TMaskEdit;
    ed_3AD: TMaskEdit;
    ed_4AD: TMaskEdit;
    ed_8AD: TMaskEdit;
    ed_8AE: TMaskEdit;
    ed_4AE: TMaskEdit;
    ed_3AE: TMaskEdit;
    ed_2AE: TMaskEdit;
    ed_1AE: TMaskEdit;
    ed_500AE: TMaskEdit;
    ed_250AE: TMaskEdit;
    ed_250OD: TMaskEdit;
    ed_500OD: TMaskEdit;
    ed_1OD: TMaskEdit;
    ed_2OD: TMaskEdit;
    ed_3OD: TMaskEdit;
    ed_4OD: TMaskEdit;
    ed_8OD: TMaskEdit;
    ed_8OE: TMaskEdit;
    ed_4OE: TMaskEdit;
    ed_3OE: TMaskEdit;
    ed_2OE: TMaskEdit;
    ed_1OE: TMaskEdit;
    ed_500OE: TMaskEdit;
    ed_250OE: TMaskEdit;
    ck_Mascarada6OD: TCheckBox;
    ck_Ausente6OD: TCheckBox;
    ck_Mascarada6OE: TCheckBox;
    ck_Ausente6OE: TCheckBox;
    ed_6OD: TMaskEdit;
    ed_6OE: TMaskEdit;
    Bevel22: TBevel;
    Label18: TLabel;
    Label100: TLabel;
    ck_Mascarada6AD: TCheckBox;
    ck_Ausente6AD: TCheckBox;
    ck_Mascarada6AE: TCheckBox;
    ck_Ausente6AE: TCheckBox;
    ed_6AD: TMaskEdit;
    ed_6AE: TMaskEdit;
    Bevel21: TBevel;
    Label101: TLabel;
    Label102: TLabel;
    tb_ItemExameIENumSeq: TIntegerField;
    Bevel45: TBevel;
    Bevel46: TBevel;
    tb_ExameEXDatCal: TDateField;
    tb_ExameEX_Idade: TStringField;
    Label103: TLabel;
    Bevel47: TBevel;
    tb_ExameEXCodMeaOD: TIntegerField;
    tb_ExameEXCodMeaOE: TIntegerField;
    tb_ExameEXSTROD: TIntegerField;
    tb_ExameEXSTROE: TIntegerField;
    tb_ExameEXAlertaFalaOD: TIntegerField;
    tb_ExameEXAlertaFalaOE: TIntegerField;
    tb_ExameEXMonoDbOD: TIntegerField;
    tb_ExameEXMonoPerOD: TFloatField;
    tb_ExameEXDiDbOD: TIntegerField;
    tb_ExameEXDiPerOD: TFloatField;
    tb_ExameEXMonoDbOE: TIntegerField;
    tb_ExameEXMonoPerOE: TFloatField;
    tb_ExameEXDiDbOE: TIntegerField;
    tb_ExameEXDiPerOE: TFloatField;
    tb_ExameEXPerdaOD: TStringField;
    tb_ExameEXPerdaOE: TStringField;
    cb_MeatoscopiaOD: TDBLookupComboBox;
    db_MeatoscopiaOE: TDBLookupComboBox;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Bevel48: TBevel;
    cb_Repetir: TDBCheckBox;
    cb_Imitanciomaetria: TDBCheckBox;
    cb_Tonal: TDBCheckBox;
    cb_Otorrinolaringologista: TDBCheckBox;
    cb_Logoaudiometria: TDBCheckBox;
    pg_Logoaudiometria: TTabSheet;
    Bevel49: TBevel;
    Bevel50: TBevel;
    pg_Laudo: TTabSheet;
    Bevel51: TBevel;
    Bevel52: TBevel;
    tb_ExameEXRepetir: TBooleanField;
    tb_ExameEXImitanciomaetria: TBooleanField;
    tb_ExameEXTonal: TBooleanField;
    tb_ExameEXOtorrinolaringologista: TBooleanField;
    tb_ExameEXLogoaudiometria: TBooleanField;
    tb_ExameEXLogoOD: TBooleanField;
    tb_ExameEXLogoOE: TBooleanField;
    Label107: TLabel;
    ed_StrOD: TDBEdit;
    Label108: TLabel;
    ed_StrOE: TDBEdit;
    Label109: TLabel;
    ed_StrAlertaFalaOD: TDBEdit;
    Label110: TLabel;
    ed_AlertaFalaOE: TDBEdit;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Bevel53: TBevel;
    Bevel54: TBevel;
    Bevel55: TBevel;
    Bevel56: TBevel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    ed_MonoDbOD: TDBEdit;
    ed_MonoPerOD: TDBEdit;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    ed_DiDbOD: TDBEdit;
    ed_DiPerOD: TDBEdit;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    ed_MonoDbOE: TDBEdit;
    ed_MonoPerOE: TDBEdit;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    ed_DiDbOE: TDBEdit;
    ed_DiPerOE: TDBEdit;
    Label130: TLabel;
    Bevel57: TBevel;
    ck_LogoOD: TDBCheckBox;
    ck_LogoOE: TDBCheckBox;
    im_Grafico: TImage;
    tb_ExameEXNumExa: TIntegerField;
    Label131: TLabel;
    Label132: TLabel;
    DBText5: TDBText;
    lblPacienteGrafico: TLabel;
    Bevel58: TBevel;
    Bevel59: TBevel;
    Bevel17: TBevel;
    ac_CtrlA: TAction;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    DBText7: TDBText;
    lblPacienteLaudo: TLabel;
    Bevel18: TBevel;
    Bevel60: TBevel;
    Label136: TLabel;
    Label137: TLabel;
    ed_PerdaOD: TDBEdit;
    ed_PerdaOE: TDBEdit;
    Bevel61: TBevel;
    Bevel62: TBevel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    Label142: TLabel;
    Label143: TLabel;
    Bevel63: TBevel;
    Label144: TLabel;
    Label145: TLabel;
    DBText11: TDBText;
    DBText12: TDBText;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Bevel64: TBevel;
    ck_F500D: TCheckBox;
    Label149: TLabel;
    ck_F1D: TCheckBox;
    ck_F2D: TCheckBox;
    ck_F3D: TCheckBox;
    ck_F4D: TCheckBox;
    ck_F6D: TCheckBox;
    ck_F8D: TCheckBox;
    Label150: TLabel;
    DBText13: TDBText;
    Label151: TLabel;
    DBText14: TDBText;
    ck_F500E: TCheckBox;
    Label152: TLabel;
    ck_F1E: TCheckBox;
    ck_F2E: TCheckBox;
    ck_F3E: TCheckBox;
    ck_F4E: TCheckBox;
    ck_F6E: TCheckBox;
    ck_F8E: TCheckBox;
    Label153: TLabel;
    DBText15: TDBText;
    Label154: TLabel;
    DBText16: TDBText;
    Bevel66: TBevel;
    Label155: TLabel;
    Bevel65: TBevel;
    tb_ExameEXLaudoD: TStringField;
    tb_ExameEXLaudoE: TStringField;
    tb_ExameEXGrauD: TStringField;
    tb_ExameEXGrauE: TStringField;
    tb_ExameEXFrequenciaD: TStringField;
    tb_ExameEXFrequenciaE: TStringField;
    ck_VAD: TDBCheckBox;
    ck_VOD: TDBCheckBox;
    ck_VAE: TDBCheckBox;
    ck_VOE: TDBCheckBox;
    tb_ExameEXVAOD: TBooleanField;
    tb_ExameEXVAOE: TBooleanField;
    tb_ExameEXVOOD: TBooleanField;
    tb_ExameEXVOOE: TBooleanField;
    tb_ExameEXObservacao: TMemoField;
    ed_Observacao: TDBMemo;
    tb_ExameEXCodFnc: TIntegerField;
    lblFuncaoLabel: TLabel;
    Label9: TLabel;
    Bevel67: TBevel;
    ac_PgUp: TAction;
    ac_PgDown: TAction;
    ac_F8: TAction;
    ck_ExameAnterior: TCheckBox;
    ed_PacienteCodigo: TDBEdit;
    lblPaciente: TLabel;
    ed_EmpresaCodigo: TDBEdit;
    lblEmpresa: TLabel;
    ed_FuncaoCodigo: TDBEdit;
    lblFuncao: TLabel;
    Bevel4: TBevel;
    tb_ExameEXHOREXA: TDateTimeField;
    ed_HorExaExame: TDBEdit;
    lblPacienteViaAerea: TLabel;
    lblPacienteViaOssea: TLabel;
    tb_ExameEXMedia01D: TBCDField;
    tb_ExameEXMedia02D: TBCDField;
    tb_ExameEXMedia01E: TBCDField;
    tb_ExameEXMedia02E: TBCDField;
    FUNCTION  Frequencia(vm_ParStrFre:String):String;
    FUNCTION  Minimo(CONST vm_ParVet: ARRAY OF Integer): Integer;
    FUNCTION  dB(vm_ParVal:Integer):Integer;
    FUNCTION  Red(vm_ParVal:Real):Real;
    FUNCTION  MostrarLaudo:Boolean;
    PROCEDURE MostrarVia;
    PROCEDURE Simbolo(X,Y:Integer;vm_ParSimbolo:String;vm_ParAusente:Boolean);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_DeletarClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure bt_IncluirClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure cb_EmpresaExameEnter(Sender: TObject);
    procedure cb_PacienteExameEnter(Sender: TObject);
    procedure cb_AudiometroExameEnter(Sender: TObject);
    procedure ds_ExameStateChange(Sender: TObject);
    procedure tb_ExameAfterScroll(DataSet: TDataSet);
    procedure bt_AlterarClick(Sender: TObject);
    procedure ac_CtrlLExecute(Sender: TObject);
    procedure ac_CtrlNExecute(Sender: TObject);
    procedure ac_CtrlSExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pg_GraficoShow(Sender: TObject);
    procedure tb_ExameBeforeDelete(DataSet: TDataSet);
    procedure bt_ProcurarClick(Sender: TObject);
    procedure cb_PacienteExameClick(Sender: TObject);
    procedure tb_ExameCalcFields(DataSet: TDataSet);
    procedure cb_MeatoscopiaODEnter(Sender: TObject);
    procedure db_MeatoscopiaOEEnter(Sender: TObject);
    procedure tb_ExameBeforePost(DataSet: TDataSet);
    procedure tb_ExamePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ac_CtrlAExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure tb_ExameAfterPost(DataSet: TDataSet);
    procedure ac_PgUpExecute(Sender: TObject);
    procedure ac_PgDownExecute(Sender: TObject);
    procedure cb_FuncaoEnter(Sender: TObject);
    procedure cb_PacienteExameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ac_F8Execute(Sender: TObject);
    procedure ck_ExameAnteriorClick(Sender: TObject);
    procedure pg_ViaOsseaShow(Sender: TObject);
    procedure pg_ViaAeriaShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tb_ExameBeforeOpen(DataSet: TDataSet);
    procedure tb_ItemExameBeforeOpen(DataSet: TDataSet);
    procedure cb_AudiometroExameExit(Sender: TObject);
    procedure lblPacienteLabelClick(Sender: TObject);
    procedure ed_PacienteCodigoExit(Sender: TObject);
    procedure lblEmpresaLabelClick(Sender: TObject);
    procedure ed_EmpresaCodigoExit(Sender: TObject);
    procedure lblFuncaoLabelClick(Sender: TObject);
    procedure ed_FuncaoCodigoExit(Sender: TObject);
    procedure ed_PacienteCodigoEnter(Sender: TObject);
    procedure ed_EmpresaCodigoEnter(Sender: TObject);
    procedure ed_FuncaoCodigoEnter(Sender: TObject);
    procedure ed_PacienteCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_EmpresaCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_FuncaoCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tb_ExameNewRecord(DataSet: TDataSet);
  private
    FUNCTION MaiorCodigo(vm_ParCampoChave, vm_ParTabela : String; vm_ParFiltro: String = ''): Integer;
    PROCEDURE MostrarEmpresa(vm_ParCodigo: Integer);
    PROCEDURE MostrarFuncao(vm_ParCodigo: Integer);
    PROCEDURE MostrarPaciente(vm_ParCodigo: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

CONST eKeyViol=9729;
CONST Nulo = -100;

var
  fm_Exame: Tfm_Exame;
  vm_TesteInt:Integer;
  vm_Media01D:Double;
  //vm_Media02D:Integer;
  vm_Media01E:Double;
  //vm_Media02E:Integer;
  vm_VetHz          : Array[1..8] OF String;
  vm_VetViaAerDir   : Array[1..8] OF Integer;
  vm_VetViaAerEsq   : Array[1..8] OF Integer;
  vm_VetViaOssDir   : Array[1..8] OF Integer;
  vm_VetViaOssEsq   : Array[1..8] OF Integer;
  vm_VetAusenteOD   : Array[1..8] OF Boolean;
  vm_VetAusenteOE   : Array[1..8] OF Boolean;
  vm_VAD            : Boolean;
  vm_VOD            : Boolean;
  vm_VAE            : Boolean;
  vm_VOE            : Boolean;
  vm_MaiorDbD       : Integer;
  vm_MaiorDbE       : Integer;
  vm_GrauMinD       : String;
  vm_GrauMinE       : String;
  vm_GrauMaxD       : String;
  vm_GrauMaxE       : String;
  vm_MenorDbD       : Integer;
  vm_MenorDbE       : Integer;
  vm_Frequencia     : String;

implementation

Uses SafuMenu, funcoes, safurela, SafdGera, safuppex, safucada, safucoex, safubusc,
  Variants, DateUtils;

{$R *.DFM}

PROCEDURE Tfm_Exame.MostrarFuncao(vm_ParCodigo: Integer);
BEGIN
  lblFuncao.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safafc', 'FCCodFnc', 'FCDescricao');
  if (lblFuncao.Caption = '') and (tb_Exame.State IN [dsEdit, dsInsert]) then
     tb_ExameEXCodFnc.Clear;
END;

PROCEDURE Tfm_Exame.MostrarPaciente(vm_ParCodigo: Integer);
BEGIN

  lblPaciente.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safapc', 'PCCodPac', 'PCNome');
  lblPacienteLaudo.Caption := lblPaciente.Caption;
  lblPacienteGrafico.Caption := lblPaciente.Caption;
  lblPacienteViaAerea.Caption := lblPaciente.Caption;
  lblPacienteViaOssea.Caption := lblPaciente.Caption;  
  if (lblPaciente.Caption = '') and (tb_Exame.State IN [dsEdit, dsInsert]) then
     tb_ExameEXCodPac.Clear;

  if (vm_ParCodigo <> 0) and (tb_Exame.State IN [dsEdit, dsInsert]) then begin
       tb_ExameEXCodEmp.Value := ObtemValorBD('select PCCodEmp from safapc where PCCodPac = '+IntToStr(vm_ParCodigo), dm_Geral.ADOConnection);
       MostrarEmpresa(tb_ExameEXCodEmp.Value);

       tb_ExameEXCodFnc.Value := ObtemValorBD('select PCCodFnc from safapc where PCCodPac = '+IntToStr(vm_ParCodigo), dm_Geral.ADOConnection);
       MostrarFuncao(tb_ExameEXCodFnc.Value);
   end;

END;

PROCEDURE Tfm_Exame.MostrarEmpresa(vm_ParCodigo: Integer);
VAR vm_Mes : Variant;
BEGIN

  lblEmpresa.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safaem', 'EMCodEmp', 'EMRazao');
  if (tb_Exame.State in [dsEdit, dsInsert]) and (lblEmpresa.Caption = '') then
     tb_ExameEXCodEmp.Clear

END;

FUNCTION Tfm_Exame.MaiorCodigo(vm_ParCampoChave, vm_ParTabela : String; vm_ParFiltro: String = ''): Integer;
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


FUNCTION Tfm_Exame.Frequencia(vm_ParStrFre:String):String;
VAR vm_Retorno:String;
BEGIN

vm_Frequencia := vm_ParStrFre;
vm_Retorno    := '';

//IF Length(vm_Frequencia) > 3 THEN
//   vm_Retorno    := ' nas Frequencias ';

//IF Length(vm_Frequencia) = 3 THEN
//   vm_Retorno    := ' na Frequencia ';


WHILE vm_Frequencia <> '' DO
  BEGIN
  IF Length(IntToStr(StrToInt(Copy(vm_Frequencia,1,3)))) = 3 THEN
     vm_Retorno  := vm_Retorno+IntToStr(StrToInt(Copy(vm_Frequencia,1,3)))+'Hz, '
  ELSE
     vm_Retorno  := vm_Retorno+IntToStr(StrToInt(Copy(vm_Frequencia,1,3)))+'KHz, ';
  Delete(vm_Frequencia,1,3);
  END;

Frequencia := Copy(vm_Retorno,1,Length(vm_Retorno)-2);

END;



FUNCTION Tfm_Exame.MostrarLaudo:Boolean;
VAR  I:Byte;
     vm_VetDifAerOss : Array[1..8] OF Integer;
     vm_MaiorOss     : Integer;
     vm_QtdMaiorAus  : Byte;
     vm_QtdMaiorPre  : Byte;
BEGIN

MostrarLaudo := False;

vm_VAD      := False;
vm_VOD      := False;
vm_VAE      := False;
vm_VOE      := False;

FOR I:=1 TO 8 DO
    BEGIN

    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'AD')).Text <> '' THEN
       TRY
       vm_TesteInt:=StrToInt(TEdit(FindComponent('ed_'+vm_VetHz[I]+'AD')).Text);
       vm_VetViaAerDir[I] := vm_TesteInt;
       IF vm_VAD = False THEN
          vm_VAD := TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'AD')).Checked;
       EXCEPT
       PageControl.ActivePage := pg_ViaAeria;
       IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'AD')).CanFocus THEN
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'AD')).SetFocus;
       Mensagem('Não é um número inteiro',StatusBar,True);
       Exit;
       END;


    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'AE')).Text <> '' THEN
       TRY
       vm_TesteInt:=StrToInt(TEdit(FindComponent('ed_'+vm_VetHz[I]+'AE')).Text);
       vm_VetViaAerEsq[I] := vm_TesteInt;
       IF vm_VAE = False THEN
          vm_VAE := TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'AE')).Checked;
       EXCEPT
       PageControl.ActivePage := pg_ViaAeria;
       IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'AE')).CanFocus THEN
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'AE')).SetFocus;
       Mensagem('Não é um número inteiro',StatusBar,True);
       Exit;
       END;


    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'OD')).Text <> '' THEN
       TRY
       vm_TesteInt:=StrToInt(TEdit(FindComponent('ed_'+vm_VetHz[I]+'OD')).Text);
       vm_VetViaOssDir[I] := vm_TesteInt;
       vm_VetAusenteOD[I] := TCheckBox(FindComponent('ck_Ausente'+vm_VetHz[I]+'OD')).Checked;
       IF vm_VOD = False THEN
          vm_VOD := TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'OD')).Checked;
       EXCEPT
       PageControl.ActivePage := pg_ViaOssea;
       IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'OD')).CanFocus THEN
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'OD')).SetFocus;
       Mensagem('Não é um número inteiro',StatusBar,True);
       Exit;
       END;


    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'OE')).Text <> '' THEN
       TRY
       vm_TesteInt:=StrToInt(TEdit(FindComponent('ed_'+vm_VetHz[I]+'OE')).Text);
       vm_VetViaOssEsq[I] := vm_TesteInt;
       vm_VetAusenteOE[I] := TCheckBox(FindComponent('ck_Ausente'+vm_VetHz[I]+'OE')).Checked;
       IF vm_VOE = False THEN
          vm_VOE := TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'OE')).Checked;
       EXCEPT
       PageControl.ActivePage := pg_ViaOssea;
       IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'OE')).CanFocus THEN
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'OE')).SetFocus;
       Mensagem('Não é um número inteiro',StatusBar,False);
       Exit;
       END;

    END;

MostrarLaudo := True;

tb_ExameEXVAOD.Value := vm_VAE;
tb_ExameEXVAOE.Value := vm_VAD;
tb_ExameEXVOOD.Value := vm_VOE;
tb_ExameEXVOOE.Value := vm_VOD;


IF (ck_Ausente500AD.Checked = False) AND
   (ck_Ausente1AD.Checked   = False) AND
   (ck_Ausente2AD.Checked   = False) AND
   (ed_500AD.Text <> '') AND
   (ed_1AD.Text <> '')   AND
   (ed_2AD.Text <> '')   THEN
   BEGIN
   tb_ExameEXMedia01D.Value   := Red((dB(vm_VetViaAerDir[2])+
                                      dB(vm_VetViaAerDir[3])+
                                      dB(vm_VetViaAerDir[4]))/3);
   vm_Media01D := tb_ExameEXMedia01D.Value;
   END
ELSE
   BEGIN
   IF (ed_3AD.Text <> '') AND
      (ed_4AD.Text <> '') AND
      (ed_6AD.Text <> '') THEN
      vm_Media01D := Red((dB(vm_VetViaAerDir[2])+
                          dB(vm_VetViaAerDir[3])+
                          dB(vm_VetViaAerDir[4]))/3);
   tb_ExameEXMedia01D.Clear;
   END;


IF (ck_Ausente3AD.Checked = False) AND
   (ck_Ausente4AD.Checked = False) AND
   (ck_Ausente6AD.Checked = False) AND
   (ed_3AD.Text <> '') AND
   (ed_4AD.Text <> '') AND
   (ed_6AD.Text <> '') THEN
   BEGIN
   tb_ExameEXMedia02D.Value   := Red((dB(vm_VetViaAerDir[5])+
                                      dB(vm_VetViaAerDir[6])+
                                      dB(vm_VetViaAerDir[7]))/3);
   END
ELSE
   tb_ExameEXMedia02D.Clear;


IF (ck_Ausente500AE.Checked = False) AND
   (ck_Ausente1AE.Checked   = False) AND
   (ck_Ausente2AE.Checked   = False) AND
   (ed_500AE.Text <> '') AND
   (ed_1AE.Text <> '')   AND
   (ed_2AE.Text <> '')   THEN
   BEGIN
   tb_ExameEXMedia01E.Value   := Red((dB(vm_VetViaAerEsq[2])+
                                      dB(vm_VetViaAerEsq[3])+
                                      dB(vm_VetViaAerEsq[4]))/3);
   vm_Media01E := tb_ExameEXMedia01E.Value;
   END
ELSE
   BEGIN
   IF (ed_500AE.Text <> '') AND
      (ed_1AE.Text <> '')   AND
      (ed_2AE.Text <> '')   THEN
      vm_Media01E := Red((dB(vm_VetViaAerEsq[2])+
                          dB(vm_VetViaAerEsq[3])+
                          dB(vm_VetViaAerEsq[4]))/3);
   tb_ExameEXMedia01E.Clear;
   END;


IF (ck_Ausente3AE.Checked = False) AND
   (ck_Ausente4AE.Checked = False) AND
   (ck_Ausente6AE.Checked = False) AND
   (ed_3AE.Text <> '') AND
   (ed_4AE.Text <> '') AND
   (ed_6AE.Text <> '') THEN
   BEGIN
   tb_ExameEXMedia02E.Value   := Red((dB(vm_VetViaAerEsq[5])+
                                      dB(vm_VetViaAerEsq[6])+
                                      dB(vm_VetViaAerEsq[7]))/3);
   END
ELSE
   tb_ExameEXMedia02E.Clear;


vm_MaiorDbD := MaxIntValue(vm_VetViaAerDir);
vm_MaiorDbE := MaxIntValue(vm_VetViaAerEsq);
vm_MenorDbD := Minimo(vm_VetViaAerDir);
vm_MenorDbE := Minimo(vm_VetViaAerEsq);
tb_ExameEXFrequenciaD.Value := '';
tb_ExameEXFrequenciaE.Value := '';

FOR I:=2 TO 8 DO
  BEGIN

  IF vm_VetViaAerDir[I] > 25 THEN
     BEGIN
     tb_ExameEXFrequenciaD.Value := tb_ExameEXFrequenciaD.Value +
                                    FormatFloat('000',StrToInt(vm_VetHz[I]));
     END;


  IF vm_VetViaAerEsq[I] > 25 THEN
     BEGIN
     tb_ExameEXFrequenciaE.Value := tb_ExameEXFrequenciaE.Value +
                                    FormatFloat('000',StrToInt(vm_VetHz[I]));
     END;

  END;


{
IF vm_MenorDbD <= 25 THEN
   vm_GrauMinD  := ''
ELSE
   vm_GrauMinD  := 'Leve';

IF vm_MenorDbE <= 25 THEN
   vm_GrauMinE  := ''
ELSE
   vm_GrauMinE  := 'Leve';
}


IF vm_MaiorDbD <= 25 THEN
   BEGIN
//   vm_GrauMaxD  := '';
   tb_ExameEXLaudoD.Value := 'Normal';
   END
ELSE
   BEGIN
//   vm_GrauMaxD  := 'Leve';
   tb_ExameEXLaudoD.Value := 'Alterado';
   END;

IF vm_MaiorDbE <= 25 THEN
   BEGIN
//   vm_GrauMaxE  := '';
   tb_ExameEXLaudoE.Value := 'Normal';
   END
ELSE
   BEGIN
//   vm_GrauMaxE  := 'Leve';
   tb_ExameEXLaudoE.Value := 'Alterado';
   END;

   {
IF vm_MenorDbD > 40 THEN vm_GrauMinD := 'Moderada';
IF vm_MenorDbE > 40 THEN vm_GrauMinE := 'Moderada';
IF vm_MenorDbD > 70 THEN vm_GrauMinD := 'Severa';
IF vm_MenorDbE > 70 THEN vm_GrauMinE := 'Severa';
IF vm_MenorDbD > 90 THEN vm_GrauMinD := 'Profunda';
IF vm_MenorDbE > 90 THEN vm_GrauMinE := 'Profunda';

IF vm_MaiorDbD > 40 THEN vm_GrauMaxD := 'Moderada';
IF vm_MaiorDbE > 40 THEN vm_GrauMaxE := 'Moderada';
IF vm_MaiorDbD > 70 THEN vm_GrauMaxD := 'Severa';
IF vm_MaiorDbE > 70 THEN vm_GrauMaxE := 'Severa';
IF vm_MaiorDbD > 90 THEN vm_GrauMaxD := 'Profunda';
IF vm_MaiorDbE > 90 THEN vm_GrauMaxE := 'Profunda';


IF vm_GrauMinD = vm_GrauMaxD THEN
   tb_ExameEXGrauD.Value := vm_GrauMinD
ELSE
   BEGIN
   IF vm_GrauMinD = '' THEN
      tb_ExameEXGrauD.Value := vm_GrauMaxD
   ELSE
      tb_ExameEXGrauD.Value := vm_GrauMinD+' a '+vm_GrauMaxD;
   END;

IF vm_GrauMinE = vm_GrauMaxE THEN
   tb_ExameEXGrauE.Value := vm_GrauMinE
ELSE
   BEGIN
   IF vm_GrauMinE = '' THEN
      tb_ExameEXGrauE.Value := vm_GrauMaxE
   ELSE
      tb_ExameEXGrauE.Value := vm_GrauMinE+' a '+vm_GrauMaxE;
   END;

}

tb_ExameEXGrauD.Clear;
if tb_ExameEXLaudoD.Value = 'Alterado' then begin
  if ck_Ausente500AD.Checked or ck_Ausente1AD.Checked or ck_Ausente2AD.Checked then
     tb_ExameEXGrauD.Value := 'Perda auditiva de grau profundo'
  else if vm_Media01D <= 25 then
     tb_ExameEXGrauD.Value := 'Nenhuma dificuldade significativa'
  else if (vm_Media01D > 25) and (vm_Media01D <= 40) then
     tb_ExameEXGrauD.Value := 'Perda auditiva de grau leve'
  else if (vm_Media01D > 40) and (vm_Media01D <= 55) then
     tb_ExameEXGrauD.Value := 'Perda auditiva de grau moderado'
  else if (vm_Media01D > 55) and (vm_Media01D <= 70) then
     tb_ExameEXGrauD.Value := 'Perda auditiva de grau moderadamente severo'
  else if (vm_Media01D > 70) and (vm_Media01D <= 90) then
     tb_ExameEXGrauD.Value := 'Perda auditiva de grau severo'
  else if vm_Media01D > 90 then
     tb_ExameEXGrauD.Value := 'Perda auditiva de grau profundo';

  tb_ExameEXGrauD.Value :=  tb_ExameEXGrauD.Value + ' (Lloyd e Kaplan - 1978)';
end;


tb_ExameEXGrauE.Clear;
if tb_ExameEXLaudoE.Value = 'Alterado' then begin

  if ck_Ausente500AE.Checked or ck_Ausente1AE.Checked or ck_Ausente2AE.Checked then
     tb_ExameEXGrauE.Value := 'Perda auditiva de grau profundo'     
  else if vm_Media01E <= 25 then
     tb_ExameEXGrauE.Value := 'Nenhuma dificuldade significativa'
  else if (vm_Media01E > 25) and (vm_Media01E <= 40) then
     tb_ExameEXGrauE.Value := 'Perda auditiva de grau leve'
  else if (vm_Media01E > 40) and (vm_Media01E <= 55) then
     tb_ExameEXGrauE.Value := 'Perda auditiva de grau moderado'
  else if (vm_Media01E > 55) and (vm_Media01E <= 70) then
     tb_ExameEXGrauE.Value := 'Perda auditiva de grau moderadamente severo'
  else if (vm_Media01E > 70) and (vm_Media01E <= 90) then
     tb_ExameEXGrauE.Value := 'Perda auditiva de grau severo'
  else if vm_Media01E > 90 then
     tb_ExameEXGrauE.Value := 'Perda auditiva de grau profundo';

  tb_ExameEXGrauE.Value :=  tb_ExameEXGrauE.Value + ' (Lloyd e Kaplan - 1978)';

end;


vm_Frequencia := tb_ExameEXFrequenciaD.Value;
WHILE vm_Frequencia <> '' DO
  BEGIN
  TCheckBox(FindComponent('ck_F'+IntToStr
           (StrToInt(Copy(vm_Frequencia,1,3)))+'D')).Checked := True;
  Delete(vm_Frequencia,1,3);
  END;

vm_Frequencia := tb_ExameEXFrequenciaE.Value;
WHILE vm_Frequencia <> '' DO
  BEGIN
  TCheckBox(FindComponent('ck_F'+IntToStr
           (StrToInt(Copy(vm_Frequencia,1,3)))+'E')).Checked := True;
  Delete(vm_Frequencia,1,3);
  END;



FOR I:=1 TO 8 DO
    BEGIN
    IF (vm_VetViaAerDir[I] = Nulo) OR (vm_VetViaOssDir[I] = Nulo) THEN
       vm_VetDifAerOss[I] := Nulo
    ELSE
       vm_VetDifAerOss[I] := abs(vm_VetViaAerDir[I] - vm_VetViaOssDir[I]);
    END;

vm_MaiorOss := MaxIntValue(vm_VetViaOssDir);

vm_QtdMaiorAus :=0;
vm_QtdMaiorPre :=0;

FOR I:=1 TO 8 DO
    BEGIN
    IF vm_VetDifAerOss[I] = MaxIntValue(vm_VetDifAerOss) THEN
       BEGIN
       IF vm_VetAusenteOD[I] = True THEN
          Inc(vm_QtdMaiorAus)
       ELSE
          Inc(vm_QtdMaiorPre);
       END;
    END;


IF (Copy(tb_ExameEXPerdaOD.Value,1,24) = 'Perda auditiva condutiva')      OR
   (Copy(tb_ExameEXPerdaOD.Value,1,30) = 'Perda auditiva neurossensorial')OR
   (Copy(tb_ExameEXPerdaOD.Value,1,20) = 'Perda auditiva mista')          OR
   (Copy(tb_ExameEXPerdaOD.Value,1,26) = 'Limiares Auditivos Normais')    OR
   (Copy(tb_ExameEXPerdaOD.Value,1,14) = 'Alteração Leve')                OR
   (Copy(tb_ExameEXPerdaOD.Value,1,18) = 'Alteração Moderada')            OR
   (Copy(tb_ExameEXPerdaOD.Value,1,16) = 'Alteração Severa')              OR
   (Copy(tb_ExameEXPerdaOD.Value,1,18) = 'Alteração Profunda')            OR
   (Copy(tb_ExameEXPerdaOD.Value,1,25) = 'Alteração Leve a Moderada')     OR
   (Copy(tb_ExameEXPerdaOD.Value,1,23) = 'Alteração Leve a Severa')       OR
   (Copy(tb_ExameEXPerdaOD.Value,1,25) = 'Alteração Leve a Profunda')     OR
   (Copy(tb_ExameEXPerdaOD.Value,1,27) = 'Alteração Moderada a Severa')   OR
   (Copy(tb_ExameEXPerdaOD.Value,1,29) = 'Alteração Moderada a Profunda') OR
   (Copy(tb_ExameEXPerdaOD.Value,1,27) = 'Alteração Severa a Profunda')   OR
   (Copy(tb_ExameEXPerdaOD.Value,1,28) = 'Limiar de via aérea alterado')  OR
   (tb_ExameEXPerdaOD.IsNull= True)                                       OR
   (tb_ExameEXPerdaOD.Text = '')                                          THEN
   BEGIN
   IF (vm_MaiorOss <> Nulo) THEN
      BEGIN

      IF (vm_MaiorDbD > 25) AND (vm_MaiorOss > 15)   THEN
         BEGIN
         IF (MaxIntValue(vm_VetDifAerOss) <= 10) OR
            ((vm_QtdMaiorAus > 0) AND (vm_QtdMaiorPre = 0)) THEN
            tb_ExameEXPerdaOD.Value := 'Perda auditiva neurossensorial'
         ELSE
            tb_ExameEXPerdaOD.Value := 'Perda auditiva mista';
         END;

      IF (vm_MaiorDbD > 25) AND (vm_MaiorOss <= 15)  THEN
         BEGIN
         IF MaxIntValue(vm_VetDifAerOss) < 15 THEN
            BEGIN
            //tb_ExameEXPerdaOD.Value := 'Alteração '+tb_ExameEXGrauD.Value+
            //                           Frequencia(tb_ExameEXFrequenciaD.Value);
            tb_ExameEXPerdaOD.Value := 'Limiar de via aérea alterado em: ' + Frequencia(tb_ExameEXFrequenciaD.Value);
            END
         ELSE
            tb_ExameEXPerdaOD.Value := 'Perda auditiva condutiva';
         END;

      tb_ExameEXPerdaOD.Value := tb_ExameEXPerdaOD.Value + ' - Classificação - Silman e Silverman (1997)';

      END

   ELSE
      BEGIN

        IF vm_MaiorDbD <= 25 THEN
          tb_ExameEXPerdaOD.Value := 'Limiares Auditivos Normais'
        ELSE BEGIN
//          IF (MaxIntValue(vm_VetViaOssEsq) <> Nulo) THEN
//             BEGIN
               //tb_ExameEXPerdaOD.Value := 'Alteração '+tb_ExameEXGrauD.Value+
               //                           Frequencia(tb_ExameEXFrequenciaD.Value);
               tb_ExameEXPerdaOD.Value := 'Limiar de via aérea alterado em: ' + Frequencia(tb_ExameEXFrequenciaD.Value);
//             END
//          ELSE
//             tb_ExameEXPerdaOD.Clear;

        END;

      END;

      {
      IF (MaxIntValue(vm_VetViaOssEsq) <> Nulo) THEN
         BEGIN
           IF vm_MaiorDbD <= 25 THEN
              tb_ExameEXPerdaOD.Value := 'Limiares Auditivos Normais'
           ELSE
              tb_ExameEXPerdaOD.Value := 'Alteração '+tb_ExameEXGrauD.Value+
                                         Frequencia(tb_ExameEXFrequenciaD.Value);
         END
      ELSE
         tb_ExameEXPerdaOD.Clear;

      END;
      }

//      tb_ExameEXPerdaOD.Value := tb_ExameEXPerdaOD.Value + ' - Classificação - Silman e Silverman (1997)';

   END;





FOR I:=1 TO 8 DO
    BEGIN
    IF (vm_VetViaAerEsq[I] = Nulo) OR (vm_VetViaOssEsq[I] = Nulo) THEN
       vm_VetDifAerOss[I] := Nulo
    ELSE
       vm_VetDifAerOss[I] := abs(vm_VetViaAerEsq[I] - vm_VetViaOssEsq[I]);
    END;

vm_MaiorOss := MaxIntValue(vm_VetViaOssEsq);

vm_QtdMaiorAus :=0;
vm_QtdMaiorPre :=0;

FOR I:=1 TO 8 DO
    BEGIN
    IF vm_VetDifAerOss[I] = MaxIntValue(vm_VetDifAerOss) THEN
       BEGIN
       IF vm_VetAusenteOE[I] = True THEN
          Inc(vm_QtdMaiorAus)
       ELSE
          Inc(vm_QtdMaiorPre);
       END;
    END;


IF (Copy(tb_ExameEXPerdaOE.Value,1,24) = 'Perda auditiva condutiva')      OR
   (Copy(tb_ExameEXPerdaOE.Value,1,30) = 'Perda auditiva neurossensorial')OR
   (Copy(tb_ExameEXPerdaOE.Value,1,20) = 'Perda auditiva mista')          OR
   (Copy(tb_ExameEXPerdaOE.Value,1,26) = 'Limiares Auditivos Normais')    OR
   (Copy(tb_ExameEXPerdaOE.Value,1,14) = 'Alteração Leve')                OR
   (Copy(tb_ExameEXPerdaOE.Value,1,18) = 'Alteração Moderada')            OR
   (Copy(tb_ExameEXPerdaOE.Value,1,16) = 'Alteração Severa')              OR
   (Copy(tb_ExameEXPerdaOE.Value,1,18) = 'Alteração Profunda')            OR
   (Copy(tb_ExameEXPerdaOE.Value,1,25) = 'Alteração Leve a Moderada')     OR
   (Copy(tb_ExameEXPerdaOE.Value,1,23) = 'Alteração Leve a Severa')       OR
   (Copy(tb_ExameEXPerdaOE.Value,1,25) = 'Alteração Leve a Profunda')     OR
   (Copy(tb_ExameEXPerdaOE.Value,1,27) = 'Alteração Moderada a Severa')   OR
   (Copy(tb_ExameEXPerdaOE.Value,1,29) = 'Alteração Moderada a Profunda') OR
   (Copy(tb_ExameEXPerdaOE.Value,1,27) = 'Alteração Severa a Profunda')   OR
   (Copy(tb_ExameEXPerdaOE.Value,1,28) = 'Limiar de via aérea alterado')  OR
   (tb_ExameEXPerdaOE.IsNull= True)                                       OR
   (tb_ExameEXPerdaOE.Text = '')                                          THEN
   BEGIN

     IF (vm_MaiorOss <> Nulo) THEN
        BEGIN

        IF (vm_MaiorDbE > 25) AND (vm_MaiorOss > 15)   THEN
           BEGIN
           IF (MaxIntValue(vm_VetDifAerOss) <= 10)     OR
              ((vm_QtdMaiorAus > 0) AND (vm_QtdMaiorPre = 0)) THEN
              tb_ExameEXPerdaOE.Value := 'Perda auditiva neurossensorial'
           ELSE
              tb_ExameEXPerdaOE.Value := 'Perda auditiva mista';
           END;

        IF (vm_MaiorDbE > 25) AND (vm_MaiorOss <= 15)  THEN
           BEGIN
           IF MaxIntValue(vm_VetDifAerOss) < 15 THEN
              BEGIN
              //tb_ExameEXPerdaOE.Value := 'Alteração '+tb_ExameEXGrauE.Value+
              //                           Frequencia(tb_ExameEXFrequenciaE.Value);
              tb_ExameEXPerdaOE.Value := 'Limiar de via aérea alterado em: ' + Frequencia(tb_ExameEXFrequenciaE.Value)
              END
           ELSE
              tb_ExameEXPerdaOE.Value := 'Perda auditiva condutiva';
           END;

        tb_ExameEXPerdaOE.Value := tb_ExameEXPerdaOE.Value + ' - Classificação - Silman e Silverman (1997)';           

        END
     ELSE
     BEGIN

         IF vm_MaiorDbE <= 25 THEN
            tb_ExameEXPerdaOE.Value := 'Limiares Auditivos Normais'
         ELSE BEGIN
//            IF (MaxIntValue(vm_VetViaOssDir) <> Nulo) THEN
//               BEGIN
                  //tb_ExameEXPerdaOE.Value := 'Alteração '+tb_ExameEXGrauE.Value+
                  //                           Frequencia(tb_ExameEXFrequenciaE.Value)
                  tb_ExameEXPerdaOE.Value := 'Limiar de via aérea alterado em: ' + Frequencia(tb_ExameEXFrequenciaE.Value)
//               END
//            ELSE
//               tb_ExameEXPerdaOE.Clear;
         END;

        {
        IF (MaxIntValue(vm_VetViaOssDir) <> Nulo) THEN
           BEGIN
           IF vm_MaiorDbE <= 25 THEN
              tb_ExameEXPerdaOE.Value := 'Limiares Auditivos Normais'
           ELSE
              tb_ExameEXPerdaOE.Value := 'Alteração '+tb_ExameEXGrauE.Value+
                                         Frequencia(tb_ExameEXFrequenciaE.Value)
           END
        ELSE
           tb_ExameEXPerdaOE.Clear;


        }

//        tb_ExameEXPerdaOE.Value := tb_ExameEXPerdaOE.Value + ' - Classificação - Silman e Silverman (1997)';

     END;
   END;


END;


FUNCTION Tfm_Exame.Minimo(CONST vm_ParVet: ARRAY OF Integer): Integer;
VAR I: Integer;
    vm_Aux:Integer;
BEGIN

IF vm_ParVet[Low(vm_ParVet)] = Nulo THEN
   Result:= 150
ELSE
   Result:= vm_ParVet[Low(vm_ParVet)];

FOR I := Low(vm_ParVet)+1 TO High(vm_ParVet) DO
    BEGIN
    vm_Aux:=0;
    IF vm_ParVet[I] = Nulo THEN vm_Aux:=250;
    IF (Result>(vm_ParVet[I]+vm_Aux)) AND
       (vm_ParVet[I] > 25)            THEN
       Result:=vm_ParVet[I];
    END;

IF Result = 150 THEN Result := Nulo;

END;


FUNCTION Tfm_Exame.dB(vm_ParVal:Integer):Integer;

BEGIN

IF vm_ParVal = Nulo THEN
   Result := 0
ELSE
   Result := vm_ParVal;

END;

FUNCTION Tfm_Exame.Red(vm_ParVal:Real):Real;
VAR X:Integer;
    Z:Integer;
BEGIN

{
X := Round(vm_ParVal);
X := Round(Int(X/5)) * 5;
Z := Round(vm_ParVal) - X;

IF Z > 2 THEN
   X := X + 5;
}

Result := Round(vm_ParVal*10)/10;

END;



PROCEDURE Tfm_Exame.Simbolo(X,Y:Integer; vm_ParSimbolo:String; vm_ParAusente:Boolean);
VAR vm_PosEsq:Integer;
    vm_PosTop:Integer;
BEGIN

IF vm_ParSimbolo = 'Circulo' THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.Ellipse(X-5,Y-4,X+5,Y+6);
   vm_PosEsq := X-3; // x-3
   vm_PosTop := Y+05;
   END;

IF vm_ParSimbolo = 'Triangulo' THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-6,Y+6);
   im_Grafico.Canvas.LineTo(X,Y-6);
   im_Grafico.Canvas.LineTo(X+6,Y+6);
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.LineTo(X-6,Y+6);
   vm_PosEsq := X-05; // x-05
   vm_PosTop := Y+07;
   END;

IF vm_ParSimbolo = 'Quadrado' THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.Rectangle(X-4,Y-4,X+6,Y+6);
   vm_PosEsq := X-3; // X-3
   vm_PosTop := Y+06;
   END;

IF (vm_ParSimbolo = 'X')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(X-5,Y+5);
   im_Grafico.Canvas.LineTo(X+5,Y-5);
   im_Grafico.Canvas.MoveTo(X+5,Y+5);
   im_Grafico.Canvas.LineTo(X-5,Y-5);
   vm_PosEsq := X-05; // X-05
   vm_PosTop := Y+05;
   END;

IF (vm_ParSimbolo = '[')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(X-08,Y-5);
   im_Grafico.Canvas.LineTo(X-13,Y-5);
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-13,Y-4);
   im_Grafico.Canvas.LineTo(X-13,Y+5);
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.LineTo(X-08,Y+5);
   vm_PosEsq := X-09; // X-13
   vm_PosTop := Y+06;
   END;


IF (vm_ParSimbolo = ']')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(X+04,Y-5);
   im_Grafico.Canvas.LineTo(X+09,Y-5);
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X+09,Y-4);
   im_Grafico.Canvas.LineTo(X+09,Y+5);
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.LineTo(X+04,Y+5);
   vm_PosEsq := X+04; // x+09
   vm_PosTop := Y+06;
   END;

IF (vm_ParSimbolo = '<')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-5,Y-5);
   im_Grafico.Canvas.LineTo(X-15,Y);
   im_Grafico.Canvas.LineTo(X-5,Y+5);
   vm_PosEsq := X-05; // X-15
   vm_PosTop := Y+05; // Y
   END;

IF (vm_ParSimbolo = '>')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-5+10,Y-5);
   im_Grafico.Canvas.LineTo(X+5+10,Y);
   im_Grafico.Canvas.LineTo(X-5+10,Y+5);
   vm_PosEsq := X+05; // X+14
   vm_PosTop := Y+05; // Y+02
   END;


IF vm_ParAusente = True THEN
   BEGIN

   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(vm_PosEsq,vm_PosTop);
   im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop+09);

{   im_Grafico.Canvas.MoveTo(vm_PosEsq-3,vm_PosTop+6);
   im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop+09);
   im_Grafico.Canvas.LineTo(vm_PosEsq+3,vm_PosTop+6);
   im_Grafico.Canvas.LineTo(vm_PosEsq-3,vm_PosTop+6);}

   im_Grafico.Canvas.Brush.Color := im_Grafico.Canvas.Pen.Color;
   im_Grafico.Canvas.Polygon([Point(vm_PosEsq-3, vm_PosTop+6), Point(vm_PosEsq,   vm_PosTop+09),
                              Point(vm_PosEsq+3, vm_PosTop+6), Point(vm_PosEsq-3, vm_PosTop+6)]);
   im_Grafico.Canvas.Brush.Color := clWhite;

   END;

END;


PROCEDURE Tfm_Exame.MostrarVia;
BEGIN

// Limpar
ed_250AD.Clear;
ck_Mascarada250AD.Checked := False;
ck_Ausente250AD.Checked   := False;
ed_500AD.Clear;
ck_Mascarada500AD.Checked := False;
ck_Ausente500AD.Checked   := False;
ed_1AD.Clear;
ck_Mascarada1AD.Checked   := False;
ck_Ausente1AD.Checked     := False;
ed_2AD.Clear;
ck_Mascarada2AD.Checked   := False;
ck_Ausente2AD.Checked     := False;
ed_3AD.Clear;
ck_Mascarada3AD.Checked   := False;
ck_Ausente3AD.Checked     := False;
ed_4AD.Clear;
ck_Mascarada4AD.Checked   := False;
ck_Ausente4AD.Checked     := False;
ed_6AD.Clear;
ck_Mascarada6AD.Checked   := False;
ck_Ausente6AD.Checked     := False;
ed_8AD.Clear;
ck_Mascarada8AD.Checked   := False;
ck_Ausente8AD.Checked     := False;
ed_250AE.Clear;
ck_Mascarada250AE.Checked := False;
ck_Ausente250AE.Checked   := False;
ed_500AE.Clear;
ck_Mascarada500AE.Checked := False;
ck_Ausente500AE.Checked   := False;
ed_1AE.Clear;
ck_Mascarada1AE.Checked   := False;
ck_Ausente1AE.Checked     := False;
ed_2AE.Clear;
ck_Mascarada2AE.Checked   := False;
ck_Ausente2AE.Checked     := False;
ed_3AE.Clear;
ck_Mascarada3AE.Checked   := False;
ck_Ausente3AE.Checked     := False;
ed_4AE.Clear;
ck_Mascarada4AE.Checked   := False;
ck_Ausente4AE.Checked     := False;
ed_6AE.Clear;
ck_Mascarada6AE.Checked   := False;
ck_Ausente6AE.Checked     := False;
ed_8AE.Clear;
ck_Mascarada8AE.Checked   := False;
ck_Ausente8AE.Checked     := False;
ed_250OD.Clear;
ck_Mascarada250OD.Checked := False;
ck_Ausente250OD.Checked   := False;
ed_500OD.Clear;
ck_Mascarada500OD.Checked := False;
ck_Ausente500OD.Checked   := False;
ed_1OD.Clear;
ck_Mascarada1OD.Checked   := False;
ck_Ausente1OD.Checked     := False;
ed_2OD.Clear;
ck_Mascarada2OD.Checked   := False;
ck_Ausente2OD.Checked     := False;
ed_3OD.Clear;
ck_Mascarada3OD.Checked   := False;
ck_Ausente3OD.Checked     := False;
ed_4OD.Clear;
ck_Mascarada4OD.Checked   := False;
ck_Ausente4OD.Checked     := False;
ed_6OD.Clear;
ck_Mascarada6OD.Checked   := False;
ck_Ausente6OD.Checked     := False;
ed_8OD.Clear;
ck_Mascarada8OD.Checked   := False;
ck_Ausente8OD.Checked     := False;
ed_250OE.Clear;
ck_Mascarada250OE.Checked := False;
ck_Ausente250OE.Checked   := False;
ed_500OE.Clear;
ck_Mascarada500OE.Checked := False;
ck_Ausente500OE.Checked   := False;
ed_1OE.Clear;
ck_Mascarada1OE.Checked   := False;
ck_Ausente1OE.Checked     := False;
ed_2OE.Clear;
ck_Mascarada2OE.Checked   := False;
ck_Ausente2OE.Checked     := False;
ed_3OE.Clear;
ck_Mascarada3OE.Checked   := False;
ck_Ausente3OE.Checked     := False;
ed_4OE.Clear;
ck_Mascarada4OE.Checked   := False;
ck_Ausente4OE.Checked     := False;
ed_6OE.Clear;
ck_Mascarada6OE.Checked   := False;
ck_Ausente6OE.Checked     := False;
ed_8OE.Clear;
ck_Mascarada8OE.Checked   := False;
ck_Ausente8OE.Checked     := False;

//tb_ItemExame.IndexFieldNames := 'IENumExa';
//tb_ItemExame.FindNearest([tb_ExameEXNumExa.Value]);
tb_ItemExame.First;

WHILE //(tb_ExameEXNumExa.Value = tb_ItemExameIENumExa.Value) AND
      (tb_ItemExame.Eof = False)                            DO
  BEGIN
  TEdit(FindComponent('ed_'+tb_ItemExameIEHz.Value+tb_ItemExameIEVia.Value+
                 tb_ItemExameIEOrelha.Value)).Text := tb_ItemExameIEDb.AsString;
  TCheckBox(FindComponent('ck_Mascarada'+tb_ItemExameIEHz.Value+
                 tb_ItemExameIEVia.Value+tb_ItemExameIEOrelha.Value)).Checked
                                   := tb_ItemExameIEMascarada.Value;
  TCheckBox(FindComponent('ck_Ausente'+tb_ItemExameIEHz.Value+tb_ItemExameIEVia.Value+
                      tb_ItemExameIEOrelha.Value)).Checked
                                   := tb_ItemExameIEAusente.Value;
  tb_ItemExame.Next;
  END;

END;


procedure Tfm_Exame.bt_AnteriorClick(Sender: TObject);
begin
tb_Exame.Prior;
Mensagem('Registro '+IntToStr(tb_Exame.RecNo)+' de '+IntToStr(tb_Exame.RecordCount),
          StatusBar,False);
end;

procedure Tfm_Exame.bt_CancelarClick(Sender: TObject);
begin

tb_Exame.Cancel;
Mensagem('As alterações foram canceladas',StatusBar,False);

pg_Grafico.TabVisible      := True;
pg_Grafico.Visible         := True;
tb_ExameAfterScroll(tb_Exame);

end;

procedure Tfm_Exame.bt_DeletarClick(Sender: TObject);
VAR vm_Status:String;
begin

IF MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN
   tb_Exame.Delete;
   vm_Status := tb_ExameEXNumExa.DisplayLabel+' '+tb_ExameEXNumExa.AsString+' excluído com sucesso';
   Mensagem(vm_Status,StatusBar,False);
   END;

end;

procedure Tfm_Exame.bt_ImprimirClick(Sender: TObject);
begin

IF fm_Relatorio = nil THEN
   Application.CreateForm(Tfm_Relatorio, fm_Relatorio);

fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Exame;
fm_Relatorio.cb_Exame.ItemIndex      := 0;
fm_Relatorio.cb_ExameClick(Sender);
fm_Relatorio.ed_NumExa.Text := tb_ExameEXNumExa.AsString;

IF Sender IS TAction THEN
   fm_Relatorio.bt_VideoClick(fm_Relatorio.bt_Impressora)
ELSE
   fm_Relatorio.ShowModal;

end;

procedure Tfm_Exame.bt_IncluirClick(Sender: TObject);
begin

tb_Exame.Insert;
tb_ExameEXDatExa.Value := Date;

cb_AudiometroExameEnter(Sender);

PageControl.ActivePage := pg_Exame;

IF ed_DatExaExame.CanFocus = True THEN
   ed_DatExaExame.SetFocus;

Mensagem('Incluindo um novo registro!',StatusBar,False);

end;


procedure Tfm_Exame.bt_ProximoClick(Sender: TObject);
begin
tb_Exame.Next;
Mensagem('Registro '+IntToStr(tb_Exame.RecNo)+' de '+IntToStr(tb_Exame.RecordCount),
          StatusBar,False);

end;

procedure Tfm_Exame.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_Exame.bt_SalvarClick(Sender: TObject);
VAR I:Byte;
begin

tb_Exame.UpdateRecord;

FOR I:=1 TO 8 DO
    BEGIN
    vm_VetViaAerDir[I]   := Nulo;
    vm_VetViaAerEsq[I]   := Nulo;
    vm_VetViaOssDir[I]   := Nulo;
    vm_VetViaOssEsq[I]   := Nulo;
    END;


IF MostrarLaudo = False THEN Exit;

tb_Exame.Post;

//tb_ItemExame.IndexFieldNames := 'IENumExa';
//tb_ItemExame.FindNearest([tb_ExameEXNumExa.Value]);
tb_ItemExame.First;

WHILE //(tb_ExameEXNumExa.Value = tb_ItemExameIENumExa.Value) AND
      (tb_ItemExame.Eof = False)                            DO
  tb_ItemExame.Delete;

FOR I:=1 TO 8 DO
    BEGIN

    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'AD')).Text <> '' THEN
       BEGIN
       tb_ItemExame.Insert;
       tb_ItemExameIENumExa.Value    := tb_ExameEXNumExa.Value;
       tb_ItemExameIENumSeq.Value    := I;
       tb_ItemExameIEHz.Value        := vm_VetHz[I];
       tb_ItemExameIEDb.AsString     :=
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'AD')).Text;
       tb_ItemExameIEVia.Value       := 'A';
       tb_ItemExameIEOrelha.Value    := 'D';
       tb_ItemExameIEMascarada.Value :=
          TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'AD')).Checked;
       tb_ItemExameIEAusente.Value   :=
          TCheckBox(FindComponent('ck_Ausente'+vm_VetHz[I]+'AD')).Checked;
       tb_ItemExame.Post;
       END;

    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'AE')).Text <> '' THEN
       BEGIN
       tb_ItemExame.Insert;
       tb_ItemExameIENumExa.Value    := tb_ExameEXNumExa.Value;
       tb_ItemExameIENumSeq.Value    := I;
       tb_ItemExameIEHz.Value        := vm_VetHz[I];
       tb_ItemExameIEDb.AsString        :=
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'AE')).Text;
       tb_ItemExameIEVia.Value       := 'A';
       tb_ItemExameIEOrelha.Value    := 'E';
       tb_ItemExameIEMascarada.Value :=
          TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'AE')).Checked;
       tb_ItemExameIEAusente.Value   :=
          TCheckBox(FindComponent('ck_Ausente'+vm_VetHz[I]+'AE')).Checked;
       tb_ItemExame.Post;
       END;

    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'OD')).Text <> '' THEN
       BEGIN
       tb_ItemExame.Insert;
       tb_ItemExameIENumExa.Value    := tb_ExameEXNumExa.Value;
       tb_ItemExameIENumSeq.Value    := I;
       tb_ItemExameIEHz.Value        := vm_VetHz[I];
       tb_ItemExameIEDb.AsString     :=
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'OD')).Text;
       tb_ItemExameIEVia.Value       := 'O';
       tb_ItemExameIEOrelha.Value    := 'D';
       tb_ItemExameIEMascarada.Value :=
          TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'OD')).Checked;
       tb_ItemExameIEAusente.Value   :=
          TCheckBox(FindComponent('ck_Ausente'+vm_VetHz[I]+'OD')).Checked;
       tb_ItemExame.Post;
       END;

    IF TEdit(FindComponent('ed_'+vm_VetHz[I]+'OE')).Text <> '' THEN
       BEGIN
       tb_ItemExame.Insert;
       tb_ItemExameIENumExa.Value    := tb_ExameEXNumExa.Value;
       tb_ItemExameIENumSeq.Value    := I;
       tb_ItemExameIEHz.Value        := vm_VetHz[I];
       tb_ItemExameIEDb.AsString     :=
          TEdit(FindComponent('ed_'+vm_VetHz[I]+'OE')).Text;
       tb_ItemExameIEVia.Value       := 'O';
       tb_ItemExameIEOrelha.Value    := 'E';
       tb_ItemExameIEMascarada.Value :=
          TCheckBox(FindComponent('ck_Mascarada'+vm_VetHz[I]+'OE')).Checked;
       tb_ItemExameIEAusente.Value   :=
          TCheckBox(FindComponent('ck_Ausente'+vm_VetHz[I]+'OE')).Checked;
       tb_ItemExame.Post;
       END;


    END;

pg_Grafico.TabVisible      := True;
pg_Grafico.Visible         := True;

Mensagem(tb_ExameEXNumExa.DisplayLabel+' '+tb_ExameEXNumExa.AsString+' salvo com sucesso'
         ,StatusBar,False);

//DbiSaveChanges(tb_ItemExame.Handle);

end;

procedure Tfm_Exame.cb_EmpresaExameEnter(Sender: TObject);
begin
//dm_Geral.tb_Empresa.IndexFieldNames := 'EMFantasia';
//fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Empresa;
end;

procedure Tfm_Exame.cb_PacienteExameEnter(Sender: TObject);
begin
//dm_Geral.tb_Paciente.IndexFieldNames := 'PCNome';
//fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Paciente;
//fm_Menu.ShowHint(Sender);
end;

procedure Tfm_Exame.cb_AudiometroExameEnter(Sender: TObject);
begin

//dm_Geral.tb_Audiometro.Close; dm_Geral.tb_Audiometro.Open;

end;

procedure Tfm_Exame.ds_ExameStateChange(Sender: TObject);
begin

IF tb_Exame.State IN [dsInsert, dsEdit] THEN
   BEGIN

   IF tb_Exame.State = dsEdit THEN
      ed_NumExaExame.Enabled := False
   ELSE
      ed_NumExaExame.Enabled := True;

   ed_DatExaExame.Enabled     := True;
   ed_HorExaExame.Enabled     := True;
   cb_TipExaExame.Enabled     := True;
   cb_AudiometroExame.Enabled := True;
   ed_PacienteCodigo.Enabled  := True;
   lblPacienteLabel.Enabled   := True;
   ed_RepousoExame.Enabled    := True;
   ed_EmpresaCodigo.Enabled   := True;
   lblEmpresaLabel.Enabled    := True;
   ed_FuncaoCodigo.Enabled    := True;
   lblFuncaoLabel.Enabled     := True;

   bt_Salvar.Enabled          := True;
   bt_Cancelar.Enabled        := True;
   bt_Alterar.Enabled         := False;
   bt_Incluir.Enabled         := False;
   bt_Deletar.Enabled         := False;
   bt_Procurar.Enabled        := False;
   bt_Imprimir.Enabled        := False;
   //bt_Anterior.Enabled        := False;
   //bt_Proximo.Enabled         := False;

   cb_MeatoscopiaOD.Enabled          := True;
   cb_Repetir.Enabled                := True;
   cb_Imitanciomaetria.Enabled       := True;
   cb_Tonal.Enabled                  := True;
   db_MeatoscopiaOE.Enabled          := True;
   cb_Otorrinolaringologista.Enabled := True;
   cb_Logoaudiometria.Enabled        := True;

   ed_StrOD.Enabled                  := True;
   ed_StrAlertaFalaOD.Enabled        := True;
   ed_MonoDbOD.Enabled               := True;
   ed_DiDbOD.Enabled                 := True;
   ed_DiPerOD.Enabled                := True;
   ed_MonoPerOD.Enabled              := True;
   ed_StrOE.Enabled                  := True;
   ed_AlertaFalaOE.Enabled           := True;
   ed_MonoDbOE.Enabled               := True;
   ed_DiDbOE.Enabled                 := True;
   ed_MonoPerOE.Enabled              := True;
   ed_DiPerOE.Enabled                := True;
   ck_LogoOD.Enabled                 := True;
   ck_LogoOE.Enabled                 := True;

   ed_PerdaOD.Enabled                := True;
   ed_PerdaOE.Enabled                := True;
   ed_Observacao.Enabled             := True;

   ed_250AD.Enabled           := True;
   ck_Mascarada250AD.Enabled  := True;
   ck_Ausente250AD.Enabled    := True;
   ed_500AD.Enabled           := True;
   ck_Mascarada500AD.Enabled  := True;
   ck_Ausente500AD.Enabled    := True;
   ed_1AD.Enabled             := True;
   ck_Mascarada1AD.Enabled    := True;
   ck_Ausente1AD.Enabled      := True;
   ed_2AD.Enabled             := True;
   ck_Mascarada2AD.Enabled    := True;
   ck_Ausente2AD.Enabled      := True;
   ed_3AD.Enabled             := True;
   ck_Mascarada3AD.Enabled    := True;
   ck_Ausente3AD.Enabled      := True;
   ed_4AD.Enabled             := True;
   ck_Mascarada4AD.Enabled    := True;
   ck_Ausente4AD.Enabled      := True;
   ed_6AD.Enabled             := True;
   ck_Mascarada6AD.Enabled    := True;
   ck_Ausente6AD.Enabled      := True;
   ed_8AD.Enabled             := True;
   ck_Mascarada8AD.Enabled    := True;
   ck_Ausente8AD.Enabled      := True;
   ed_250AE.Enabled           := True;
   ck_Mascarada250AE.Enabled  := True;
   ck_Ausente250AE.Enabled    := True;
   ed_500AE.Enabled           := True;
   ck_Mascarada500AE.Enabled  := True;
   ck_Ausente500AE.Enabled    := True;
   ed_1AE.Enabled             := True;
   ck_Mascarada1AE.Enabled    := True;
   ck_Ausente1AE.Enabled      := True;
   ed_2AE.Enabled             := True;
   ck_Mascarada2AE.Enabled    := True;
   ck_Ausente2AE.Enabled      := True;
   ed_3AE.Enabled             := True;
   ck_Mascarada3AE.Enabled    := True;
   ck_Ausente3AE.Enabled      := True;
   ed_4AE.Enabled             := True;
   ck_Mascarada4AE.Enabled    := True;
   ck_Ausente4AE.Enabled      := True;
   ed_6AE.Enabled             := True;
   ck_Mascarada6AE.Enabled    := True;
   ck_Ausente6AE.Enabled      := True;
   ed_8AE.Enabled             := True;
   ck_Mascarada8AE.Enabled    := True;
   ck_Ausente8AE.Enabled      := True;
   ed_250OD.Enabled           := True;
   ck_Mascarada250OD.Enabled  := True;
   ck_Ausente250OD.Enabled    := True;
   ed_500OD.Enabled           := True;
   ck_Mascarada500OD.Enabled  := True;
   ck_Ausente500OD.Enabled    := True;
   ed_1OD.Enabled             := True;
   ck_Mascarada1OD.Enabled    := True;
   ck_Ausente1OD.Enabled      := True;
   ed_2OD.Enabled             := True;
   ck_Mascarada2OD.Enabled    := True;
   ck_Ausente2OD.Enabled      := True;
   ed_3OD.Enabled             := True;
   ck_Mascarada3OD.Enabled    := True;
   ck_Ausente3OD.Enabled      := True;
   ed_4OD.Enabled             := True;
   ck_Mascarada4OD.Enabled    := True;
   ck_Ausente4OD.Enabled      := True;
   ed_6OD.Enabled             := True;
   ck_Mascarada6OD.Enabled    := True;
   ck_Ausente6OD.Enabled      := True;
   ed_8OD.Enabled             := True;
   ck_Mascarada8OD.Enabled    := True;
   ck_Ausente8OD.Enabled      := True;
   ed_250OE.Enabled           := True;
   ck_Mascarada250OE.Enabled  := True;
   ck_Ausente250OE.Enabled    := True;
   ed_500OE.Enabled           := True;
   ck_Mascarada500OE.Enabled  := True;
   ck_Ausente500OE.Enabled    := True;
   ed_1OE.Enabled             := True;
   ck_Mascarada1OE.Enabled    := True;
   ck_Ausente1OE.Enabled      := True;
   ed_2OE.Enabled             := True;
   ck_Mascarada2OE.Enabled    := True;
   ck_Ausente2OE.Enabled      := True;
   ed_3OE.Enabled             := True;
   ck_Mascarada3OE.Enabled    := True;
   ck_Ausente3OE.Enabled      := True;
   ed_4OE.Enabled             := True;
   ck_Mascarada4OE.Enabled    := True;
   ck_Ausente4OE.Enabled      := True;
   ed_6OE.Enabled             := True;
   ck_Mascarada6OE.Enabled    := True;
   ck_Ausente6OE.Enabled      := True;
   ed_8OE.Enabled             := True;
   ck_Mascarada8OE.Enabled    := True;
   ck_Ausente8OE.Enabled      := True;

   pg_Grafico.TabVisible      := False;
   pg_Grafico.Visible         := False;

   END
ELSE
   BEGIN

   ed_NumExaExame.Enabled     := False;

   ed_DatExaExame.Enabled     := False;
   ed_HorExaExame.Enabled     := False;
   cb_TipExaExame.Enabled     := False;
   cb_AudiometroExame.Enabled := False;
   ed_PacienteCodigo.Enabled  := False;
   lblPacienteLabel.Enabled   := False;
   ed_RepousoExame.Enabled    := False;
   ed_EmpresaCodigo.Enabled   := False;
   lblEmpresaLabel.Enabled    := False;
   ed_FuncaoCodigo.Enabled    := False;
   lblFuncaoLabel.Enabled     := False;

   bt_Salvar.Enabled          := False;
   bt_Cancelar.Enabled        := False;
   bt_Alterar.Enabled         := True;
   bt_Incluir.Enabled         := True;
   bt_Deletar.Enabled         := True;
   bt_Procurar.Enabled        := True;
   bt_Imprimir.Enabled        := True;
   //bt_Anterior.Enabled        := True;
   //bt_Proximo.Enabled         := True;

   cb_MeatoscopiaOD.Enabled          := False;
   cb_Repetir.Enabled                := False;
   cb_Imitanciomaetria.Enabled       := False;
   cb_Tonal.Enabled                  := False;
   db_MeatoscopiaOE.Enabled          := False;
   cb_Otorrinolaringologista.Enabled := False;
   cb_Logoaudiometria.Enabled        := False;

   ed_StrOD.Enabled                  := False;
   ed_StrAlertaFalaOD.Enabled        := False;
   ed_MonoDbOD.Enabled               := False;
   ed_DiDbOD.Enabled                 := False;
   ed_DiPerOD.Enabled                := False;
   ed_MonoPerOD.Enabled              := False;
   ed_StrOE.Enabled                  := False;
   ed_AlertaFalaOE.Enabled           := False;
   ed_MonoDbOE.Enabled               := False;
   ed_DiDbOE.Enabled                 := False;
   ed_MonoPerOE.Enabled              := False;
   ed_DiPerOE.Enabled                := False;
   ck_LogoOD.Enabled                 := False;
   ck_LogoOE.Enabled                 := False;

   ed_PerdaOD.Enabled                := False;
   ed_PerdaOE.Enabled                := False;
   ed_Observacao.Enabled             := False;

   ed_250AD.Enabled           := False;
   ck_Mascarada250AD.Enabled  := False;
   ck_Ausente250AD.Enabled    := False;
   ed_500AD.Enabled           := False;
   ck_Mascarada500AD.Enabled  := False;
   ck_Ausente500AD.Enabled    := False;
   ed_1AD.Enabled             := False;
   ck_Mascarada1AD.Enabled    := False;
   ck_Ausente1AD.Enabled      := False;
   ed_2AD.Enabled             := False;
   ck_Mascarada2AD.Enabled    := False;
   ck_Ausente2AD.Enabled      := False;
   ed_3AD.Enabled             := False;
   ck_Mascarada3AD.Enabled    := False;
   ck_Ausente3AD.Enabled      := False;
   ed_4AD.Enabled             := False;
   ck_Mascarada4AD.Enabled    := False;
   ck_Ausente4AD.Enabled      := False;
   ed_6AD.Enabled             := False;
   ck_Mascarada6AD.Enabled    := False;
   ck_Ausente6AD.Enabled      := False;
   ed_8AD.Enabled             := False;
   ck_Mascarada8AD.Enabled    := False;
   ck_Ausente8AD.Enabled      := False;
   ed_250AE.Enabled           := False;
   ck_Mascarada250AE.Enabled  := False;
   ck_Ausente250AE.Enabled    := False;
   ed_500AE.Enabled           := False;
   ck_Mascarada500AE.Enabled  := False;
   ck_Ausente500AE.Enabled    := False;
   ed_1AE.Enabled             := False;
   ck_Mascarada1AE.Enabled    := False;
   ck_Ausente1AE.Enabled      := False;
   ed_2AE.Enabled             := False;
   ck_Mascarada2AE.Enabled    := False;
   ck_Ausente2AE.Enabled      := False;
   ed_3AE.Enabled             := False;
   ck_Mascarada3AE.Enabled    := False;
   ck_Ausente3AE.Enabled      := False;
   ed_4AE.Enabled             := False;
   ck_Mascarada4AE.Enabled    := False;
   ck_Ausente4AE.Enabled      := False;
   ed_6AE.Enabled             := False;
   ck_Mascarada6AE.Enabled    := False;
   ck_Ausente6AE.Enabled      := False;
   ed_8AE.Enabled             := False;
   ck_Mascarada8AE.Enabled    := False;
   ck_Ausente8AE.Enabled      := False;
   ed_250OD.Enabled           := False;
   ck_Mascarada250OD.Enabled  := False;
   ck_Ausente250OD.Enabled    := False;
   ed_500OD.Enabled           := False;
   ck_Mascarada500OD.Enabled  := False;
   ck_Ausente500OD.Enabled    := False;
   ed_1OD.Enabled             := False;
   ck_Mascarada1OD.Enabled    := False;
   ck_Ausente1OD.Enabled      := False;
   ed_2OD.Enabled             := False;
   ck_Mascarada2OD.Enabled    := False;
   ck_Ausente2OD.Enabled      := False;
   ed_3OD.Enabled             := False;
   ck_Mascarada3OD.Enabled    := False;
   ck_Ausente3OD.Enabled      := False;
   ed_4OD.Enabled             := False;
   ck_Mascarada4OD.Enabled    := False;
   ck_Ausente4OD.Enabled      := False;
   ed_6OD.Enabled             := False;
   ck_Mascarada6OD.Enabled    := False;
   ck_Ausente6OD.Enabled      := False;
   ed_8OD.Enabled             := False;
   ck_Mascarada8OD.Enabled    := False;
   ck_Ausente8OD.Enabled      := False;
   ed_250OE.Enabled           := False;
   ck_Mascarada250OE.Enabled  := False;
   ck_Ausente250OE.Enabled    := False;
   ed_500OE.Enabled           := False;
   ck_Mascarada500OE.Enabled  := False;
   ck_Ausente500OE.Enabled    := False;
   ed_1OE.Enabled             := False;
   ck_Mascarada1OE.Enabled    := False;
   ck_Ausente1OE.Enabled      := False;
   ed_2OE.Enabled             := False;
   ck_Mascarada2OE.Enabled    := False;
   ck_Ausente2OE.Enabled      := False;
   ed_3OE.Enabled             := False;
   ck_Mascarada3OE.Enabled    := False;
   ck_Ausente3OE.Enabled      := False;
   ed_4OE.Enabled             := False;
   ck_Mascarada4OE.Enabled    := False;
   ck_Ausente4OE.Enabled      := False;
   ed_6OE.Enabled             := False;
   ck_Mascarada6OE.Enabled    := False;
   ck_Ausente6OE.Enabled      := False;
   ed_8OE.Enabled             := False;
   ck_Mascarada8OE.Enabled    := False;
   ck_Ausente8OE.Enabled      := False;

   ck_ExameAnterior.Checked   := False;
   IF fm_ExameAnterior <> Nil THEN
      BEGIN
      fm_ExameAnterior.Free;
      fm_ExameAnterior := Nil;
      END;

   END;


end;

procedure Tfm_Exame.tb_ExameAfterScroll(DataSet: TDataSet);
VAR vm_Proporcao:Real;
    vm_VetViaAerDir   :Array[1..8] OF Integer;
    vm_VetMascaradaAD :Array[1..8] OF Boolean;
    vm_VetAusenteAD   :Array[1..8] OF Boolean;
    vm_VetViaAerEsq   :Array[1..8] OF Integer;
    vm_VetMascaradaAE :Array[1..8] OF Boolean;
    vm_VetAusenteAE   :Array[1..8] OF Boolean;
    vm_VetViaOssDir   :Array[1..8] OF Integer;
    vm_VetMascaradaOD :Array[1..8] OF Boolean;
    vm_VetAusenteOD   :Array[1..8] OF Boolean;
    vm_VetViaOssEsq   :Array[1..8] OF Integer;
    vm_VetMascaradaOE :Array[1..8] OF Boolean;
    vm_VetAusenteOE   :Array[1..8] OF Boolean;
    I:Byte;
    vm_PosEsq         :Integer;
    vm_PosTop         :Integer;
begin


FOR I:=1 TO 8 DO
    BEGIN
    vm_VetViaAerDir[I]   := Nulo;
    vm_VetViaAerEsq[I]   := Nulo;
    vm_VetViaOssDir[I]   := Nulo;
    vm_VetViaOssEsq[I]   := Nulo;
    IF I>1 THEN
       BEGIN
       TCheckBox(FindComponent('ck_F'+vm_VetHz[I]+'D')).Checked := False;
       TCheckBox(FindComponent('ck_F'+vm_VetHz[I]+'E')).Checked := False;
       END;
    END;


RefreshTable(DataSet);

ck_ExameAnterior.Checked := False;

MostrarVia;

// Mostrar Gráfico

im_Grafico.Free;
im_Grafico        := TImage.Create(Self);
im_Grafico.Parent := pg_Grafico;


im_Grafico.Align       := alClient;
im_Grafico.Transparent := True;

im_Grafico.SendToBack();
im_Grafico.Canvas.Brush.Color := clBtnFace;
im_Grafico.Canvas.Pen.Color := clBtnFace;
im_Grafico.Canvas.Rectangle(0, im_Grafico.Top, im_Grafico.Width, im_Grafico.Height);


vm_Proporcao := sp_Direita.Height/150;

// Carregar os vetores
//tb_ItemExame.IndexFieldNames := 'IENumExa';
//tb_ItemExame.FindNearest([tb_ExameEXNumExa.Value]);
tb_ItemExame.First;

WHILE //(tb_ExameEXNumExa.Value = tb_ItemExameIENumExa.Value) AND
      (tb_ItemExame.Eof = False)                            DO
  BEGIN

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'D') THEN
     BEGIN
     vm_VetViaAerDir[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaAD[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteAD[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'E') THEN
     BEGIN
     vm_VetViaAerEsq[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaAE[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteAE[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;

  IF (tb_ItemExameIEVia.Value = 'O') AND (tb_ItemExameIEOrelha.Value= 'D') THEN
     BEGIN
     vm_VetViaOssDir[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaOD[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteOD[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;

  IF (tb_ItemExameIEVia.Value = 'O') AND (tb_ItemExameIEOrelha.Value= 'E') THEN
     BEGIN
     vm_VetViaOssEsq[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaOE[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteOE[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;


  tb_ItemExame.Next;

  END;


// Desenhar linha do Gráfico Esquerdo

im_Grafico.Canvas.Brush.Color := clNone;
im_Grafico.Canvas.Brush.Style := bsClear;
im_Grafico.Canvas.Pen.Color   := clRed;
im_Grafico.Canvas.Pen.Style   := psSolid;

FOR I:=1 TO 8 DO
    BEGIN

    vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'d')).Left;
    vm_PosTop := sp_Direita.Top+Round(vm_VetViaAerDir[I]*vm_Proporcao);

    IF (vm_VetAusenteAD[I] = False) AND (I<>1) AND
       (vm_VetViaAerDir[I-1]<>Nulo) AND
       (vm_VetViaAerDir[I]  <>Nulo) THEN
       im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop)
    ELSE
       im_Grafico.Canvas.MoveTo(vm_PosEsq,vm_PosTop);

    END;


// Desenhar linha do Gráfico Direito

im_Grafico.Canvas.Pen.Color := clBlue;
im_Grafico.Canvas.Pen.Style := psDot;

FOR I:=1 TO 8 DO
    BEGIN

    vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'e')).Left;
    vm_PosTop := sp_Esquerda.Top+Round(vm_VetViaAerEsq[I]*vm_Proporcao);

    IF (vm_VetAusenteAE[I] = False) AND (I<>1) AND
       (vm_VetViaAerEsq[I-1]<>Nulo) AND
       (vm_VetViaAerEsq[I]  <>Nulo) THEN
       im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop)
    ELSE
       im_Grafico.Canvas.MoveTo(vm_PosEsq,vm_PosTop);

    END;


// Mostrar os simbolos

FOR I:=1 TO 8 DO
  BEGIN

  // Direita
  IF vm_VetViaAerDir[I] <> Nulo THEN
     BEGIN

     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'d')).Left;
     vm_PosTop := sp_Direita.Top+Round(vm_VetViaAerDir[I]*vm_Proporcao);

     IF vm_VetMascaradaAD[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'Circulo',vm_VetAusenteAD[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,'Triangulo',vm_VetAusenteAD[I]);

     END;

  // Direita
  IF vm_VetViaOssDir[I] <> Nulo THEN
     BEGIN

     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'d')).Left;
     vm_PosTop := sp_Direita.Top+Round(vm_VetViaOssDir[I]*vm_Proporcao);

     IF vm_VetMascaradaOD[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'<',vm_VetAusenteOD[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,'[',vm_VetAusenteOD[I]);

     END;


  // Esquerda
  IF vm_VetViaAerEsq[I] <> Nulo THEN
     BEGIN

     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'e')).Left;
     vm_PosTop := sp_Esquerda.Top+Round(vm_VetViaAerEsq[I]*vm_Proporcao);

     IF vm_VetMascaradaAE[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'X',vm_VetAusenteAE[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,'Quadrado',vm_VetAusenteAE[I]);

     END;

  // Esquerda
  IF vm_VetViaOssEsq[I] <> Nulo THEN
     BEGIN
     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'e')).Left;
     vm_PosTop := sp_Esquerda.Top+Round(vm_VetViaOssEsq[I]*vm_Proporcao);

     IF vm_VetMascaradaOE[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'>',vm_VetAusenteOE[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,']',vm_VetAusenteOE[I]);

     END;

  END;

vm_Frequencia := tb_ExameEXFrequenciaD.Value;
WHILE vm_Frequencia <> '' DO
  BEGIN
  TCheckBox(FindComponent('ck_F'+IntToStr
           (StrToInt(Copy(vm_Frequencia,1,3)))+'D')).Checked := True;
  Delete(vm_Frequencia,1,3);
  END;

vm_Frequencia := tb_ExameEXFrequenciaE.Value;
WHILE vm_Frequencia <> '' DO
  BEGIN
  TCheckBox(FindComponent('ck_F'+IntToStr
           (StrToInt(Copy(vm_Frequencia,1,3)))+'E')).Checked := True;
  Delete(vm_Frequencia,1,3);
  END;

MostrarPaciente(tb_ExameEXCodPac.AsInteger);
MostrarEmpresa(tb_ExameEXCodEmp.AsInteger);
MostrarFuncao(tb_ExameEXCodFnc.AsInteger);

end;

procedure Tfm_Exame.bt_AlterarClick(Sender: TObject);
begin

tb_Exame.Edit;

IF ed_DatExaExame.CanFocus = True THEN
   ed_DatExaExame.SetFocus;

IF ed_250AD.CanFocus = True       THEN
   ed_250AD.SetFocus;

IF ed_250OD.CanFocus = True       THEN
   ed_250OD.SetFocus;

IF ed_StrOD.CanFocus = True       THEN
   ed_StrOD.SetFocus;

Mensagem('Alterando um novo registro!',StatusBar,False);

end;

procedure Tfm_Exame.ac_CtrlLExecute(Sender: TObject);
begin

IF bt_Procurar.Enabled = True THEN
   bt_ProcurarClick(bt_Procurar);

end;

procedure Tfm_Exame.ac_CtrlNExecute(Sender: TObject);
begin
IF bt_Incluir.Enabled = True THEN
   bt_IncluirClick(bt_Incluir);
end;

procedure Tfm_Exame.ac_CtrlSExecute(Sender: TObject);
begin
IF bt_Salvar.Enabled = True THEN
   bt_SalvarClick(bt_Salvar);
end;

procedure Tfm_Exame.ac_EscExecute(Sender: TObject);
begin
IF bt_Cancelar.Enabled = True THEN
   bt_CancelarClick(bt_Cancelar);
end;


procedure Tfm_Exame.FormCreate(Sender: TObject);
begin

Self.Top := 0;
Self.Left := 0;

dm_Geral.tb_Audiometro.Close;
dm_Geral.tb_Audiometro.Open;

dm_Geral.tb_Meatoscopia.Close;
dm_Geral.tb_Meatoscopia.Open;

tb_ItemExame.Active    := True;
tb_Exame.Active        := True;
PageControl.ActivePage :=pg_Grafico;

end;

procedure Tfm_Exame.pg_GraficoShow(Sender: TObject);
begin
tb_ExameAfterScroll(tb_Exame);
end;

procedure Tfm_Exame.tb_ExameBeforeDelete(DataSet: TDataSet);
begin

//tb_ItemExame.IndexFieldNames := 'IENumExa';
//tb_ItemExame.FindNearest([tb_ExameEXNumExa.Value]);
tb_ItemExame.First;

WHILE //(tb_ExameEXNumExa.Value = tb_ItemExameIENumExa.Value) AND
      (tb_ItemExame.Eof = False)                            DO
  tb_ItemExame.Delete;

end;

procedure Tfm_Exame.bt_ProcurarClick(Sender: TObject);
VAR vm_NumExa : LongInt;
begin

IF fm_ProcuraExame = Nil THEN
   Application.CreateForm(Tfm_ProcuraExame, fm_ProcuraExame);

IF fm_ProcuraExame.ShowModal = mrOk THEN
   BEGIN

   TRY
   vm_NumExa := StrToInt(fm_ProcuraExame.ed_NumExa.Text);
   EXCEPT
   vm_NumExa := fm_ProcuraExame.qr_ExameEXNumExa.Value;
   END;

   //tb_Exame.First;
   //tb_Exame.IndexFieldNames := 'EXNumExa';
   //tb_Exame.FindNearest([vm_NumExa]);

   tb_Exame.Close;
   tb_Exame.Parameters.ParamByName('EXNUMEXA').Value := vm_NumExa;
   tb_Exame.Open;

   //tb_ExameAfterScroll(tb_Exame); VERIFICAR
   IF tb_ExameEXNumExa.Value = vm_NumExa THEN
      Mensagem('Localizado exame n. '+IntToStr(vm_NumExa),StatusBar,False)
   ELSE
      Mensagem('Exame n. '+IntToStr(vm_NumExa)+' não foi localizado',StatusBar,True);

   END;

end;

procedure Tfm_Exame.cb_PacienteExameClick(Sender: TObject);
begin
tb_ExameEXCodEmp.Value   := dm_Geral.tb_PacientePCCodEmp.Value;
tb_ExameEXCodFnc.Value   := dm_Geral.tb_PacientePCCodFnc.Value;
ck_ExameAnterior.Checked := False;
end;

procedure Tfm_Exame.tb_ExameCalcFields(DataSet: TDataSet);
VAR vm_AnoAtu,vm_MesAtu,vm_DiaAtu:Word;
    vm_AnoNas,vm_MesNas,vm_DiaNas:Word;
    vm_IdadeMes:LongInt;
    vm_AtualMes:LongInt;
    vm_DatNas: Variant;
begin

IF (tb_ExameEXCodPac.IsNull = False) THEN
   BEGIN

   vm_DatNas := ObtemValorBD('select PCDatNas from SAFAPC where PCCodPac = '+tb_ExameEXCodPac.AsString, dm_Geral.ADOConnection);

   IF Not VarIsNull(vm_DatNas) THEN
     BEGIN

       DecodeDate(tb_ExameEXDatExa.Value,vm_AnoAtu,vm_MesAtu,vm_DiaAtu);
       DecodeDate(vm_DatNas,vm_AnoNas,vm_MesNas,vm_DiaNas);
       vm_IdadeMes := (vm_AnoNas*12)+vm_MesNas;
       vm_AtualMes := (vm_AnoAtu*12)+vm_MesAtu;
       tb_ExameEX_Idade.Value :=
                   FormatFloat('#00',Int((vm_AtualMes-vm_IdadeMes)/12))+' anos e ' +
                   FormatFloat('00',Frac((vm_AtualMes-vm_IdadeMes)/12)*12)+' meses';
     END
   ELSE
     BEGIN
       tb_ExameEX_Idade.Clear;
     END;

   END
ELSE
   BEGIN
   tb_ExameEX_Idade.Clear;
   END;

end;

procedure Tfm_Exame.cb_MeatoscopiaODEnter(Sender: TObject);
begin
//dm_Geral.tb_Meatoscopia.Close; dm_Geral.tb_Meatoscopia.Open;
//fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Meatoscopia;
end;

procedure Tfm_Exame.db_MeatoscopiaOEEnter(Sender: TObject);
begin
//dm_Geral.tb_Meatoscopia.Close; dm_Geral.tb_Meatoscopia.Open;
//fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Meatoscopia;
end;




procedure Tfm_Exame.tb_ExameBeforePost(DataSet: TDataSet);
begin

IF tb_ExameEXNumExa.IsNull = True THEN
   BEGIN
   //IF dm_Geral.tb_Exame.IsEmpty = True THEN
   //   tb_ExameEXNumExa.Value := 1
   //ELSE
   //   BEGIN
      //dm_Geral.tb_Exame.IndexFieldNames := 'EXNumExa';
      //dm_Geral.tb_Exame.Last;
      tb_ExameEXNumExa.Value := MaiorCodigo('EXNumExa', 'SAFAEX') + 1;
   //   END;
   END;

end;

procedure Tfm_Exame.tb_ExamePostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   tb_ExameEXNumExa.Value := tb_ExameEXNumExa.Value + 1;
   Action := daRetry;
   END;


end;

procedure Tfm_Exame.ac_CtrlAExecute(Sender: TObject);
begin
IF bt_Alterar.Enabled = True THEN
   bt_AlterarClick(bt_Procurar);
end;



procedure Tfm_Exame.PageControlChange(Sender: TObject);
VAR I:Byte;
begin

IF ((PageControl.ActivePage = pg_Laudo)                    OR
    (PageControl.ActivePage = pg_Logoaudiometria)) = False THEN
    Exit;

IF (tb_Exame.State in [dsEdit,dsInsert]) = False  THEN
   Exit;


FOR I:=1 TO 8 DO
    BEGIN

    vm_VetViaAerDir[I]   := Nulo;
    vm_VetViaAerEsq[I]   := Nulo;
    vm_VetViaOssDir[I]   := Nulo;
    vm_VetViaOssEsq[I]   := Nulo;

    IF I>1 THEN
       BEGIN
       TCheckBox(FindComponent('ck_F'+vm_VetHz[I]+'D')).Checked := False;
       TCheckBox(FindComponent('ck_F'+vm_VetHz[I]+'E')).Checked := False;
       END;

    END;


IF MostrarLaudo = False THEN Exit;

end;

procedure Tfm_Exame.tb_ExameAfterPost(DataSet: TDataSet);
begin
//DbiSaveChanges(TTable(DataSet).Handle);
end;

procedure Tfm_Exame.ac_PgUpExecute(Sender: TObject);
begin
//IF bt_Anterior.Enabled = True THEN
//   bt_AnteriorClick(Sender);
end;

procedure Tfm_Exame.ac_PgDownExecute(Sender: TObject);
begin
//IF bt_Proximo.Enabled = True THEN
//   bt_ProximoClick(Sender);
end;

procedure Tfm_Exame.cb_FuncaoEnter(Sender: TObject);
begin
dm_Geral.tb_Funcao.IndexFieldNames := 'FCDescricao';
fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Funcao;
end;

procedure Tfm_Exame.cb_PacienteExameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

// Evento compartilhado

IF Key = vk_F9 THEN
   fm_Cadastro.Show;

end;

procedure Tfm_Exame.ac_F8Execute(Sender: TObject);
begin
IF bt_Imprimir.Enabled = True THEN
   bt_ImprimirClick(Sender);
end;

procedure Tfm_Exame.ck_ExameAnteriorClick(Sender: TObject);
begin

IF ck_ExameAnterior.Checked = True THEN
   BEGIN
   IF Not VarIsNull(ObtemValorBD('select EXCodPac from SAFAEX where EXCodPac = '+tb_ExameEXCodPac.AsString, dm_Geral.ADOConnection)) THEN
      BEGIN
      Screen.Cursor := crHourGlass;

      IF fm_ExameAnterior = Nil THEN
         Application.CreateForm(Tfm_ExameAnterior, fm_ExameAnterior);

      fm_ExameAnterior.tb_ItemExame.Active := False;
      fm_ExameAnterior.tb_ItemExame.Active := True;
      fm_ExameAnterior.qr_Exame.Active := False;
      fm_ExameAnterior.qr_Exame.Parameters[0].Value := tb_ExameEXCodPac.Value;
      fm_ExameAnterior.qr_Exame.Active := True;
      fm_ExameAnterior.qr_Exame.Last;
      fm_ExameAnterior.Show;

      Screen.Cursor := crDefault;
      END
   ELSE
      BEGIN
      ck_ExameAnterior.OnClick := Nil;
      ck_ExameAnterior.Checked := False;
      ck_ExameAnterior.OnClick := ck_ExameAnteriorClick;
      Mensagem('Não existem exames anteriores deste paciente!',StatusBar,False);
      END;
   END
ELSE
   BEGIN

   fm_ExameAnterior.Close;

   IF tb_Exame.State = dsBrowse THEN
      BEGIN
      IF fm_ExameAnterior <> Nil THEN
         BEGIN
         fm_ExameAnterior.Free;
         fm_ExameAnterior := Nil;
         END;
      END;

   END;


end;

procedure Tfm_Exame.pg_ViaOsseaShow(Sender: TObject);
begin
IF tb_Exame.State IN [dsEdit, dsInsert] THEN
   BEGIN

   IF fm_ExameAnterior = Nil THEN
      ck_ExameAnterior.Checked := True;

   IF ed_500OD.CanFocus = True THEN
      ed_500OD.SetFocus;

   END;
end;

procedure Tfm_Exame.pg_ViaAeriaShow(Sender: TObject);
begin

IF tb_Exame.State IN [dsEdit, dsInsert] THEN
   BEGIN

   IF fm_ExameAnterior = Nil THEN
      ck_ExameAnterior.Checked := True;

   IF ed_500AD.CanFocus = True THEN
      ed_500AD.SetFocus;

   END;
end;

procedure Tfm_Exame.FormClose(Sender: TObject; var Action: TCloseAction);
begin

IF fm_ProcuraExame <> Nil THEN
   BEGIN
   fm_ProcuraExame.Free;
   fm_ProcuraExame := Nil;
   END;

Action := caFree;
fm_Exame := Nil;

end;

procedure Tfm_Exame.tb_ExameBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Exame.SQL.Text = '' THEN
  BEGIN
    tb_Exame.SQL.Text := 'select * from Safaex where EXNumExa = :EXNUMEXA';

    tb_Exame.Parameters.Clear;
    tb_Exame.Parameters.CreateParameter( 'EXNUMEXA', ftInteger, pdInput, 0, 0);
    tb_Exame.Parameters.ParamByName('EXNUMEXA').Value := MaiorCodigo('EXNumExa', 'SAFAEX');
  END;


end;

procedure Tfm_Exame.tb_ItemExameBeforeOpen(DataSet: TDataSet);
begin

  IF tb_ItemExame.SQL.Text = '' THEN
  BEGIN
    tb_ItemExame.SQL.Text := 'select * from Safaie where IENumExa = :EXNUMEXA';

    tb_ItemExame.Parameters.Clear;
    tb_ItemExame.Parameters.CreateParameter( 'EXNUMEXA', ftInteger, pdInput, 0, 0);
  END;
  
end;

procedure Tfm_Exame.cb_AudiometroExameExit(Sender: TObject);
begin
tb_ExameEXDatCal.Value := dm_Geral.tb_AudiometroAUDatCal.Value;
end;

procedure Tfm_Exame.lblPacienteLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safapc', 'PCCodPac', 'PCNome', 'Paciente') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_ExameEXCodPac.Value := Codigo;

      MostrarPaciente(Codigo);

    END;
  END;

end;

procedure Tfm_Exame.ed_PacienteCodigoExit(Sender: TObject);
begin
  MostrarPaciente(tb_ExameEXCodPac.AsInteger);
end;

procedure Tfm_Exame.lblEmpresaLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safaem', 'EMCodEmp', 'EMRazao', 'Empresa') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_ExameEXCodEmp.Value := Codigo;

      MostrarEmpresa(Codigo);

    END;
  END;

end;

procedure Tfm_Exame.ed_EmpresaCodigoExit(Sender: TObject);
begin
  MostrarEmpresa(tb_ExameEXCodEmp.AsInteger);
end;

procedure Tfm_Exame.lblFuncaoLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safafc', 'FCCodFnc', 'FCDescricao', 'Função') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_ExameEXCodFnc.Value := Codigo;

      MostrarFuncao(Codigo);

    END;
  END;

end;

procedure Tfm_Exame.ed_FuncaoCodigoExit(Sender: TObject);
begin
  MostrarFuncao(tb_ExameEXCodFnc.AsInteger);
end;

procedure Tfm_Exame.ed_PacienteCodigoEnter(Sender: TObject);
begin

  IF (tb_ExameEXCodPac.IsNull) THEN
     lblPacienteLabelClick(Sender);

end;

procedure Tfm_Exame.ed_EmpresaCodigoEnter(Sender: TObject);
begin

  IF (tb_ExameEXCodEmp.IsNull) THEN
     lblEmpresaLabelClick(Sender);

end;

procedure Tfm_Exame.ed_FuncaoCodigoEnter(Sender: TObject);
begin

  IF (tb_ExameEXCodFnc.IsNull) THEN
     lblFuncaoLabelClick(Sender);

end;

procedure Tfm_Exame.ed_PacienteCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblPacienteLabelClick(Sender);

end;

procedure Tfm_Exame.ed_EmpresaCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblEmpresaLabelClick(Sender);

end;

procedure Tfm_Exame.ed_FuncaoCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblFuncaoLabelClick(Sender);

end;

procedure Tfm_Exame.tb_ExameNewRecord(DataSet: TDataSet);
begin
  tb_ExameEXNumHorRep.Value := 14;
  tb_ExameEXHOREXA.Value := StrToTime(FormatDateTime('hh:nn:ss', Now));
  tb_ExameEXCodMeaOD.Value := 1;
  tb_ExameEXCodMeaOE.Value := 1;
  tb_ExameEXCodAud.Value := 1;
  tb_ExameEXLogoOD.Value := False;
  tb_ExameEXLogoOE.Value := False;
  tb_ExameEXImitanciomaetria.Value := False;
  tb_ExameEXVAOD.Value := False;
  tb_ExameEXVAOE.Value := False;
  tb_ExameEXVOOD.Value := False;
  tb_ExameEXVOOE.Value := False;

  cb_AudiometroExameExit(cb_AudiometroExame);
end;

INITIALIZATION

vm_VetHz[1] := '250';
vm_VetHz[2] := '500';
vm_VetHz[3] := '1';
vm_VetHz[4] := '2';
vm_VetHz[5] := '3';
vm_VetHz[6] := '4';
vm_VetHz[7] := '6';
vm_VetHz[8] := '8';

end.
