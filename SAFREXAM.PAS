unit safrExam;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, ADODB;

type
  Trp_Exame = class(TQuickRep)
    qr_Exame: TADOQuery;
    tb_ItemExame: TADOQuery;
    ds_Exame: TDataSource;
    TitleBand1: TQRBand;
    tb_ItemExameIENumExa: TIntegerField;
    tb_ItemExameIENumSeq: TIntegerField;
    tb_ItemExameIEVia: TStringField;
    tb_ItemExameIEOrelha: TStringField;
    tb_ItemExameIEHz: TStringField;
    tb_ItemExameIEDb: TIntegerField;
    tb_ItemExameIEMascarada: TBooleanField;
    tb_ItemExameIEAusente: TBooleanField;
    qr_ExameEXNumExa: TIntegerField;
    qr_ExameEXDatExa: TDateTimeField;
    qr_ExameEXTipExa: TStringField;
    qr_ExameEXNumHorRep: TIntegerField;
    qr_ExameEXDatCal: TDateField;
    qr_ExameEXSTROD: TIntegerField;
    qr_ExameEXSTROE: TIntegerField;
    qr_ExameEXAlertaFalaOD: TIntegerField;
    qr_ExameEXAlertaFalaOE: TIntegerField;
    qr_ExameEXMonoDbOD: TIntegerField;
    qr_ExameEXMonoPerOD: TFloatField;
    qr_ExameEXDiDbOD: TIntegerField;
    qr_ExameEXDiPerOD: TFloatField;
    qr_ExameEXMonoDbOE: TIntegerField;
    qr_ExameEXMonoPerOE: TFloatField;
    qr_ExameEXDiDbOE: TIntegerField;
    qr_ExameEXDiPerOE: TFloatField;
    qr_ExameEXPerdaOD: TStringField;
    qr_ExameEXPerdaOE: TStringField;
    qr_ExameEXObservacao: TMemoField;
    qr_ExameEXRepetir: TBooleanField;
    qr_ExameEXImitanciomaetria: TBooleanField;
    qr_ExameEXTonal: TBooleanField;
    qr_ExameEXOtorrinolaringologista: TBooleanField;
    qr_ExameEXLogoaudiometria: TBooleanField;
    qr_ExameEXLogoOD: TBooleanField;
    qr_ExameEXLogoOE: TBooleanField;
    qr_ExameEXVAOD: TBooleanField;
    qr_ExameEXVAOE: TBooleanField;
    qr_ExameEXVOOD: TBooleanField;
    qr_ExameEXVOOE: TBooleanField;
    qr_ExameEXLaudoD: TStringField;
    qr_ExameEXLaudoE: TStringField;
    qr_ExameEXGrauD: TStringField;
    qr_ExameEXGrauE: TStringField;
    qr_ExameEXFrequenciaD: TStringField;
    qr_ExameEXFrequenciaE: TStringField;
    qr_ExameAUDescricao: TStringField;
    qr_ExameEMFantasia: TStringField;
    qr_ExamePCNome: TStringField;
    qr_ExameFCDescricao: TStringField;
    im_Grafico: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qr_ExamePCNumDoc: TStringField;
    QRDBText3: TQRDBText;
    qr_ExamePCTipDoc: TStringField;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    qr_ExamePCDatNas: TDateField;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    qr_ExameEX_Idade: TStringField;
    qr_ExamePCSexo: TStringField;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText15: TQRDBText;
    qr_ExameEXCodMeaOD: TIntegerField;
    qr_ExameEXCodMeaOE: TIntegerField;
    qr_ExameEXMeatoscopiaOD: TStringField;
    qr_ExameEXMeatoscopiaOE: TStringField;
    QRShape1: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText28: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel47: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel48: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel49: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel50: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel51: TQRLabel;
    QRExpr10: TQRExpr;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape13: TQRShape;
    QRLabel55: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    lb_500D: TQRLabel;
    QRLabel62: TQRLabel;
    lb_1D: TQRLabel;
    QRLabel64: TQRLabel;
    lb_2D: TQRLabel;
    QRLabel66: TQRLabel;
    lb_3D: TQRLabel;
    QRLabel68: TQRLabel;
    lb_4D: TQRLabel;
    QRLabel70: TQRLabel;
    lb_6D: TQRLabel;
    QRLabel72: TQRLabel;
    lb_8D: TQRLabel;
    QRLabel61: TQRLabel;
    lb_500E: TQRLabel;
    QRLabel65: TQRLabel;
    lb_1E: TQRLabel;
    QRLabel69: TQRLabel;
    lb_2E: TQRLabel;
    QRLabel73: TQRLabel;
    lb_3E: TQRLabel;
    QRLabel75: TQRLabel;
    lb_4E: TQRLabel;
    QRLabel77: TQRLabel;
    lb_6E: TQRLabel;
    QRLabel79: TQRLabel;
    lb_8E: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRLabel71: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel74: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel98: TQRLabel;
    qr_ExameSTDescricao: TStringField;
    QRImage1: TQRImage;
    QRShape18: TQRShape;
    QRLabel4: TQRLabel;
    qr_ExameEXMedia01D: TFloatField;
    qr_ExameEXMedia02D: TFloatField;
    qr_ExameEXMedia01E: TFloatField;
    qr_ExameEXMedia02E: TFloatField;
    qr_ExameEX_GRAUD: TStringField;
    qr_ExameEX_GRAUE: TStringField;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    procedure qr_ExameCalcFields(DataSet: TDataSet);
  private

  public
    procedure GerarGraficoExame(vm_ParExame:Integer);

  end;

CONST Nulo = -100;

var
  rp_Exame: Trp_Exame;

implementation

Uses Safdgera, safurela, saffgrex;

{$R *.DFM}


procedure Trp_Exame.GerarGraficoExame(vm_ParExame: Integer);
var vm_Frequencia :String;
begin

  im_Grafico.Picture.LoadFromFile(GerarJPGGraficoExame(vm_ParExame));
  im_Grafico.Left := 16;
  im_Grafico.Top := 310;

  vm_Frequencia := qr_ExameEXFrequenciaD.Value;
  WHILE vm_Frequencia <> '' DO
    BEGIN
    TQRLabel(FindComponent('lb_'+IntToStr
             (StrToInt(Copy(vm_Frequencia,1,3)))+'D')).Caption := '[X]';
    Delete(vm_Frequencia,1,3);
    END;

  vm_Frequencia := qr_ExameEXFrequenciaE.Value;
  WHILE vm_Frequencia <> '' DO
    BEGIN
    TQRLabel(FindComponent('lb_'+IntToStr
             (StrToInt(Copy(vm_Frequencia,1,3)))+'E')).Caption := '[X]';
    Delete(vm_Frequencia,1,3);
    END;




end;

procedure Trp_Exame.qr_ExameCalcFields(DataSet: TDataSet);
VAR vm_AnoAtu,vm_MesAtu,vm_DiaAtu:Word;
    vm_AnoNas,vm_MesNas,vm_DiaNas:Word;
    vm_IdadeMes:LongInt;
    vm_AtualMes:LongInt;
begin

IF qr_ExamePCDatNas.IsNull = False THEN
   BEGIN
   DecodeDate(qr_ExameEXDatExa.Value,vm_AnoAtu,vm_MesAtu,vm_DiaAtu);
   DecodeDate(qr_ExamePCDatNas.Value,vm_AnoNas,vm_MesNas,vm_DiaNas);
   vm_IdadeMes := (vm_AnoNas*12)+vm_MesNas;
   vm_AtualMes := (vm_AnoAtu*12)+vm_MesAtu;
   qr_ExameEX_Idade.Value :=
               FormatFloat('#00',Int((vm_AtualMes-vm_IdadeMes)/12))+' anos e ' +
               FormatFloat('00',Frac((vm_AtualMes-vm_IdadeMes)/12)*12)+' meses';
   END
ELSE
   BEGIN
   qr_ExameEX_Idade.Clear;
   END;


IF qr_ExameEXGrauD.IsNull = False THEN
   BEGIN
   qr_ExameEX_GRAUD.Value := qr_ExameEXGrauD.AsString;
   END
ELSE
   BEGIN
   qr_ExameEX_GRAUD.Value := '-------------------------------------------------------------------------------------------';
   END;

IF qr_ExameEXGrauE.IsNull = False THEN
   BEGIN
   qr_ExameEX_GRAUE.Value := qr_ExameEXGrauE.AsString;
   END
ELSE
   BEGIN
   qr_ExameEX_GRAUE.Value := '-------------------------------------------------------------------------------------------';
   END;


end;

end.
