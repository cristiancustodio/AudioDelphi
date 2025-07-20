unit Safrqtcr;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB;

type
  Trp_QuitadaCtrc = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    lb_Periodo: TQRLabel;
    qr_QuitadaCtrc: TADOQuery;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRDBText5: TQRDBText;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    qr_QuitadaCtrcDUPLNumDup: TIntegerField;
    qr_QuitadaCtrcDUPLCodAlu: TIntegerField;
    qr_QuitadaCtrcDUPLDatEmi: TDateField;
    qr_QuitadaCtrcDUPLValDup: TFloatField;
    qr_QuitadaCtrcDUPLDatVen: TDateField;
    qr_QuitadaCtrcDUPLDatPag: TDateField;
    qr_QuitadaCtrcDUPLValPag: TFloatField;
    qr_QuitadaCtrcALUNNome: TStringField;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    qr_QuitadaCtrcDUPLNumPar: TIntegerField;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
  private

  public

  end;

var
  rp_QuitadaCtrc: Trp_QuitadaCtrc;

implementation

{$R *.DFM}

end.
