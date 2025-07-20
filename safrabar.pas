unit safrabar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB, safdgera;

type
  Trp_AbertaCtrc = class(TQuickRep)
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
    qr_AbertaCtrc: TADOQuery;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    lb_Periodo: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    qr_AbertaCtrcDUPLNumDup: TIntegerField;
    qr_AbertaCtrcDUPLCodAlu: TIntegerField;
    qr_AbertaCtrcDUPLDatEmi: TDateField;
    qr_AbertaCtrcDUPLValDup: TFloatField;
    qr_AbertaCtrcDUPLDatVen: TDateField;
    qr_AbertaCtrcALUNNome: TStringField;
    qr_AbertaCtrcDUPLNumPar: TIntegerField;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
  private

  public

  end;

var
  rp_AbertaCtrc: Trp_AbertaCtrc;

implementation

{$R *.DFM}

end.
