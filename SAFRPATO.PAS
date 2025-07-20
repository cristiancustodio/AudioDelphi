unit safrpato;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, ADODB, safdgera;

type
  Trp_Patologia = class(TQuickRep)
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
    QRLabel14: TQRLabel;
    QRBand4: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    qr_Patologia: TADOQuery;
  private

  public

  end;

var
  rp_Patologia: Trp_Patologia;

implementation

{$R *.DFM}

end.
