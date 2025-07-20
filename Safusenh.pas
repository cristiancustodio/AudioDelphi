unit Safusenh;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, DB, DBTables, DBCtrls, dialogs, ExtCtrls,sysutils, ADODB;

type
  Tfm_Senha = class(TForm)
    Label1: TLabel;
    OKBtn: TBitBtn;
    ed_Senha: TEdit;
    CancelBtn: TBitBtn;
    lb_Usuario: TLabel;
    Bevel1: TBevel;
    ed_Usuario: TEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Senha: Tfm_Senha;

implementation

Uses safuMenu, funcoes, safdgera;

{$R *.DFM}


procedure Tfm_Senha.OKBtnClick(Sender: TObject);
VAR oQuery    : TADOQuery;
    bExiste   : Boolean;
    sSenha    : String;
    sNome     : String;
    sCodigo   : LongInt;
begin

oQuery := TADOQuery.Create(Nil);

oQuery.Connection :=  dm_Geral.ADOConnection;

oQuery.SQL.Text := 'select USSenha, USNome, USCodUsu from safaus where USNomAbr = ' + #39 + ed_Usuario.Text + #39;

oQuery.Open;

bExiste := Not oQuery.Eof;
sSenha  := oQuery.Fields[0].AsString;
sNome   := oQuery.Fields[1].AsString;
sCodigo := oQuery.Fields[2].AsInteger;

oQuery.Close;
oQuery.Free;

IF Not bExiste THEN
   BEGIN
   MessageDlg('Usuário não Cadastrado!', mtInformation, [mbOk],0);
   ModalResult := mrNone;
   ed_Usuario.SetFocus;
   Exit;
   END;

//if sNivel= 'Excluído' then begin
//   MessageDlg('Acesso Negado!', mtinformation, [mbOk],0);
//   ModalResult := mrNone;
//   ed_Usuario.SetFocus;
//   Exit;
//end;

IF (sSenha <> '') and (sSenha <> CLCRIPTO(ed_Senha.text, 'CRTEC')) THEN
   BEGIN
   MessageDlg('Senha Não Confere!', mtinformation, [mbOk],0);
   ModalResult := mrNone;
   ed_Senha.Text := '';
   ed_Senha.SetFocus;
   Exit;
   END
ELSE
   BEGIN
   vm_NomUsuSenha := sNome;
   vm_CodUsuSenha := sCodigo;
   ModalResult:= mrOk;
   END;


end;



procedure Tfm_Senha.CancelBtnClick(Sender: TObject);
begin
Application.Terminate;
end;

end.

