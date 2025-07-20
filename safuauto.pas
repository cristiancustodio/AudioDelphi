unit safuauto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables;

type
  Tfm_Autorizacao = class(TForm)
    lb_Usuario: TLabel;
    ed_Usuario: TEdit;
    Label1: TLabel;
    ed_Senha: TEdit;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
    tb_Usuario: TTable;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    fCodUsu:Integer;
    { Private declarations }
  public
    function GetCodUsu:Integer;
    { Public declarations }
  end;

var
  fm_Autorizacao: Tfm_Autorizacao;

implementation

Uses funcoes;

{$R *.dfm}


procedure Tfm_Autorizacao.OKBtnClick(Sender: TObject);
begin

tb_Usuario.Open;

tb_Usuario.IndexFieldNames := 'USUANomAbr';

IF NOT tb_Usuario.FindKey([ed_Usuario.Text]) THEN
   BEGIN
   MessageDlg('Usuário não Cadastrado.Ok!', mtInformation, [mbOk],0);
   ModalResult := mrNone;
   ed_Usuario.SetFocus;
   Exit;
   END;

if tb_Usuario.FieldByName('USUANivAce').Text = 'Excluído' then begin
   MessageDlg('Sem Permissão!', mtinformation, [mbOk],0);
   ModalResult := mrNone;
   ed_Usuario.SetFocus;
   Exit;
end;

IF tb_Usuario.FieldByName('USUASenha').Text <> CLCRIPTO(ed_Senha.text, 'PRISMA') THEN
   BEGIN
   MessageDlg('Senha Não Confere!', mtinformation, [mbOk],0);
   ModalResult := mrNone;
   ed_Senha.Text := '';
   ed_Senha.SetFocus;
   Exit;
   END
ELSE
   BEGIN
   ModalResult:= mrOk;
   END;

tb_Usuario.Close;

end;

procedure Tfm_Autorizacao.CancelBtnClick(Sender: TObject);
begin
 ModalResult:= mrCancel;
end;

function Tfm_Autorizacao.GetCodUsu: Integer;
begin
 Result := fCodUsu;
end;

end.
