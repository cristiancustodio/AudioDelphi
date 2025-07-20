unit Safuctpg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, StdCtrls, ToolWin, Buttons, DBCtrls, Mask,
  Grids, DBGrids, Db, DBTables, ActnList, DBActns, BDE, Variants, ADODB, Math;

type
  Tfm_CtasPagar = class(TForm)
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
    Bevel6: TBevel;
    Bevel1: TBevel;
    Bevel8: TBevel;
    ActionList1: TActionList;
    ac_CtrlN: TAction;
    ac_Esc: TAction;
    ac_CtrlS: TAction;
    ac_CtrlL: TAction;
    Bevel2: TBevel;
    bt_Alterar: TSpeedButton;
    ac_CtrlA: TAction;
    tb_CtasPagar: TADOQuery;
    ds_CtasPagar: TDataSource;
    Label2: TLabel;
    ed_NumDup: TDBEdit;
    Label3: TLabel;
    ed_DatEmi: TDBEdit;
    Label4: TLabel;
    lc_Despesa: TDBLookupComboBox;
    Label5: TLabel;
    ed_Observacao: TDBEdit;
    Label6: TLabel;
    ed_DatVen: TDBEdit;
    Label7: TLabel;
    ed_ValDup: TDBEdit;
    pn_Pagar: TPanel;
    Label8: TLabel;
    ed_DatPag: TDBEdit;
    Label9: TLabel;
    ed_ValPag: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Bevel11: TBevel;
    Bevel12: TBevel;
    qr_TotPagar: TADOQuery;
    ds_TotPagar: TDataSource;
    qr_TotVen: TADOQuery;
    ds_TotVen: TDataSource;
    qr_TotPagarCP_TotPag: TFloatField;
    qr_TotVenCP_TotVen: TFloatField;
    bt_Pagar: TSpeedButton;
    ac_F8: TAction;
    ac_PageUp: TAction;
    ac_PageDown: TAction;
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
    lblFornecedorLabel: TLabel;
    edFornecedorCodigo: TDBEdit;
    lblFornecedor: TLabel;
    bt_Estornar: TSpeedButton;
    procedure bt_SairClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_IncluirClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_DeletarClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure ac_CtrlNExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ac_CtrlSExecute(Sender: TObject);
    procedure bt_ProcurarClick(Sender: TObject);
    procedure ac_CtrlLExecute(Sender: TObject);
    procedure ac_CtrlAExecute(Sender: TObject);
    procedure ds_CtasPagarStateChange(Sender: TObject);
    procedure tb_CtasPagarAfterScroll(DataSet: TDataSet);
    procedure tb_CtasPagarPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure bt_AlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lc_FornecedorEnter(Sender: TObject);
    procedure lc_DespesaEnter(Sender: TObject);
    procedure bt_PagarClick(Sender: TObject);
    procedure ac_F8Execute(Sender: TObject);
    procedure ac_PageUpExecute(Sender: TObject);
    procedure ac_PageDownExecute(Sender: TObject);
    procedure lc_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tb_CtasPagarAfterPost(DataSet: TDataSet);
    procedure tb_CtasPagarBeforeOpen(DataSet: TDataSet);
    procedure lblFornecedorLabelClick(Sender: TObject);
    procedure edFornecedorCodigoExit(Sender: TObject);
    procedure edFornecedorCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_EstornarClick(Sender: TObject);
    procedure tb_CtasPagarAfterCancel(DataSet: TDataSet);
  private
    vm_BooPagamento:Boolean;
    vm_VlrPagamento:Double;
    PROCEDURE MostrarFornecedor(vm_ParCodigo: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

CONST eKeyViol=9729;

var
  fm_CtasPagar: Tfm_CtasPagar;

implementation

USES funcoes, safumenu, SafdGera, safufifo, safurela, safubusc;

{$R *.DFM}

PROCEDURE Tfm_CtasPagar.MostrarFornecedor(vm_ParCodigo: Integer);
BEGIN
  lblFornecedor.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safafo', 'FOCodFor', 'FONome');
  if (tb_CtasPagar.State in [dsEdit, dsInsert]) then
  begin
     if (lblFornecedor.Caption = '') then
        tb_CtasPagarCPCodFor.Clear
  end;
END;

procedure Tfm_CtasPagar.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_CtasPagar.bt_SalvarClick(Sender: TObject);
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
    vm_MaiorNumLan:LongInt;
    vm_ProNumLan:LongInt;
    vm_SaldoAnt:Double;
    oQuery: TADOQuery;
begin

tb_CtasPagar.UpdateRecord;


IF vm_BooPagamento = False THEN
   BEGIN
   IF tb_CtasPagarCPDatVen.Value < tb_CtasPagarCPDatEmi.Value THEN
      BEGIN
      ShowMessage('Data de vencimento menor que data de emissão!');
      ed_DatVen.SetFocus;
      Exit;
      END;

   tb_CtasPagar.Post;

   Mensagem('Duplicata n. '+tb_CtasPagarCPNumDup.AsString+
            ' salvo com sucesso',StatusBar,False);

   END
ELSE
   BEGIN

   if tb_CtasPagarCPDatPag.IsNull then // Estorno
      DecodeDate(Now,vm_Ano,vm_Mes,vm_Dia)
   else
      DecodeDate(tb_CtasPagarCPDatPag.Value,vm_Ano,vm_Mes,vm_Dia);

   vm_MaiorNumLan := ObtemValorBD('select COALESCE(Max(CXNumLan), 0) from SAFACX where CXAnoLan = ' + IntToStr(vm_Ano) + ' and CXMesLan = ' + IntToStr(vm_Mes), dm_Geral.ADOConnection);

   vm_ProNumLan := vm_MaiorNumLan + 1;

   // Gravar Movimento Caixa

   TRY

     oQuery := TADOQuery.Create(Nil);

     oQuery.Connection :=  dm_Geral.ADOConnection;

     oQuery.SQL.Text := 'select top 1 * from safacx';

     oQuery.Open;

     oQuery.Insert;
     oQuery.FieldByName('CXAnoLan').Value    := vm_Ano;
     oQuery.FieldByName('CXMesLan').Value    := vm_Mes;
     oQuery.FieldByName('CXNumLan').Value    := vm_ProNumLan;
     oQuery.FieldByName('CXDatLan').Value    := tb_CtasPagarCPDatPag.Value;
     oQuery.FieldByName('CXCodDes').Value    := tb_CtasPagarCPCodDes.Value;
     oQuery.FieldByName('CXCodFor').Value    := tb_CtasPagarCPCodFor.Value;

     if tb_CtasPagarCPDatPag.IsNull then // Estorno
     begin
       oQuery.FieldByName('CXTipLan').Value    := 'Crédito';
       oQuery.FieldByName('CXValLan').Value    :=  vm_VlrPagamento;
       oQuery.FieldByName('CXHistorico').Value := ObtemValorBD('select FONOME from SAFAFO where FOCodFor = ' + tb_CtasPagarCPCodFor.AsString, dm_Geral.ADOConnection) +
                          ' - (Estorno)';
     end
     else
     begin
       oQuery.FieldByName('CXTipLan').Value    := 'Débito';
       oQuery.FieldByName('CXValLan').Value    := tb_CtasPagarCPValPag.Value;
       oQuery.FieldByName('CXHistorico').Value := ObtemValorBD('select FONOME from SAFAFO where FOCodFor = ' + tb_CtasPagarCPCodFor.AsString, dm_Geral.ADOConnection);
     end;

     oQuery.Post;

     tb_CtasPagarCPNumLan.Value := vm_ProNumLan;

   FINALLY
     oQuery.Close;
     oQuery.Free;
   END;

   Mensagem('A parcela n. '+tb_CtasPagarCPNumDup.AsString+
                           ' foi quitada com sucesso!',StatusBar,False);

   tb_CtasPagar.Post;

   tb_CtasPagarAfterScroll(tb_CtasPagar);

   END;

end;

procedure Tfm_CtasPagar.bt_IncluirClick(Sender: TObject);
begin

tb_CtasPagar.Insert;


lblFornecedorLabel.Enabled := True;
edFornecedorCodigo.Enabled := True;
ed_NumDup.Enabled      := True;
ed_DatEmi.Enabled      := True;
lc_Despesa.Enabled     := True;
ed_Observacao.Enabled  := True;
ed_DatVen.Enabled      := True;
ed_ValDup.Enabled      := True;

tb_CtasPagarCPDatEmi.Value := Date;
edFornecedorCodigo.SetFocus;

Mensagem('Incluíndo novo registro!',StatusBar,False);

end;


procedure Tfm_CtasPagar.bt_CancelarClick(Sender: TObject);
begin

tb_CtasPagar.Cancel;

IF vm_BooPagamento = False THEN
   Mensagem('A Inclusão/Alteração foi cancelada!',StatusBar,False)
ELSE
   Mensagem('O pagamento foi cancelado!',StatusBar,False);

end;

procedure Tfm_CtasPagar.bt_DeletarClick(Sender: TObject);
VAR vm_Status:String;
begin

IF MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN
   vm_Status := 'Duplicata n. '+tb_CtasPagarCPNumDup.AsString+
                ' excluída com sucesso';

   tb_CtasPagar.Delete;

   Mensagem(vm_Status,StatusBar,False);


   qr_TotPagar.Active     := False;
   qr_TotPagar.Active     := True;

   qr_TotVen.Active       := False;
   qr_TotVen.Parameters[0].Value := Date;
   qr_TotVen.Active       := True;
   END;

end;

procedure Tfm_CtasPagar.bt_ImprimirClick(Sender: TObject);
begin

IF fm_Relatorio = nil THEN
   Application.CreateForm(Tfm_Relatorio, fm_Relatorio);

fm_Relatorio.pg_Relatorio.ActivePage    := fm_Relatorio.pg_Faturamento;
fm_Relatorio.cb_Faturamento.ItemIndex   := 1;
fm_Relatorio.rg_CtasPagar.ItemIndex     := 1; // Em aberto
fm_Relatorio.ed_DatIniFat.Clear;
fm_Relatorio.ed_DatFinFat.Clear;
fm_Relatorio.cb_FaturamentoClick(fm_Relatorio.cb_Faturamento);
fm_Relatorio.ShowModal;

end;

procedure Tfm_CtasPagar.bt_AnteriorClick(Sender: TObject);
begin
tb_CtasPagar.Prior;
Mensagem('Registro '+IntToStr(tb_CtasPagar.RecNo)+' de '+IntToStr(tb_CtasPagar.RecordCount),
         StatusBar,tb_CtasPagar.Bof=True);
end;

procedure Tfm_CtasPagar.bt_ProximoClick(Sender: TObject);
begin
tb_CtasPagar.Next;
Mensagem('Registro '+IntToStr(tb_CtasPagar.RecNo)+' de '+IntToStr(tb_CtasPagar.RecordCount),
         StatusBar,tb_CtasPagar.Eof=True);
end;

procedure Tfm_CtasPagar.ac_CtrlNExecute(Sender: TObject);
begin
IF bt_Incluir.Enabled = True THEN
   bt_IncluirClick(bt_Incluir);
end;

procedure Tfm_CtasPagar.ac_EscExecute(Sender: TObject);
begin
IF bt_Cancelar.Enabled = True THEN
   bt_CancelarClick(bt_Cancelar);
end;

procedure Tfm_CtasPagar.ac_CtrlSExecute(Sender: TObject);
begin
IF bt_Salvar.Enabled = True THEN
   bt_SalvarClick(bt_Salvar);
end;

procedure Tfm_CtasPagar.bt_ProcurarClick(Sender: TObject);
begin

WITH Tfm_FichaFornecedor.Create(Application, tb_CtasPagarCPCodFor.AsInteger) DO
BEGIN

  IF ShowModal = mrOk THEN
     BEGIN

     Self.tb_CtasPagar.Active := False;

     //tb_CtasPagar.SQL.Text := 'select * from safacp where CPCodFor = :CPCODFOR and CPNumDup = :CPNUMDUP';

     //tb_CtasPagar.Parameters.Clear;
     //tb_CtasPagar.Parameters.CreateParameter( 'CPCODFOR', ftInteger, pdInput, 0, 0);
     //tb_CtasPagar.Parameters.CreateParameter( 'CPNUMDUP', ftString, pdInput, 0, 0);


     Self.tb_CtasPagar.Parameters.ParamByName('CPCODFOR').Value := CodigoFornecedor;
     Self.tb_CtasPagar.Parameters.ParamByName('CPNUMDUP').Value := NumeroDuplicata;

     Self.tb_CtasPagar.Active := True;

     END;
END;

end;

procedure Tfm_CtasPagar.ac_CtrlLExecute(Sender: TObject);
begin
IF bt_Procurar.Enabled = True THEN
   bt_ProcurarClick(bt_Procurar);
end;

procedure Tfm_CtasPagar.ac_CtrlAExecute(Sender: TObject);
begin

IF bt_Alterar.Enabled = True THEN
   bt_AlterarClick(bt_Alterar);

end;

procedure Tfm_CtasPagar.ds_CtasPagarStateChange(Sender: TObject);
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
//   bt_Anterior.Enabled    := False;
//   bt_Proximo.Enabled     := False;
   bt_Sair.Enabled        := False;

   bt_Pagar.Enabled       := False;
   bt_Estornar.Enabled    := False;
   //bt_Pagar.Visible       := Not tb_CtasPagarCPDatPag.IsNull;
   //bt_Estornar.Visible    := tb_CtasPagarCPDatPag.IsNull;

// pn_Pagar.Visible       := Not tb_CtasPagarCPDatPag.IsNull;

// dg_CtasPagar.Enabled   := False;

   ed_DatPag.Enabled      := True;
   ed_ValPag.Enabled      := True;

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
//   bt_Anterior.Enabled    := True;
//   bt_Proximo.Enabled     := True;
   bt_Sair.Enabled        := True;
   lblFornecedorLabel.Enabled := False;
   edFornecedorCodigo.Enabled := False;
   ed_NumDup.Enabled      := False;

   bt_Pagar.Enabled       := True;
   bt_Estornar.Enabled    := True;
   //bt_Pagar.Visible       := True;
   //bt_Estornar.Visible    := True;

   ed_DatEmi.Enabled      := False;
   lc_Despesa.Enabled     := False;
   ed_Observacao.Enabled  := False;
   ed_DatVen.Enabled      := False;
   ed_ValDup.Enabled      := False;

   ed_DatPag.Enabled      := False;
   ed_ValPag.Enabled      := False;

   //dg_CtasPagar.Enabled   := True;

   //pn_Pagar.Visible       := True;

   vm_BooPagamento        := False;

   qr_TotPagar.Active     := False;
   qr_TotPagar.Active     := True;

   qr_TotVen.Active       := False;
   qr_TotVen.Parameters[0].Value := Date;
   qr_TotVen.Active       := True;

   END;

end;

procedure Tfm_CtasPagar.tb_CtasPagarAfterScroll(DataSet: TDataSet);
begin
//RefreshTable(DataSet);
MostrarFornecedor(tb_CtasPagarCPCodFor.AsInteger);

if Not tb_CtasPagarCPDatPag.IsNull then bt_Alterar.Enabled := false;
bt_Pagar.Visible := tb_CtasPagarCPDatPag.IsNull;
bt_Estornar.Visible := Not tb_CtasPagarCPDatPag.IsNull;

pn_Pagar.Visible := Not tb_CtasPagarCPDatPag.IsNull;

end;

procedure Tfm_CtasPagar.tb_CtasPagarPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END;

end;


procedure Tfm_CtasPagar.bt_AlterarClick(Sender: TObject);
begin

tb_CtasPagar.Edit;

ed_DatEmi.Enabled      := True;
lc_Despesa.Enabled     := True;
ed_Observacao.Enabled  := True;
ed_DatVen.Enabled      := True;
ed_ValDup.Enabled      := True;


lc_Despesa.SetFocus;

end;

procedure Tfm_CtasPagar.FormCreate(Sender: TObject);
begin

tb_CtasPagar.Active := True;

qr_TotPagar.Open;
qr_TotVen.Open;

dm_Geral.tb_Despesa.Active := True;

vm_BooPagamento := False

end;

procedure Tfm_CtasPagar.lc_FornecedorEnter(Sender: TObject);
begin

//dm_Geral.tb_Fornecedor.IndexFieldNames := 'FONome';
//fm_Cadastro.pg_Cadastro.ActivePage     := fm_Cadastro.pg_Fornecedor;

end;

procedure Tfm_CtasPagar.lc_DespesaEnter(Sender: TObject);
begin

//dm_Geral.tb_Despesa.IndexFieldNames := 'DEDescricao';
//fm_Cadastro.pg_Cadastro.ActivePage  := fm_Cadastro.pg_Despesa;

end;

procedure Tfm_CtasPagar.bt_PagarClick(Sender: TObject);
begin

tb_CtasPagar.Edit;

vm_BooPagamento := True;

pn_Pagar.Visible := True;

ed_DatPag.SetFocus;

tb_CtasPagarCPDatPag.Value := tb_CtasPagarCPDatVen.Value;
tb_CtasPagarCPValPag.Value := tb_CtasPagarCPValDup.Value;

Mensagem('Pagamento de parcela',StatusBar,False);

end;


procedure Tfm_CtasPagar.ac_F8Execute(Sender: TObject);
begin

IF bt_Imprimir.Enabled = True THEN
   bt_ImprimirClick(Sender);

end;

procedure Tfm_CtasPagar.ac_PageUpExecute(Sender: TObject);
begin

//IF bt_Anterior.Enabled = True THEN
//   bt_AnteriorClick(Sender);

end;

procedure Tfm_CtasPagar.ac_PageDownExecute(Sender: TObject);
begin

//IF bt_Proximo.Enabled = True THEN
//   bt_ProximoClick(Sender);

end;

procedure Tfm_CtasPagar.lc_FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

// Evento compartilhado

//IF Key = vk_F9 THEN
//   fm_Cadastro.Show;

end;

procedure Tfm_CtasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

IF fm_FichaFornecedor <> Nil THEN
   BEGIN
   fm_FichaFornecedor.Free;
   fm_FichaFornecedor := Nil;
   END;

Action := caFree;
fm_CtasPagar := Nil;

end;

procedure Tfm_CtasPagar.tb_CtasPagarAfterPost(DataSet: TDataSet);
begin
//DbiSaveChanges(TTable(DataSet).Handle);
end;

procedure Tfm_CtasPagar.tb_CtasPagarBeforeOpen(DataSet: TDataSet);
var
  oQuery: TADOQuery;
begin

  IF tb_CtasPagar.SQL.Text = '' THEN
  BEGIN

    tb_CtasPagar.SQL.Text := 'select * from safacp where CPCodFor = :CPCODFOR and CPNumDup = :CPNUMDUP';

    tb_CtasPagar.Parameters.Clear;
    tb_CtasPagar.Parameters.CreateParameter( 'CPCODFOR', ftInteger, pdInput, 0, 0);
    tb_CtasPagar.Parameters.CreateParameter( 'CPNUMDUP', ftString, pdInput, 0, 0);

    TRY

      oQuery := TADOQuery.Create(Nil);

      oQuery.Connection :=  dm_Geral.ADOConnection;

      oQuery.SQL.Text := 'select top 1 CPCodFor, CPNumDup from safacp order by CPDatEmi desc';

      oQuery.Open;

      tb_CtasPagar.Parameters.ParamByName('CPCODFOR').Value := oQuery.Fields[0].AsInteger;
      tb_CtasPagar.Parameters.ParamByName('CPNUMDUP').Value := oQuery.Fields[1].AsString;

    FINALLY
      oQuery.Close;
      oQuery.Free;
    END;

  END;

end;

//PROCEDURE Tfm_CtasPagar.OpenTopLancamento();
//VAR
//    vm_CodigoFornecedor: Integer;
//begin

//  TRY
//    vm_CodigoFornecedor =
//  EXCEPT
//    DecodeDate(Date,vm_Ano,vm_Mes,vm_Dia);
//  END;
//
//  qr_Top.SQL.Text := 'select top '+cb_Top.Text+' * from safacx where CXAnoLan = :CXANOLAN and CXMesLan = :CXMESLAN order by CXNumLan desc';
//
//  qr_Top.Parameters.Clear;
//  qr_Top.Parameters.CreateParameter( 'CXANOLAN', ftWord, pdInput, 0, 0);
//  qr_Top.Parameters.ParamByName('CXANOLAN').Value := vm_Ano;
//  qr_Top.Parameters.CreateParameter( 'CXMESLAN', ftWord, pdInput, 0, 0);
//  qr_Top.Parameters.ParamByName('CXMESLAN').Value := vm_Mes;
//
//  qr_Top.Open;
//
//END;


procedure Tfm_CtasPagar.lblFornecedorLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safafo', 'FOCodFor', 'FONome') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      tb_CtasPagarCPCodFor.Value := Codigo;

      MostrarFornecedor(Codigo);

    END;
  END;

end;

procedure Tfm_CtasPagar.edFornecedorCodigoExit(Sender: TObject);
begin
  MostrarFornecedor(tb_CtasPagarCPCodFor.AsInteger);
end;

procedure Tfm_CtasPagar.edFornecedorCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblFornecedorLabelClick(Sender);

end;

procedure Tfm_CtasPagar.bt_EstornarClick(Sender: TObject);
VAR vm_Status:String;
begin

IF MessageDlg('Confirma Estorno?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN
   vm_Status := 'Duplicata n. '+tb_CtasPagarCPNumDup.AsString+
                ' estornada com sucesso.';

   tb_CtasPagar.Edit;

   vm_BooPagamento := True;

   vm_VlrPagamento := tb_CtasPagarCPValPag.AsFloat;

//pn_Pagar.Visible := True;

//   ed_DatPag.SetFocus;

   tb_CtasPagarCPDatPag.Clear;
   tb_CtasPagarCPValPag.Clear;

   bt_SalvarClick(Sender);

   Mensagem(vm_Status,StatusBar,False);

   END;

//Mensagem('Pagamento de parcela',StatusBar,False);

end;

procedure Tfm_CtasPagar.tb_CtasPagarAfterCancel(DataSet: TDataSet);
begin
   tb_CtasPagarAfterScroll(tb_CtasPagar);  
end;

end.
