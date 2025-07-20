// TMPG
unit safumenu;

//recriar (sacuauto)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, ToolWin, ComCtrls, ImgList, ActnList,
  Db, DBTables, jpeg;

type
  Tfm_Menu = class(TForm)
    MainMenu1: TMainMenu;
    mi_Cadastros: TMenuItem;
    mi_Cadastro: TMenuItem;
    mi_Manutencao: TMenuItem;
    N2: TMenuItem;
    mi_Sair: TMenuItem;
    StatusBar: TStatusBar;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    bt_Parametro: TToolButton;
    bt_Cadastro: TToolButton;
    bt_Exame: TToolButton;
    mi_Relatrio: TMenuItem;
    im_Paciente: TMenuItem;
    im_Empresa: TMenuItem;
    im_Convenio: TMenuItem;
    im_Patologia: TMenuItem;
    im_Meatoscopia: TMenuItem;
    sb_Botao: TImageList;
    mi_Movimento: TMenuItem;
    Exames: TMenuItem;
    CtasReceber: TMenuItem;
    CtasPagar: TMenuItem;
    bt_Relatorio: TToolButton;
    N3: TMenuItem;
    sb_Menu: TImageList;
    Image1: TImage;
    im_Funcao: TMenuItem;
    im_Cadastro: TMenuItem;
    im_Exame: TMenuItem;
    mi_Salvar: TMenuItem;
    mi_Restaurar: TMenuItem;
    mi_Compactar: TMenuItem;
    N4: TMenuItem;
    bt_Caixa: TToolButton;
    Caixa: TMenuItem;
    N5: TMenuItem;
    Venda: TMenuItem;
    ReciboEmpresa: TMenuItem;
    ReciboExame: TMenuItem;
    ReciboTerapia: TMenuItem;
    im_Faturamento: TMenuItem;
    PopupMenu1: TPopupMenu;
    Restaurar: TMenuItem;
    Scripts: TMenuItem;
    ToolButton1: TToolButton;
    PopupMenu2: TPopupMenu;
    CtasPagar1: TMenuItem;
    CtasReceber1: TMenuItem;
    Caixa1: TMenuItem;
    N1: TMenuItem;
    ToolButton2: TToolButton;
    TestagemAparelho1: TMenuItem;
    bt_Testagem: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    im_Comprador: TMenuItem;
    im_Venda: TMenuItem;
    PROCEDURE ShowHint(Sender:TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure mi_SairClick(Sender: TObject);
    procedure bt_ParametroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_CadastroClick(Sender: TObject);
    procedure bt_ExameClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bt_RelatorioClick(Sender: TObject);
    procedure mi_CadastrosClick(Sender: TObject);
    procedure im_PacienteClick(Sender: TObject);
    procedure ExamesClick(Sender: TObject);
    procedure im_CadastroClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mi_SalvarClick(Sender: TObject);
    procedure mi_RestaurarClick(Sender: TObject);
    procedure mi_CompactarClick(Sender: TObject);
    procedure bt_CtasPagarClick(Sender: TObject);
    procedure bt_CaixaClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ScriptsClick(Sender: TObject);
    procedure TestagemAparelho1Click(Sender: TObject);
    procedure im_VendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Menu: Tfm_Menu;
  vm_NomUsuSenha:String;  
  vm_CodUsuSenha:LongInt;  

implementation

uses safupara, safucada, safuexam, safusobr, safurela, saffgera, safdgera,
  safucomp, Safuctpg, Safucaix, funcoes, //scripts,
  safutest, safuvend, Safusenh;

{$R *.DFM}

PROCEDURE Tfm_Menu.ShowHint(Sender: TObject);
BEGIN
StatusBar.Panels[0].Text := Application.Hint;
END;

procedure Tfm_Menu.ToolButton1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfm_Menu.mi_SairClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfm_Menu.bt_ParametroClick(Sender: TObject);
begin
if (fm_Parametro = nil) then
  Application.CreateForm(Tfm_Parametro, fm_Parametro);
fm_Parametro.Show;
end;

procedure Tfm_Menu.FormCreate(Sender: TObject);
begin
Application.OnHint := ShowHint;
Self.Width := Screen.Width;
end;

procedure Tfm_Menu.bt_CadastroClick(Sender: TObject);
begin
if (fm_Cadastro = nil) then
  Application.CreateForm(Tfm_Cadastro, fm_Cadastro);
fm_Cadastro.Show;
end;

procedure Tfm_Menu.bt_ExameClick(Sender: TObject);
begin
if (fm_Exame = nil) then
  Application.CreateForm(Tfm_Exame, fm_Exame);

fm_Exame.Show;
end;

procedure Tfm_Menu.N2Click(Sender: TObject);
begin
Application.CreateForm(Tfm_Sobre, fm_Sobre);
fm_Sobre.ShowModal
end;

procedure Tfm_Menu.bt_RelatorioClick(Sender: TObject);
begin
IF fm_Relatorio = nil THEN
   Application.CreateForm(Tfm_Relatorio, fm_Relatorio);
   
fm_Relatorio.ShowModal;
end;

procedure Tfm_Menu.mi_CadastrosClick(Sender: TObject);
begin
fm_Parametro.Show;
end;

procedure Tfm_Menu.im_PacienteClick(Sender: TObject);
begin

// Evento compartilhado

fm_Cadastro.pg_Cadastro.ActivePage :=
   TTabSheet(fm_Cadastro.FindComponent('pg_'+Copy(TMenuItem(Sender).Name,4,20)));

fm_Cadastro.Show;

end;

procedure Tfm_Menu.ExamesClick(Sender: TObject);
begin
fm_Exame.Show;
end;

procedure Tfm_Menu.im_CadastroClick(Sender: TObject);
begin

// Evento compatilhado

fm_Relatorio.pg_Relatorio.ActivePage :=
   TTabSheet(fm_Relatorio.FindComponent('pg_'+Copy(TMenuItem(Sender).Name,4,20)));

fm_Relatorio.Show;

end;

procedure Tfm_Menu.FormDestroy(Sender: TObject);
begin
Mensagem(TimeToStr(Time)+' - Fechando sistema',Nil,False);
end;

procedure Tfm_Menu.mi_SalvarClick(Sender: TObject);
VAR I:Integer;
    Z:Integer;
    vm_VetObj:ARRAY[1..400] OF TObject;
    X:Integer;
begin
{
X:=1;

FOR I:=1 TO 400 DO vm_VetObj[I] := Nil;

Mensagem(TimeToStr(Time)+' - Manutenções - Salvar',Nil,False);

FOR I := 0 TO Screen.FormCount-1 DO
    BEGIN

    IF Screen.Forms[I] <> Screen.ActiveForm THEN
       BEGIN
       IF Screen.Forms[I].Visible = True THEN
          BEGIN
          Screen.Forms[I].Close;
          vm_VetObj[X] := Screen.Forms[I];
          Inc(X);
          END;
       END;

    FOR Z:=0 TO Screen.Forms[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.Forms[I].Components[Z] IS TTable)              AND
           (TTable(Screen.Forms[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.Forms[I].Components[Z]).Close;
           vm_VetObj[X] := TTable(Screen.Forms[I].Components[Z]);
           Inc(X);
           END;

        END;

    END;


FOR I := 0 TO Screen.DataModuleCount-1 DO
    BEGIN

    FOR Z:=0 TO Screen.DataModules[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.DataModules[I].Components[Z] IS TTable) AND
           (TTable(Screen.DataModules[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.DataModules[I].Components[Z]).Close;
           vm_VetObj[X] := TTable(Screen.DataModules[I].Components[Z]);
           Inc(X);
           END;
        END;

    END;

Application.CreateForm(Tfm_Backup, fm_Backup);

fm_Backup.ShowModal;

fm_Backup.Free;
fm_Backup := Nil;

FOR I:=1 TO X DO
    BEGIN

    IF vm_VetObj[I] IS TForm  THEN
       TForm(vm_VetObj[I]).Show;
    IF vm_VetObj[I] IS TTable THEN
       TTable(vm_VetObj[I]).Open;

    END;
 }
end;

procedure Tfm_Menu.mi_RestaurarClick(Sender: TObject);
VAR I:Integer;
    Z:Integer;
    vm_VetObj:ARRAY[1..400] OF TObject;
    X:Integer;
begin

{
X:=1;

FOR I:=1 TO 400 DO vm_VetObj[I] := Nil;

Mensagem(TimeToStr(Time)+' - Manutenções - Salvar',Nil,False);

FOR I := 0 TO Screen.FormCount-1 DO
    BEGIN

    IF Screen.Forms[I] <> Screen.ActiveForm THEN
       BEGIN
       IF Screen.Forms[I].Visible = True THEN
          BEGIN
          Screen.Forms[I].Close;
          vm_VetObj[X] := Screen.Forms[I];
          Inc(X);
          END;
       END;

    FOR Z:=0 TO Screen.Forms[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.Forms[I].Components[Z] IS TTable)              AND
           (TTable(Screen.Forms[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.Forms[I].Components[Z]).Close;
           vm_VetObj[X] := TTable(Screen.Forms[I].Components[Z]);
           Inc(X);
           END;

        END;

    END;


FOR I := 0 TO Screen.DataModuleCount-1 DO
    BEGIN

    FOR Z:=0 TO Screen.DataModules[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.DataModules[I].Components[Z] IS TTable) AND
           (TTable(Screen.DataModules[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.DataModules[I].Components[Z]).Close;
           vm_VetObj[X] := TTable(Screen.DataModules[I].Components[Z]);
           Inc(X);
           END;
        END;

    END;

Application.CreateForm(Tfm_Restaurar, fm_Restaurar);

fm_Restaurar.ShowModal;

fm_Restaurar.Free;
fm_Restaurar := Nil;

FOR I:=1 TO X DO
    BEGIN

    IF vm_VetObj[I] IS TForm  THEN
       TForm(vm_VetObj[I]).Show;
    IF vm_VetObj[I] IS TTable THEN
       TTable(vm_VetObj[I]).Open;

    END;
}
end;

procedure Tfm_Menu.mi_CompactarClick(Sender: TObject);
VAR I:Integer;
    Z:Integer;
    vm_VetObj:ARRAY[1..400] OF TObject;
    X:Integer;
begin



X:=1;

FOR I:=1 TO 400 DO vm_VetObj[I] := Nil;

Mensagem(TimeToStr(Time)+' - Manutenções - Salvar',Nil,False);

FOR I := 0 TO Screen.FormCount-1 DO
    BEGIN

    IF Screen.Forms[I] <> Screen.ActiveForm THEN
       BEGIN
       IF Screen.Forms[I].Visible = True THEN
          BEGIN
          Screen.Forms[I].Close;
          vm_VetObj[X] := Screen.Forms[I];
          Inc(X);
          END;
       END;

    FOR Z:=0 TO Screen.Forms[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.Forms[I].Components[Z] IS TTable)              AND
           (TTable(Screen.Forms[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.Forms[I].Components[Z]).Close;
           vm_VetObj[X] := TTable(Screen.Forms[I].Components[Z]);
           Inc(X);
           END;

        END;

    END;


FOR I := 0 TO Screen.DataModuleCount-1 DO
    BEGIN

    FOR Z:=0 TO Screen.DataModules[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.DataModules[I].Components[Z] IS TTable) AND
           (TTable(Screen.DataModules[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.DataModules[I].Components[Z]).Close;
           vm_VetObj[X] := TTable(Screen.DataModules[I].Components[Z]);
           Inc(X);
           END;
        END;

    END;

Application.CreateForm(Tfm_Compactar, fm_Compactar);

fm_Compactar.ShowModal;

fm_Compactar.Free;
fm_Compactar := Nil;

FOR I:=1 TO X DO
    BEGIN

    IF vm_VetObj[I] IS TForm  THEN
       TForm(vm_VetObj[I]).Show;
    IF vm_VetObj[I] IS TTable THEN
       TTable(vm_VetObj[I]).Open;

    END;


end;

procedure Tfm_Menu.bt_CtasPagarClick(Sender: TObject);
begin
if (fm_CtasPagar = nil) then
  Application.CreateForm(Tfm_CtasPagar, fm_CtasPagar);

fm_CtasPagar.Show;
end;

procedure Tfm_Menu.bt_CaixaClick(Sender: TObject);
begin
if (fm_Caixa = nil) then
  Application.CreateForm(Tfm_Caixa, fm_Caixa);

fm_Caixa.Show;
end;

procedure Tfm_Menu.Image1Click(Sender: TObject);
begin
mi_RestaurarClick(Sender);
end;

procedure Tfm_Menu.ScriptsClick(Sender: TObject);
begin
{*
 FecharTodosForm(TimeToStr(Time)+' - Manutenções - Scripts');
 Application.CreateForm(Tfm_Script, fm_Script);
 fm_Script.ShowModal;
 fm_Script.Free;
 AbrirTodosForm;
*}
end;

procedure Tfm_Menu.TestagemAparelho1Click(Sender: TObject);
begin
 fm_Testagem.Show;
end;

procedure Tfm_Menu.im_VendaClick(Sender: TObject);
begin
 fm_Venda.Show;
end;

procedure Tfm_Menu.FormShow(Sender: TObject);
var bOk:Boolean;
begin

bOk := True;

IF fm_Senha = Nil THEN
   Application.CreateForm(Tfm_Senha, fm_Senha);

if fm_Senha.ShowModal <> mrok then begin
   bOk := False;
   Application.Terminate;
end;

StatusBar.Panels[1].Text := 'Funcionário : '+vm_NomUsuSenha;

bt_Caixa.Enabled := vm_CodUsuSenha = 1;

fm_Senha.Free;
fm_Senha := Nil;

end;

end.
