unit safrvecp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB;

type
  Trp_VencidaCtpg = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    qr_VencidaCtpg: TADOQuery;
    qr_VencidaCtpgCPNumDup: TStringField;
    qr_VencidaCtpgCPCodFor: TIntegerField;
    qr_VencidaCtpgCPDatEmi: TDateField;
    qr_VencidaCtpgCPValDup: TFloatField;
    qr_VencidaCtpgCPDatVen: TDateField;
    qr_VencidaCtpgFONome: TStringField;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
  private

  public

  end;

var
  rp_VencidaCtpg: Trp_VencidaCtpg;

implementation

uses safdgera;

{$R *.DFM}

end.
