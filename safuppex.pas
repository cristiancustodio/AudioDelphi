unit safuppex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Db, DBTables,
  ActnList, ADODB;

type
  Tfm_ProcuraExame = class(TForm)
    Bevel2: TBevel;
    lblPacienteLabel: TLabel;
    qr_Exame: TADOQuery;
    ds_Exame: TDataSource;
    qr_ExameEXNumExa: TIntegerField;
    qr_ExameEXDatExa: TDateField;
    qr_ExameEXTipExa: TStringField;
    qr_ExamePCNome: TStringField;
    dg_Exame: TDBGrid;
    Panel1: TPanel;
    bt_Sair: TSpeedButton;
    bt_Ok: TSpeedButton;
    Label2: TLabel;
    ed_NumExa: TEdit;
    ActionList1: TActionList;
    ac_Enter: TAction;
    Timer: TTimer;
    lblPaciente: TLabel;
    edPacienteCodigo: TEdit;
    procedure lc_PacienteEnter(Sender: TObject);
    procedure dg_ExameDblClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure bt_OkClick(Sender: TObject);
    procedure qr_ExameAfterScroll(DataSet: TDataSet);
    procedure lc_PacienteExit(Sender: TObject);
    procedure ac_EnterExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure lc_PacienteClick(Sender: TObject);
    procedure lblPacienteLabelClick(Sender: TObject);
    procedure edPacienteCodigoExit(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
    procedure ed_NumExaExit(Sender: TObject);
  private
    procedure MostrarPaciente(vm_ParCodigo: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_ProcuraExame: Tfm_ProcuraExame;

implementation

Uses SafdGera, Safubusc;

{$R *.DFM}

PROCEDURE Tfm_ProcuraExame.MostrarPaciente(vm_ParCodigo: Integer);
BEGIN
  lblPaciente.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safapc', 'PCCodPac', 'PCNome');
  Timer.Enabled := False;
  Timer.Enabled := True;
  if (lblPaciente.Caption <> '') then ac_Enter.Enabled := True else ac_Enter.Enabled := False;
END;

procedure Tfm_ProcuraExame.lc_PacienteEnter(Sender: TObject);
begin
dm_Geral.tb_Paciente.IndexFieldNames := 'PCNome';
ac_Enter.Enabled := False;
end;

procedure Tfm_ProcuraExame.dg_ExameDblClick(Sender: TObject);
begin
fm_ProcuraExame.ModalResult := mrOk;
end;

procedure Tfm_ProcuraExame.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_ProcuraExame.bt_OkClick(Sender: TObject);
begin
fm_ProcuraExame.ModalResult := mrOk;
end;

procedure Tfm_ProcuraExame.qr_ExameAfterScroll(DataSet: TDataSet);
begin
ed_NumExa.Text := qr_ExameEXNumExa.AsString;
end;

procedure Tfm_ProcuraExame.lc_PacienteExit(Sender: TObject);
begin
ed_NumExa.Text   := qr_ExameEXNumExa.AsString;
ac_Enter.Enabled := True;
end;

procedure Tfm_ProcuraExame.ac_EnterExecute(Sender: TObject);
begin

bt_OkClick(Sender);

end;

procedure Tfm_ProcuraExame.TimerTimer(Sender: TObject);
begin
qr_Exame.Active := False;
if StrToIntDef(edPacienteCodigo.Text, 0) + StrToIntDef(ed_NumExa.Text, 0) > 0 then
  begin
  qr_Exame.Parameters[0].Value := StrToIntDef(edPacienteCodigo.Text, 0);
  qr_Exame.Parameters[1].Value := StrToIntDef(ed_NumExa.Text, 0);
  qr_Exame.Active := True;
  end;
Timer.Enabled := False;
end;

procedure Tfm_ProcuraExame.lc_PacienteClick(Sender: TObject);
begin
Timer.Enabled := False;
Timer.Enabled := True;
end;

procedure Tfm_ProcuraExame.lblPacienteLabelClick(Sender: TObject);
begin
  WITH Tfm_Busca.Create(Application, 'safapc', 'PCCodPac', 'PCNome') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      edPacienteCodigo.Text := IntToStr(Codigo);

      if StrToIntDef(edPacienteCodigo.Text, 0) <> 0 then ed_NumExa.Clear;      

      MostrarPaciente(Codigo);

    END;
  END;
end;

procedure Tfm_ProcuraExame.edPacienteCodigoExit(Sender: TObject);
begin
 if StrToIntDef(edPacienteCodigo.Text, 0) <> 0 then ed_NumExa.Clear;
 MostrarPaciente(StrToIntDef(edPacienteCodigo.Text, 0));
end;

procedure Tfm_ProcuraExame.ac_EscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfm_ProcuraExame.ed_NumExaExit(Sender: TObject);
begin
  Timer.Enabled := False;
  Timer.Enabled := True;
end;

end.
