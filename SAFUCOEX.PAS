unit safucoex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, ADODB, safdgera;

type
  Tfm_ExameAnterior = class(TForm)
    sp_Direita: TShape;
    sp_250d: TShape;
    sp_500d: TShape;
    sp_1d: TShape;
    sp_2d: TShape;
    sp_3d: TShape;
    sp_4d: TShape;
    sp_6d: TShape;
    sp_8d: TShape;
    sp_: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBGrid1: TDBGrid;
    sp_Esquerda: TShape;
    sp_250e: TShape;
    sp_500e: TShape;
    sp_1e: TShape;
    sp_2e: TShape;
    sp_3e: TShape;
    sp_4e: TShape;
    sp_6e: TShape;
    sp_8e: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    qr_Exame: TADOQuery;
    ds_Exame: TDataSource;
    DBText1: TDBText;
    qr_ExameEXNumExa: TIntegerField;
    qr_ExameEXDatExa: TDateField;
    qr_ExameEXTipExa: TStringField;
    qr_ExamePCCodPac: TIntegerField;
    qr_ExamePCNome: TStringField;
    tb_ItemExame: TADOQuery;
    tb_ItemExameIENumExa: TIntegerField;
    tb_ItemExameIENumSeq: TIntegerField;
    tb_ItemExameIEVia: TStringField;
    tb_ItemExameIEOrelha: TStringField;
    tb_ItemExameIEHz: TStringField;
    tb_ItemExameIEDb: TIntegerField;
    tb_ItemExameIEMascarada: TBooleanField;
    tb_ItemExameIEAusente: TBooleanField;
    im_Grafico: TImage;
    PROCEDURE Simbolo(X,Y:Integer; vm_ParSimbolo:String; vm_ParAusente:Boolean);
    procedure qr_ExameAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

CONST Nulo = -100;

var
  fm_ExameAnterior: Tfm_ExameAnterior;
  vm_VetHz        : Array[1..8] OF String;  

implementation

{$R *.DFM}

PROCEDURE Tfm_ExameAnterior.Simbolo(X,Y:Integer; vm_ParSimbolo:String; vm_ParAusente:Boolean);
VAR vm_PosEsq:Integer;
    vm_PosTop:Integer;
BEGIN

IF vm_ParSimbolo = 'Circulo' THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.Ellipse(X-5,Y-4,X+5,Y+6);
   vm_PosEsq := X-3;
   vm_PosTop := Y+05;
   END;

IF vm_ParSimbolo = 'Triangulo' THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-6,Y+6);
   im_Grafico.Canvas.LineTo(X,Y-6);
   im_Grafico.Canvas.LineTo(X+6,Y+6);
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.LineTo(X-6,Y+6);
   vm_PosEsq := X-05;
   vm_PosTop := Y+07;
   END;

IF vm_ParSimbolo = 'Quadrado' THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.Rectangle(X-4,Y-4,X+6,Y+6);
   vm_PosEsq := X-3;
   vm_PosTop := Y+06;
   END;

IF (vm_ParSimbolo = 'X')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(X-5,Y+5);
   im_Grafico.Canvas.LineTo(X+5,Y-5);
   im_Grafico.Canvas.MoveTo(X+5,Y+5);
   im_Grafico.Canvas.LineTo(X-5,Y-5);
   vm_PosEsq := X-05;
   vm_PosTop := Y+05;
   END;

IF (vm_ParSimbolo = '[')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(X-08,Y-5);
   im_Grafico.Canvas.LineTo(X-13,Y-5);
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-13,Y-4);
   im_Grafico.Canvas.LineTo(X-13,Y+5);
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.LineTo(X-08,Y+5);
   vm_PosEsq := X-13;
   vm_PosTop := Y+06;
   END;


IF (vm_ParSimbolo = ']')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(X+04,Y-5);
   im_Grafico.Canvas.LineTo(X+09,Y-5);
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X+09,Y-4);
   im_Grafico.Canvas.LineTo(X+09,Y+5);
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.LineTo(X+04,Y+5);
   vm_PosEsq := X+09;
   vm_PosTop := Y+06;
   END;

IF (vm_ParSimbolo = '<')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clRed;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-5,Y-5);
   im_Grafico.Canvas.LineTo(X-15,Y);
   im_Grafico.Canvas.LineTo(X-5,Y+5);
   vm_PosEsq := X-15;
   vm_PosTop := Y;
   END;

IF (vm_ParSimbolo = '>')  THEN
   BEGIN
   im_Grafico.Canvas.Pen.Color := clBlue;
   im_Grafico.Canvas.Pen.Style := psSolid;
   im_Grafico.Canvas.Pen.Width := 2;
   im_Grafico.Canvas.MoveTo(X-5+10,Y-5);
   im_Grafico.Canvas.LineTo(X+5+10,Y);
   im_Grafico.Canvas.LineTo(X-5+10,Y+5);
   vm_PosEsq := X+14;
   vm_PosTop := Y+02;
   END;


IF vm_ParAusente = True THEN
   BEGIN
   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.MoveTo(vm_PosEsq,vm_PosTop);
   im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop+09);
   im_Grafico.Canvas.MoveTo(vm_PosEsq-3,vm_PosTop+6);
   im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop+09);
   im_Grafico.Canvas.LineTo(vm_PosEsq+3,vm_PosTop+6);
   END;

END;


procedure Tfm_ExameAnterior.qr_ExameAfterScroll(DataSet: TDataSet);
VAR vm_Proporcao:Real;
    vm_VetViaAerDir   :Array[1..8] OF Integer;
    vm_VetMascaradaAD :Array[1..8] OF Boolean;
    vm_VetAusenteAD   :Array[1..8] OF Boolean;
    vm_VetViaAerEsq   :Array[1..8] OF Integer;
    vm_VetMascaradaAE :Array[1..8] OF Boolean;
    vm_VetAusenteAE   :Array[1..8] OF Boolean;
    vm_VetViaOssDir   :Array[1..8] OF Integer;
    vm_VetMascaradaOD :Array[1..8] OF Boolean;
    vm_VetAusenteOD   :Array[1..8] OF Boolean;
    vm_VetViaOssEsq   :Array[1..8] OF Integer;
    vm_VetMascaradaOE :Array[1..8] OF Boolean;
    vm_VetAusenteOE   :Array[1..8] OF Boolean;
    I:Byte;
    vm_PosEsq         :Integer;
    vm_PosTop         :Integer;
begin

FOR I:=1 TO 8 DO
    BEGIN
    vm_VetViaAerDir[I]   := Nulo;
    vm_VetViaAerEsq[I]   := Nulo;
    vm_VetViaOssDir[I]   := Nulo;
    vm_VetViaOssEsq[I]   := Nulo;
    END;


// Mostrar Gráfico

IF Not tb_ItemExame.Active THEN tb_ItemExame.Active := true;

tb_ItemExame.Refresh;

im_Grafico.Free;
im_Grafico        := TImage.Create(Self);
im_Grafico.Parent := fm_ExameAnterior;

im_Grafico.Align       := alClient;
im_Grafico.Transparent := True;

im_Grafico.SendToBack();
im_Grafico.Canvas.Brush.Color := clBtnFace;
im_Grafico.Canvas.Pen.Color := clBtnFace;
im_Grafico.Canvas.Rectangle(0, im_Grafico.Top, im_Grafico.Width, im_Grafico.Height);

vm_Proporcao := sp_Direita.Height/150;

// Carregar os vetores
tb_ItemExame.First;

WHILE (tb_ItemExame.Eof = False) DO
  BEGIN

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'D') THEN
     BEGIN
     vm_VetViaAerDir[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaAD[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteAD[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;

  IF (tb_ItemExameIEVia.Value = 'A') AND (tb_ItemExameIEOrelha.Value= 'E') THEN
     BEGIN
     vm_VetViaAerEsq[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaAE[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteAE[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;

  IF (tb_ItemExameIEVia.Value = 'O') AND (tb_ItemExameIEOrelha.Value= 'D') THEN
     BEGIN
     vm_VetViaOssDir[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaOD[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteOD[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;

  IF (tb_ItemExameIEVia.Value = 'O') AND (tb_ItemExameIEOrelha.Value= 'E') THEN
     BEGIN
     vm_VetViaOssEsq[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEDb.Value+20;
     vm_VetMascaradaOE[tb_ItemExameIENumSeq.Value] := tb_ItemExameIEMascarada.Value;
     vm_VetAusenteOE[tb_ItemExameIENumSeq.Value]   := tb_ItemExameIEAusente.Value;
     END;


  tb_ItemExame.Next;

  END;


// Desenhar linha do Gráfico Esquerdo

im_Grafico.Canvas.Brush.Color := clNone;
im_Grafico.Canvas.Brush.Style := bsClear;
im_Grafico.Canvas.Pen.Color   := clRed;
im_Grafico.Canvas.Pen.Style   := psSolid;

FOR I:=1 TO 8 DO
    BEGIN

    vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'d')).Left;
    vm_PosTop := sp_Direita.Top+Round(vm_VetViaAerDir[I]*vm_Proporcao);

    IF (vm_VetAusenteAD[I] = False) AND (I<>1) AND
       (vm_VetViaAerDir[I-1]<>Nulo) AND
       (vm_VetViaAerDir[I]  <>Nulo) THEN
       im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop)
    ELSE
       im_Grafico.Canvas.MoveTo(vm_PosEsq,vm_PosTop);

    END;


// Desenhar linha do Gráfico Direito

im_Grafico.Canvas.Pen.Color := clBlue;
im_Grafico.Canvas.Pen.Style := psDot;

FOR I:=1 TO 8 DO
    BEGIN

    vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'e')).Left;
    vm_PosTop := sp_Esquerda.Top+Round(vm_VetViaAerEsq[I]*vm_Proporcao);

    IF (vm_VetAusenteAE[I] = False) AND (I<>1) AND
       (vm_VetViaAerEsq[I-1]<>Nulo) AND
       (vm_VetViaAerEsq[I]  <>Nulo) THEN       
       im_Grafico.Canvas.LineTo(vm_PosEsq,vm_PosTop)
    ELSE
       im_Grafico.Canvas.MoveTo(vm_PosEsq,vm_PosTop);

    END;


// Mostrar os simbolos

FOR I:=1 TO 8 DO
  BEGIN

  // Direita
  IF vm_VetViaAerDir[I] <> Nulo THEN
     BEGIN

     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'d')).Left;
     vm_PosTop := sp_Direita.Top+Round(vm_VetViaAerDir[I]*vm_Proporcao);

     IF vm_VetMascaradaAD[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'Circulo',vm_VetAusenteAD[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,'Triangulo',vm_VetAusenteAD[I]);

     END;

  // Direita
  IF vm_VetViaOssDir[I] <> Nulo THEN
     BEGIN

     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'d')).Left;
     vm_PosTop := sp_Direita.Top+Round(vm_VetViaOssDir[I]*vm_Proporcao);

     IF vm_VetMascaradaOD[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'<',vm_VetAusenteOD[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,'[',vm_VetAusenteOD[I]);

     END;


  // Esquerda
  IF vm_VetViaAerEsq[I] <> Nulo THEN
     BEGIN

     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'e')).Left;
     vm_PosTop := sp_Esquerda.Top+Round(vm_VetViaAerEsq[I]*vm_Proporcao);

     IF vm_VetMascaradaAE[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'X',vm_VetAusenteAE[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,'Quadrado',vm_VetAusenteAE[I]);

     END;

  // Esquerda
  IF vm_VetViaOssEsq[I] <> Nulo THEN
     BEGIN
     vm_PosEsq := TShape(FindComponent('sp_'+vm_VetHz[I]+'e')).Left;
     vm_PosTop := sp_Esquerda.Top+Round(vm_VetViaOssEsq[I]*vm_Proporcao);

     IF vm_VetMascaradaOE[I] = False THEN
        Simbolo(vm_PosEsq,vm_PosTop,'>',vm_VetAusenteOE[I])
     ELSE
        Simbolo(vm_PosEsq,vm_PosTop,']',vm_VetAusenteOE[I]);

     END;

  END;


end;

procedure Tfm_ExameAnterior.FormCreate(Sender: TObject);
begin
 qr_Exame.Active := true;
// tb_ItemExame.Active := true;
end;

INITIALIZATION

vm_VetHz[1] := '250';
vm_VetHz[2] := '500';
vm_VetHz[3] := '1';
vm_VetHz[4] := '2';
vm_VetHz[5] := '3';
vm_VetHz[6] := '4';
vm_VetHz[7] := '6';
vm_VetHz[8] := '8';


end.
