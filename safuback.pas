unit safuback;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, FileCtrl, CheckLst;

type
  Tfm_Backup = class(TForm)
    bt_Iniciar: TButton;
    bt_Fechar: TButton;
    bt_Cancelar: TButton;
    Bevel1: TBevel;
    ProgressBar: TProgressBar;
    RichEdit1: TRichEdit;
    lb_Situacao: TLabel;
    FileListBox: TFileListBox;
    procedure bt_IniciarClick(Sender: TObject);
    procedure BackupFileProgress(Sender: TObject; Filename: String;
      Percent: TPercentage; var Continue: Boolean);
    procedure bt_FecharClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackupFileNeedDisk(Sender: TObject; DiskID: Word;
      var Continue: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Backup: Tfm_Backup;
  vm_Cancel: Boolean;

implementation

{$R *.DFM}

procedure Tfm_Backup.bt_IniciarClick(Sender: TObject);
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

FileListBox.Mask    := 'A:*.*';
IF FileListBox.Items.Count <> 0 THEN
   BEGIN
   lb_Situacao.Caption  := 'Eliminando os arquivos existentes no disco!';
   ProgressBar.Position := 80;
   Application.ProcessMessages;
   FOR I:=0 TO FileListBox.Items.Count-1 DO DeleteFile('A:'+FileListBox.Items[I]);
   END;

BackupFile.BackupTitle := 'Copia '+FormatDateTime('ddmmyyyy',Now);

FileListBox.Mask := '???A*.*';


IF BackupFile.Backup(FileListBox.Items, 'A:Backup.001') = True THEN
   ShowMessage('Copia realizada com sucesso !'+#13+
               'Taxa de compressão = '+IntToStr(BackupFile.CompressionRate)+' %')
ELSE
   BEGIN
   IF vm_Cancel = False THEN
      ShowMessage('Houve falha na cópia !'+#13+'O arquivo não foi gerado. Erro !')
   ELSE
      ShowMessage('A copia de dados foi interrompida pelo usuário!');
   END;

bt_Iniciar.Enabled  := True;
bt_Cancelar.Visible := False;
bt_Fechar.Visible   := True;

vm_Cancel := False;

end;

procedure Tfm_Backup.BackupFileProgress(Sender: TObject; Filename: String;
  Percent: TPercentage; var Continue: Boolean);
begin

IF vm_Cancel = False THEN
   BEGIN
   lb_Situacao.Caption  := 'Copiando arquivo: '+FileName;
   ProgressBar.Position := Percent;
   END;
   
Continue := Not(vm_Cancel);

end;

procedure Tfm_Backup.bt_FecharClick(Sender: TObject);
begin

Close;

end;

procedure Tfm_Backup.bt_CancelarClick(Sender: TObject);
begin
vm_Cancel := True;
end;

procedure Tfm_Backup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IF BackupFile.Busy THEN
   Action := caNone
ELSE
   Action := caHide;
end;

procedure Tfm_Backup.BackupFileNeedDisk(Sender: TObject; DiskID: Word;
  var Continue: Boolean);
VAR I:Integer;  
begin

IF MessageDlg('Insira o '+IntToStr(DiskID)+'° Disco no Drive A:', mtConfirmation,
              [mbOk,mbCancel], 0) = mrOk THEN
   BEGIN
   
   FileListBox.Mask    := 'A:*.*';
   IF FileListBox.Items.Count <> 0 THEN
      BEGIN
      lb_Situacao.Caption  := 'Eliminando os arquivos existentes no disco!';
      ProgressBar.Position := 80;
      Application.ProcessMessages;
      FOR I:=0 TO FileListBox.Items.Count-1 DO DeleteFile('A:'+FileListBox.Items[I]);
      END;
                                        
   Continue := True;
   END
ELSE
   BEGIN
   vm_Cancel := True;
   Continue  := False;
   END;



end;

INITIALIZATION

vm_Cancel := False;

end.
