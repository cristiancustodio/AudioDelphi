unit Safufifo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons, Db, DBTables,
  ComCtrls, Bde, ADODB, wwdbedit;

type
  Tfm_FichaFornecedor = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    ed_DatIni: TMaskEdit;
    ed_DatFin: TMaskEdit;
    dg_CtasPagar: TDBGrid;
    Panel1: TPanel;
    bt_Sair: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    tb_CtasPagar: TADOQuery;
    ds_CtasPagar: TDataSource;
    qr_TotalPago: TADOQuery;
    ds_TotalPago: TDataSource;
    ds_TotalApagar: TDataSource;
    qr_TotalApagar: TADOQuery;
    qr_TotalVencida: TADOQuery;
    ds_TotalVencida: TDataSource;
    qr_TotalPagoCP_TotalPago: TFloatField;
    qr_TotalApagarCP_TotalApagar: TFloatField;
    qr_TotalVencidaCP_TotalVencida: TFloatField;
    qr_TotalDup: TADOQuery;
    ds_TotalDup: TDataSource;
    qr_TotalDupCP_TotalDup: TFloatField;
    StatusBar: TStatusBar;
    bt_Imprimir: TSpeedButton;
    lblFornecedorLabel: TLabel;
    edFornecedorCodigo: TEdit;
    lblFornecedor: TLabel;
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
    tb_CtasPagarDEDescricao: TStringField;
    procedure bt_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ds_CtasPagarDataChange(Sender: TObject; Field: TField);
    procedure ed_DatIniEnter(Sender: TObject);
    procedure ed_DatFinEnter(Sender: TObject);
    procedure ed_DatFinExit(Sender: TObject);
    procedure dg_CtasPagarDblClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure lblFornecedorLabelClick(Sender: TObject);
    procedure edFornecedorCodigoExit(Sender: TObject);
    procedure edFornecedorCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    PROCEDURE MostrarFornecedor(vm_ParCodigo: Integer);
  private
    vm_StrAnt   : String;
    vm_DatAtual : TDateTime;
    vm_CodigoFornecedor: Integer;
    FNumeroDuplicata: String;
    fCodigoFornecedor: Longint;
    PROCEDURE AplicarFiltro();
    FUNCTION toInt(vm_ParCodigo: String):Integer;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; vm_ParCodigoFornecedor: Integer);
    property CodigoFornecedor : Longint read fCodigoFornecedor;
    property NumeroDuplicata : String read FNumeroDuplicata;
    { Public declarations }
  end;

var
  fm_FichaFornecedor: Tfm_FichaFornecedor;

implementation

uses safdgera, saffgera, safurela, safubusc;

{$R *.DFM}

constructor Tfm_FichaFornecedor.Create(AOwner: TComponent; vm_ParCodigoFornecedor: Integer);
begin
  inherited Create(AOwner);
  fm_FichaFornecedor := Self;
  vm_CodigoFornecedor := vm_ParCodigoFornecedor;
end;

FUNCTION Tfm_FichaFornecedor.toInt(vm_ParCodigo: String):Integer;
BEGIN
  Result := StrToIntDef(Trim(vm_ParCodigo),0)
END;

PROCEDURE Tfm_FichaFornecedor.MostrarFornecedor(vm_ParCodigo: Integer);
BEGIN
  lblFornecedor.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safafo', 'FOCodFor', 'FONome');
  if (tb_CtasPagar.State in [dsEdit, dsInsert]) then
  begin
     if (lblFornecedor.Caption = '') then
        edFornecedorCodigo.Clear;
  end;

END;


PROCEDURE Tfm_FichaFornecedor.AplicarFiltro();
var vm_DatIni:String;
    vm_DatFin, vm_Filtro:String;
BEGIN

vm_DatAtual := Date;

IF ed_DatIni.Text = '  /  /    ' THEN
   vm_DatIni:='01/01/1000'
ELSE
   vm_DatIni := ed_DatIni.Text;

IF ed_DatFin.Text = '  /  /    ' THEN
   vm_DatFin:='01/01/9999'
ELSE
   vm_DatFin:=ed_DatFin.Text;


tb_CtasPagar.Active := False;
tb_CtasPagar.Parameters[0].Value := vm_CodigoFornecedor;
tb_CtasPagar.Parameters[1].Value := StrToDate(vm_DatIni);
tb_CtasPagar.Parameters[2].Value := StrToDate(vm_DatFin);
tb_CtasPagar.Active := True;

qr_TotalPago.Active := False;
qr_TotalPago.Parameters[0].Value := vm_CodigoFornecedor;
qr_TotalPago.Parameters[1].Value := StrToDate(vm_DatIni);
qr_TotalPago.Parameters[2].Value := StrToDate(vm_DatFin);
qr_TotalPago.Active := True;

qr_TotalApagar.Active := False;
qr_TotalApagar.Parameters[0].Value := vm_CodigoFornecedor;
qr_TotalApagar.Parameters[1].Value := StrToDate(vm_DatIni);
qr_TotalApagar.Parameters[2].Value := StrToDate(vm_DatFin);
qr_TotalApagar.Active := True;

qr_TotalVencida.Active := False;
qr_TotalVencida.Parameters[0].Value:= vm_CodigoFornecedor;
qr_TotalVencida.Parameters[1].Value:= Date;
qr_TotalVencida.Parameters[2].Value:= StrToDate(vm_DatIni);
qr_TotalVencida.Parameters[3].Value:= StrToDate(vm_DatFin);
qr_TotalVencida.Active := True;

END;


procedure Tfm_FichaFornecedor.bt_SairClick(Sender: TObject);
begin

ModalResult := mrCancel;

end;

procedure Tfm_FichaFornecedor.FormShow(Sender: TObject);
begin

edFornecedorCodigo.Text := IntToStr(vm_CodigoFornecedor);

edFornecedorCodigoExit(edFornecedorCodigo);

//AplicarFiltro();

edFornecedorCodigo.SetFocus;

end;

procedure Tfm_FichaFornecedor.ds_CtasPagarDataChange(Sender: TObject;
  Field: TField);
begin

//IF tb_CtasPagar.FieldByName('CPValPag').Value > 0 THEN
//   bt_Cancelar.Enabled:=True
//ELSE
//   bt_Cancelar.Enabled:=False;

end;

procedure Tfm_FichaFornecedor.ed_DatIniEnter(Sender: TObject);
begin
vm_StrAnt:=ed_DatIni.Text;
end;

procedure Tfm_FichaFornecedor.ed_DatFinEnter(Sender: TObject);
begin
vm_StrAnt:=ed_DatFin.Text;
end;

procedure Tfm_FichaFornecedor.ed_DatFinExit(Sender: TObject);
var vm_DatIni:String;
    vm_DatFin:String;
    vm_Filtro:String;
    vm_TestaData : TdateTime;
begin

TRY
IF (Sender as TMaskEdit).Text <> '  /  /    ' THEN
   BEGIN
   vm_TestaData := StrToDate((Sender as TMaskEdit).Text);
   (Sender as TMaskEdit).Text := DateToStr(vm_TestaData);
   END;
EXCEPT
Mensagem('Data Inválida!',StatusBar,True);
(Sender as TMaskEdit).SetFocus;
END;

IF (vm_StrAnt = (Sender as TMaskEdit).Text) THEN
   Exit;

vm_CodigoFornecedor := StrToIntDef(edFornecedorCodigo.Text, 0);

AplicarFiltro();

end;

procedure Tfm_FichaFornecedor.dg_CtasPagarDblClick(Sender: TObject);
begin
                    
fCodigoFornecedor := tb_CtasPagar.FieldByName('CPCODFOR').AsInteger;
fNumeroDuplicata := tb_CtasPagar.FieldByName('CPNUMDUP').AsString;

ModalResult := mrOk;

end;

procedure Tfm_FichaFornecedor.bt_ImprimirClick(Sender: TObject);
begin
{
fm_Relatorio.pg_Relatorio.ActivePage := fm_Relatorio.pg_Faturamento;
fm_Relatorio.ed_DatIniFat.Text := ed_DatIni.Text;
fm_Relatorio.ed_DatFinFat.Text := ed_DatFin.Text;
fm_Relatorio.cb_Fornecedor.KeyValue := cb_Fornecedor.KeyValue;
fm_Relatorio.cb_Faturamento.ItemIndex   := 4;
fm_Relatorio.cb_FaturamentoClick(fm_Relatorio.cb_Faturamento);
fm_Relatorio.ShowModal;
}
end;

procedure Tfm_FichaFornecedor.lblFornecedorLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safafo', 'FOCodFor', 'FONome') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      edFornecedorCodigo.Text := IntToStr(Codigo);
      //vm_CodigoFornecedor := Codigo;

      edFornecedorCodigoExit(Sender);      

      MostrarFornecedor(Codigo);

    END;
  END;

end;

procedure Tfm_FichaFornecedor.edFornecedorCodigoExit(Sender: TObject);
begin

  edFornecedorCodigo.Text := IntToStr(StrToIntDef( Trim(edFornecedorCodigo.Text) , 0));

  MostrarFornecedor(toInt(edFornecedorCodigo.Text));

  vm_CodigoFornecedor := StrToIntDef(edFornecedorCodigo.Text, 0);

  AplicarFiltro();

end;

procedure Tfm_FichaFornecedor.edFornecedorCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblFornecedorLabelClick(Sender);

end;

end.
