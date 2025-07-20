// Não permitir alterar ou escluir controles que foram testados
// nao permitir alterar ou excluir cadastro de aparelho
unit safutest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ActnList, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls, ComCtrls, DBCGrids, BDE, ADODB;

type
  Tfm_Testagem = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
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
    bt_Anterior: TSpeedButton;
    bt_Proximo: TSpeedButton;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Bevel10: TBevel;
    bt_Alterar: TSpeedButton;
    lc_Paciente: TDBLookupComboBox;
    ed_DatTes: TDBEdit;
    tb_Testagem: TTable;
    ds_Testagem: TDataSource;
    tb_ItemTesEsq: TTable;
    ds_ItemTesEsq: TDataSource;
    Label11: TLabel;
    ed_DatRet: TDBEdit;
    Bevel14: TBevel;
    Bevel6: TBevel;
    pn_ItemTestagem: TPanel;
    Bevel7: TBevel;
    Bevel11: TBevel;
    DBCtrlGrid1: TDBCtrlGrid;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBMemo1: TDBEdit;
    DBCtrlGrid2: TDBCtrlGrid;
    Bevel9: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBMemo2: TDBEdit;
    Bevel13: TBevel;
    Bevel12: TBevel;
    Label6: TLabel;
    Label10: TLabel;
    bt_IncluirEsq: TSpeedButton;
    bt_ExcluirEsq: TSpeedButton;
    bt_IncluirDir: TSpeedButton;
    bt_ExcluirDir: TSpeedButton;
    tb_TestagemTENumTes: TIntegerField;
    tb_TestagemTECodPac: TIntegerField;
    tb_TestagemTEDatTes: TDateField;
    tb_TestagemTEDatRet: TDateField;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    tb_ItemTesEsqITNumTes: TIntegerField;
    tb_ItemTesEsqITCodApa: TIntegerField;
    tb_ItemTesEsqITCodMar: TIntegerField;
    tb_ItemTesEsqITBooApaBom: TStringField;
    tb_ItemTesEsqITDirEsq: TStringField;
    tb_ItemTesEsqITObservacao: TStringField;
    tb_ItemTesEsqIT_Aparelho: TStringField;
    tb_ItemTesEsqIT_Marca: TStringField;
    tb_ItemTesDir: TTable;
    ds_ItemTesDir: TDataSource;
    tb_ItemTesDirITNumTes: TIntegerField;
    tb_ItemTesDirITCodApa: TIntegerField;
    tb_ItemTesDirITCodMar: TIntegerField;
    tb_ItemTesDirITBooApaBom: TStringField;
    tb_ItemTesDirITDirEsq: TStringField;
    tb_ItemTesDirITObservacao: TStringField;
    tb_ItemTesDirIT_Aparelho: TStringField;
    tb_ItemTesDirIT_Marca: TStringField;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    tb_ItemTesEsqITStrControle: TStringField;
    tb_ItemTesDirITStrControle: TStringField;
    tb_TMPB: TTable;
    ds_TMPB: TDataSource;
    tb_TMPBCodApa: TIntegerField;
    tb_TMPBCodMar: TIntegerField;
    tb_TMPBStrControle: TStringField;
    tb_TMPBBooApaBom: TStringField;
    tb_TMPBObservacao: TStringField;
    tb_TMPC: TTable;
    ds_TMPC: TDataSource;
    tb_TMPCCodApa: TIntegerField;
    tb_TMPCCodMar: TIntegerField;
    tb_TMPCStrControle: TStringField;
    tb_TMPCBooApaBom: TStringField;
    tb_TMPCObservacao: TStringField;
    pn_TMP: TPanel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    DBCtrlGrid3: TDBCtrlGrid;
    Bevel17: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    ck_ApaBomEsq: TDBCheckBox;
    ed_ObsEsq: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBCtrlGrid4: TDBCtrlGrid;
    Bevel18: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit11: TDBEdit;
    ck_ApaBomDir: TDBCheckBox;
    ed_ObsDir: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    tb_TMPBIT_Aparelho: TStringField;
    tb_TMPB_Marca: TStringField;
    tb_TMPC_Aparelho: TStringField;
    tb_TMPC_Marca: TStringField;
    ActionList1: TActionList;
    ac_CtrlN: TAction;
    ac_Esc: TAction;
    ac_CtrlS: TAction;
    ac_CtrlL: TAction;
    ac_CtrlA: TAction;
    ac_F8: TAction;
    ac_PageUp: TAction;
    ac_PageDown: TAction;
    tb_TMPD: TTable;
    ds_TMPD: TDataSource;
    tb_ItemControle: TTable;
    tb_ItemControleICCodTes: TIntegerField;
    tb_ItemControleICDirEsq: TStringField;
    tb_ItemControleICCodApa: TIntegerField;
    tb_ItemControleICCodCon: TIntegerField;
    tb_ItemControleICControle: TStringField;
    tb_ItemControleICUniMed: TStringField;
    tb_ItemControleICValMed: TFloatField;
    tb_TMPDDirEsq: TStringField;
    tb_TMPDCodApa: TIntegerField;
    tb_TMPDCodCon: TIntegerField;
    tb_TMPDValMed: TFloatField;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label23: TLabel;
    tb_ItemTesEsqIT_Modelo: TStringField;
    tb_ItemTesDirIT_Modelo: TStringField;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    Label25: TLabel;
    tb_TMPB_Modelo: TStringField;
    tb_TMPC_Modelo: TStringField;
    tb_TMPDControle: TStringField;
    tb_TMPDUniMed: TStringField;
    ed_NumTes: TDBEdit;
    Label26: TLabel;
    procedure tb_TMPBAfterClose(DataSet: TDataSet);
    procedure tb_TMPBBeforeOpen(DataSet: TDataSet);
    procedure tb_TMPCAfterClose(DataSet: TDataSet);
    procedure tb_TMPCBeforeOpen(DataSet: TDataSet);
    procedure ds_TestagemStateChange(Sender: TObject);
    procedure bt_IncluirClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure ac_CtrlAExecute(Sender: TObject);
    procedure ac_CtrlLExecute(Sender: TObject);
    procedure ac_CtrlNExecute(Sender: TObject);
    procedure ac_CtrlSExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ac_F8Execute(Sender: TObject);
    procedure ac_PageDownExecute(Sender: TObject);
    procedure ac_PageUpExecute(Sender: TObject);
    procedure bt_AlterarClick(Sender: TObject);
    procedure bt_DeletarClick(Sender: TObject);
    procedure bt_ProcurarClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure tb_TestagemAfterEdit(DataSet: TDataSet);
    procedure tb_TestagemAfterPost(DataSet: TDataSet);
    procedure tb_TestagemAfterScroll(DataSet: TDataSet);
    procedure tb_ItemTesEsqAfterScroll(DataSet: TDataSet);
    procedure tb_ItemTesDirAfterScroll(DataSet: TDataSet);
    procedure tb_TestagemPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_TMPDAfterClose(DataSet: TDataSet);
    procedure tb_TMPDBeforeOpen(DataSet: TDataSet);
    procedure bt_IncluirEsqClick(Sender: TObject);
    procedure bt_ExcluirEsqClick(Sender: TObject);
    procedure tb_TMPBAfterInsert(DataSet: TDataSet);
    procedure tb_TMPBAfterDelete(DataSet: TDataSet);
    procedure tb_TMPCAfterDelete(DataSet: TDataSet);
    procedure tb_TMPCAfterInsert(DataSet: TDataSet);
    procedure bt_IncluirDirClick(Sender: TObject);
    procedure bt_ExcluirDirClick(Sender: TObject);
    procedure tb_TestagemBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

CONST eKeyViol=9729;

var
  fm_Testagem: Tfm_Testagem;

implementation

Uses safdgera,funcoes, SAFULCAP, safuppex, safuppte;

{$R *.DFM}

procedure Tfm_Testagem.tb_TMPBAfterClose(DataSet: TDataSet);
begin
DeletarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Testagem.tb_TMPBBeforeOpen(DataSet: TDataSet);
begin
CriarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Testagem.tb_TMPCAfterClose(DataSet: TDataSet);
begin
DeletarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Testagem.tb_TMPCBeforeOpen(DataSet: TDataSet);
begin
CriarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Testagem.ds_TestagemStateChange(Sender: TObject);
begin

IF (Sender As TDataSource).DataSet.State IN [dsEdit,dsInsert] THEN
   BEGIN
   bt_Salvar.Enabled      := True;
   bt_Incluir.Enabled     := False;
   bt_Alterar.Enabled     := False;
   bt_Cancelar.Enabled    := True;
   bt_Deletar.Enabled     := False;
   bt_Procurar.Enabled    := False;
   bt_Imprimir.Enabled    := False;
   bt_Anterior.Enabled    := False;
   bt_Proximo.Enabled     := False;
   bt_Sair.Enabled        := False;

   if (Sender As TDataSource).DataSet.State = dsInsert THEN
      BEGIN
      lc_Paciente.Enabled    := True;
      ed_NumTes.Enabled      := True;
      ed_DatTes.Enabled      := True;
      END;

   pn_ItemTestagem.Visible:= False;
   pn_TMP.Visible         := True;

   bt_IncluirEsq.Enabled  := True;
   bt_IncluirDir.Enabled  := True;

   ed_DatRet.Enabled      := True;

   tb_TMPB.EmptyTable;
   tb_TMPC.EmptyTable;
   tb_TMPD.EmptyTable;

   tb_TMPBAfterDelete(tb_TMPB);
   tb_TMPCAfterDelete(tb_TMPC);

   END
ELSE
   BEGIN
   bt_Salvar.Enabled      := False;
   bt_Incluir.Enabled     := True;
   bt_Alterar.Enabled     := True;
   bt_Cancelar.Enabled    := False;
   bt_Deletar.Enabled     := True;
   bt_Procurar.Enabled    := True;
   bt_Imprimir.Enabled    := True;
   bt_Anterior.Enabled    := True;
   bt_Proximo.Enabled     := True;
   bt_Sair.Enabled        := True;

   lc_Paciente.Enabled    := False;
   ed_NumTes.Enabled      := False;
   ed_DatTes.Enabled      := False;
   ed_DatRet.Enabled      := False;

   pn_ItemTestagem.Visible:= True;
   pn_TMP.Visible         := False;

   bt_IncluirEsq.Enabled  := False;
   bt_ExcluirEsq.Enabled  := False;
   bt_IncluirDir.Enabled  := False;
   bt_ExcluirDir.Enabled  := False;

   END;

end;

procedure Tfm_Testagem.bt_IncluirClick(Sender: TObject);
begin

 tb_Testagem.Insert;
 tb_TestagemTEDatTes.AsDateTime := Date;
 lc_Paciente.SetFocus;
 Mensagem('Incluíndo novo registro!',StatusBar,False);

end;

procedure Tfm_Testagem.bt_CancelarClick(Sender: TObject);
begin
 tb_Testagem.Cancel;
 Mensagem('A Inclusão/Alteração foi cancelada!',StatusBar,False)
end;

procedure Tfm_Testagem.ac_CtrlAExecute(Sender: TObject);
begin

IF bt_Alterar.Enabled = True THEN
   bt_AlterarClick(bt_Alterar);

end;

procedure Tfm_Testagem.ac_CtrlLExecute(Sender: TObject);
begin
IF bt_Procurar.Enabled = True THEN
   bt_ProcurarClick(bt_Procurar);
end;

procedure Tfm_Testagem.ac_CtrlNExecute(Sender: TObject);
begin
IF bt_Incluir.Enabled = True THEN
   bt_IncluirClick(bt_Incluir);
end;

procedure Tfm_Testagem.ac_CtrlSExecute(Sender: TObject);
begin
IF bt_Salvar.Enabled = True THEN
   bt_SalvarClick(bt_Salvar);
end;

procedure Tfm_Testagem.ac_EscExecute(Sender: TObject);
begin
IF bt_Cancelar.Enabled = True THEN
   bt_CancelarClick(bt_Cancelar);
end;

procedure Tfm_Testagem.ac_F8Execute(Sender: TObject);
begin

IF bt_Imprimir.Enabled = True THEN
   bt_ImprimirClick(Sender);

end;

procedure Tfm_Testagem.ac_PageDownExecute(Sender: TObject);
begin

IF bt_Proximo.Enabled = True THEN
   bt_ProximoClick(Sender);

end;

procedure Tfm_Testagem.ac_PageUpExecute(Sender: TObject);
begin

IF bt_Anterior.Enabled = True THEN
   bt_AnteriorClick(Sender);

end;

procedure Tfm_Testagem.bt_AlterarClick(Sender: TObject);
begin
 tb_Testagem.Edit;
 Mensagem('Alterando um novo registro!',StatusBar,False);
end;

procedure Tfm_Testagem.bt_DeletarClick(Sender: TObject);
begin

 if MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
 
    tb_ItemTesEsq.First;
    while tb_ItemTesEsq.Eof = False do tb_ItemTesEsq.Delete;
    
    tb_ItemTesDir.First;
    while tb_ItemTesDir.Eof = False do tb_ItemTesDir.Delete;
    
    tb_ItemControle.First;
    while tb_ItemControle.Eof = False do tb_ItemControle.Delete;
    
    tb_Testagem.Delete;
 end;
 
end;

procedure Tfm_Testagem.bt_ProcurarClick(Sender: TObject);
VAR vm_NumTes : LongInt;
begin

IF fm_ProcuraExame = Nil THEN
   Application.CreateForm(Tfm_ProcuraTestagem, fm_ProcuraTestagem);

IF fm_ProcuraTestagem.ShowModal = mrOk THEN
   BEGIN

   TRY
   vm_NumTes := StrToInt(fm_ProcuraTestagem.ed_NumTes.Text);
   EXCEPT
   vm_NumTes := fm_ProcuraTestagem.qr_Testagem.FieldByName('TENumTes').Value;
   END;

   tb_Testagem.First;
   tb_Testagem.IndexFieldNames := 'TENumTes';
   tb_Testagem.FindNearest([vm_NumTes]);
   tb_TestagemAfterScroll(tb_Testagem);
   IF tb_Testagem.FieldByName('TENumTes').Value = vm_NumTes THEN
      Mensagem('Localizado testagem n. '+IntToStr(vm_NumTes),StatusBar,False)
   ELSE
      Mensagem('Testagem n. '+IntToStr(vm_NumTes)+' não foi localizado',StatusBar,True);

   END;


end;

procedure Tfm_Testagem.bt_ImprimirClick(Sender: TObject);
begin
//
end;

procedure Tfm_Testagem.bt_SalvarClick(Sender: TObject);
begin

 tb_Testagem.UpdateRecord;

 if tb_TestagemTECodPac.IsNull = True then begin
    ShowMessage('Informe o Paciente!');
    lc_Paciente.SetFocus;
    Exit;
 end;

 if (tb_TestagemTEDatTes.IsNull = False) and
    (tb_TestagemTEDatRet.IsNull = False) and
    (tb_TestagemTEDatTes.AsDateTime > tb_TestagemTEDatRet.AsDateTime) then begin
    ShowMessage('Data de retorno deve ser maior que a data do teste!');
    ed_DatRet.SetFocus;
    Exit;
 end;

 tb_ItemTesEsq.First;
 while tb_ItemTesEsq.Eof = False do tb_ItemTesEsq.Delete;

 tb_ItemTesDir.First;
 while tb_ItemTesDir.Eof = False do tb_ItemTesDir.Delete;

 tb_ItemControle.First;
 while tb_ItemControle.Eof = False do tb_ItemControle.Delete;

 tb_Testagem.Post;

 tb_TMPB.First;
 while tb_TMPB.Eof = False do begin
   tb_ItemTesEsq.Append;
   tb_ItemTesEsqITNumTes.AsInteger    := tb_TestagemTENumTes.AsInteger;
   tb_ItemTesEsqITCodApa.AsInteger    := tb_TMPBCodApa.AsInteger;
   tb_ItemTesEsqITCodMar.AsInteger    := tb_TMPBCodMar.AsInteger;
   tb_ItemTesEsqITBooApaBom.AsString  := tb_TMPBBooApaBom.AsString;
   tb_ItemTesEsqITDirEsq.AsString     := 'E';
   tb_ItemTesEsqITObservacao.AsString := tb_TMPBObservacao.AsString;
   tb_ItemTesEsqITStrControle.AsString:= tb_TMPBStrControle.AsString;
   tb_ItemTesEsq.Post;
   tb_TMPB.Next;
 end;

 tb_TMPC.First;
 while tb_TMPC.Eof = False do begin
   tb_ItemTesDir.Append;
   tb_ItemTesDirITNumTes.AsInteger    := tb_TestagemTENumTes.AsInteger;
   tb_ItemTesDirITCodApa.AsInteger    := tb_TMPCCodApa.AsInteger;
   tb_ItemTesDirITCodMar.AsInteger    := tb_TMPCCodMar.AsInteger;
   tb_ItemTesDirITBooApaBom.AsString  := tb_TMPCBooApaBom.AsString;
   tb_ItemTesDirITDirEsq.AsString     := 'D';
   tb_ItemTesDirITObservacao.AsString := tb_TMPCObservacao.AsString;
   tb_ItemTesDirITStrControle.AsString:= tb_TMPCStrControle.AsString;
   tb_ItemTesDir.Post;
   tb_TMPC.Next;
 end;

 tb_TMPD.First;
 while tb_TMPD.Eof = False do begin
   tb_ItemControle.Append;
   tb_ItemControleICCodTes.AsInteger   := tb_TestagemTENumTes.AsInteger;
   tb_ItemControleICDirEsq.AsString    := tb_TMPDDirEsq.AsString;
   tb_ItemControleICCodApa.AsInteger   := tb_TMPDCodApa.AsInteger;
   tb_ItemControleICCodCon.AsInteger   := tb_TMPDCodCon.AsInteger;
   tb_ItemControleICControle.AsString  := tb_TMPDControle.AsString;
   tb_ItemControleICUniMed.AsString    := tb_TMPDUniMed.AsString;
   tb_ItemControleICValMed.AsString    := tb_TMPDValMed.AsString;
   tb_ItemControle.Post;
   tb_TMPD.Next;
 end;

 Mensagem(tb_TestagemTENumTes.DisplayLabel+' '+tb_TestagemTENumTes.AsString+' salvo com sucesso'
          ,StatusBar,False);

 DbiSaveChanges(tb_Testagem.Handle);
 DbiSaveChanges(tb_ItemControle.Handle);
 DbiSaveChanges(tb_ItemTesEsq.Handle);
 DbiSaveChanges(tb_ItemTesDir.Handle);

end;

procedure Tfm_Testagem.bt_ProximoClick(Sender: TObject);
begin
tb_Testagem.Next;
Mensagem('Registro '+IntToStr(tb_Testagem.RecNo)+' de '+IntToStr(tb_Testagem.RecordCount),
         StatusBar,tb_Testagem.Eof=True);
end;

procedure Tfm_Testagem.bt_AnteriorClick(Sender: TObject);
begin
tb_Testagem.Prior;
Mensagem('Registro '+IntToStr(tb_Testagem.RecNo)+' de '+IntToStr(tb_Testagem.RecordCount),
         StatusBar,tb_Testagem.Bof=True);
end;

procedure Tfm_Testagem.tb_TestagemAfterEdit(DataSet: TDataSet);
begin
 tb_TMPB.EmptyTable;
 tb_ItemTesEsq.DisableControls;
 tb_TMPB.DisableControls;
 tb_ItemTesEsq.First;
 while tb_ItemTesEsq.Eof = False do begin
   tb_TMPB.Append;
   tb_TMPBCodApa.AsInteger      := tb_ItemTesEsqITCodApa.AsInteger;
   tb_TMPBCodMar.AsInteger      := tb_ItemTesEsqITCodMar.AsInteger;
   tb_TMPBStrControle.AsString  := tb_ItemTesEsqITStrControle.AsString;
   tb_TMPBBooApaBom.AsString    := tb_ItemTesEsqITBooApaBom.AsString;
   tb_TMPBObservacao.AsString   := tb_ItemTesEsqITObservacao.AsString;
   tb_TMPB.Post;
   tb_ItemTesEsq.Next;
 end;
 tb_ItemTesEsq.EnableControls;
 tb_TMPB.EnableControls;


 tb_TMPC.EmptyTable;
 tb_ItemTesDir.DisableControls;
 tb_TMPC.DisableControls;
 tb_ItemTesDir.First;
 while tb_ItemTesDir.Eof = False do begin
   tb_TMPC.Append;
   tb_TMPCCodApa.AsInteger      := tb_ItemTesDirITCodApa.AsInteger;
   tb_TMPCCodMar.AsInteger      := tb_ItemTesDirITCodMar.AsInteger;
   tb_TMPCStrControle.AsString  := tb_ItemTesDirITStrControle.AsString;
   tb_TMPCBooApaBom.AsString    := tb_ItemTesDirITBooApaBom.AsString;
   tb_TMPCObservacao.AsString   := tb_ItemTesDirITObservacao.AsString;
   tb_TMPC.Post;
   tb_ItemTesDir.Next;
 end;



 tb_ItemControle.First;
 while tb_ItemControle.Eof = False do begin
   tb_TMPD.Append;
   tb_TMPDDirEsq.AsString   := tb_ItemControleICDirEsq.AsString;
   tb_TMPDCodApa.AsInteger  := tb_ItemControleICCodApa.AsInteger;
   tb_TMPDCodCon.AsInteger  := tb_ItemControleICCodCon.AsInteger;
   tb_TMPDControle.AsString := tb_ItemControleICControle.AsString;
   tb_TMPDUniMed.AsString   := tb_ItemControleICUniMed.AsString;
   tb_TMPDValMed.AsString   := tb_ItemControleICValMed.AsString;
   tb_TMPD.Post;
   tb_ItemControle.Next;
 end;

 tb_ItemTesDir.EnableControls;
 tb_TMPC.EnableControls;

end;

procedure Tfm_Testagem.tb_TestagemAfterPost(DataSet: TDataSet);
begin

 // Evento compartilhado
 DbiSaveChanges(TTable(DataSet).Handle);

end;

procedure Tfm_Testagem.tb_TestagemAfterScroll(DataSet: TDataSet);
begin
 RefreshTable(DataSet);
end;

procedure Tfm_Testagem.tb_ItemTesEsqAfterScroll(DataSet: TDataSet);
begin
 RefreshTable(DataSet);
end;

procedure Tfm_Testagem.tb_ItemTesDirAfterScroll(DataSet: TDataSet);
begin
 RefreshTable(DataSet);
end;

procedure Tfm_Testagem.tb_TestagemPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   tb_TestagemTENumTes.Value := tb_TestagemTENumTes.Value + 1;
   Action := daRetry;
   END;

end;

procedure Tfm_Testagem.tb_TMPDAfterClose(DataSet: TDataSet);
begin
DeletarTMP(DataSet);
end;

procedure Tfm_Testagem.tb_TMPDBeforeOpen(DataSet: TDataSet);
begin
CriarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Testagem.bt_IncluirEsqClick(Sender: TObject);
begin
 Application.CreateForm(Tfm_Controle, fm_Controle);
 if fm_Controle.ShowModal = mrOk then begin

    tb_TMPB.IndexFieldNames := 'CodApa';
    if tb_TMPB.FindKey([fm_Controle.qr_Aparelho.FieldByName('APCodApa').AsInteger]) then
       ShowMessage('Este aparelho já foi testado na orelha esquerda!')
    else begin
       tb_TMPB.Append;
       tb_TMPBCodApa.AsInteger := fm_Controle.qr_Aparelho.FieldByName('APCodApa').AsInteger;
       tb_TMPBCodMar.AsInteger := fm_Controle.qr_Aparelho.FieldByName('APCodMar').AsInteger;
       tb_TMPBStrControle.Clear;

       with fm_Controle.tb_TMPE do begin
         First;
         while Eof = False do begin
           tb_TMPD.Append;
           tb_TMPDDirEsq.AsString  := 'E';
           tb_TMPDCodApa.AsInteger := fm_Controle.cb_Aparelho.KeyValue;
           tb_TMPDCodCon.AsInteger := FieldByName('CodCon').AsInteger;
           tb_TMPDControle.AsString:= FieldByName('Controle').AsString;
           tb_TMPDUniMed.AsString  := FieldByName('UniMed').AsString;
           tb_TMPDValMed.AsFloat   := FieldByName('ValMed').AsFloat;
           tb_TMPD.Post;

           tb_TMPBStrControle.AsString := tb_TMPBStrControle.AsString+' / '+
                                          FieldByName('Controle').AsString+
                                          FieldByName('ValMed').AsString;

           Next;
         end;
       end;
       tb_TMPBStrControle.AsString := Copy(tb_TMPBStrControle.AsString,4,50);
       tb_TMPB.Post;
    end;
 end;

 fm_Controle.Free;
end;

procedure Tfm_Testagem.bt_ExcluirEsqClick(Sender: TObject);
begin
 tb_TMPD.IndexFieldNames := 'DirEsq;CodApa';
 tb_TMPD.FindNearest(['E',tb_TMPBCodApa.AsInteger]);
 while (tb_TMPDDirEsq.AsString = 'E') and
       (tb_TMPDCodApa.AsInteger = tb_TMPBCodApa.AsInteger) and
       (tb_TMPD.Eof = False) do
       tb_TMPD.Delete;

 tb_TMPB.Delete;
end;

procedure Tfm_Testagem.tb_TMPBAfterInsert(DataSet: TDataSet);
begin
 ed_ObsEsq.Enabled    := True;
 ck_ApaBomEsq.Enabled := True;
 bt_ExcluirEsq.Enabled:= True; 
end;

procedure Tfm_Testagem.tb_TMPBAfterDelete(DataSet: TDataSet);
begin
 if DataSet.IsEmpty = True then begin
    ed_ObsEsq.Enabled    := False;
    ck_ApaBomEsq.Enabled := False;
    bt_ExcluirEsq.Enabled:= False;
 end;
end;

procedure Tfm_Testagem.tb_TMPCAfterDelete(DataSet: TDataSet);
begin
 if DataSet.IsEmpty = True then begin
    ed_ObsDir.Enabled     := False;
    ck_ApaBomDir.Enabled  := False;
    bt_ExcluirDir.Enabled := False;
 end;
end;

procedure Tfm_Testagem.tb_TMPCAfterInsert(DataSet: TDataSet);
begin
 ed_ObsDir.Enabled    := True;
 ck_ApaBomDir.Enabled := True;
 bt_ExcluirDir.Enabled:= True; 
end;

procedure Tfm_Testagem.bt_IncluirDirClick(Sender: TObject);
begin
 Application.CreateForm(Tfm_Controle, fm_Controle);
 if fm_Controle.ShowModal = mrOk then begin

    tb_TMPC.IndexFieldNames := 'CodApa';
    if tb_TMPC.FindKey([fm_Controle.qr_Aparelho.FieldByName('APCodApa').AsInteger]) then
       ShowMessage('Este aparelho já foi testado na orelha direita!')
    else begin
       tb_TMPC.Append;
       tb_TMPCCodApa.AsInteger := fm_Controle.qr_Aparelho.FieldByName('APCodApa').AsInteger;
       tb_TMPCCodMar.AsInteger := fm_Controle.qr_Aparelho.FieldByName('APCodMar').AsInteger;
       tb_TMPCStrControle.Clear;

       with fm_Controle.tb_TMPE do begin
         First;
         while Eof = False do begin
           tb_TMPD.Append;
           tb_TMPDDirEsq.AsString  := 'D';
           tb_TMPDCodApa.AsInteger := fm_Controle.cb_Aparelho.KeyValue;
           tb_TMPDCodCon.AsInteger := FieldByName('CodCon').AsInteger;
           tb_TMPDControle.AsString:= FieldByName('Controle').AsString;
           tb_TMPDUniMed.AsString  := FieldByName('UniMed').AsString;
           tb_TMPDValMed.AsFloat   := FieldByName('ValMed').AsFloat;
           tb_TMPD.Post;

           tb_TMPCStrControle.AsString := tb_TMPCStrControle.AsString+' / '+
                                          FieldByName('Controle').AsString+
                                          FieldByName('ValMed').AsString;

           Next;
         end;
       end;
       tb_TMPCStrControle.AsString := Copy(tb_TMPCStrControle.AsString,4,50);
       tb_TMPC.Post;
    end;
 end;

 fm_Controle.Free;

end;

procedure Tfm_Testagem.bt_ExcluirDirClick(Sender: TObject);
begin
 tb_TMPD.IndexFieldNames := 'DirEsq;CodApa';
 tb_TMPD.FindNearest(['D',tb_TMPBCodApa.AsInteger]);
 while (tb_TMPDDirEsq.AsString = 'D') and
       (tb_TMPDCodApa.AsInteger = tb_TMPBCodApa.AsInteger) and
       (tb_TMPD.Eof = False) do
       tb_TMPD.Delete;

 tb_TMPC.Delete;
end;

procedure Tfm_Testagem.tb_TestagemBeforePost(DataSet: TDataSet);
begin

IF tb_TestagemTENumTes.IsNull = True THEN
   BEGIN
   IF dm_Geral.tb_Testagem.IsEmpty = True THEN
      tb_TestagemTENumTes.Value := 1
   ELSE
      BEGIN
      dm_Geral.tb_Testagem.IndexFieldNames := 'TENumTes';
      dm_Geral.tb_Testagem.Last;
      tb_TestagemTENumTes.Value := dm_Geral.tb_TestagemTENumTes.Value+1;
      END;
   END;

end;

procedure Tfm_Testagem.FormCreate(Sender: TObject);
begin
 tb_TMPB.Active := True;
 tb_TMPC.Active := True;
 tb_TMPD.Active := True;
end;

procedure Tfm_Testagem.FormDestroy(Sender: TObject);
begin
 tb_TMPB.Active := False;
 tb_TMPC.Active := False;
 tb_TMPD.Active := False;
end;

end.
