unit Safrcaix;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,funcoes, ADODB;

type
  Trp_Caixa = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    qr_Caixa: TADOQuery;
    qr_CaixaCXDatLan: TDateField;
    qr_CaixaCXTipLan: TStringField;
    qr_CaixaCXHistorico: TStringField;
    qr_CaixaCXValLan: TFloatField;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRExpr3: TQRExpr;
    lb_Periodo: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
    qr_CaixaCX_ValCre: TFloatField;
    qr_CaixaCX_ValDep: TFloatField;
    QRShape11: TQRShape;
    PROCEDURE Total;
    procedure qr_CaixaCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  rp_Caixa: Trp_Caixa;

implementation

Uses SafdGera;

{$R *.DFM}


{ Trp_Caixa }

PROCEDURE Trp_Caixa.Total;
VAR vm_ValSalAnt :Double;
    vm_ValSalAtu :Double;
    vm_ValTotBru :Double;
    vm_Ano       :Word;
    vm_Mes       :Word;
    vm_Dia       :Word;
    vm_DatPri    :TDateTime;
BEGIN
{
vm_ValSalAnt := 0;
vm_ValTotBru := 0;

qr_Caixa.First;
vm_DatPri:=qr_CaixaCXDatLan.Value;
DecodeDate(vm_DatPri,vm_Ano,vm_Mes,vm_Dia);

WHILE qr_Caixa.Eof = False DO
  BEGIN

  IF qr_CaixaCXTipLan.Value = 'Crédito' THEN
     vm_ValTotBru := vm_ValTotBru + qr_CaixaCXValLan.Value
  ELSE
     vm_ValTotBru := vm_ValTotBru - qr_CaixaCXValLan.Value;

  qr_Caixa.Next;

  END;


dm_Geral.tb_Saldo.IndexFieldNames := 'SDAno;SDMes';
dm_Geral.tb_Saldo.FindNearest([vm_Ano,vm_Mes]);
dm_Geral.tb_Saldo.Prior;
IF dm_Geral.tb_Saldo.Bof = False THEN
   vm_ValSalAnt := dm_Geral.tb_SaldoSDSaldo.Value;

dm_Geral.tb_Caixa.IndexFieldNames := 'CXDatLan';
dm_Geral.tb_Caixa.FindNearest([EncodeDate(vm_Ano,vm_Mes,1)]);

WHILE (dm_Geral.tb_Caixa.Eof = False)              AND
      (dm_Geral.tb_CaixaCXAnoLan.Value = vm_Ano) AND
      (dm_Geral.tb_CaixaCXMesLan.Value = vm_Mes) AND
      (dm_Geral.tb_CaixaCXDatLan.Value < vm_DatPri) DO
  BEGIN

  IF dm_Geral.tb_CaixaCXTipLan.Value = 'Crédito' THEN
     vm_ValSalAnt := vm_ValSalAnt + dm_Geral.tb_CaixaCXValLan.Value
  ELSE
     vm_ValSalAnt := vm_ValSalAnt - dm_Geral.tb_CaixaCXValLan.Value;

  dm_Geral.tb_Caixa.Next;

  END;

vm_ValSalAtu := vm_ValSalAnt + vm_ValTotBru;

lb_SaldoAnterior.Caption := FormatFloat('####,##0.00',vm_ValSalAnt);
lb_SaldoAtual.Caption    := FormatFloat('####,##0.00',vm_ValSalAtu);
lb_TotalBruto.Caption    := FormatFloat('####,##0.00',vm_ValTotBru);
 }
END;


procedure Trp_Caixa.qr_CaixaCalcFields(DataSet: TDataSet);
begin
 qr_CaixaCX_ValCre.AsFloat:= Se(qr_CaixaCXTipLan.AsString = 'Crédito', qr_CaixaCXValLan.AsFloat, 0);
 qr_CaixaCX_ValDep.AsFloat:= Se(qr_CaixaCXTipLan.AsString = 'Débito',  qr_CaixaCXValLan.AsFloat, 0);
end;

end.
