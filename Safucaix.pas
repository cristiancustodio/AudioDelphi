unit Safucaix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Buttons, ActnList, Db, DBTables, StdCtrls, Mask,
  DBCtrls, Grids, DBGrids, BDE, funcoes, Variants, ADODB;

type
  Tfm_Caixa = class(TForm)
    Bevel2: TBevel;
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
    Bevel1: TBevel;
    Bevel8: TBevel;
    Bevel10: TBevel;
    bt_Alterar: TSpeedButton;
    StatusBar: TStatusBar;
    Bevel7: TBevel;
    tb_Caixa: TADOQuery;
    ds_Caixa: TDataSource;
    tb_CaixaCXAnoLan: TIntegerField;
    tb_CaixaCXMesLan: TIntegerField;
    tb_CaixaCXNumLan: TIntegerField;
    tb_CaixaCXDatLan: TDateField;
    tb_CaixaCXCodDes: TIntegerField;
    tb_CaixaCXCodFor: TIntegerField;
    tb_CaixaCXTipLan: TStringField;
    tb_CaixaCXValLan: TFloatField;
    tb_CaixaCXCodAlu: TIntegerField;
    ed_Competencia: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    ed_NumLan: TDBEdit;
    Label3: TLabel;
    ed_DatLan: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ed_ValLan: TDBEdit;
    dg_Caixa: TDBGrid;
    cb_TipLan: TDBComboBox;
    lc_Despesa: TDBLookupComboBox;
    Bevel9: TBevel;
    tb_CaixaCXHistorico: TStringField;
    ed_Historico: TDBEdit;
    Label8: TLabel;
    lbSaldo: TLabel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    ActionList1: TActionList;
    ac_CtrlN: TAction;
    ac_Esc: TAction;
    ac_CtrlS: TAction;
    ac_CtrlL: TAction;
    ac_CtrlA: TAction;
    ac_F8: TAction;
    ac_PageUp: TAction;
    ac_PageDown: TAction;
    UpDown: TUpDown;
    Label9: TLabel;
    cb_Top: TComboBox;
    qr_Top: TADOQuery;
    ds_Top: TDataSource;
    procedure ac_F8Execute(Sender: TObject);
    procedure ac_PageUpExecute(Sender: TObject);
    procedure ac_PageDownExecute(Sender: TObject);
    procedure ac_CtrlNExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ac_CtrlSExecute(Sender: TObject);
    procedure ac_CtrlLExecute(Sender: TObject);
    procedure ac_CtrlAExecute(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_IncluirClick(Sender: TObject);
    procedure bt_AlterarClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_DeletarClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_ProcurarClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure lc_DespesaEnter(Sender: TObject);
    procedure tb_CaixaAfterScroll(DataSet: TDataSet);
    procedure tb_CaixaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormCreate(Sender: TObject);
    procedure ed_CompetenciaExit(Sender: TObject);
    procedure ds_CaixaStateChange(Sender: TObject);
    procedure lc_DespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_TipLanClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tb_CaixaAfterPost(DataSet: TDataSet);
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure tb_CaixaBeforeOpen(DataSet: TDataSet);
    procedure cb_TopChange(Sender: TObject);
    procedure qr_TopAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PROCEDURE OpenTopLancamento();
    FUNCTION MaxLancamento():Integer;
    PROCEDURE CalculeSaldo();
    { Private declarations }
  public
    { Public declarations }
  end;

CONST eKeyViol=9729;

var
  fm_Caixa: Tfm_Caixa;

implementation

Uses safdgera, safumenu, safucada, saffgera, safurela, DateUtils;

{$R *.DFM}

PROCEDURE Tfm_Caixa.CalculeSaldo();
VAR vm_Ano,vm_Mes,vm_Dia:Word;
    oQuery: TADOQuery;
BEGIN

  TRY
   vm_Mes    := StrToInt(Copy(ed_Competencia.Text,1,2));
   vm_Ano    := StrToInt(Copy(ed_Competencia.Text,4,4));
  EXCEPT
    Exit;
  END;


  TRY

    oQuery := TADOQuery.Create(Nil);

    oQuery.Connection :=  dm_Geral.ADOConnection;

    oQuery.SQL.Text := 'select sum(CASE WHEN CXTipLan = '''+'Crédito'+''' THEN CXValLan ELSE CXValLan * -1 END) as CXValLan from safacx where CXAnoLan = :CXANOLAN and CXMesLan = :CXMESLAN';

    oQuery.Parameters.Clear;
    oQuery.Parameters.CreateParameter( 'CXANOLAN', ftWord, pdInput, 0, 0);
    oQuery.Parameters.ParamByName('CXANOLAN').Value := vm_Ano;
    oQuery.Parameters.CreateParameter( 'CXMESLAN', ftWord, pdInput, 0, 0);
    oQuery.Parameters.ParamByName('CXMESLAN').Value := vm_Mes;

    oQuery.Open;

    lbSaldo.Caption := FormatFloat('###,###,##0.00', oQuery.Fields[0].AsFloat);

  FINALLY
    oQuery.Close;
    oQuery.Free;
  END;

END;


FUNCTION Tfm_Caixa.MaxLancamento():Integer;
VAR vm_Ano,vm_Mes,vm_Dia:Word;
    vm_Competencia:String;
    oQuery: TADOQuery;
BEGIN

  TRY
   vm_Mes    := StrToInt(Copy(ed_Competencia.Text,1,2));
   vm_Ano    := StrToInt(Copy(ed_Competencia.Text,4,4));
  EXCEPT
    Exit;
  END;


  TRY

    oQuery := TADOQuery.Create(Nil);

    oQuery.Connection :=  dm_Geral.ADOConnection;

    oQuery.SQL.Text := 'select max(CXNumLan) as CXNumLan from safacx where CXAnoLan = :CXANOLAN and CXMesLan = :CXMESLAN';

    oQuery.Parameters.Clear;
    oQuery.Parameters.CreateParameter( 'CXANOLAN', ftWord, pdInput, 0, 0);
    oQuery.Parameters.ParamByName('CXANOLAN').Value := vm_Ano;
    oQuery.Parameters.CreateParameter( 'CXMESLAN', ftWord, pdInput, 0, 0);
    oQuery.Parameters.ParamByName('CXMESLAN').Value := vm_Mes;

    oQuery.Open;

    Result := oQuery.Fields[0].AsInteger;

  FINALLY
    oQuery.Close;
    oQuery.Free;
  END;

END;


PROCEDURE Tfm_Caixa.OpenTopLancamento();
VAR vm_Ano,vm_Mes,vm_Dia:Word;
    vm_Competencia:String;
begin

  TRY
   vm_Mes    := StrToInt(Copy(ed_Competencia.Text,1,2));
   vm_Ano    := StrToInt(Copy(ed_Competencia.Text,4,4));
  EXCEPT
    DecodeDate(Date,vm_Ano,vm_Mes,vm_Dia);
  END;

  qr_Top.SQL.Text := 'select top '+cb_Top.Text+' * from safacx where CXAnoLan = :CXANOLAN and CXMesLan = :CXMESLAN order by CXNumLan desc';

  qr_Top.Parameters.Clear;
  qr_Top.Parameters.CreateParameter( 'CXANOLAN', ftWord, pdInput, 0, 0);
  qr_Top.Parameters.ParamByName('CXANOLAN').Value := vm_Ano;
  qr_Top.Parameters.CreateParameter( 'CXMESLAN', ftWord, pdInput, 0, 0);
  qr_Top.Parameters.ParamByName('CXMESLAN').Value := vm_Mes;

  qr_Top.Open;

  if qr_Top.IsEmpty then
    qr_TopAfterScroll(qr_Top);

END;



procedure Tfm_Caixa.ac_CtrlNExecute(Sender: TObject);
begin
IF bt_Incluir.Enabled = True THEN
   bt_IncluirClick(bt_Incluir);
end;

procedure Tfm_Caixa.ac_EscExecute(Sender: TObject);
begin
IF bt_Cancelar.Enabled = True THEN
   bt_CancelarClick(bt_Cancelar);
end;

procedure Tfm_Caixa.ac_CtrlSExecute(Sender: TObject);
begin
IF bt_Salvar.Enabled = True THEN
   bt_SalvarClick(bt_Salvar);
end;

procedure Tfm_Caixa.ac_CtrlLExecute(Sender: TObject);
begin
IF bt_Procurar.Enabled = True THEN
   bt_ProcurarClick(bt_Procurar);
end;

procedure Tfm_Caixa.ac_CtrlAExecute(Sender: TObject);
begin

IF bt_Alterar.Enabled = True THEN
   bt_AlterarClick(bt_Alterar);

end;


procedure Tfm_Caixa.bt_SalvarClick(Sender: TObject);
VAR vm_Ano,vm_Mes,vm_Dia:Word;
//  vm_SaldoAnt:Double;
begin

tb_Caixa.UpdateRecord;


DecodeDate(tb_CaixaCXDatLan.Value, vm_Ano,vm_Mes,vm_Dia);

IF (vm_Mes <> StrToInt(Copy(ed_Competencia.Text,1,2))) OR
   (vm_Ano <> StrToInt(Copy(ed_Competencia.Text,4,4))) THEN
   BEGIN
   ed_DatLan.SetFocus;
   Mensagem('Data de lançamento diferente de competência',StatusBar,True);
   Exit;
   END;


// Cancelar lançamento de caixa alterado

//dm_Geral.tb_Caixa.IndexFieldNames := 'CXAnoLan;CXMesLan;CXNumLan';
//dm_Geral.tb_Caixa.First;

//IF dm_Geral.tb_Caixa.FindKey([vm_Ano,vm_Mes,tb_CaixaCXNumLan.Value]) THEN
//   BEGIN
//
//   // Cancelar Saldo
//
//   dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
//   IF dm_Geral.tb_Saldo.FindKey([vm_Ano,vm_Mes]) = True THEN
//      BEGIN
//      dm_Geral.tb_Saldo.Edit;
//
//      IF dm_Geral.tb_CaixaCXTipLan.Value = 'Crédito' THEN
//         dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
//                                             dm_Geral.tb_CaixaCXValLan.Value
//      ELSE
//         dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
//                                             dm_Geral.tb_CaixaCXValLan.Value;
//
//      dm_Geral.tb_Saldo.Post;
//      END;
//
//
//   // Recalcular saldo
//
//   dm_Geral.tb_Saldo.LockTable(ltWriteLock);
//
//   dm_Geral.tb_Saldo.Next;
//
//   WHILE dm_Geral.tb_Saldo.Eof = False DO
//     BEGIN
//     dm_Geral.tb_Saldo.Edit;
//
//     IF dm_Geral.tb_CaixaCXTipLan.Value = 'Crédito' THEN
//        dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
//                                             dm_Geral.tb_CaixaCXValLan.Value
//     ELSE
//        dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
//                                             dm_Geral.tb_CaixaCXValLan.Value;
//
//     dm_Geral.tb_Saldo.Post;
//     dm_Geral.tb_Saldo.Next;
//     END;
//
//   dm_Geral.tb_Saldo.UnLockTable(ltWriteLock);
//
//   END;


//IF dm_Geral.tb_Caixa.FindKey([vm_Ano,vm_Mes,tb_CaixaCXNumLan.Value]) THEN
//   BEGIN
//
//   // Cancelar Saldo
//
//   dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
//   IF dm_Geral.tb_Saldo.FindKey([vm_Ano,vm_Mes]) = True THEN
//      BEGIN
//      dm_Geral.tb_Saldo.Edit;
//
//      IF dm_Geral.tb_CaixaCXTipLan.Value = 'Crédito' THEN
//         dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
//                                             dm_Geral.tb_CaixaCXValLan.Value
//      ELSE
//         dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
//                                             dm_Geral.tb_CaixaCXValLan.Value;
//
//      dm_Geral.tb_Saldo.Post;
//      END;
//
//
//   // Recalcular saldo
//
//   dm_Geral.tb_Saldo.LockTable(ltWriteLock);
//
//   dm_Geral.tb_Saldo.Next;
//
//   WHILE dm_Geral.tb_Saldo.Eof = False DO
//     BEGIN
//     dm_Geral.tb_Saldo.Edit;
//
//     IF dm_Geral.tb_CaixaCXTipLan.Value = 'Crédito' THEN
//        dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
//                                             dm_Geral.tb_CaixaCXValLan.Value
//     ELSE
//        dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
//                                             dm_Geral.tb_CaixaCXValLan.Value;
//
//     dm_Geral.tb_Saldo.Post;
//     dm_Geral.tb_Saldo.Next;
//     END;
//
//   dm_Geral.tb_Saldo.UnLockTable(ltWriteLock);
//
//   END;

 tb_CaixaCXMesLan.Value := vm_Mes;
 tb_CaixaCXAnoLan.Value := vm_Ano;

tb_Caixa.Post;

OpenTopLancamento();

CalculeSaldo();

// Gravar Saldo

//dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
//IF dm_Geral.tb_Saldo.FindKey([vm_Ano,vm_Mes]) = True THEN
//   BEGIN
//   dm_Geral.tb_Saldo.Edit;
//
//   IF tb_CaixaCXTipLan.Value = 'Crédito' THEN
//      dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
//                                          tb_CaixaCXValLan.Value
//   ELSE
//      dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
//                                          tb_CaixaCXValLan.Value;
//
//   dm_Geral.tb_Saldo.Post;
//   END
//ELSE
//   BEGIN
//   dm_Geral.tb_Saldo.Insert;
//   dm_Geral.tb_SaldoSDAno.Value   := vm_Ano;
//   dm_Geral.tb_SaldoSDMes.Value   := vm_Mes;
//   dm_Geral.tb_Saldo.Post;
//
//   dm_Geral.tb_Saldo.Prior;
//
//   IF dm_Geral.tb_Saldo.Bof = False THEN
//      BEGIN
//      vm_SaldoAnt := dm_Geral.tb_SaldoSDSaldo.Value;
//      dm_Geral.tb_Saldo.Next;
//
//      dm_Geral.tb_Saldo.Edit;
//
//      IF tb_CaixaCXTipLan.Value = 'Crédito' THEN
//         dm_Geral.tb_SaldoSDSaldo.Value := vm_SaldoAnt +
//                                             tb_CaixaCXValLan.Value
//      ELSE
//         dm_Geral.tb_SaldoSDSaldo.Value := vm_SaldoAnt -
//                                             tb_CaixaCXValLan.Value;
//
//      dm_Geral.tb_Saldo.Post;
//      END
//   ELSE
//      BEGIN
//      dm_Geral.tb_Saldo.Edit;
//
//      IF tb_CaixaCXTipLan.Value = 'Crédito' THEN
//         dm_Geral.tb_SaldoSDSaldo.Value := tb_CaixaCXValLan.Value
//      ELSE
//         dm_Geral.tb_SaldoSDSaldo.Value := tb_CaixaCXValLan.Value;
//
//      dm_Geral.tb_Saldo.Post;
//      END;
//
//   END;
//
//
//// Recalcular saldo

//dm_Geral.tb_Saldo.LockTable(ltWriteLock);
//
//dm_Geral.tb_Saldo.Next;
//
//WHILE dm_Geral.tb_Saldo.Eof = False DO
//  BEGIN
//  dm_Geral.tb_Saldo.Edit;
//
//  IF tb_CaixaCXTipLan.Value = 'Crédito' THEN
//     dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
//                                         tb_CaixaCXValLan.Value
//  ELSE
//     dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
//                                         tb_CaixaCXValLan.Value;
//
//  dm_Geral.tb_Saldo.Post;
//
//  dm_Geral.tb_Saldo.Next;
//  END;
//
//dm_Geral.tb_Saldo.UnLockTable(ltWriteLock);

Mensagem('Lançamento n. '+tb_CaixaCXNumLan.AsString+
                        ' salvo com sucesso',StatusBar,False);

end;

procedure Tfm_Caixa.bt_IncluirClick(Sender: TObject);
VAR vm_ProNumLan : LongInt;
begin

dg_Caixa.SetFocus;

vm_ProNumLan := MaxLancamento() + 1;

tb_Caixa.Insert;
tb_CaixaCXNumLan.Value := vm_ProNumLan;
tb_CaixaCXDatLan.Value := Date;

ed_NumLan.SetFocus;

Mensagem('Incluíndo novo lançamento!',StatusBar,False);

end;

procedure Tfm_Caixa.bt_AlterarClick(Sender: TObject);
begin


IF tb_CaixaCXCodAlu.IsNull = False THEN
   BEGIN
   Mensagem('Este lançamento só pode ser alterado pelo Ctas a Receber!',StatusBar,True);
   Exit;
   END;

IF tb_CaixaCXCodFor.IsNull = False THEN
   BEGIN
   Mensagem('Este lançamento só pode ser alterado pelo Ctas a Pagar!',StatusBar,True);
   Exit;
   END;

tb_Caixa.Edit;

ed_Historico.SetFocus;

end;

procedure Tfm_Caixa.bt_CancelarClick(Sender: TObject);
begin
tb_Caixa.Cancel;
end;

procedure Tfm_Caixa.bt_DeletarClick(Sender: TObject);
VAR vm_Ano,vm_Mes:Word;
begin

IF MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN

   IF tb_CaixaCXCodAlu.IsNull = False THEN
      BEGIN
      Mensagem('Este lançamento só pode ser apagado pelo Ctas a Receber!',StatusBar,True);
      Exit;
      END;

   IF tb_CaixaCXCodFor.IsNull = False THEN
      BEGIN
      Mensagem('Este lançamento só pode ser apagado pelo Ctas a Pagar!',StatusBar,True);
      Exit;
      END;

   //vm_Ano := tb_CaixaCXAnoLan.Value;
   //vm_Mes := tb_CaixaCXMesLan.Value;

   // Cancelar Saldo

   //dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
   //IF dm_Geral.tb_Saldo.FindKey([vm_Ano,vm_Mes]) = True THEN
   //   BEGIN
   //   dm_Geral.tb_Saldo.Edit;
   //
   //   IF tb_CaixaCXTipLan.Value = 'Crédito' THEN
   //      dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
   //                                          tb_CaixaCXValLan.Value
   //   ELSE
   //      dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
   //                                          tb_CaixaCXValLan.Value;
   //
   //   dm_Geral.tb_Saldo.Post;
   //   END;
   //
   //
   //// Recalcular saldo
   //
   //dm_Geral.tb_Saldo.LockTable(ltWriteLock);
   //
   //dm_Geral.tb_Saldo.Next;
   //
   //WHILE dm_Geral.tb_Saldo.Eof = False DO
   //  BEGIN
   //  dm_Geral.tb_Saldo.Edit;
   //
   //  IF tb_CaixaCXTipLan.Value = 'Crédito' THEN
   //     dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value-
   //                                         tb_CaixaCXValLan.Value
   //  ELSE
   //     dm_Geral.tb_SaldoSDSaldo.Value := dm_Geral.tb_SaldoSDSaldo.Value+
   //                                         tb_CaixaCXValLan.Value;
   //
   //  dm_Geral.tb_Saldo.Post;
   //  dm_Geral.tb_Saldo.Next;
   //  END;
   //
   ////dm_Geral.tb_Saldo.UnLockTable(ltWriteLock);

   tb_Caixa.Delete;

   Mensagem('Lançamento n. '+tb_CaixaCXNumLan.AsString+
                           ' excluído com sucesso',StatusBar,False);

   END;

end;

procedure Tfm_Caixa.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_Caixa.bt_AnteriorClick(Sender: TObject);
begin
tb_Caixa.Prior;
Mensagem('Registro '+IntToStr(tb_Caixa.RecNo)+' de '+IntToStr(tb_Caixa.RecordCount),
         StatusBar,tb_Caixa.Bof=True);
end;

procedure Tfm_Caixa.bt_ProximoClick(Sender: TObject);
begin
tb_Caixa.Next;
Mensagem('Registro '+IntToStr(tb_Caixa.RecNo)+' de '+IntToStr(tb_Caixa.RecordCount),
         StatusBar,tb_Caixa.Eof=True);
end;

procedure Tfm_Caixa.bt_ProcurarClick(Sender: TObject);
VAR vm_Expressao:String;
    vm_NumLan:LongInt;
    vm_Ano:Word;
    vm_Mes:Word;
begin

vm_Expressao := InputBox('Busca', 'Lançamento n°', '');

TRY
IF vm_Expressao <> '' THEN
   BEGIN
     vm_Mes    := StrToInt(Copy(ed_Competencia.Text,1,2));
     vm_Ano    := StrToInt(Copy(ed_Competencia.Text,4,4));
     vm_NumLan := StrToInt(vm_Expressao);

     tb_Caixa.Close;
     tb_Caixa.Parameters.ParamByName('CXNUMLAN').Value := vm_NumLan;
     tb_Caixa.Open;

     IF tb_Caixa.Eof THEN
        Mensagem('Lançamento n° '+vm_Expressao + ' não Encontrado ',StatusBar,False)
     ELSE
        Mensagem('Encontrado lançamento n° '+vm_Expressao,StatusBar,False);
        
   END;
EXCEPT
Mensagem('Expressão inválida! São permitidos somente caracteres numéricos.',StatusBar,True);
END;

end;

procedure Tfm_Caixa.bt_ImprimirClick(Sender: TObject);
begin

IF fm_Relatorio = nil THEN
   Application.CreateForm(Tfm_Relatorio, fm_Relatorio);

fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Faturamento;
fm_Relatorio.cb_Faturamento.ItemIndex   := 1;
fm_Relatorio.ed_DatIniFat.Text := '01/'+ed_Competencia.Text;
fm_Relatorio.ed_DatFinFat.Text := IntToStr(MaiorDiaDoMes(StrToDate('01/'+ed_Competencia.Text)))+
                                  '/'+ed_Competencia.Text;
fm_Relatorio.cb_FaturamentoClick(fm_Relatorio.cb_Faturamento);
fm_Relatorio.ShowModal;

end;

procedure Tfm_Caixa.lc_DespesaEnter(Sender: TObject);
begin

//dm_Geral.tb_Despesa.IndexFieldNames := 'DEDescricao';
//fm_Cadastro.pg_Cadastro.ActivePage  := fm_Cadastro.pg_Despesa;

end;

procedure Tfm_Caixa.tb_CaixaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Caixa.tb_CaixaPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin

IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
      BEGIN
      ShowMessage('Registro já Informado. Verifique!');
      Action := daAbort;
      END;

end;

procedure Tfm_Caixa.FormCreate(Sender: TObject);
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
begin

DecodeDate(Date,vm_Ano,vm_Mes,vm_Dia);

ed_Competencia.Text := FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);

//dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
//dm_Geral.tb_Saldo.FindNearest([vm_Ano,vm_Mes]);

dm_Geral.tb_Despesa.Active := True;
//tb_Caixa.Active := True;

tb_Caixa.Active := True;

ed_CompetenciaExit(Sender);

//tb_Caixa.IndexFieldNames := 'CXAnoLan;CXMesLan;CXNumLan';
//tb_Caixa.SetRange([vm_Ano,vm_Mes],[vm_Ano,vm_Mes]);
//tb_Caixa.ApplyRange;

end;

procedure Tfm_Caixa.ed_CompetenciaExit(Sender: TObject);
VAR vm_Competencia:String;
    vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
    vm_TesDat:TDateTime;
begin


IF ed_Competencia.Text = '  /    ' THEN Exit;

vm_Competencia:=ed_Competencia.Text;


TRY

  vm_TesDat:=StrToDate('01/'+vm_Competencia);

  DecodeDate(vm_TesDat,vm_Ano,vm_Mes,vm_Dia);

  ed_Competencia.Text := FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);


  OpenTopLancamento();

  CalculeSaldo();  

  //tb_Caixa.IndexFieldNames := 'CXAnoLan;CXMesLan;CXNumLan';
  //tb_Caixa.SetRange([vm_Ano,vm_Mes],[vm_Ano,vm_Mes]);
  //tb_Caixa.ApplyRange;

  //tb_Caixa.Last;

  //dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
  //dm_Geral.tb_Saldo.FindNearest([vm_Ano,]);

EXCEPT;
  if ed_Competencia.CanFocus then ed_Competencia.SetFocus;
  Mensagem('Mês ou Ano competência inválido!',StatusBar,True);
END;

end;

procedure Tfm_Caixa.ds_CaixaStateChange(Sender: TObject);
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
   bt_Sair.Enabled        := False;

   dg_Caixa.Enabled       := False;

   ed_Competencia.Enabled := False;
   ed_NumLan.Enabled      := True;
   ed_DatLan.Enabled      := True;
   cb_TipLan.Enabled      := True;
   ed_Historico.Enabled   := True;
   ed_ValLan.Enabled      := True;

   UpDown.Enabled         := False;

   IF lc_Despesa.KeyValue <> Null THEN
      lc_Despesa.Enabled     := True;   


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
   bt_Sair.Enabled        := True;

   dg_Caixa.Enabled       := True;

   ed_Competencia.Enabled := True;
   ed_NumLan.Enabled      := False;
   ed_DatLan.Enabled      := False;
   cb_TipLan.Enabled      := False;
   ed_Historico.Enabled   := False;
   lc_Despesa.Enabled     := False;
   ed_ValLan.Enabled      := False;

   UpDown.Enabled         := True;

   END;

end;

procedure Tfm_Caixa.ac_F8Execute(Sender: TObject);
begin

IF bt_Imprimir.Enabled = True THEN
   bt_ImprimirClick(Sender);

end;


procedure Tfm_Caixa.ac_PageUpExecute(Sender: TObject);
begin

//IF bt_Anterior.Enabled = True THEN
//   bt_AnteriorClick(Sender);

end;

procedure Tfm_Caixa.ac_PageDownExecute(Sender: TObject);
begin

//IF bt_Proximo.Enabled = True THEN
//   bt_ProximoClick(Sender);

end;

procedure Tfm_Caixa.lc_DespesaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

// Evento compartilhado

IF Key = vk_F9 THEN
   fm_Cadastro.Show;

end;

procedure Tfm_Caixa.cb_TipLanClick(Sender: TObject);
begin

IF cb_TipLan.Text = 'Crédito' THEN
   BEGIN
   lc_Despesa.Enabled  := False;
   lc_Despesa.KeyValue := Null;
   END;

IF cb_TipLan.Text = 'Débito' THEN
   lc_Despesa.Enabled := True;




end;

procedure Tfm_Caixa.FormActivate(Sender: TObject);
begin
ed_CompetenciaExit(ed_Competencia);
end;

procedure Tfm_Caixa.tb_CaixaAfterPost(DataSet: TDataSet);
begin
DbiSaveChanges(TTable(DataSet).Handle);
end;

procedure Tfm_Caixa.UpDownClick(Sender: TObject; Button: TUDBtnType);
VAR vm_Competencia:String;
    vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
    vm_TesDat:TDateTime;
begin

IF Button = btNext THEN
   TRY
   vm_TesDat:=StrToDate('01/'+ed_Competencia.Text);

   DecodeDate(vm_TesDat,vm_Ano,vm_Mes,vm_Dia);

   vm_Mes := vm_Mes+1;

   WHILE vm_Mes > 12 DO
     BEGIN
     vm_Mes := vm_Mes - 12;
     vm_Ano := vm_Ano + 1;
     END;

   ed_Competencia.Text := FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);
   ed_CompetenciaExit(ed_Competencia);
   EXCEPT
   ed_Competencia.SetFocus;
   Mensagem('Mês ou Ano competência inválido!',StatusBar,True);
   END;

IF Button = btPrev THEN
   TRY
   vm_TesDat:=StrToDate('01/'+ed_Competencia.Text);

   DecodeDate(vm_TesDat,vm_Ano,vm_Mes,vm_Dia);

   vm_Mes := vm_Mes-1;

   WHILE vm_Mes < 1 DO
     BEGIN
     vm_Mes := vm_Mes + 12;
     vm_Ano := vm_Ano - 1;
     END;

   ed_Competencia.Text := FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);
   ed_CompetenciaExit(ed_Competencia);
   EXCEPT
   ed_Competencia.SetFocus;
   Mensagem('Mês ou Ano competência inválido!',StatusBar,True);
   END

end;

procedure Tfm_Caixa.tb_CaixaBeforeOpen(DataSet: TDataSet);
begin

IF tb_Caixa.SQL.Text = '' THEN
  BEGIN
    tb_Caixa.SQL.Text := 'select * from safacx where CXAnoLan = :CXANOLAN and CXMesLan = :CXMESLAN and CXNumLan = :CXNUMLAN';
  END;

end;

procedure Tfm_Caixa.cb_TopChange(Sender: TObject);
begin
OpenTopLancamento();
end;

procedure Tfm_Caixa.qr_TopAfterScroll(DataSet: TDataSet);
VAR vm_Ano:Word;
    vm_Mes:Word;
begin

  TRY
   vm_Mes    := StrToInt(Copy(ed_Competencia.Text,1,2));
   vm_Ano    := StrToInt(Copy(ed_Competencia.Text,4,4));
  EXCEPT
    Exit;
  END;

  tb_Caixa.Close;

  tb_Caixa.Parameters.Clear;
  tb_Caixa.Parameters.CreateParameter( 'CXANOLAN', ftWord, pdInput, 0, 0);
  tb_Caixa.Parameters.CreateParameter( 'CXMESLAN', ftWord, pdInput, 0, 0);
  tb_Caixa.Parameters.CreateParameter( 'CXNUMLAN', ftInteger, pdInput, 0, 0);

  tb_Caixa.Parameters.ParamByName('CXANOLAN').Value := vm_Ano;
  tb_Caixa.Parameters.ParamByName('CXMESLAN').Value := vm_Mes;
  tb_Caixa.Parameters.ParamByName('CXNUMLAN').Value := qr_Top.FieldByName('CXNUMLAN').Value;
  tb_Caixa.Open;
end;

procedure Tfm_Caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Action := caFree;
fm_Caixa := Nil;

end;

end.



