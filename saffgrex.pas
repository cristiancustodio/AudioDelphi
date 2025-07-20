unit saffgrex;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, JPEG, funcoes;


function GerarJPGGraficoExame(vm_ParExame: Integer):String;

procedure DesenharTabela;
procedure GerarGrafico(vm_ParExame:Integer);
procedure ExibirSimbolo(X, Y: Integer; vm_ParSimbolo: String; vm_ParAusente: Boolean);
procedure PreparaQueryExame(vm_ParExame: Integer);

CONST Nulo = -100;

var
  im_Grafico: TImage;
  vm_PosInicio   : Integer;
  vm_VetPosHzDir : ARRAY [1..8] OF Integer;
  vm_VetPosHzEsq : ARRAY [1..8] OF Integer;
  oQueryExame: TADOQuery;
  oQueryItemExame: TADOQuery;
  oDataSourceExame: TDataSource;

implementation

uses safdgera;


PROCEDURE DesenharTabela;
BEGIN

//IF fm_Relatorio.ck_Formulario.Checked = True THEN
//   BEGIN
   // Orelha direita
   im_Grafico.Canvas.Brush.Color      := clWhite;
   im_Grafico.Canvas.Font.Color       := clBlack;
   im_Grafico.Canvas.Font.Name        := 'Times New Roman';
   im_Grafico.Canvas.Font.Style       := [fsItalic];
   im_Grafico.Canvas.Font.Size        := 16;
   im_Grafico.Canvas.TextOut(30,08,'Orelha Direita');


   im_Grafico.Canvas.Font.Color       := clBlack;
   im_Grafico.Canvas.Font.Style       := [];
   im_Grafico.Canvas.Font.Size        := 10;

   im_Grafico.Canvas.TextOut(055,35,'250');
   im_Grafico.Canvas.TextOut(091,35,'500');
   im_Grafico.Canvas.TextOut(131,35,'1K');
   im_Grafico.Canvas.TextOut(168,35,'2K');
   im_Grafico.Canvas.TextOut(196,35,'3K');
   im_Grafico.Canvas.TextOut(222,35,'4K');
   im_Grafico.Canvas.TextOut(248,35,'6K');
   im_Grafico.Canvas.TextOut(274,35,'8K');
   im_Grafico.Canvas.TextOut(301,36,'Hz');

   im_Grafico.Canvas.TextOut(09,059,'-10');
   im_Grafico.Canvas.TextOut(18,074,'0');
   im_Grafico.Canvas.TextOut(12,089,'10');
   im_Grafico.Canvas.TextOut(12,104,'20');
   im_Grafico.Canvas.TextOut(12,119,'30');
   im_Grafico.Canvas.TextOut(12,134,'40');
   im_Grafico.Canvas.TextOut(12,149,'50');
   im_Grafico.Canvas.TextOut(12,164,'60');
   im_Grafico.Canvas.TextOut(12,179,'70');
   im_Grafico.Canvas.TextOut(12,194,'80');
   im_Grafico.Canvas.TextOut(12,209,'90');
   im_Grafico.Canvas.TextOut(06,224,'100');
   im_Grafico.Canvas.TextOut(06,239,'110');
   im_Grafico.Canvas.TextOut(06,254,'120');
   im_Grafico.Canvas.TextOut(11,271,'dB');

   im_Grafico.Canvas.Brush.Color := clWhite;
   im_Grafico.Canvas.Pen.Color   := clBlack;
   im_Grafico.Canvas.Pen.Style   := psSolid;
   im_Grafico.Canvas.Pen.Width := 1;

   im_Grafico.Canvas.Rectangle(30,51,30+273,51+225); // sp_Direita

   im_Grafico.Canvas.Brush.Color := clBlack;

   im_Grafico.Canvas.Rectangle(067,52,067+1,52+224); // 250
   im_Grafico.Canvas.Rectangle(104,52,104+1,52+224); // 500
   im_Grafico.Canvas.Rectangle(140,52,140+1,52+224); // 1
   im_Grafico.Canvas.Rectangle(177,52,177+1,52+224); // 2
   im_Grafico.Canvas.Rectangle(203,52,203+1,52+224); // 3
   im_Grafico.Canvas.Rectangle(228,52,228+1,52+224); // 4
   im_Grafico.Canvas.Rectangle(254,52,254+1,52+224); // 6
   im_Grafico.Canvas.Rectangle(278,52,278+1,52+224); // 8

   // Linhas horizontais
   im_Grafico.Canvas.Brush.Color := clBlack;

   im_Grafico.Canvas.Rectangle(30,066,30+273,066+1);
   im_Grafico.Canvas.Rectangle(30,080,30+273,080+3);
   im_Grafico.Canvas.Rectangle(30,096,30+273,096+1);
   im_Grafico.Canvas.Rectangle(30,111,30+273,111+1);
   im_Grafico.Canvas.Rectangle(30,126,30+273,126+1);
   im_Grafico.Canvas.Rectangle(30,141,30+273,141+1);
   im_Grafico.Canvas.Rectangle(30,156,30+273,156+1);
   im_Grafico.Canvas.Rectangle(30,171,30+273,171+1);
   im_Grafico.Canvas.Rectangle(30,186,30+273,186+1);
   im_Grafico.Canvas.Rectangle(30,201,30+273,201+1);
   im_Grafico.Canvas.Rectangle(30,216,30+273,216+1);
   im_Grafico.Canvas.Rectangle(30,231,30+273,231+1);
   im_Grafico.Canvas.Rectangle(30,246,30+273,246+1);
   im_Grafico.Canvas.Rectangle(30,261,30+273,261+1);

   // Orelha esquerda
   im_Grafico.Canvas.Brush.Color      := clWhite;
   im_Grafico.Canvas.Font.Color       := clBlack;
   im_Grafico.Canvas.Font.Name        := 'Times New Roman';
   im_Grafico.Canvas.Font.Style       := [fsItalic];
   im_Grafico.Canvas.Font.Size        := 16;
   im_Grafico.Canvas.TextOut(350,08,'Orelha Esquerda');


   im_Grafico.Canvas.Font.Color  := clBlack;
   im_Grafico.Canvas.Font.Style  := [];
   im_Grafico.Canvas.Font.Size   := 10;

   im_Grafico.Canvas.TextOut(329,059,'-10');
   im_Grafico.Canvas.TextOut(338,074,'0');
   im_Grafico.Canvas.TextOut(332,089,'10');
   im_Grafico.Canvas.TextOut(332,104,'20');
   im_Grafico.Canvas.TextOut(332,119,'30');
   im_Grafico.Canvas.TextOut(332,134,'40');
   im_Grafico.Canvas.TextOut(332,149,'50');
   im_Grafico.Canvas.TextOut(332,164,'60');
   im_Grafico.Canvas.TextOut(332,179,'70');
   im_Grafico.Canvas.TextOut(332,194,'80');
   im_Grafico.Canvas.TextOut(332,209,'90');
   im_Grafico.Canvas.TextOut(326,224,'100');
   im_Grafico.Canvas.TextOut(326,239,'110');
   im_Grafico.Canvas.TextOut(326,254,'120');
   im_Grafico.Canvas.TextOut(331,271,'dB');

   im_Grafico.Canvas.TextOut(377,35,'250');
   im_Grafico.Canvas.TextOut(413,35,'500');
   im_Grafico.Canvas.TextOut(453,35,'1K');
   im_Grafico.Canvas.TextOut(490,35,'2K');
   im_Grafico.Canvas.TextOut(518,35,'3K');
   im_Grafico.Canvas.TextOut(544,35,'4K');
   im_Grafico.Canvas.TextOut(571,35,'6K');
   im_Grafico.Canvas.TextOut(596,35,'8K');
   im_Grafico.Canvas.TextOut(623,36,'Hz');


   im_Grafico.Canvas.Pen.Width := 1;
   im_Grafico.Canvas.Brush.Color := clWhite;

   im_Grafico.Canvas.Rectangle(350,51,350+273,51+225); // sp_Esquerda

   im_Grafico.Canvas.Brush.Color := clBlack;

   im_Grafico.Canvas.Rectangle(387,52,387+1,52+224); // 250
   im_Grafico.Canvas.Rectangle(424,52,424+1,52+224); // 500
   im_Grafico.Canvas.Rectangle(460,52,460+1,52+224); // 1
   im_Grafico.Canvas.Rectangle(497,52,497+1,52+224); // 2
   im_Grafico.Canvas.Rectangle(523,52,523+1,52+224); // 3
   im_Grafico.Canvas.Rectangle(548,52,548+1,52+224); // 4
   im_Grafico.Canvas.Rectangle(574,52,574+1,52+224); // 6
   im_Grafico.Canvas.Rectangle(598,52,598+1,52+224); // 8

   // Linhas Horizontais
   im_Grafico.Canvas.Rectangle(350,066,350+273,066+1);
   im_Grafico.Canvas.Rectangle(350,080,350+273,080+3);
   im_Grafico.Canvas.Rectangle(350,096,350+273,096+1);
   im_Grafico.Canvas.Rectangle(350,111,350+273,111+1);
   im_Grafico.Canvas.Rectangle(350,126,350+273,126+1);
   im_Grafico.Canvas.Rectangle(350,141,350+273,141+1);
   im_Grafico.Canvas.Rectangle(350,156,350+273,156+1);
   im_Grafico.Canvas.Rectangle(350,171,350+273,171+1);
   im_Grafico.Canvas.Rectangle(350,186,350+273,186+1);
   im_Grafico.Canvas.Rectangle(350,201,350+273,201+1);
   im_Grafico.Canvas.Rectangle(350,216,350+273,216+1);
   im_Grafico.Canvas.Rectangle(350,231,350+273,231+1);
   im_Grafico.Canvas.Rectangle(350,246,350+273,246+1);
   im_Grafico.Canvas.Rectangle(350,261,350+273,261+1);
//   END;


vm_PosInicio      := 51;

vm_VetPosHzDir[1] := 067;
vm_VetPosHzDir[2] := 104;
vm_VetPosHzDir[3] := 140;
vm_VetPosHzDir[4] := 177;
vm_VetPosHzDir[5] := 203;
vm_VetPosHzDir[6] := 228;
vm_VetPosHzDir[7] := 254;
vm_VetPosHzDir[8] := 278;

vm_VetPosHzEsq[1] := 387;
vm_VetPosHzEsq[2] := 424;
vm_VetPosHzEsq[3] := 460;
vm_VetPosHzEsq[4] := 497;
vm_VetPosHzEsq[5] := 523;
vm_VetPosHzEsq[6] := 548;
vm_VetPosHzEsq[7] := 574;
vm_VetPosHzEsq[8] := 598;

END;


PROCEDURE GerarGrafico(vm_ParExame:Integer);
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
    vm_VetHz          :Array[1..8] OF String;
    vm_Frequencia     :String;
    I:Byte;
    vm_PosEsq         :Integer;
    vm_PosTop         :Integer;
BEGIN

PreparaQueryExame(vm_ParExame);

oQueryExame.Open;
oQueryItemExame.Open;

DesenharTabela;

//IF fm_Relatorio.ck_Dado.Checked = True THEN
//   BEGIN

   vm_VetHz[1] := '250';
   vm_VetHz[2] := '500';
   vm_VetHz[3] := '1';
   vm_VetHz[4] := '2';
   vm_VetHz[5] := '3';
   vm_VetHz[6] := '4';
   vm_VetHz[7] := '6';
   vm_VetHz[8] := '8';

   FOR I:=1 TO 8 DO
       BEGIN
       vm_VetViaAerDir[I]   := Nulo;
       vm_VetViaAerEsq[I]   := Nulo;
       vm_VetViaOssDir[I]   := Nulo;
       vm_VetViaOssEsq[I]   := Nulo;
       END;



   vm_Proporcao := 225/150; // altura da tabela dividido por 15 divisoes de 10 db (-10 a +120)
   oQueryItemExame.First;

   // Carregar os vetores

   WHILE (oQueryItemExame.Eof = False) DO
     BEGIN

     IF (oQueryItemExame.FieldByName('IEVia').Value = 'A') AND (oQueryItemExame.FieldByName('IEOrelha').Value= 'D') THEN
        BEGIN
        vm_VetViaAerDir[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEDb').Value+20;
        vm_VetMascaradaAD[oQueryItemExame.FieldByName('IENumSeq').AsInteger] := oQueryItemExame.FieldByName('IEMascarada').Value;
        vm_VetAusenteAD[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEAusente').Value;
        END;

     IF (oQueryItemExame.FieldByName('IEVia').Value = 'A') AND (oQueryItemExame.FieldByName('IEOrelha').Value= 'E') THEN
        BEGIN
        vm_VetViaAerEsq[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEDb').Value+20;
        vm_VetMascaradaAE[oQueryItemExame.FieldByName('IENumSeq').AsInteger] := oQueryItemExame.FieldByName('IEMascarada').Value;
        vm_VetAusenteAE[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEAusente').Value;
        END;

     IF (oQueryItemExame.FieldByName('IEVia').Value = 'O') AND (oQueryItemExame.FieldByName('IEOrelha').Value= 'D') THEN
        BEGIN
        vm_VetViaOssDir[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEDb').Value+20;
        vm_VetMascaradaOD[oQueryItemExame.FieldByName('IENumSeq').AsInteger] := oQueryItemExame.FieldByName('IEMascarada').Value;
        vm_VetAusenteOD[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEAusente').Value;
        END;

     IF (oQueryItemExame.FieldByName('IEVia').Value = 'O') AND (oQueryItemExame.FieldByName('IEOrelha').Value= 'E') THEN
        BEGIN
        vm_VetViaOssEsq[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEDb').Value+20;
        vm_VetMascaradaOE[oQueryItemExame.FieldByName('IENumSeq').AsInteger] := oQueryItemExame.FieldByName('IEMascarada').Value;
        vm_VetAusenteOE[oQueryItemExame.FieldByName('IENumSeq').AsInteger]   := oQueryItemExame.FieldByName('IEAusente').Value;
        END;


     oQueryItemExame.Next;

     END;


   // Desenhar linha do Gráfico Esquerdo

   im_Grafico.Canvas.Brush.Style := bsClear;
   im_Grafico.Canvas.Brush.Color := clWhite;

   im_Grafico.Canvas.Pen.Color   := clRed;
   im_Grafico.Canvas.Pen.Style   := psSolid;

   FOR I:=1 TO 8 DO
       BEGIN

       vm_PosEsq := vm_VetPosHzDir[I];
       vm_PosTop := vm_PosInicio+Round(vm_VetViaAerDir[I]*vm_Proporcao);

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

       vm_PosEsq := vm_VetPosHzEsq[I];
       vm_PosTop := vm_PosInicio+Round(vm_VetViaAerEsq[I]*vm_Proporcao);

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

          vm_PosEsq := vm_VetPosHzDir[I];
          vm_PosTop := vm_PosInicio+Round(vm_VetViaAerDir[I]*vm_Proporcao);

          IF vm_VetMascaradaAD[I] = False THEN
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'Circulo',vm_VetAusenteAD[I])
          ELSE
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'Triangulo',vm_VetAusenteAD[I]);

        END;

     // Direita
     IF vm_VetViaOssDir[I] <> Nulo THEN
        BEGIN

          vm_PosEsq := vm_VetPosHzDir[I];
          vm_PosTop := vm_PosInicio+Round(vm_VetViaOssDir[I]*vm_Proporcao);

          IF vm_VetMascaradaOD[I] = False THEN
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'<',vm_VetAusenteOD[I])
          ELSE
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'[',vm_VetAusenteOD[I]);

        END;


     // Esquerda
     IF vm_VetViaAerEsq[I] <> Nulo THEN
        BEGIN

          vm_PosEsq := vm_VetPosHzEsq[I];
          vm_PosTop := vm_PosInicio+Round(vm_VetViaAerEsq[I]*vm_Proporcao);

          IF vm_VetMascaradaAE[I] = False THEN
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'X',vm_VetAusenteAE[I])
          ELSE
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'Quadrado',vm_VetAusenteAE[I]);

        END;

     // Esquerda
     IF vm_VetViaOssEsq[I] <> Nulo THEN
        BEGIN
          vm_PosEsq := vm_VetPosHzEsq[I];
          vm_PosTop := vm_PosInicio+Round(vm_VetViaOssEsq[I]*vm_Proporcao);

          IF vm_VetMascaradaOE[I] = False THEN
             ExibirSimbolo(vm_PosEsq,vm_PosTop,'>',vm_VetAusenteOE[I])
          ELSE
             ExibirSimbolo(vm_PosEsq,vm_PosTop,']',vm_VetAusenteOE[I]);

        END;

     END;


// END;

oQueryExame.Close;
oQueryItemExame.Close;

oDataSourceExame := Nil;
oQueryExame.Free;
oQueryItemExame.Free;

oDataSourceExame.Free;

END;



PROCEDURE ExibirSimbolo(X,Y:Integer; vm_ParSimbolo:String; vm_ParAusente:Boolean);
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





procedure PreparaQueryExame(vm_ParExame: Integer);
begin

    oQueryExame := TADOQuery.Create(Application);
    oQueryExame.Connection := dm_Geral.ADOConnection;

    oQueryExame.SQL.Clear;
    oQueryExame.SQL.Add(' SELECT Safaex.EXNumExa,');
    oQueryExame.SQL.Add('        DATEADD(SS, datepart(SS, ISNULL(EXHOREXA,0)), DATEADD(MI, datepart(MI, ISNULL(EXHOREXA,0)), DATEADD(hh, datepart(HH, ISNULL(EXHOREXA, 0)), EXDatExa))) AS EXDATEXA,');
    oQueryExame.SQL.Add('        Safaex.EXTipExa, Safaex.EXNumHorRep,');
    oQueryExame.SQL.Add('        Safaex.EXDatCal, Safaex.EXSTROD, Safaex.EXSTROE, Safaex.EXAlertaFalaOD,');
    oQueryExame.SQL.Add('        Safaex.EXAlertaFalaOE, Safaex.EXMonoDbOD, Safaex.EXMonoPerOD,');
    oQueryExame.SQL.Add('        Safaex.EXDiDbOD, Safaex.EXDiPerOD, Safaex.EXMonoDbOE,');
    oQueryExame.SQL.Add('        Safaex.EXMonoPerOE, Safaex.EXDiDbOE, Safaex.EXDiPerOE,');
    oQueryExame.SQL.Add('        Safaex.EXPerdaOD, Safaex.EXPerdaOE, Safaex.EXObservacao,');
    oQueryExame.SQL.Add('        Safaex.EXRepetir, Safaex.EXImitanciomaetria, Safaex.EXTonal,');
    oQueryExame.SQL.Add('        Safaex.EXOtorrinolaringologista, Safaex.EXLogoaudiometria,');
    oQueryExame.SQL.Add('        Safaex.EXLogoOD, Safaex.EXLogoOE, Safaex.EXVAOD,');
    oQueryExame.SQL.Add('        Safaex.EXVAOE, Safaex.EXVOOD, Safaex.EXVOOE,');
    oQueryExame.SQL.Add('        Safaex.EXMedia01D, Safaex.EXMedia02D,');
    oQueryExame.SQL.Add('        Safaex.EXMedia01E, Safaex.EXMedia02E,');
    oQueryExame.SQL.Add('        Safaex.EXLaudoD, Safaex.EXLaudoE,');
    oQueryExame.SQL.Add('        Safaex.EXGrauD, Safaex.EXGrauE, Safaex.EXFrequenciaD,');
    oQueryExame.SQL.Add('        Safaex.EXFrequenciaE, Safaau.AUDescricao, Safaem.EMFantasia,');
    oQueryExame.SQL.Add('        Safaex.EXCodMeaOD, Safaex.EXCodMeaOE,');
    oQueryExame.SQL.Add('        Safapc.PCNome, Safapc.PCNumDoc,');
    oQueryExame.SQL.Add('        Safapc.PCTipDoc, safapc.PCDatNas, Safapc.PCSexo,');
    oQueryExame.SQL.Add('        Safafc.FCDescricao,');
    oQueryExame.SQL.Add('        mtod.MTDescricao as EXMeatoscopiaOD,');
    oQueryExame.SQL.Add('        mtoe.MTDescricao as EXMeatoscopiaOE,');
    oQueryExame.SQL.Add('        safast.STDescricao');
    oQueryExame.SQL.Add(' FROM Safaex');
    oQueryExame.SQL.Add('    INNER JOIN Safaau');
    oQueryExame.SQL.Add('    ON  (Safaex.EXCodAud = Safaau.AUCodAud)');
    oQueryExame.SQL.Add('    INNER JOIN Safapc');
    oQueryExame.SQL.Add('    ON  (Safaex.EXCodPac = Safapc.PCCodPac)');
    oQueryExame.SQL.Add('    INNER JOIN Safaem');
    oQueryExame.SQL.Add('    ON  (Safaex.EXCodEmp = Safaem.EMCodEmp)');
    oQueryExame.SQL.Add('    INNER JOIN Safafc');
    oQueryExame.SQL.Add('    ON  (Safaex.EXCodFnc = Safafc.FCCodFnc)');
    oQueryExame.SQL.Add('    INNER JOIN Safamt mtod');
    oQueryExame.SQL.Add('    ON  (Safaex.EXCodMeaOD = mtod.MTCodMea)');
    oQueryExame.SQL.Add('    INNER JOIN Safamt mtoe');
    oQueryExame.SQL.Add('    ON  (Safaex.EXCodMeaOE = mtoe.MTCodMea)');
    oQueryExame.SQL.Add('    LEFT JOIN Safast');
    oQueryExame.SQL.Add('    ON  (Safapc.PCCodSet = safast.STCodSet)');
    oQueryExame.SQL.Add('  WHERE  Safaex.EXNumExa = '+IntToStr(vm_ParExame));

    oDataSourceExame := TDataSource.Create(Application);
    oDataSourceExame.DataSet := oQueryExame;

    oQueryItemExame := TADOQuery.Create(Application);
    oQueryItemExame.Connection := dm_Geral.ADOConnection;
    oQueryItemExame.DataSource := oDataSourceExame;
    oQueryItemExame.SQL.Clear;

    oQueryItemExame.SQL.Text := 'select * from SAFAIE where IENumExa = :EXNumExa';
    oQueryItemExame.Parameters.Clear;
    oQueryItemExame.Parameters.CreateParameter( 'EXNumExa', ftInteger, pdInput, 0, 0);

end;

function GerarJPGGraficoExame(vm_ParExame: Integer):String;
var
  vm_NomeArq:String;
begin

  im_Grafico := TImage.Create(Application);
  im_Grafico.Width := 650;
  im_Grafico.Height := 291;

  vm_NomeArq := 'Exame'+IntToStr(vm_ParExame)+'.jpg';

  GerarGrafico(vm_ParExame);

  with TJPEGImage.Create do begin
    Assign(im_Grafico.Picture.Graphic);
    SaveToFile(vm_NomeArq);
    Free;
  end;

  im_Grafico.Free;

  Result := vm_NomeArq;

end;


end.



