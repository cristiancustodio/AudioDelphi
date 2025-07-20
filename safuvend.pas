// Enviar tabela de duplicatas
// nao esta aparecendo o servido na nota 2
unit safuvend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB,
  DBTables, Grids, DBGrids, Wwdbigrd, Wwdbgrid, wwdblook, bde, Wwdatsrc,
  Wwquery, ActnList, ADODB;

type
  Tfm_Venda = class(TForm)
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
    Bevel6: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label26: TLabel;
    lc_Paciente: TDBLookupComboBox;
    ed_DatNot: TDBEdit;
    ed_NumNot: TDBEdit;
    tb_Venda: TTable;
    ds_Venda: TDataSource;
    Bevel13: TBevel;
    dg_TMPF: TwwDBGrid;
    Label6: TLabel;
    cb_TipNot: TDBComboBox;
    Label3: TLabel;
    lc_Comprador: TDBLookupComboBox;
    Bevel11: TBevel;
    Label8: TLabel;
    DBText1: TDBText;
    Bevel12: TBevel;
    Label11: TLabel;
    ed_DesAcr: TDBEdit;
    Bevel3: TBevel;
    Label4: TLabel;
    dg_TMPG: TwwDBGrid;
    Label5: TLabel;
    tb_ItemVenda: TTable;
    ds_ItemVenda: TDataSource;
    tb_VendaVENumNot: TIntegerField;
    tb_VendaVECodPac: TIntegerField;
    tb_VendaVECodCmp: TIntegerField;
    tb_VendaVETipVen: TStringField;
    tb_VendaVEDatVen: TDateField;
    tb_VendaVEValVen: TFloatField;
    tb_VendaVEDesAcr: TFloatField;
    tb_ItemVendaIVNumNot: TIntegerField;
    tb_ItemVendaIVNumSeq: TIntegerField;
    tb_ItemVendaIVCodApa: TIntegerField;
    tb_ItemVendaIVCodSer: TIntegerField;
    tb_ItemVendaIVSerie: TStringField;
    tb_ItemVendaIVDatVal: TDateField;
    tb_ItemVendaIVValor: TFloatField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    tb_ItemVendaIV_Aparelho: TStringField;
    tb_ItemVendaIV_ModeloApa: TStringField;
    tb_ItemVendaIV_Servico: TStringField;
    wwDBLookupCombo2: TwwDBLookupCombo;
    tb_TMPF: TTable;
    tb_TMPFIV_Aparelho: TStringField;
    tb_TMPFIV_ModeloApa: TStringField;
    tb_TMPFIV_Servico: TStringField;
    tb_TMPFIVSerie: TStringField;
    tb_TMPFIVDatVal: TDateField;
    tb_TMPFIVValor: TFloatField;
    tb_TMPFIVCodSer: TIntegerField;
    tb_TMPFIVCodApa: TIntegerField;
    tb_TMPFIVNumSeq: TIntegerField;
    ds_TEMPF: TDataSource;
    ds_TMPG: TDataSource;
    tb_TMPG: TTable;
    tb_TMPGData: TDateField;
    tb_TMPGValor: TFloatField;
    tb_TMPGNro: TIntegerField;
    dg_Item: TwwDBGrid;
    pn_TotPar: TPanel;
    Bevel9: TBevel;
    Label7: TLabel;
    lb_TotPar: TLabel;
    Bevel14: TBevel;
    Bevel2: TBevel;
    Bevel7: TBevel;
    tb_VendaVEDatCan: TDateField;
    dg_Duplicata: TwwDBGrid;
    qr_Duplicata: TwwQuery;
    ds_Duplicata: TwwDataSource;
    bt_Anular: TSpeedButton;
    cb_TipPgt: TDBComboBox;
    Label9: TLabel;
    ActionList1: TActionList;
    ac_CtrlN: TAction;
    ac_Esc: TAction;
    ac_CtrlS: TAction;
    ac_CtrlL: TAction;
    ac_CtrlA: TAction;
    ac_PgUp: TAction;
    ac_PgDown: TAction;
    ac_F8: TAction;
    procedure ds_VendaStateChange(Sender: TObject);
    procedure bt_IncluirClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure tb_TMPFBeforeOpen(DataSet: TDataSet);
    procedure tb_TMPFAfterClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure lc_PacienteEnter(Sender: TObject);
    procedure lc_CompradorEnter(Sender: TObject);
    procedure cb_TipNotClick(Sender: TObject);
    procedure tb_VendaAfterPost(DataSet: TDataSet);
    procedure tb_VendaBeforePost(DataSet: TDataSet);
    procedure tb_VendaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_TMPFAfterPost(DataSet: TDataSet);
    procedure tb_TMPFAfterDelete(DataSet: TDataSet);
    procedure ed_DesAcrExit(Sender: TObject);
    procedure tb_VendaAfterScroll(DataSet: TDataSet);
    procedure tb_TMPGNewRecord(DataSet: TDataSet);
    procedure tb_TMPGPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tb_TMPGAfterPost(DataSet: TDataSet);
    procedure tb_TMPGAfterDelete(DataSet: TDataSet);
    procedure bt_SalvarClick(Sender: TObject);
    procedure qr_DuplicataAfterOpen(DataSet: TDataSet);
    procedure tb_TMPFNewRecord(DataSet: TDataSet);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure lc_PacienteCloseUp(Sender: TObject);
    procedure ac_CtrlSExecute(Sender: TObject);
    procedure ac_CtrlNExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ac_PgUpExecute(Sender: TObject);
    procedure ac_PgDownExecute(Sender: TObject);
  private
    function TotalizeItens:Double;
    function  TotalizeParcelas:Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Venda: Tfm_Venda;

implementation

Uses safdgera, funcoes, safucada, safumenu;

{$R *.dfm}

function Tfm_Venda.TotalizeItens:Double;
var nTotVen  :Double;
    oBookMark: TBookmark;
begin

 with tb_TMPF do begin
      DisableControls;
      oBookMark := GetBookmark;

      First; nTotVen := 0;
      while Eof = False do begin
            nTotVen := nTotVen + FieldByName('IVValor').AsFloat;
            Next;
      end;

      GotoBookmark(oBookMark);
      FreeBookmark(oBookMark);

      tb_VendaVEValVen.AsFloat := nTotVen + tb_Venda.FieldByName('VEDesAcr').AsFloat;
      Result := tb_VendaVEValVen.AsFloat;

      EnableControls;
 end;

end;


function Tfm_Venda.TotalizeParcelas:Double;
var nTotPar  :Double;
    oBookMark: TBookmark;
begin

 with tb_TMPG do begin
      DisableControls;
      oBookMark := GetBookmark;

      First; nTotPar := 0;
      while Eof = False do begin
            nTotPar := nTotPar + FieldByName('Valor').AsFloat;
            Next;
      end;

      GotoBookmark(oBookMark);
      FreeBookmark(oBookMark);

      lb_TotPar.Caption := FormatFloat('###,###.00', nTotPar);
      Result := nTotPar;

      EnableControls;
 end;

end;


procedure Tfm_Venda.ds_VendaStateChange(Sender: TObject);
begin

IF (Sender AS TDataSource).DataSet.State IN [dsEdit,dsInsert] THEN
   BEGIN
   bt_Salvar.Enabled      := True;
   bt_Incluir.Enabled     := False;
//   bt_Alterar.Enabled     := False;
   bt_Cancelar.Enabled    := True;
   bt_Deletar.Enabled     := False;
   bt_Procurar.Enabled    := False;
   bt_Imprimir.Enabled    := False;
   bt_Anterior.Enabled    := False;
   bt_Proximo.Enabled     := False;
   bt_Sair.Enabled        := False;

//   IF (Sender As TDataSource).DataSet.State = dsInsert THEN
//      BEGIN
      lc_Paciente.Enabled    := True;
      lc_Comprador.Enabled   := True;
      cb_TipNot.Enabled      := True;
      ed_NumNot.Enabled      := True;
      ed_DatNot.Enabled      := True;
      ed_DesAcr.Enabled      := True;

      pn_TotPar.Visible      := True;

//      END;


//   pn_ItemTestagem.Visible:= False;
//   pn_TMP.Visible         := True;

//   tb_TMPB.EmptyTable;

//   tb_TMPBAfterDelete(tb_TMPB);
   dm_Geral.tb_Aparelho.IndexFieldNames := 'APDescricao';
   dm_Geral.tb_Servico.IndexFieldNames  := 'SEDescricao';
   END
ELSE
   BEGIN
   bt_Salvar.Enabled      := False;
   bt_Incluir.Enabled     := True;
//   bt_Alterar.Enabled     := True;
   bt_Cancelar.Enabled    := False;
   bt_Deletar.Enabled     := True;
   bt_Procurar.Enabled    := True;
   bt_Imprimir.Enabled    := True;
   bt_Anterior.Enabled    := True;
   bt_Proximo.Enabled     := True;
   bt_Sair.Enabled        := True;

   lc_Paciente.Enabled    := False;
   lc_Comprador.Enabled   := False;
   cb_TipNot.Enabled      := False;
   ed_NumNot.Enabled      := False;
   ed_DatNot.Enabled      := False;
   ed_DesAcr.Enabled      := False;

   pn_TotPar.Visible      := False;

//   pn_ItemTestagem.Visible:= True;
//   pn_TMP.Visible         := False;
   END;

   dg_TMPF.Visible := (Sender AS TDataSource).DataSet.State IN [dsEdit,dsInsert];
   dg_Item.Visible := Not (dg_TMPF.Visible);

   dg_TMPG.Visible := (Sender AS TDataSource).DataSet.State IN [dsEdit,dsInsert];
   dg_Duplicata.Visible := Not (dg_TMPF.Visible);


   cb_TipNotClick(cb_TipNot);

end;

procedure Tfm_Venda.bt_IncluirClick(Sender: TObject);
begin

 tb_Venda.Insert;
 tb_Venda.FieldByName('VEDatVen').AsDateTime := Date;
 tb_Venda.FieldByName('VETipVen').AsString   := 'Venda';
 cb_TipNot.SetFocus;
 Mensagem('Incluíndo novo registro!',StatusBar,False);

end;

procedure Tfm_Venda.bt_CancelarClick(Sender: TObject);
begin
 tb_Venda.Cancel;
 Mensagem('A Inclusão/Alteração foi cancelada!',StatusBar,False)
end;

procedure Tfm_Venda.tb_TMPFBeforeOpen(DataSet: TDataSet);
begin
CriarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Venda.tb_TMPFAfterClose(DataSet: TDataSet);
begin
DeletarTMP(DataSet);
end;

procedure Tfm_Venda.FormCreate(Sender: TObject);
begin
 tb_TMPF.Open;
 tb_TMPG.Open;
 cb_TipNotClick(cb_TipNot);
 cb_TipPgt.ItemIndex := 1; 
end;

procedure Tfm_Venda.lc_PacienteEnter(Sender: TObject);
begin
 dm_Geral.tb_Paciente.IndexFieldNames := 'PCNome';
 fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Paciente;
 fm_Menu.ShowHint(Sender);
end;

procedure Tfm_Venda.lc_CompradorEnter(Sender: TObject);
begin
 dm_Geral.tb_Comprador.IndexFieldNames := 'PCNome';
 fm_Cadastro.pg_Cadastro.ActivePage := fm_Cadastro.pg_Comprador;
 fm_Menu.ShowHint(Sender);
end;

procedure Tfm_Venda.cb_TipNotClick(Sender: TObject);
begin

 if cb_TipNot.ItemIndex = -1 then Exit;

 if tb_Venda.State in [dsEdit, dsInsert] then begin
    tb_TMPF.FieldByName('IV_Aparelho').Visible  := cb_TipNot.Text = 'Venda';
    tb_TMPF.FieldByName('IV_ModeloApa').Visible := cb_TipNot.Text = 'Venda';
    tb_TMPF.FieldByName('IV_Servico').Visible   := cb_TipNot.Text = 'Serviço';
 end else begin
    tb_ItemVenda.FieldByName('IV_Aparelho').Visible  := cb_TipNot.Text = 'Venda';
    tb_ItemVenda.FieldByName('IV_ModeloApa').Visible := cb_TipNot.Text = 'Venda';
    tb_ItemVenda.FieldByName('IV_Servico').Visible   := cb_TipNot.Text = 'Serviço';
 end;
 
end;

procedure Tfm_Venda.tb_VendaAfterPost(DataSet: TDataSet);
begin
DbiSaveChanges(TTable(DataSet).Handle);
end;

procedure Tfm_Venda.tb_VendaBeforePost(DataSet: TDataSet);
begin
IF tb_Venda.FieldByName('VENumNot' ).IsNull = True THEN
   BEGIN
   IF dm_Geral.tb_Venda.IsEmpty = True THEN
      tb_VendaVENumNot.Value := 1
   ELSE
      BEGIN
      dm_Geral.tb_Venda.IndexFieldNames := 'VENumNot';
      dm_Geral.tb_Venda.Last;
      tb_VendaVENumNot.Value := dm_Geral.tb_Venda.FieldByName('VENumNot').Value+1;
      END;
   END;
end;                         

procedure Tfm_Venda.tb_VendaPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
IF (E IS EDBEngineError) THEN
   IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
   BEGIN
   tb_VendaVENumNot.Value := tb_VendaVENumNot.Value + 1;
   Action := daRetry;
   END;
end;

procedure Tfm_Venda.tb_TMPFAfterPost(DataSet: TDataSet);
begin
 TotalizeItens;
end;

procedure Tfm_Venda.tb_TMPFAfterDelete(DataSet: TDataSet);
begin
 TotalizeItens;
end;

procedure Tfm_Venda.ed_DesAcrExit(Sender: TObject);
begin
 TotalizeItens;
end;

procedure Tfm_Venda.tb_VendaAfterScroll(DataSet: TDataSet);
begin
 cb_TipNotClick(cb_TipNot);
end;

procedure Tfm_Venda.tb_TMPGNewRecord(DataSet: TDataSet);
begin
 tb_TMPGNro.AsInteger := tb_TMPG.RecordCount+1;
end;

procedure Tfm_Venda.tb_TMPGPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 IF (E IS EDBEngineError) THEN
    IF (E AS EDBEngineError).Errors[0].Errorcode = eKeyViol THEN
    BEGIN
    tb_TMPGNro.Value := tb_TMPGNro.Value + 1;
    Action := daRetry;
    END;
end;

procedure Tfm_Venda.tb_TMPGAfterPost(DataSet: TDataSet);
begin
 TotalizeParcelas;
end;

procedure Tfm_Venda.tb_TMPGAfterDelete(DataSet: TDataSet);
begin
 TotalizeParcelas;
end;

procedure Tfm_Venda.bt_SalvarClick(Sender: TObject);
begin

 tb_Venda.UpdateRecord;

 if TotalizeParcelas <> TotalizeItens then begin
    if MessageDlg('O total das parcelas não confere com o total da venda.'+#13+#10+
                  'Deseja continuar mesmo assim?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
       Exit;
    end;
 end;

 tb_Venda.Post;

 tb_TmpF.First;
 while tb_TmpF.Eof = False do begin
       tb_ItemVenda.Append;
       tb_ItemVendaIVNumNot.Value := tb_VendaVENumNot.Value;       
       tb_ItemVendaIVNumSeq.Value := tb_TMPFIVNumSeq.Value;
       tb_ItemVendaIVSerie.Value  := tb_TMPFIVSerie.Value;
       tb_ItemVendaIVDatVal.Value := tb_TMPFIVDatVal.Value;
       tb_ItemVendaIVValor.Value  := tb_TMPFIVValor.Value;
       tb_ItemVendaIVCodSer.Value := tb_TMPFIVCodSer.Value;
       tb_ItemVendaIVCodApa.Value := tb_TMPFIVCodApa.Value;
       tb_ItemVenda.Post;
       tb_TmpF.Next;
 end;



 try
   tb_TMPG.First;
   while tb_TMPG.Eof = False do begin
         dm_Geral.tb_Duplicata.Append;
         dm_Geral.tb_DuplicataDUNumNot.Value := tb_Venda.FieldByName('VENumNot').Value;
         dm_Geral.tb_DuplicataDUNumPar.Value := tb_TMPG.FieldByName('Nro').Value;
         dm_Geral.tb_DuplicataDUCodPac.Value := tb_Venda.FieldByName('VECodPac').Value;
         dm_Geral.tb_DuplicataDUDatEmi.Value := tb_Venda.FieldByName('VEDatVen').Value;;
         dm_Geral.tb_DuplicataDUValDup.Value := tb_TMPG.FieldByName('Valor').Value;
         dm_Geral.tb_DuplicataDUDatVen.Value := tb_TMPG.FieldByName('Data').Value;
         dm_Geral.tb_Duplicata.Post;
         tb_TMPG.Next;
   end;
 except
   on E:Exception do begin
      Mensagem('          ***ATENÇÃO****           '+#13#10+
               'Houve um erro ao gerar as parcelas!'+#13#10+
               E.Message,StatusBar,False);
      Exit;
   end;
 end;

 DbiSaveChanges(tb_Venda.Handle);
 DbiSaveChanges(tb_ItemVenda.Handle);
 DbiSaveChanges(dm_Geral.tb_Duplicata.Handle);

 qr_Duplicata.Close; qr_Duplicata.Open;

end;

procedure Tfm_Venda.qr_DuplicataAfterOpen(DataSet: TDataSet);
begin
  TNumericField(qr_Duplicata.FieldByName('DUValDup')).DisplayFormat := '###,##0.00';
end;

procedure Tfm_Venda.tb_TMPFNewRecord(DataSet: TDataSet);
begin
 tb_TMPFIVNumSeq.AsInteger := tb_TMPF.RecordCount+1;
end;

procedure Tfm_Venda.bt_AnteriorClick(Sender: TObject);
begin
 tb_Venda.Prior;
end;

procedure Tfm_Venda.bt_ProximoClick(Sender: TObject);
begin
 tb_Venda.Next;
end;

procedure Tfm_Venda.lc_PacienteCloseUp(Sender: TObject);
begin
 lc_Comprador.KeyValue := lc_Paciente.KeyValue;
end;

procedure Tfm_Venda.ac_CtrlSExecute(Sender: TObject);
begin
 bt_Salvar.OnClick(bt_Salvar);
end;

procedure Tfm_Venda.ac_CtrlNExecute(Sender: TObject);
begin
 bt_Incluir.OnClick(bt_Incluir);
end;

procedure Tfm_Venda.ac_EscExecute(Sender: TObject);
begin
 IF bt_Cancelar.Enabled = True THEN
    bt_Cancelar.OnClick(bt_Cancelar);
end;

procedure Tfm_Venda.ac_PgUpExecute(Sender: TObject);
begin
IF bt_Anterior.Enabled = True THEN
   bt_Anterior.OnClick(Sender);
end;

procedure Tfm_Venda.ac_PgDownExecute(Sender: TObject);
begin
IF bt_Proximo.Enabled = True THEN
   bt_Proximo.OnClick(Sender);
end;

end.
