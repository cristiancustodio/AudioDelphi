unit safrexpe;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Math, ADODB,
  jpeg;

type
  Trp_ExamePeriodo = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    lb_Paciente: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    qr_ExamePeriodo: TADOQuery;
    QRGroup1: TQRGroup;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    lb_Periodo: TQRLabel;
    QRLabel6: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel17: TQRLabel;
    tb_ItemExame: TADOQuery;
    tb_ItemExameIENumExa: TIntegerField;
    tb_ItemExameIENumSeq: TIntegerField;
    tb_ItemExameIEHz: TStringField;
    tb_ItemExameIEDb: TIntegerField;
    tb_ItemExameIEVia: TStringField;
    tb_ItemExameIEOrelha: TStringField;
    tb_ItemExameIEMascarada: TBooleanField;
    tb_ItemExameIEAusente: TBooleanField;
    qr_ExamePeriodoPCNome: TStringField;
    qr_ExamePeriodoFCDescricao: TStringField;
    qr_ExamePeriodoEMFantasia: TStringField;
    qr_ExamePeriodoEXLaudoD: TStringField;
    qr_ExamePeriodoEXLaudoE: TStringField;
    qr_ExamePeriodoEXNumExa: TIntegerField;
    QRLabel18: TQRLabel;
    tb_Exame: TADOQuery;
    tb_ExameEXNumExa: TIntegerField;
    tb_ExameEXDatExa: TDateField;
    tb_ExameEXTipExa: TStringField;
    tb_ExameEXCodPac: TIntegerField;
    tb_ExameEXCodEmp: TIntegerField;
    qr_ExamePeriodoEXCodEmp: TIntegerField;
    qr_ExamePeriodoEXCodPac: TIntegerField;
    ds_ExamePeriodo: TDataSource;
    ds_Exame: TDataSource;
    QRLabel20: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel21: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel22: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape8: TQRShape;
    QRImage1: TQRImage;
    tb_ExameEXMedia01D: TFloatField;
    tb_ExameEXMedia02D: TFloatField;
    tb_ExameEXMedia01E: TFloatField;
    tb_ExameEXMedia02E: TFloatField;
    procedure qr_ExamePeriodoAfterScroll(DataSet: TDataSet);
    procedure qr_ExamePeriodoAfterOpen(DataSet: TDataSet);
  private

  public

  end;

CONST
  Nulo = -100;

var
  rp_ExamePeriodo: Trp_ExamePeriodo;

implementation

uses safdgera;

{$R *.DFM}

procedure Trp_ExamePeriodo.qr_ExamePeriodoAfterScroll(DataSet: TDataSet);
VAR vm_VetViaAerDirUlt :Array[1..8] OF Integer;
    vm_VetViaAerEsqUlt :Array[1..8] OF Integer;
    vm_VetViaAerDirPri :Array[1..8] OF Integer;
    vm_VetViaAerEsqPri :Array[1..8] OF Integer;
    vm_VetDifAerDir    :Array[1..8] OF Integer;
    vm_VetDifAerEsq    :Array[1..8] OF Integer;
    vm_VetMedUlt       :Array[1..4] OF Double;
    vm_VetMedPri       :Array[1..4] OF Double;
    vm_VetMedDif       :Array[1..4] OF Double;
    I:Byte;
begin

lb_Paciente.Font.Color := clBlack;

FOR I:=1 TO 8 DO
    BEGIN
    vm_VetViaAerDirUlt[I]   := Nulo;
    vm_VetViaAerEsqUlt[I]   := Nulo;
    vm_VetViaAerDirPri[I]   := Nulo;
    vm_VetViaAerEsqPri[I]   := Nulo;
    END;


tb_Exame.Last;
IF (tb_ExameEXTipExa.Value = 'Admissional') OR
   (tb_Exame.RecordCount = 1) THEN
   Exit;

vm_VetMedUlt[1] := tb_ExameEXMedia01D.Value;
vm_VetMedUlt[2] := tb_ExameEXMedia02D.Value;
vm_VetMedUlt[3] := tb_ExameEXMedia01E.Value;
vm_VetMedUlt[4] := tb_ExameEXMedia02E.Value;

tb_ItemExame.First;
WHILE tb_ItemExame.Eof = False DO
  BEGIN

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'D') THEN
     vm_VetViaAerDirUlt[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value;

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'E') THEN
     vm_VetViaAerEsqUlt[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value;

  tb_ItemExame.Next;

  END;


WHILE (tb_Exame.Bof = False) AND (tb_ExameEXTipExa.Value <> 'Admissional') DO
      tb_Exame.Prior;

vm_VetMedPri[1] := tb_ExameEXMedia01D.Value;
vm_VetMedPri[2] := tb_ExameEXMedia02D.Value;
vm_VetMedPri[3] := tb_ExameEXMedia01E.Value;
vm_VetMedPri[4] := tb_ExameEXMedia02E.Value;

tb_ItemExame.First;
WHILE tb_ItemExame.Eof = False DO
  BEGIN

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'D') THEN
     vm_VetViaAerDirPri[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value;

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'E') THEN
     vm_VetViaAerEsqPri[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value;

  tb_ItemExame.Next;

  END;

  
FOR I:=1 TO 8 DO
    BEGIN

    IF (vm_VetViaAerDirUlt[I] = Nulo) OR (vm_VetViaAerDirPri[I] = Nulo) THEN
       vm_VetDifAerDir[I] := Nulo
    ELSE
       vm_VetDifAerDir[I] := vm_VetViaAerDirUlt[I] - vm_VetViaAerDirPri[I];

    IF (vm_VetViaAerEsqUlt[I] = Nulo) OR (vm_VetViaAerEsqPri[I] = Nulo) THEN
       vm_VetDifAerEsq[I] := Nulo
    ELSE
       vm_VetDifAerEsq[I] := vm_VetViaAerEsqUlt[I] - vm_VetViaAerEsqPri[I];

    END;

IF (MaxIntValue(vm_VetDifAerDir) >= 15) OR
   (MaxIntValue(vm_VetDifAerEsq) >= 15) THEN
   lb_Paciente.Font.Color := clRed
ELSE
   BEGIN

   FOR I:=1 TO 4 DO
       vm_VetMedDif[I] := vm_VetMedUlt[I] - vm_VetMedPri[I];

   IF (MaxValue(vm_VetMedDif) >= 10) THEN
   lb_Paciente.Font.Color := clRed;

   END;

end;

procedure Trp_ExamePeriodo.qr_ExamePeriodoAfterOpen(DataSet: TDataSet);
begin
 tb_Exame.Open;
 tb_ItemExame.Open;
end;

end.
