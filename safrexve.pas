{*
object tb_TMPA: TTable
  BeforeOpen = tb_TMPABeforeOpen
  AfterOpen = tb_TMPAAfterOpen
  AfterClose = tb_TMPAAfterClose
  Exclusive = True
  FieldDefs = <
    item
      Name = 'Fantasia'
      DataType = ftString
      Size = 40
    end
    item
      Name = 'Paciente'
      DataType = ftString
      Size = 40
    end
    item
      Name = 'CodPac'
      DataType = ftInteger
    end>
  IndexDefs = <
    item
      Name = 'tb_TMPAIndex1'
      Fields = 'Fantasia;Paciente;CodPac'
      Options = [ixPrimary, ixUnique]
    end>
  IndexFieldNames = 'Fantasia'
  StoreDefs = True
  Left = 20
  Top = 2
  object tb_TMPAFantasia: TStringField
    FieldName = 'Fantasia'
    Size = 40
  end
  object tb_TMPAPaciente: TStringField
    FieldName = 'Paciente'
    Size = 40
  end
  object tb_TMPACodPac: TIntegerField
    FieldName = 'CodPac'
  end
end
*}

unit safrexve;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, ADODB, jpeg;

type
  Trp_ExameVencido = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    lb_MesAno: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    tb_TMPA: TADOTable;
    tb_TMPAFantasia: TStringField;
    tb_Exame: TADOQuery;
    tb_TMPAPaciente: TStringField;
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
    tb_TMPACodPac: TIntegerField;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    procedure tb_TMPABeforeOpen(DataSet: TDataSet);
    procedure tb_TMPAAfterClose(DataSet: TDataSet);
    procedure tb_TMPAAfterOpen(DataSet: TDataSet);
  private
    procedure CriarTMPEXVE;
  public
    vm_Ano:Word;
    vm_Mes:Word;
    vm_CodEmp:LongInt;
  end;

var
  rp_ExameVencido: Trp_ExameVencido;

implementation

Uses safdgera, funcoes;

{$R *.DFM}


PROCEDURE Trp_ExameVencido.CriarTMPEXVE();
VAR oQuery: TADOQuery;
begin

  try
    oQuery := TADOQuery.Create(Nil);
    oQuery.Connection := dm_Geral.ADOConnection;

    oQuery.SQL.Text := 'IF OBJECT_ID(''tempdb..#EXVE'') IS NOT NULL DROP TABLE #EXVE';
    oQuery.ExecSQL();

    oQuery.SQL.Clear;
    oQuery.SQL.Add(' CREATE TABLE #EXVE(');

    oQuery.SQL.Add('Fantasia varchar(40),');
    oQuery.SQL.Add('Paciente varchar(40),');
    oQuery.SQL.Add('CodPac int');
    oQuery.SQL.Add(')');
    oQuery.ExecSQL();
  finally
    oQuery.Close;
    oQuery.Free;
  end;

end;


procedure Trp_ExameVencido.tb_TMPABeforeOpen(DataSet: TDataSet);
begin
  CriarTMPEXVE();
end;

procedure Trp_ExameVencido.tb_TMPAAfterClose(DataSet: TDataSet);
begin
//DeletarTMP(DataSet);
end;




procedure Trp_ExameVencido.tb_TMPAAfterOpen(DataSet: TDataSet);
VAR vm_CodEmpExa:LongInt;
    vm_CodPacExa:LongInt;
    vm_TesteData:TDateTime;
    vm_AnoExa:Word;
    vm_MesExa:Word;
    vm_DiaExa:Word;
    vm_MesAnoExa:String;
begin

 tb_Exame.Parameters.ParamByName('EXCODEMP').Value := vm_CodEmp;
 tb_Exame.Open;

 WHILE tb_Exame.Eof = False DO BEGIN
    // vm_CodEmpExa := tb_ExameEXCodEmp.Value;
    // vm_CodPacExa := tb_ExameEXCodPac.Value;
    //IF tb_ExameEXTipExa.Value <> 'Demissional' THEN BEGIN

    DecodeDate(tb_Exame.FieldByName('EXDatExa').Value,vm_AnoExa,vm_MesExa,vm_DiaExa);

    vm_MesExa := vm_MesExa+tb_Exame.FieldByName('PCMesNovCon').AsInteger;

    WHILE vm_MesExa > 12 DO BEGIN
      vm_MesExa := vm_MesExa - 12;
      vm_AnoExa := vm_AnoExa + 1;
    END;

    vm_MesAnoExa := FormatFloat('0000',vm_AnoExa)+FormatFloat('00',vm_MesExa);

    if (Trim(tb_Exame.FieldByName('EMMesAnoIni').AsString) = '')  or
       (Trim(tb_Exame.FieldByName('EMMesAnoIni').AsString) = '/') or
       (vm_MesAnoExa >= Copy(tb_Exame.FieldByName('EMMesAnoIni').AsString,4,4)+Copy(tb_Exame.FieldByName('EMMesAnoIni').AsString,1,2)) then begin

       IF tb_Exame.FieldByName('PCMesNovCon').Value > 0 THEN BEGIN
          IF vm_MesAnoExa <= (FormatFloat('0000',vm_Ano)+FormatFloat('00',vm_Mes)) THEN BEGIN
             tb_TMPA.Insert;
             tb_TMPAFantasia.Value := tb_Exame.FieldByName('EMFantasia').Value;
             tb_TMPAPaciente.Value := tb_Exame.FieldByName('PCNome').Value;
             tb_TMPACodPac.Value   := tb_Exame.FieldByName('PCCodPac').Value;
             tb_TMPA.Post;
          END;
       END;

    end;

    //END;
    //tb_Exame.FindNearest([vm_CodEmpExa,vm_CodPacExa]);
    //tb_Exame.Locate('EX')
    tb_Exame.Next;
 END;

end;

end.
