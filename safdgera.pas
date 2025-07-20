unit safdgera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ADODB;

type
  Tdm_Geral = class(TDataModule)
    tb_Anamnese: TTable;
    tb_AnamneseANCodAna: TIntegerField;
    tb_AnamneseANDescricao: TStringField;
    ds_Anamnese: TDataSource;
    ds_Pergunta: TDataSource;
    tb_Pergunta: TTable;
    tb_PerguntaPGCodAna: TIntegerField;
    tb_PerguntaPGNumPer: TIntegerField;
    tb_PerguntaPGDescricao: TStringField;
    tb_Audiometro: TADOQuery;
    tb_AudiometroAUCodAud: TIntegerField;
    tb_AudiometroAUDescricao: TStringField;
    tb_AudiometroAUDatCal: TDateField;
    tb_AudiometroAUDatAfe: TDateField;
    ds_Audiometro: TDataSource;
    tb_Convenio: TTable;
    tb_ConvenioCVCodCon: TIntegerField;
    tb_ConvenioCVDescricao: TStringField;
    ds_Convenio: TDataSource;
    tb_Patologia: TTable;
    tb_PatologiaPTCodPat: TIntegerField;
    tb_PatologiaPTDescricao: TStringField;
    ds_Patologia: TDataSource;
    tb_Paciente: TTable;
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
    ds_Paciente: TDataSource;
    ds_Empresa: TDataSource;
    tb_Empresa: TTable;
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
    tb_Funcao: TTable;
    tb_FuncaoFCCodFnc: TIntegerField;
    tb_FuncaoFCDescricao: TStringField;
    ds_Funcao: TDataSource;
    tb_Meatoscopia: TADOQuery;
    tb_MeatoscopiaMTCodMea: TIntegerField;
    tb_MeatoscopiaMTDescricao: TStringField;
    ds_Meatoscopia: TDataSource;
    tb_Exame: TTable;
    tb_ExameEXNumExa: TIntegerField;
    tb_ExameEXDatExa: TDateField;
    tb_ExameEXTipExa: TStringField;
    tb_ExameEXCodAud: TIntegerField;
    tb_ExameEXDatCal: TDateField;
    tb_ExameEXCodPac: TIntegerField;
    tb_ExameEXNumHorRep: TIntegerField;
    tb_ExameEXCodEmp: TIntegerField;
    tb_ExameEX_Idade: TStringField;
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
    tb_ExameEXRepetir: TBooleanField;
    tb_ExameEXImitanciomaetria: TBooleanField;
    tb_ExameEXTonal: TBooleanField;
    tb_ExameEXOtorrinolaringologista: TBooleanField;
    tb_ExameEXLogoaudiometria: TBooleanField;
    tb_ExameEXLogoOD: TBooleanField;
    tb_ExameEXLogoOE: TBooleanField;
    tb_ExameEXMedia01D: TFloatField;
    tb_ExameEXMedia02D: TFloatField;
    tb_ExameEXMedia01E: TFloatField;
    tb_ExameEXMedia02E: TFloatField;
    tb_ExameEXLaudoD: TStringField;
    tb_ExameEXLaudoE: TStringField;
    tb_ExameEXGrauD: TStringField;
    tb_ExameEXGrauE: TStringField;
    tb_ExameEXFrequenciaD: TStringField;
    tb_ExameEXFrequenciaE: TStringField;
    tb_ExameEXVAOD: TBooleanField;
    tb_ExameEXVAOE: TBooleanField;
    tb_ExameEXVOOD: TBooleanField;
    tb_ExameEXVOOE: TBooleanField;
    ds_Exame: TDataSource;
    tb_Usuario: TTable;
    tb_UsuarioUSCodUsu: TIntegerField;
    tb_UsuarioUSNome: TStringField;
    tb_UsuarioUSNomAbr: TStringField;
    tb_UsuarioUSFuncao: TStringField;
    tb_UsuarioUSSenha: TStringField;
    ds_Usuario: TDataSource;
    tb_ExameEXObservacao: TMemoField;
    tb_PacientePCCodFnc: TIntegerField;
    tb_PacientePCMesNovCon: TIntegerField;
    ds_Duplicata: TDataSource;
    tb_Duplicata: TTable;
    tb_Caixa: TTable;
    ds_Caixa: TDataSource;
    ds_Saldo: TDataSource;
    tb_Saldo: TTable;
    tb_CtasPagar: TTable;
    ds_CtasPagar: TDataSource;
    tb_Fornecedor: TTable;
    tb_FornecedorFOCodFor: TIntegerField;
    tb_FornecedorFONome: TStringField;
    ds_Fornecedor: TDataSource;
    tb_Despesa: TADOQuery;
    ds_Despesa: TDataSource;
    tb_DuplicataDUDatEmi: TDateField;
    tb_DuplicataDUValDup: TFloatField;
    tb_DuplicataDUDatVen: TDateField;
    tb_DuplicataDUValPag: TFloatField;
    tb_DuplicataDUDatPag: TDateField;
    tb_DuplicataDUObservacao: TStringField;
    tb_DuplicataDUNumLan: TIntegerField;
    tb_CtasPagarCPCodFor: TIntegerField;
    tb_CtasPagarCPNumDup: TStringField;
    tb_CtasPagarCPCodDes: TIntegerField;
    tb_CtasPagarCPDatVen: TDateField;
    tb_CtasPagarCPDatEmi: TDateField;
    tb_CtasPagarCPValDup: TFloatField;
    tb_CtasPagarCPDatPag: TDateField;
    tb_CtasPagarCPValPag: TFloatField;
    tb_CtasPagarCPObservacao: TStringField;
    tb_CtasPagarCPNumLan: TIntegerField;
    tb_CaixaCXAnoLan: TIntegerField;
    tb_CaixaCXMesLan: TIntegerField;
    tb_CaixaCXNumLan: TIntegerField;
    tb_CaixaCXDatLan: TDateField;
    tb_CaixaCXCodDes: TIntegerField;
    tb_CaixaCXCodFor: TIntegerField;
    tb_CaixaCXTipLan: TStringField;
    tb_CaixaCXValLan: TFloatField;
    tb_CaixaCXCodAlu: TIntegerField;
    tb_CaixaCXHistorico: TStringField;
    tb_SaldoSDAno: TIntegerField;
    tb_SaldoSDMes: TIntegerField;
    tb_SaldoSDSaldo: TFloatField;
    tb_DespesaDECodDes: TIntegerField;
    tb_DespesaDEDescricao: TStringField;
    tb_Comprador: TTable;
    ds_Comprador: TDataSource;
    tb_PacientePCBooUsaApa: TStringField;
    tb_Marca: TTable;
    tb_MarcaMACodMar: TIntegerField;
    tb_MarcaMADescricao: TStringField;
    ds_Marca: TDataSource;
    tb_Aparelho: TTable;
    tb_AparelhoAPCodApa: TIntegerField;
    tb_AparelhoAPDescricao: TStringField;
    tb_AparelhoAPModelo: TStringField;
    ds_Aparelho: TDataSource;
    tb_Controle: TTable;
    tb_ControleCOCodApa: TIntegerField;
    tb_ControleCOCodCon: TIntegerField;
    tb_ControleCODescricao: TStringField;
    tb_ControleCOControle: TStringField;
    tb_ControleCOUniMed: TStringField;
    ds_Controle: TDataSource;
    tb_AparelhoAPCodMar: TIntegerField;
    tb_Testagem: TTable;
    tb_TestagemTENumTes: TIntegerField;
    tb_TestagemTECodPac: TIntegerField;
    tb_TestagemTEDatTes: TDateField;
    tb_TestagemTEDatRet: TDateField;
    ds_Testagem: TDataSource;
    tb_ItemControle: TTable;
    tb_ItemControleICCodTes: TIntegerField;
    tb_ItemControleICDirEsq: TStringField;
    tb_ItemControleICCodApa: TIntegerField;
    tb_ItemControleICCodCon: TIntegerField;
    tb_ItemControleICControle: TStringField;
    tb_ItemControleICUniMed: TStringField;
    tb_ItemControleICValMed: TFloatField;
    ds_ItemControle: TDataSource;
    tb_ItemTesDir: TTable;
    tb_ItemTesDirITNumTes: TIntegerField;
    tb_ItemTesDirITCodApa: TIntegerField;
    tb_ItemTesDirITCodMar: TIntegerField;
    tb_ItemTesDirITBooApaBom: TStringField;
    tb_ItemTesDirITDirEsq: TStringField;
    tb_ItemTesDirITObservacao: TStringField;
    tb_ItemTesDirITStrControle: TStringField;
    ds_ItemTesDir: TDataSource;
    tb_EmpresaEMMesAnoIni: TStringField;
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
    tb_Servico: TTable;
    ds_Servico: TDataSource;
    tb_ServicoSECodSer: TIntegerField;
    tb_ServicoSEDescricao: TStringField;
    tb_Venda: TTable;
    ds_Venda: TDataSource;
    tb_ItemVenda: TTable;
    ds_ItemVenda: TDataSource;
    tb_DuplicataDUCodPac: TIntegerField;
    tb_VendaVENumNot: TIntegerField;
    tb_VendaVECodPac: TIntegerField;
    tb_VendaVECodCmp: TIntegerField;
    tb_VendaVETipVen: TStringField;
    tb_VendaVEDatVen: TDateField;
    tb_VendaVEDatCan: TDateField;
    tb_VendaVEValVen: TFloatField;
    tb_VendaVEDesAcr: TFloatField;
    tb_ItemVendaIVNumNot: TIntegerField;
    tb_ItemVendaIVNumSeq: TIntegerField;
    tb_ItemVendaIVCodApa: TIntegerField;
    tb_ItemVendaIVCodSer: TIntegerField;
    tb_ItemVendaIVSerie: TStringField;
    tb_ItemVendaIVDatVal: TDateField;
    tb_ItemVendaIVValor: TFloatField;
    tb_DuplicataDUNumNot: TIntegerField;
    tb_DuplicataDUNumPar: TIntegerField;
    ADOConnection: TADOConnection;
    tb_Setor: TADOQuery;
    ds_Setor: TDataSource;
    tb_TipoContato: TADOQuery;
    ds_TipoContato: TDataSource;
    tb_TipoContatoTPCOTipo: TIntegerField;
    tb_TipoContatoTPCONome: TStringField;
    procedure tb_PacienteCalcFields(DataSet: TDataSet);
    procedure tb_AnamneseAfterScroll(DataSet: TDataSet);
    procedure tb_PerguntaAfterScroll(DataSet: TDataSet);
    procedure tb_AudiometroAfterScroll(DataSet: TDataSet);
    procedure tb_FuncaoAfterScroll(DataSet: TDataSet);
    procedure tb_ConvenioAfterScroll(DataSet: TDataSet);
    procedure tb_PatologiaAfterScroll(DataSet: TDataSet);
    procedure tb_PacienteAfterScroll(DataSet: TDataSet);
    procedure tb_EmpresaAfterScroll(DataSet: TDataSet);
    procedure tb_MeatoscopiaAfterScroll(DataSet: TDataSet);
    procedure tb_ExameAfterScroll(DataSet: TDataSet);
    procedure tb_UsuarioAfterScroll(DataSet: TDataSet);
    procedure tb_DespesaAfterScroll(DataSet: TDataSet);
    procedure tb_CompradorAfterScroll(DataSet: TDataSet);
    procedure tb_FornecedorAfterScroll(DataSet: TDataSet);
    procedure tb_SaldoAfterScroll(DataSet: TDataSet);
    procedure tb_CaixaAfterScroll(DataSet: TDataSet);
    procedure tb_CtasPagarAfterScroll(DataSet: TDataSet);
    procedure tb_DuplicataAfterScroll(DataSet: TDataSet);
    FUNCTION  TabelasOk: Boolean;
    procedure tb_MarcaAfterScroll(DataSet: TDataSet);
    procedure tb_AparelhoAfterScroll(DataSet: TDataSet);
    procedure tb_ControleAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Geral: Tdm_Geral;

implementation

Uses funcoes;

{$R *.DFM}

FUNCTION Tdm_Geral.TabelasOk: Boolean;
VAR
    Z,I:Integer;
BEGIN
TRY
FOR Z:=0 TO Self.ComponentCount-1 DO
    BEGIN
    IF (Self.Components[Z] IS TTable) THEN
       BEGIN
       TTable(Self.Components[Z]).Open;
       FOR I := 0 TO TTable(Self.Components[Z]).IndexDefs.Count - 1 DO
          TTable(Self.Components[Z]).IndexFieldNames := TTable(Self.Components[Z]).IndexDefs.Items[I].Fields;
       END;
    END;
Result := True;
EXCEPT
Result := False;
END;//TRY
END;

procedure Tdm_Geral.tb_PacienteCalcFields(DataSet: TDataSet);
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
ELSE
   BEGIN
   tb_PacientePC_Idade.Clear;
   END;

end;

procedure Tdm_Geral.tb_AnamneseAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_PerguntaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_AudiometroAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_FuncaoAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_ConvenioAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_PatologiaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_PacienteAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_EmpresaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_MeatoscopiaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_ExameAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_UsuarioAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_DespesaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_CompradorAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_FornecedorAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_SaldoAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_CaixaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_CtasPagarAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_DuplicataAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_MarcaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_AparelhoAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.tb_ControleAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tdm_Geral.DataModuleCreate(Sender: TObject);
begin
  ADOConnection.Close;
  ADOConnection.ConnectionString := GetCfgValue('ConnectionString');
end;

end.
