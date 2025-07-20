unit SAFULCAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, StdCtrls, Db, DBTables, Buttons, Mask, ADODB;

type
  Tfm_Controle = class(TForm)
    cb_Aparelho: TDBLookupComboBox;
    gd_TMPE: TDBGrid;
    Label1: TLabel;
    tb_TMPE: TTable;
    ds_TMPE: TDataSource;
    bt_Confirma: TSpeedButton;
    BitBtn1: TBitBtn;
    bt_Ok: TBitBtn;
    qr_Aparelho: TQuery;
    ds_Aparelho: TDataSource;
    qr_Controle: TQuery;
    ds_Controle: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    bt_Abort: TSpeedButton;
    procedure tb_TMPEAfterClose(DataSet: TDataSet);
    procedure tb_TMPEBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure bt_ConfirmaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tb_TMPEBeforeInsert(DataSet: TDataSet);
    procedure tb_TMPEBeforeDelete(DataSet: TDataSet);
    procedure bt_AbortClick(Sender: TObject);
    procedure bt_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Controle: Tfm_Controle;

implementation

Uses funcoes, safdgera;

{$R *.DFM}

procedure Tfm_Controle.tb_TMPEAfterClose(DataSet: TDataSet);
begin
DeletarTMP(DataSet);
end;

procedure Tfm_Controle.tb_TMPEBeforeOpen(DataSet: TDataSet);
begin
CriarTMP(TADOQuery(DataSet));
end;

procedure Tfm_Controle.FormCreate(Sender: TObject);
begin
 cb_Aparelho.KeyValue := qr_Aparelho.FieldByName('APCodApa').AsInteger;
 tb_TMPE.Active := True;
end;

procedure Tfm_Controle.bt_ConfirmaClick(Sender: TObject);
begin

 tb_TMPE.EmptyTable;

 tb_TMPE.DisableControls;

 qr_Controle.First;
 while qr_Controle.Eof = False do begin
   tb_TMPE.Append;
   tb_TMPE.FieldByName('CodCon').AsInteger  := qr_Controle.FieldByName('COCodCon').AsInteger;
   tb_TMPE.FieldByName('DesCon').AsString   := qr_Controle.FieldByName('CODescricao').AsString+' ('+
                                               qr_Controle.FieldByName('COControle').AsString+')';
   tb_TMPE.FieldByName('Controle').AsString := qr_Controle.FieldByName('COControle').AsString;
   tb_TMPE.FieldByName('UniMed').AsString   := qr_Controle.FieldByName('COUniMed').AsString;
   tb_TMPE.Post;
   qr_Controle.Next;
 end;

 tb_TMPE.First;
 tb_TMPE.EnableControls;

 gd_TMPE.Enabled    := True;
 bt_Ok.Enabled      := True;
 bt_Confirma.Visible:= False;
 bt_Abort.Visible   := True;
 cb_Aparelho.Enabled:= False; 

 gd_TMPE.SelectedField := tb_TMPE.FieldByName('ValMed');
 gd_TMPE.SetFocus;

end;

procedure Tfm_Controle.FormDestroy(Sender: TObject);
begin
 tb_TMPE.Close;
end;

procedure Tfm_Controle.tb_TMPEBeforeInsert(DataSet: TDataSet);
begin
 if gd_TMPE.Focused then
    Abort;
end;

procedure Tfm_Controle.tb_TMPEBeforeDelete(DataSet: TDataSet);
begin
 if gd_TMPE.Focused then Abort;
end;

procedure Tfm_Controle.bt_AbortClick(Sender: TObject);
begin

 tb_TMPE.EmptyTable;

 bt_Confirma.Visible:= True;
 bt_Abort.Visible   := False;
 gd_TMPE.Enabled    := False;
 bt_Ok.Enabled      := False;
 cb_Aparelho.Enabled:= True;
 cb_Aparelho.SetFocus;

end;

procedure Tfm_Controle.bt_OkClick(Sender: TObject);
var cMsg:String;
begin
 tb_TMPE.First;
 while tb_TMPE.Eof = False do begin
   if tb_TMPE.FieldByName('ValMed').IsNull = True then begin
      cMsg := 'Informe um valor para o controle: '+tb_TMPE.FieldByName('DesCon').AsString+'!';
      Break;
   end;
   tb_TMPE.Next;
 end;

 if cMsg = '' then begin
    ModalResult := mrOk;
 end else begin
    ShowMessage(cMsg);
 end;

end;

end.
 