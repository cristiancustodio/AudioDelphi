unit Safrcrve;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB, safdgera;

type
  Trp_VencidaCtrc = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    qr_VencidaCtrc: TADOQuery;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    qr_VencidaCtrcDUPLNumDup: TIntegerField;
    qr_VencidaCtrcDUPLCodAlu: TIntegerField;
    qr_VencidaCtrcDUPLDatEmi: TDateField;
    qr_VencidaCtrcDUPLValDup: TFloatField;
    qr_VencidaCtrcDUPLDatVen: TDateField;
    qr_VencidaCtrcALUNNome: TStringField;
    qr_VencidaCtrcDUPLNumPar: TIntegerField;
    qr_VencidaCtrcALUNTelefone: TStringField;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
  private

  public

  end;

var
  rp_VencidaCtrc: Trp_VencidaCtrc;

implementation

{$R *.DFM}

end.
