unit safrpaci;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, ADODB, safdgera;

type
  Trp_Paciente = class(TQuickRep)
    qr_Paciente: TADOQuery;
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
  private

  public

  end;

var
  rp_Paciente: Trp_Paciente;

implementation

{$R *.DFM}

end.
