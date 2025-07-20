unit Safrabpg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB, safdgera;

type
  Trp_AbertaCtpg = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
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
    lb_Periodo: TQRLabel;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    qr_AbertaCtpg: TADOQuery;
    qr_AbertaCtpgCPNumDup: TStringField;
    qr_AbertaCtpgCPCodFor: TIntegerField;
    qr_AbertaCtpgCPDatEmi: TDateField;
    qr_AbertaCtpgCPValDup: TFloatField;
    qr_AbertaCtpgCPDatVen: TDateField;
    qr_AbertaCtpgFONome: TStringField;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
  private

  public

  end;

var
  rp_AbertaCtpg: Trp_AbertaCtpg;

implementation


{$R *.DFM}

end.
