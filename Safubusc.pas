unit Safubusc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, ActnList;

type
  Tfm_Busca = class(TForm)
    Bevel2: TBevel;
    Panel1: TPanel;
    bt_Sair: TSpeedButton;
    bt_Ok: TSpeedButton;
    lblBusca: TLabel;
    edBusca: TEdit;
    dg_Busca: TDBGrid;
    bt_Confirma: TSpeedButton;
    DataSource: TDataSource;
    ADOQuery: TADOQuery;
    ActionList1: TActionList;
    ac_Enter: TAction;
    ac_Esc: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_OkClick(Sender: TObject);
    procedure bt_ConfirmaClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure edBuscaChange(Sender: TObject);
    procedure dg_BuscaDblClick(Sender: TObject);
    procedure ac_EnterExecute(Sender: TObject);
    procedure ac_EscExecute(Sender: TObject);
  private
    fCodigo: Longint;
    vm_TabelaDb: String;
    vm_CampoCodigo: String;
    vm_CampoNome: String;
    procedure OpenQuery(vm_ParStrFiltro: String = '');
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; vm_ParTabelaDb: String; vm_ParCampoCodigo:String; vm_ParCampoNome:String; vm_ParTitulo: String = '');
    property Codigo : Longint read fCodigo;
    { Public declarations }
  end;

function GetDescricao(vm_ParCodigo: Integer; vm_ParTabelaDb, vm_ParCampoCodigo, vm_ParCampoNome: String) : String;  

var
  fm_Busca: Tfm_Busca;

implementation

uses safdgera;

{$R *.dfm}


function GetDescricao(vm_ParCodigo: Integer; vm_ParTabelaDb, vm_ParCampoCodigo, vm_ParCampoNome: String) : String;
var vm_LocalADOQuery: TADOQuery;
begin

  vm_LocalADOQuery := TADOQuery.Create(Application);

  vm_LocalADOQuery.Connection := dm_Geral.ADOConnection;

  vm_LocalADOQuery.SQL.Text := ' select '+vm_ParCampoNome + ' as NOME from ' + vm_ParTabelaDb +
                               ' where '+vm_ParCampoCodigo + ' = ' + IntToStr(vm_ParCodigo);

  vm_LocalADOQuery.Open;
  Result := vm_LocalADOQuery.Fields[0].AsString;
  vm_LocalADOQuery.Close;
  vm_LocalADOQuery.Free;

end;

procedure Tfm_Busca.OpenQuery(vm_ParStrFiltro: String = '');
begin
  ADOQuery.SQL.Text := 'select top 15 '+vm_CampoCodigo + ' as CODIGO, ' + vm_CampoNome + ' as NOME from ' + vm_TabelaDb;
  IF vm_ParStrFiltro <> '' THEN
  BEGIN
     ADOQuery.SQL.Text := ADOQuery.SQL.Text + ' where ' + vm_CampoNome + ' like ' + ''''+UpperCase(vm_ParStrFiltro)+'%''';
  END;

  //IF Length(vm_ParStrFiltro) < 2 THEN
  //   ADOQuery.SQL.Text := StringReplace(ADOQuery.SQL.Text, 'top10', 'top 10', [])
  //ELSE
  //   ADOQuery.SQL.Text := StringReplace(ADOQuery.SQL.Text, 'top10', 'top ', []);

  ADOQuery.SQL.Text := ADOQuery.SQL.Text + ' order by 2';
  ADOQuery.Open;
end;

constructor Tfm_Busca.Create(AOwner: TComponent; vm_ParTabelaDb,
  vm_ParCampoCodigo, vm_ParCampoNome: String; vm_ParTitulo: String = '');
begin

  inherited Create(AOwner);

  vm_TabelaDb := vm_ParTabelaDb;
  vm_CampoCodigo := vm_ParCampoCodigo;
  vm_CampoNome := vm_ParCampoNome;

  IF (vm_ParTitulo <> '') THEN
  BEGIN
     Self.Caption := 'Busca por ' + vm_ParTitulo;
     lblBusca.Caption := vm_ParTitulo;
  END;

  OpenQuery();


end;

procedure Tfm_Busca.FormCreate(Sender: TObject);
begin
  fCodigo := 0
end;

procedure Tfm_Busca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery.Close;
end;

procedure Tfm_Busca.bt_OkClick(Sender: TObject);
begin
  fCodigo := ADOQuery.Fields[0].AsInteger;
//  fDescricao := ADOQuery.Fields[1].AsString;
  ModalResult := mrOk;
end;

procedure Tfm_Busca.bt_ConfirmaClick(Sender: TObject);
begin
  OpenQuery(edBusca.Text);
end;

procedure Tfm_Busca.bt_SairClick(Sender: TObject);
begin
  ModalResult := mrCancel;

end;

procedure Tfm_Busca.edBuscaChange(Sender: TObject);
begin
  OpenQuery(edBusca.Text);
end;

procedure Tfm_Busca.dg_BuscaDblClick(Sender: TObject);
begin
  bt_OkClick(nil);
end;

procedure Tfm_Busca.ac_EnterExecute(Sender: TObject);
begin
  bt_OkClick(nil);
end;

procedure Tfm_Busca.ac_EscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
