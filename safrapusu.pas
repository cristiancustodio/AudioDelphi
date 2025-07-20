unit safrapusu;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, ADODB, safdgera;

type
  Trp_AparelhoUsuario = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    qr_AparelhoUsuario: TADOQuery;
  private

  public

  end;

var
  rp_AparelhoUsuario: Trp_AparelhoUsuario;

implementation

{$R *.DFM}

end.
