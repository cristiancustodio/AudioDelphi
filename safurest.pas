unit safurest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, FileCtrl, CheckLst;

type
  Tfm_Restaurar = class(TForm)
    bt_Iniciar: TButton;
    bt_Fechar: TButton;
    bt_Cancelar: TButton;
    Bevel1: TBevel;
    ProgressBar: TProgressBar;
    RichEdit1: TRichEdit;
    lb_Situacao: TLabel;
    procedure bt_IniciarClick(Sender: TObject);
    procedure BackupFileProgress(Sender: TObject; Filename: String;
      Percent: TPercentage; var Continue: Boolean);
    procedure bt_FecharClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Restaurar: Tfm_Restaurar;
  vm_Cancel: Boolean;

implementation

{$R *.DFM}

procedure Tfm_Restaurar.bt_IniciarClick(Sender: TObject);
VAR I:Integer;
begin

IF SetCurrentDir('A:\') = False THEN
   BEGIN
   ShowMessage('Coloque o disco de backup na unidade A:');
   Exit;
   END;

bt_Iniciar.Enabled  := False;
bt_Fechar.Visible   := False;
bt_Cancelar.Visible := True;

IF BackupFile.Restore('A:Backup.001', 'C:') then
   ShowMessage('Restauração realizada com sucesso, '+InttoStr(BackupFile.FilesProcessed)+
                ' arquivos de '+InttoStr(BackupFile.FilesTotal)+' restaurados')
ELSE
   BEGIN
   IF vm_Cancel = False THEN
      ShowMessage('Houve falha na restauração !'+#13+'Os arquivos não foram restaurados corretamente. Erro !')
   ELSE
      ShowMessage('A copia de dados foi interrompida pelo usuário!');
   END;

bt_Iniciar.Enabled  := True;
bt_Cancelar.Visible := False;
bt_Fechar.Visible   := True;

vm_Cancel := False;

SetCurrentDir('C:')

end;

procedure Tfm_Restaurar.BackupFileProgress(Sender: TObject; Filename: String;
  Percent: TPercentage; var Continue: Boolean);
begin

IF vm_Cancel = False THEN
   BEGIN
   lb_Situacao.Caption  := 'Restaurando arquivo: '+FileName;
   ProgressBar.Position := Percent;
   END;

Continue := Not(vm_Cancel);

end;

procedure Tfm_Restaurar.bt_FecharClick(Sender: TObject);
begin

Close;

end;

procedure Tfm_Restaurar.bt_CancelarClick(Sender: TObject);
begin
vm_Cancel := True;
end;

procedure Tfm_Restaurar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IF BackupFile.Busy THEN
   Action := caNone
ELSE
   Action := caHide;
end;

INITIALIZATION

vm_Cancel := False;

end.





