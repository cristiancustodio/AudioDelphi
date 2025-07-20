
// PARAMETROS
// RELATORIOS DOS PARAMETROS
//
// Alterar TADOQuery para TADOQuery
// Connection
// Abrir tabela no Create
// BeforeOpen
// BeforePost
// vm_StrTableDB  := 'SAFAPC';


unit safupara;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, StdCtrls, ToolWin, Buttons, DBCtrls, Mask,
  Grids, DBGrids, Db, DBTables, ActnList, DBActns, Bde, ADODB;

type
  Tfm_Parametro = class(TForm)
    pg_Parametro: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet1: TTabSheet;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    bt_Incluir: TSpeedButton;
    bt_Salvar: TSpeedButton;
    bt_Cancelar: TSpeedButton;
    bt_Deletar: TSpeedButton;
    bt_Procurar: TSpeedButton;
    bt_Imprimir: TSpeedButton;
    bt_Sair: TSpeedButton;
    Bevel5: TBevel;
    pg_Anamnese: TPageControl;
    pg_AnamneseAna: TTabSheet;
    pg_PerguntaAna: TTabSheet;
    ed_CodAna: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    ed_DesAna: TDBEdit;
    dg_Pergunta: TDBGrid;
    tb_Anamnese: TADOQuery;
    ds_Anamnese: TDataSource;
    DBText1: TDBText;
    Bevel2: TBevel;
    tb_AnamneseANCodAna: TIntegerField;
    tb_AnamneseANDescricao: TStringField;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    ActionList1: TActionList;
    ac_CtrN: TAction;
    ac_Esc: TAction;
    ac_CtrS: TAction;
    ac_Busca: TAction;
    Label3: TLabel;
    tb_Pergunta: TADOQuery;
    ds_Pergunta: TDataSource;
    tb_PerguntaPGCodAna: TIntegerField;
    tb_PerguntaPGDescricao: TStringField;
    tb_PerguntaPGNumPer: TIntegerField;
    tb_Audiometro: TADOQuery;
    ds_Audiometro: TDataSource;
    tb_AudiometroAUCodAud: TIntegerField;
    tb_AudiometroAUDescricao: TStringField;
    tb_AudiometroAUDatCal: TDateField;
    tb_AudiometroAUDatAfe: TDateField;
    Label4: TLabel;
    ed_CodAud: TDBEdit;
    Label5: TLabel;
    ed_DesAud: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    ac_PgUp: TAction;
    ac_PgDown: TAction;
    ac_F8: TAction;
    bt_Alterar: TSpeedButton;
    ac_CtrA: TAction;
    TabSheet3: TTabSheet;
    Bevel3: TBevel;
    Bevel4: TBevel;
    tb_TipoContato: TADOQuery;
    ds_TipoContato: TDataSource;
    tb_TipoContatoTPCOTipo: TAutoIncField;
    tb_TipoContatoTPCONome: TStringField;
    Label8: TLabel;
    ed_TipoContato: TDBEdit;
    PROCEDURE OutroEstado(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure tb_AnamneseAfterScroll(DataSet: TDataSet);
    procedure tb_AnamnesePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure bt_IncluirClick(Sender: TObject);
    procedure TabSheetShow(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_DeletarClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure tb_TableBeforePost(DataSet: TDataSet);
    procedure ac_CtrNExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ac_CtrSExecute(Sender: TObject);
    procedure bt_ProcurarClick(Sender: TObject);
    procedure ac_BuscaExecute(Sender: TObject);
    procedure ds_PerguntaStateChange(Sender: TObject);
    procedure tb_PerguntaAfterInsert(DataSet: TDataSet);
    procedure tb_PerguntaAfterScroll(DataSet: TDataSet);
    procedure tb_PerguntaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure tb_AudiometroAfterScroll(DataSet: TDataSet);
    procedure tb_AudiometroPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
    procedure tb_AnamneseAfterPost(DataSet: TDataSet);
    procedure ac_PgUpExecute(Sender: TObject);
    procedure ac_PgDownExecute(Sender: TObject);
    procedure ac_F8Execute(Sender: TObject);
    procedure bt_AlterarClick(Sender: TObject);
    procedure ac_CtrAExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tb_AnamneseBeforeOpen(DataSet: TDataSet);
    procedure tb_PerguntaBeforeOpen(DataSet: TDataSet);
    procedure tb_AudiometroBeforeOpen(DataSet: TDataSet);
    procedure tb_PerguntaBeforePost(DataSet: TDataSet);
    procedure tb_TipoContatoBeforeOpen(DataSet: TDataSet);
    procedure tb_TipoContatoBeforePost(DataSet: TDataSet);
  private
    FUNCTION MaiorCodigo(vm_ParCampoChave, vm_ParTabela : String; vm_ParFiltro: String = ''): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

CONST eKeyViol=9729;

var
  fm_Parametro: Tfm_Parametro;
  vm_ObjTable : TADOQuery; // Tabela atual da barra de ferramenta
  vm_ObjSource: TDataSource; // DataSource atual da barra de ferramenta
  vm_ObjFieldKey: TField; // Campo Chave
  vm_ObjTabSheet: TTabSheet;
  vm_ObjEdit: TDBEdit;

implementation

Uses SafuMenu, safurela, safdgera, safucada, Safubusc, funcoes;

{$R *.DFM}


FUNCTION Tfm_Parametro.MaiorCodigo(vm_ParCampoChave, vm_ParTabela : String; vm_ParFiltro: String = ''): Integer;
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


PROCEDURE Tfm_Parametro.OutroEstado(Sender: TObject);
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
          (Self.Components[I].ClassType = TDBComboBox) OR
          (Self.Components[I].ClassType = TDBCheckBox) OR
          (Self.Components[I].ClassType = TCheckBox)   OR
          (Self.Components[I].ClassType = TDBMemo)     OR
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

       END;

    END;

bt_Salvar.Enabled   := (vm_BooEdit OR vm_BooInsert);
bt_Incluir.Enabled  := vm_BooBrowse;
bt_Alterar.Enabled  := vm_BooBrowse;
bt_Cancelar.Enabled := (vm_BooEdit OR vm_BooInsert);
bt_Deletar.Enabled  := vm_BooBrowse;
bt_Procurar.Enabled := vm_BooBrowse;
bt_Imprimir.Enabled := vm_BooBrowse;

END;



procedure Tfm_Parametro.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_Parametro.bt_SalvarClick(Sender: TObject);
begin

vm_ObjTable.UpdateRecord;
vm_ObjTable.Post;
Mensagem(vm_ObjFieldKey.DisplayLabel+' '+vm_ObjFieldKey.AsString+' salvo com sucesso',
         StatusBar,False);

end;

procedure Tfm_Parametro.tb_AnamneseAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;

procedure Tfm_Parametro.tb_AnamnesePostError(DataSet: TDataSet;
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


procedure Tfm_Parametro.bt_IncluirClick(Sender: TObject);
begin
vm_ObjTable.Insert;
IF vm_ObjEdit.CanFocus = True THEN
   vm_ObjEdit.SetFocus;
Mensagem('Incluindo um novo registro!',StatusBar,False);
end;


procedure Tfm_Parametro.TabSheetShow(Sender: TObject);
begin

vm_ObjTable    := Nil;
vm_ObjSource   := Nil;
vm_ObjFieldKey := Nil;
vm_ObjTabSheet := TTabSheet(Sender);

IF (Sender As TTabSheet).Caption = 'Anamneses'     THEN
   BEGIN
   IF pg_Anamnese.ActivePage.Caption = 'Anamnese'  THEN
      BEGIN
      vm_ObjTable    := fm_Parametro.tb_Anamnese;
      vm_ObjSource   := fm_Parametro.ds_Anamnese;
      vm_ObjFieldKey := fm_Parametro.tb_AnamneseANCodAna;
      vm_ObjFieldNom := fm_Parametro.tb_AnamneseANDescricao;
      vm_ObjEdit     := ed_DesAna;
      vm_ObjTabSheet := pg_AnamneseAna;
      vm_StrTableDB  := 'SAFAAN';
      OutroEstado(vm_ObjSource);
      END;
   IF pg_Anamnese.ActivePage.Caption = 'Perguntas' THEN
      BEGIN
      vm_ObjTable    := fm_Parametro.tb_Pergunta;
      vm_ObjSource   := fm_Parametro.ds_Pergunta;
      vm_ObjFieldKey := fm_Parametro.tb_PerguntaPGNumPer;
      vm_ObjFieldNom := fm_Parametro.tb_PerguntaPGDescricao;
      vm_ObjTabSheet := pg_PerguntaAna;
      vm_StrTableDB  := 'SAFAAN';
      ds_PerguntaStateChange(vm_ObjSource);
      END;
   END;

IF (Sender As TTabSheet).Caption =  'Anamnese' THEN
   BEGIN
   vm_ObjTable    := fm_Parametro.tb_Anamnese;
   vm_ObjSource   := fm_Parametro.ds_Anamnese;
   vm_ObjFieldKey := fm_Parametro.tb_AnamneseANCodAna;
   vm_ObjFieldNom := fm_Parametro.tb_AnamneseANDescricao;
   vm_ObjEdit     := ed_DesAna;
   vm_StrTableDB  := 'SAFAAN';
   OutroEstado(vm_ObjSource);
   END;

IF (Sender As TTabSheet).Caption = 'Perguntas' THEN
   BEGIN
   vm_ObjTable    := fm_Parametro.tb_Pergunta;
   vm_ObjSource   := fm_Parametro.ds_Pergunta;
   vm_ObjFieldKey := fm_Parametro.tb_PerguntaPGNumPer;
   vm_ObjFieldNom := fm_Parametro.tb_PerguntaPGDescricao;
   vm_StrTableDB  := 'SAFAPG';
   ds_PerguntaStateChange(vm_ObjSource);
   END;

IF (Sender As TTabSheet).Caption = 'Audiômetro' THEN
   BEGIN
   vm_ObjTable    := fm_Parametro.tb_Audiometro;
   vm_ObjSource   := fm_Parametro.ds_Audiometro;
   vm_ObjFieldKey := fm_Parametro.tb_AudiometroAUCodAud;
   vm_ObjFieldNom := fm_Parametro.tb_AudiometroAUDescricao;
   vm_StrTableDB  := 'SAFAAU';
   vm_ObjEdit     := ed_DesAud;
   OutroEstado(vm_ObjSource);
   END;

IF (Sender As TTabSheet).Caption = 'Tipos de Contatos' THEN
   BEGIN
   vm_ObjTable    := fm_Parametro.tb_TipoContato;
   vm_ObjSource   := fm_Parametro.ds_TipoContato;
   vm_ObjFieldKey := fm_Parametro.tb_TipoContatoTPCOTipo;
   vm_ObjFieldNom := fm_Parametro.tb_TipoContatoTPCONome;
   vm_StrTableDB  := 'SAFATPCO';
   vm_ObjEdit     := ed_TipoContato;
   OutroEstado(vm_ObjSource);
   END;

end;

procedure Tfm_Parametro.bt_CancelarClick(Sender: TObject);
begin
vm_ObjTable.Cancel;
Mensagem('As alterações foram canceladas',StatusBar,False);
end;

procedure Tfm_Parametro.bt_DeletarClick(Sender: TObject);
VAR vm_Status:String;
begin

IF MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN
   vm_Status := vm_ObjFieldKey.DisplayLabel+' '+vm_ObjFieldKey.AsString+' excluído com sucesso';
   vm_ObjTable.Delete;
   Mensagem(vm_Status,StatusBar,False);
   END;

end;

procedure Tfm_Parametro.bt_ImprimirClick(Sender: TObject);
begin

IF fm_Relatorio = nil THEN
   Application.CreateForm(Tfm_Relatorio, fm_Relatorio);

fm_Relatorio.ShowModal;

end;

procedure Tfm_Parametro.bt_AnteriorClick(Sender: TObject);
begin
vm_ObjTable.Prior;
Mensagem('Registro '+IntToStr(vm_ObjTable.RecNo)+' de '+IntToStr(vm_ObjTable.RecordCount),
         StatusBar,False);
end;

procedure Tfm_Parametro.bt_ProximoClick(Sender: TObject);
begin
vm_ObjTable.Next;
Mensagem('Registro '+IntToStr(vm_ObjTable.RecNo)+' de '+IntToStr(vm_ObjTable.RecordCount),
         StatusBar,False);
end;

// Evento Compartilhado
procedure Tfm_Parametro.tb_TableBeforePost(DataSet: TDataSet);
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

procedure Tfm_Parametro.ac_CtrNExecute(Sender: TObject);
begin
IF bt_Incluir.Enabled = True THEN
   bt_IncluirClick(bt_Incluir);
end;

procedure Tfm_Parametro.ac_EscExecute(Sender: TObject);
begin
IF bt_Cancelar.Enabled = True THEN
   bt_CancelarClick(bt_Cancelar);
end;

procedure Tfm_Parametro.ac_CtrSExecute(Sender: TObject);
begin
IF bt_Salvar.Enabled = True THEN
   bt_SalvarClick(bt_Salvar);
end;


procedure Tfm_Parametro.bt_ProcurarClick(Sender: TObject);
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

procedure Tfm_Parametro.ac_BuscaExecute(Sender: TObject);
begin
IF bt_Procurar.Enabled = True THEN
   bt_ProcurarClick(bt_Procurar);
end;

procedure Tfm_Parametro.ds_PerguntaStateChange(Sender: TObject);
begin

IF (vm_ObjTable = Nil)                              OR
   ((Sender As TDataSource).DataSet <> vm_ObjTable) THEN
   Exit;

IF (Sender As TDataSource).DataSet.State IN [dsEdit,dsInsert] THEN
   BEGIN

   IF (Sender As TDataSource).DataSet.State = dsEdit THEN
      dg_Pergunta.Columns[0].ReadOnly := True
   ELSE
      dg_Pergunta.Columns[0].ReadOnly := False;

   bt_Salvar.Enabled   := True;
   bt_Incluir.Enabled  := False;
   bt_Cancelar.Enabled := True;
   bt_Deletar.Enabled  := False;
   bt_Procurar.Enabled := False;
   bt_Imprimir.Enabled := False;
   END
ELSE
   BEGIN
   bt_Salvar.Enabled   := False;
   bt_Incluir.Enabled  := True;
   bt_Cancelar.Enabled := False;
   bt_Deletar.Enabled  := True;
   bt_Procurar.Enabled := False;
   bt_Imprimir.Enabled := True;
   dg_Pergunta.Columns[0].ReadOnly := True;
   END;

end;


procedure Tfm_Parametro.tb_PerguntaAfterInsert(DataSet: TDataSet);
begin
dg_Pergunta.SetFocus;
end;

procedure Tfm_Parametro.tb_PerguntaAfterScroll(DataSet: TDataSet);
begin
RefreshTable(DataSet);
end;


procedure Tfm_Parametro.tb_PerguntaPostError(DataSet: TDataSet;
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


procedure Tfm_Parametro.tb_AudiometroAfterScroll(DataSet: TDataSet);
begin
//RefreshTable(DataSet);
end;


procedure Tfm_Parametro.tb_AudiometroPostError(DataSet: TDataSet;
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


procedure Tfm_Parametro.tb_AnamneseAfterPost(DataSet: TDataSet);
begin

// Evento compartilhado

//DbiSaveChanges(TADOQuery(DataSet).Handle);

end;

procedure Tfm_Parametro.ac_PgUpExecute(Sender: TObject);
begin

//IF bt_Anterior.Enabled = True THEN
//   bt_AnteriorClick(Sender);

end;

procedure Tfm_Parametro.ac_PgDownExecute(Sender: TObject);
begin

//IF bt_Proximo.Enabled = True THEN
//   bt_ProximoClick(Sender);

end;

procedure Tfm_Parametro.ac_F8Execute(Sender: TObject);
begin
IF bt_Imprimir.Enabled = True THEN
   bt_ImprimirClick(Sender);
end;

procedure Tfm_Parametro.bt_AlterarClick(Sender: TObject);
begin
vm_ObjTable.Edit;
IF vm_ObjEdit.CanFocus = True THEN
   vm_ObjEdit.SetFocus;
Mensagem('Alterando registro!',StatusBar,False);
end;

procedure Tfm_Parametro.ac_CtrAExecute(Sender: TObject);
begin

IF bt_Alterar.Enabled = True THEN
   bt_AlterarClick(bt_Alterar);

end;

procedure Tfm_Parametro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fm_Parametro := nil;
end;

procedure Tfm_Parametro.FormCreate(Sender: TObject);
begin
  Self.Top := 0;
  Self.Left := 0;

  tb_Anamnese.Open;
  tb_Pergunta.Open;
  tb_Audiometro.Open;
  tb_TipoContato.Open;
end;

procedure Tfm_Parametro.tb_AnamneseBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Anamnese.SQL.Text = '' THEN
  BEGIN
    tb_Anamnese.SQL.Text := 'select * from Safaan where ANCodAna = :ANCODANA';

    tb_Anamnese.Parameters.Clear;
    tb_Anamnese.Parameters.CreateParameter( 'ANCODANA', ftInteger, pdInput, 0, 0);
    tb_Anamnese.Parameters.ParamByName('ANCODANA').Value := MaiorCodigo('ANCodAna', 'SAFAAN');
  END;

end;

procedure Tfm_Parametro.tb_PerguntaBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Pergunta.SQL.Text = '' THEN
  BEGIN
    tb_Pergunta.SQL.Text := 'select * from Safapg where PGCodAna = :ANCodAna';

    tb_Pergunta.Parameters.Clear;
    tb_Pergunta.Parameters.CreateParameter( 'ANCodAna', ftInteger, pdInput, 0, 0);
    //tb_Pergunta.Parameters.ParamByName('ANCodAna').Value := MaiorCodigo('PGNumPer', 'SAFAPG');
    tb_Pergunta.DataSource := ds_Anamnese;
  END;

end;

procedure Tfm_Parametro.tb_AudiometroBeforeOpen(DataSet: TDataSet);
begin

  IF tb_Audiometro.SQL.Text = '' THEN
  BEGIN
    tb_Audiometro.SQL.Text := 'select * from Safaau where AUCodAud = :AUCODAUD';

    tb_Audiometro.Parameters.Clear;
    tb_Audiometro.Parameters.CreateParameter( 'AUCODAUD', ftInteger, pdInput, 0, 0);
    tb_Audiometro.Parameters.ParamByName('AUCODAUD').Value := MaiorCodigo('AUCodAud', 'SAFAAU');
  END;
  
end;

procedure Tfm_Parametro.tb_PerguntaBeforePost(DataSet: TDataSet);
begin
  tb_PerguntaPGCodAna.Value := tb_AnamneseANCodAna.Value;
  Self.tb_TableBeforePost(DataSet);
end;

procedure Tfm_Parametro.tb_TipoContatoBeforeOpen(DataSet: TDataSet);
begin
  IF tb_TipoContato.SQL.Text = '' THEN
  BEGIN
    tb_TipoContato.SQL.Text := 'select * from SAFATPCO where TPCOTipo = :TPCOTIPO';

    tb_TipoContato.Parameters.Clear;
    tb_TipoContato.Parameters.CreateParameter( 'TPCOTIPO', ftInteger, pdInput, 0, 0);
    tb_TipoContato.Parameters.ParamByName('TPCOTIPO').Value := MaiorCodigo('TPCOTIPO', 'SAFATPCO');
  END;
end;

procedure Tfm_Parametro.tb_TipoContatoBeforePost(DataSet: TDataSet);
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

end.
