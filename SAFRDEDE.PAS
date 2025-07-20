unit Safrdede;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB, safdgera;

type
  Trp_DespesaDet = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    lb_Periodo: TQRLabel;
    qr_DespesaDet: TADOQuery;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
  private

  public

  end;

var
  rp_DespesaDet: Trp_DespesaDet;

implementation

{$R *.DFM}

end.
