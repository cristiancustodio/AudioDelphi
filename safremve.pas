unit safremve;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  ADODB, jpeg;

type
  Trp_EmpresaVencida = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    lb_MesAno: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    tb_TMPA: TADOTable;
    tb_TMPAFantasia: TStringField;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    tb_Exame: TADOQuery;
    QRImage1: TQRImage;
    procedure tb_TMPAAfterClose(DataSet: TDataSet);
    procedure tb_TMPABeforeOpen(DataSet: TDataSet);
    procedure tb_TMPAAfterOpen(DataSet: TDataSet);
  private
    procedure CriarTMPEXVE;
  public
     vm_Ano:Word;
     vm_Mes:Word;
  end;

var
  rp_EmpresaVencida: Trp_EmpresaVencida;

implementation

Uses safdgera, funcoes, DateUtils;

{$R *.DFM}


PROCEDURE Trp_EmpresaVencida.CriarTMPEXVE();
VAR oQuery: TADOQuery;
begin

  try
    oQuery := TADOQuery.Create(Nil);
    oQuery.Connection := dm_Geral.ADOConnection;

    oQuery.SQL.Text := 'IF OBJECT_ID(''tempdb..#EMVE'') IS NOT NULL DROP TABLE #EMVE';
    oQuery.ExecSQL();

    oQuery.SQL.Clear;
    oQuery.SQL.Add(' CREATE TABLE #EMVE(');
    oQuery.SQL.Add('    Fantasia varchar(40)');
    oQuery.SQL.Add(')');
    oQuery.ExecSQL();
  finally
    oQuery.Close;
    oQuery.Free;
  end;

end;

procedure Trp_EmpresaVencida.tb_TMPAAfterClose(DataSet: TDataSet);
begin
//DeletarTMP(DataSet);
end;

procedure Trp_EmpresaVencida.tb_TMPABeforeOpen(DataSet: TDataSet);
begin
  CriarTMPEXVE();
end;

procedure Trp_EmpresaVencida.tb_TMPAAfterOpen(DataSet: TDataSet);
VAR vm_CodEmp:LongInt;
    vm_CodPac:LongInt;
    vm_TesteData:TDateTime;
    vm_AnoExa:Word;
    vm_MesExa:Word;
    vm_DiaExa:Word;
    vm_MesAnoExa:String;
begin

 tb_Exame.Parameters.ParamByName('GETDATE').Value := EncodeDateTime(vm_Ano, vm_Mes, 1, 0, 0, 0, 0);
 tb_Exame.Open;

 WHILE tb_Exame.Eof = False DO BEGIN
    tb_TMPA.Insert;
    tb_TMPA.FieldByName('Fantasia').Value := tb_Exame.FieldByName('EMFantasia').Value;
    tb_TMPA.Post;
    vm_CodPac:=0;

    //tb_Exame.FindNearest([vm_CodEmp,vm_CodPac]);
    tb_Exame.Next;
 END;

end;

end.
