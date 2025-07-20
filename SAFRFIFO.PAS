unit Safrfifo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB;

type
  Trp_FichaFor = class(TQuickRep)
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
    QRExpr5: TQRExpr;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    lb_Periodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
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
    qr_FichaFor: TADOQuery;
    qr_FichaForCP_ValVen: TFloatField;
    qr_FichaForCPNumDup: TStringField;
    qr_FichaForCPCodFor: TIntegerField;
    qr_FichaForCPDatEmi: TDateField;
    qr_FichaForCPValDup: TFloatField;
    qr_FichaForCPDatVen: TDateField;
    qr_FichaForCPDatPag: TDateField;
    qr_FichaForCPValPag: TFloatField;
    qr_FichaForFONome: TStringField;
    QRLabel16: TQRLabel;
    qr_FichaForCP_ValApg: TFloatField;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    procedure qr_FichaForCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  rp_FichaFor: Trp_FichaFor;

implementation

uses safdgera;

{$R *.DFM}

procedure Trp_FichaFor.qr_FichaForCalcFields(DataSet: TDataSet);
begin

IF (qr_FichaForCPDatVen.Value < Date) AND (qr_FichaForCPDatPag.IsNull = True) THEN
   qr_FichaForCP_ValVen.Value := qr_FichaForCPValDup.Value;

IF qr_FichaForCPDatPag.IsNull = True THEN
   qr_FichaForCP_ValApg.Value := qr_FichaForCPValDup.Value;

end;

end.
