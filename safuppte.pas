unit safuppte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Db, DBTables,
  ActnList;

type
  Tfm_ProcuraTestagem = class(TForm)
    Bevel2: TBevel;
    lc_Paciente: TDBLookupComboBox;
    Label1: TLabel;
    qr_Testagem: TQuery;
    ds_Testagem: TDataSource;
    dg_Exame: TDBGrid;
    Panel1: TPanel;
    bt_Sair: TSpeedButton;
    bt_Ok: TSpeedButton;
    Label2: TLabel;
    ed_NumTes: TEdit;
    ActionList1: TActionList;
    ac_Enter: TAction;
    Timer: TTimer;
    procedure lc_PacienteEnter(Sender: TObject);
    procedure dg_ExameDblClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure bt_OkClick(Sender: TObject);
    procedure qr_TestagemAfterScroll(DataSet: TDataSet);
    procedure lc_PacienteExit(Sender: TObject);
    procedure ac_EnterExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure lc_PacienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_ProcuraTestagem: Tfm_ProcuraTestagem;

implementation

Uses SafdGera;

{$R *.DFM}

procedure Tfm_ProcuraTestagem.lc_PacienteEnter(Sender: TObject);
begin
dm_Geral.tb_Paciente.IndexFieldNames := 'PCNome';
ac_Enter.Enabled := False;
end;

procedure Tfm_ProcuraTestagem.dg_ExameDblClick(Sender: TObject);
begin
fm_ProcuraTestagem.ModalResult := mrOk;
end;

procedure Tfm_ProcuraTestagem.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_ProcuraTestagem.bt_OkClick(Sender: TObject);
begin
fm_ProcuraTestagem.ModalResult := mrOk;
end;

procedure Tfm_ProcuraTestagem.qr_TestagemAfterScroll(DataSet: TDataSet);
begin
ed_NumTes.Text := qr_Testagem.FieldByName('TENumTes').AsString;
end;

procedure Tfm_ProcuraTestagem.lc_PacienteExit(Sender: TObject);
begin
ed_NumTes.Text   := qr_Testagem.FieldByName('TENumTes').AsString;
ac_Enter.Enabled := True;
end;

procedure Tfm_ProcuraTestagem.ac_EnterExecute(Sender: TObject);
begin

bt_OkClick(Sender);

end;

procedure Tfm_ProcuraTestagem.TimerTimer(Sender: TObject);
begin
qr_Testagem.Active := False;
qr_Testagem.Params[0].AsInteger := lc_Paciente.KeyValue;
qr_Testagem.Active := True;
Timer.Enabled := False;
end;

procedure Tfm_ProcuraTestagem.lc_PacienteClick(Sender: TObject);
begin
Timer.Enabled := False;
Timer.Enabled := True;
end;

end.
