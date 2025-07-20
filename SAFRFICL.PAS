unit Safrficl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB;

type
  Trp_FichaCli = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    lb_Periodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    qr_FichaCli: TADOQuery;
    qr_FichaCliDUNumDup: TIntegerField;
    qr_FichaCliDUDatEmi: TDateField;
    qr_FichaCliDUValDup: TFloatField;
    qr_FichaCliDUDatVen: TDateField;
    qr_FichaCliDUDatPag: TDateField;
    qr_FichaCliDUValPag: TFloatField;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRExpr5: TQRExpr;
    qr_FichaCliDU_ValVen: TFloatField;
    QRLabel16: TQRLabel;
    qr_FichaCliDU_ValApg: TFloatField;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    qr_FichaCliDUCodAlu: TIntegerField;
    qr_FichaCliCLNome: TStringField;
    QRLabel18: TQRLabel;
    QRDBText7: TQRDBText;
    qr_FichaCliDUNumPar: TIntegerField;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    procedure qr_FichaCliCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  rp_FichaCli: Trp_FichaCli;

implementation

{$R *.DFM}

procedure Trp_FichaCli.qr_FichaCliCalcFields(DataSet: TDataSet);
begin

IF (qr_FichaCliDUDatVen.Value < Date) AND (qr_FichaCliDUDatPag.IsNull = True) THEN
   qr_FichaCliDU_ValVen.Value := qr_FichaCliDUValDup.Value;

IF qr_FichaCliDUDatPag.IsNull = True THEN
   qr_FichaCliDU_ValApg.Value := qr_FichaCliDUValDup.Value;

end;

end.
