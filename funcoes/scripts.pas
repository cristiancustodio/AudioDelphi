unit scripts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, DBTables;

type
  Tfm_Script = class(TForm)
    Memo: TMemo;
    bt_Execute: TButton;
    bt_Sair: TButton;
    Bevel1: TBevel;
    Query: TQuery;
    procedure bt_ExecuteClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Script: Tfm_Script;

implementation

uses sacuauto;

{$R *.DFM}

procedure Tfm_Script.bt_ExecuteClick(Sender: TObject);
VAR I:Byte;
begin

 if fm_Autorizacao.CheckPermissao(0) = False then Exit;

 if Memo.ReadOnly = True then begin
    i:=1;
    WHILE FileExists('Scripts'+IntToStr(I)+'.SQL') = True DO BEGIN
      TRY
       Query.SQL.LoadFromFile('Scripts'+IntToStr(I)+'.SQL');
       Query.ExecSQL;
      EXCEPT  ON E: Exception DO ShowMessage(E.Message);
      END;
      DeleteFile('Scripts'+IntToStr(I)+'.SQL');
      Inc(I);
    END;
 end else begin
    Query.SQL.Text := Memo.Lines.Text;
    Query.ExecSQL;
 end;
 Memo.Text      := '';
 Memo.ReadOnly  := False;
 ShowMessage('Scripts encerrado!');
end;

procedure Tfm_Script.bt_SairClick(Sender: TObject);
begin
 Close;
end;

procedure Tfm_Script.FormShow(Sender: TObject);
var I:Byte;
    vm_ObjStrings:TStrings;
begin

vm_ObjStrings := TStringList.Create;

I:=1;

WHILE FileExists('Scripts'+IntToStr(I)+'.SQL') = True DO
   BEGIN
   vm_ObjStrings.LoadFromFile('Scripts'+IntToStr(I)+'.SQL');
   Memo.Text := Memo.Text + vm_ObjStrings.Text;
   Inc(I);
   END;

IF I <> 1 THEN Memo.ReadOnly := True;

vm_ObjStrings.Free;

end;

end.
