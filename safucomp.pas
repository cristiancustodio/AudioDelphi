unit safucomp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, FileCtrl, CheckLst, BDE, dbtables,
  Db;
type
  Tfm_Compactar = class(TForm)
    bt_Iniciar: TButton;
    bt_Fechar: TButton;
    Bevel1: TBevel;
    ProgressBar: TProgressBar;
    RichEdit1: TRichEdit;
    lb_Situacao: TLabel;
    procedure bt_IniciarClick(Sender: TObject);
    procedure bt_FecharClick(Sender: TObject);
    PROCEDURE PackPdoxTable(Table:TTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Compactar: Tfm_Compactar;

implementation

uses safdgera;

{$R *.DFM}

PROCEDURE Tfm_Compactar.PackPdoxTable(Table:TTable);
VAR TableDesc:CRTblDesc;
    HDatabase:hDbiDB;
BEGIN

Screen.Cursor := crHourglass;

TRY
Table.Open;
hDatabase := Table.DBHandle;
Table.Close;
FillChar(TableDesc, SizeOf (CRTblDesc), 0);
WITH TableDesc DO
   BEGIN
   StrPCopy(szTblName, Table.TableName);
   StrPCopy(szTblType, szParadox);
   bPack := True;
   END;

Check(DBIDoRestructure(hDatabase, 1, @TableDesc, Nil, Nil, Nil, False))

FINALLY

Screen.Cursor := crDefault;

END;

END;


procedure Tfm_Compactar.bt_IniciarClick(Sender: TObject);
VAR I:Integer;
begin

bt_Iniciar.Enabled  := False;
bt_Fechar.Enabled   := False;

ProgressBar.Min     := 0;
ProgressBar.Max     := dm_Geral.ComponentCount-1;

FOR I:=0 TO dm_Geral.ComponentCount-1 DO
    BEGIN
    IF (dm_Geral.Components[I] IS TTable) THEN
       BEGIN
       lb_Situacao.Caption  := 'Compactando arquivo: '+
                               TTable(dm_Geral.Components[I]).TableName;
       ProgressBar.Position := I;
       Application.ProcessMessages;
       PackPdoxTable(TTable(dm_Geral.Components[I]));
       END;
    END;

ProgressBar.Position := dm_Geral.ComponentCount-1;

bt_Iniciar.Enabled  := True;
bt_Fechar.Enabled   := True;

end;

procedure Tfm_Compactar.bt_FecharClick(Sender: TObject);
begin

Close;

end;

end.
