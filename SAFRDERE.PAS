unit Safrdere;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB, safdgera;

type
  Trp_DespesaRes = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    qr_DespesaRes: TADOQuery;
    lb_Periodo: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
  private

  public

  end;

var
  rp_DespesaRes: Trp_DespesaRes;

implementation

{$R *.DFM}

end.
