unit Safrqtpg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB;

type
  Trp_QuitadaCtpg = class(TQuickRep)
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
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    qr_QuitadaCtpg: TADOQuery;
    qr_QuitadaCtpgCPNumDup: TStringField;
    qr_QuitadaCtpgCPCodFor: TIntegerField;
    qr_QuitadaCtpgCPDatEmi: TDateField;
    qr_QuitadaCtpgCPValDup: TFloatField;
    qr_QuitadaCtpgCPDatVen: TDateField;
    qr_QuitadaCtpgCPDatPag: TDateField;
    qr_QuitadaCtpgCPValPag: TFloatField;
    qr_QuitadaCtpgFONome: TStringField;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
  private

  public

  end;

var
  rp_QuitadaCtpg: Trp_QuitadaCtpg;

implementation

uses safdgera;

{$R *.DFM}

end.
