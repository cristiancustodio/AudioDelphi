unit safrserv;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, ADODB, safdgera;

type
  Trp_Servico = class(TQuickRep)
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
    qr_Servico: TADOQuery;
  private

  public

  end;

var
  rp_Servico: Trp_Servico;

implementation

{$R *.DFM}

end.
