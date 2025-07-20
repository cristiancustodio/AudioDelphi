unit safurela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, QuickRpt, Mask, DBCtrls, Db,
  DBTables, Bde, ADODB, safubusc;

type
  Tfm_Relatorio = class(TForm)
    pg_Relatorio: TPageControl;
    pg_Cadastro: TTabSheet;
    Panel1: TPanel;
    bt_Sair: TSpeedButton;
    Bevel3: TBevel;
    Bevel10: TBevel;
    Bevel4: TBevel;
    pg_Exame: TTabSheet;
    Bevel2: TBevel;
    cb_Cadastro: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cb_Exame: TComboBox;
    bt_Video: TSpeedButton;
    bt_Impressora: TSpeedButton;
    pn_NumExa: TPanel;
    Label3: TLabel;
    ed_NumExa: TEdit;
    pn_PeriodoExa: TPanel;
    Label4: TLabel;
    ed_DatIni: TMaskEdit;
    ed_DatFin: TMaskEdit;
    Label5: TLabel;
    pn_Empresa: TPanel;
    StatusBar: TStatusBar;
    pn_MesAno: TPanel;
    Label7: TLabel;
    ed_MesAno: TMaskEdit;
    tb_Parametro: TADOTable;
    ds_Parametro: TDataSource;
    rg_Margem: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ed_MarEsq: TDBEdit;
    ed_MarSup: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    tb_ParametroPAMarSup: TIntegerField;
    tb_ParametroPAMarEsq: TIntegerField;
    pg_Faturamento: TTabSheet;
    Label12: TLabel;
    pn_Despesa: TPanel;
    Label13: TLabel;
    cb_Despesa: TDBLookupComboBox;
    pn_Cliente: TPanel;
    Label14: TLabel;
    cb_Cliente: TDBLookupComboBox;
    pn_Fornecedor: TPanel;
    cb_Faturamento: TComboBox;
    pn_PeriodoFat: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    ed_DatIniFat: TMaskEdit;
    ed_DatFinFat: TMaskEdit;
    rg_Despesa: TRadioGroup;
    rg_CtasReceber: TRadioGroup;
    rg_CtasPagar: TRadioGroup;
    Bevel1: TBevel;
    pg_Aparelho: TTabSheet;
    cb_Aparelho: TComboBox;
    Label18: TLabel;
    Bevel5: TBevel;
    pn_PeriodoApa: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    ed_DatIniApa: TMaskEdit;
    ed_DatFinApa: TMaskEdit;
    lblEmpresaLabel: TLabel;
    edEmpresaCodigo: TEdit;
    lblEmpresa: TLabel;
    lblFornecedor: TLabel;
    edFornecedorCodigo: TEdit;
    lblFornecedorLabel: TLabel;
    procedure bt_SairClick(Sender: TObject);
    procedure bt_VideoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_ExameClick(Sender: TObject);
    procedure cb_EmpresaEnter(Sender: TObject);
    procedure ed_DatIniExit(Sender: TObject);
    procedure ed_MesAnoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tb_ParametroAfterPost(DataSet: TDataSet);
    procedure cb_FaturamentoClick(Sender: TObject);
    procedure rg_CtasReceberClick(Sender: TObject);
    procedure rg_DespesaClick(Sender: TObject);
    procedure cb_AparelhoClick(Sender: TObject);
    procedure lblEmpresaLabelClick(Sender: TObject);
    procedure edEmpresaCodigoExit(Sender: TObject);
    procedure edEmpresaCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblFornecedorLabelClick(Sender: TObject);
    procedure edFornecedorCodigoExit(Sender: TObject);
    procedure edFornecedorCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pg_RelatorioChange(Sender: TObject);
  private
    PROCEDURE MostrarFornecedor(vm_ParCodigo: Integer);  
    procedure MostrarEmpresa(vm_ParCodigo: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Relatorio: Tfm_Relatorio;
  vm_Mes:Word;
  vm_Ano:Word;
  vm_Dia:Word;
  vm_Dat:TDateTime;

implementation

uses safumenu, safrpaci, safdgera, safrExam, safrexpe, safrexve, safremve,
     safrempr, safrconv, safrpato, safrmeat, safrfunc, saffgera, Safrcrve,
  safrabar, Safrqtcr, safrvecp, Safrabpg, Safrqtpg, Safrcaix, Safrdere,
  Safrdede, Safrficl, Safrfifo, safrapusu, SAFRAPRE, safrcomp, safrserv;

{$R *.DFM}


PROCEDURE Tfm_Relatorio.MostrarFornecedor(vm_ParCodigo: Integer);
BEGIN
  lblFornecedor.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safafo', 'FOCodFor', 'FONome');
END;


PROCEDURE Tfm_Relatorio.MostrarEmpresa(vm_ParCodigo: Integer);
VAR vm_Mes : Variant;
BEGIN
  lblEmpresa.Caption := safubusc.GetDescricao(vm_ParCodigo, 'safaem', 'EMCodEmp', 'EMRazao');
END;


procedure Tfm_Relatorio.bt_SairClick(Sender: TObject);
begin
Close;
end;

procedure Tfm_Relatorio.bt_VideoClick(Sender: TObject);
VAR vm_ObjRelatorio:TQuickRep;
    vm_NumExa:LongInt;
    vm_DatIni:TDateTime;
    vm_DatFin:TDateTime;
    vm_ObjCombo:TComboBox;
begin

// Evento compartilhado
// ** Alerta **  Existem comandos exits no interior deste procedimento.


Screen.Cursor := crHourGlass;

vm_ObjRelatorio := Nil;

IF pg_Relatorio.ActivePage = pg_Cadastro THEN
   BEGIN

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Pacientes' THEN
      BEGIN

      IF rp_Paciente <> Nil THEN
         rp_Paciente.Free;

      Application.CreateForm(Trp_Paciente, rp_Paciente);

      vm_ObjRelatorio := rp_Paciente;
      rp_Paciente.qr_Paciente.Active := False;
      rp_Paciente.qr_Paciente.Active := True;

      END;

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Empresas' THEN
      BEGIN

      IF rp_Empresa <> Nil THEN
         rp_Empresa.Free;

      Application.CreateForm(Trp_Empresa, rp_Empresa);

      vm_ObjRelatorio := rp_Empresa;
      rp_Empresa.qr_Empresa.Active := False;
      rp_Empresa.qr_Empresa.Active := True;

      END;

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Convênios' THEN
      BEGIN

      IF rp_Convenio <> Nil THEN
         rp_Convenio.Free;

      Application.CreateForm(Trp_Convenio, rp_Convenio);

      vm_ObjRelatorio := rp_Convenio;
      rp_Convenio.qr_Convenio.Active := False;
      rp_Convenio.qr_Convenio.Active := True;

      END;

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Patologias' THEN
      BEGIN

      IF rp_Patologia <> Nil THEN
         rp_Patologia.Free;

      Application.CreateForm(Trp_Patologia, rp_Patologia);

      vm_ObjRelatorio := rp_Patologia;
      rp_Patologia.qr_Patologia.Active := False;
      rp_Patologia.qr_Patologia.Active := True;

      END;


   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Meatoscopias' THEN
      BEGIN

      IF rp_Meatoscopia <> Nil THEN
         rp_Meatoscopia.Free;

      Application.CreateForm(Trp_Meatoscopia, rp_Meatoscopia);

      vm_ObjRelatorio := rp_Meatoscopia;
      rp_Meatoscopia.qr_Meatoscopia.Active := False;
      rp_Meatoscopia.qr_Meatoscopia.Active := True;

      END;

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Funções' THEN
      BEGIN

      IF rp_Funcao <> Nil THEN
         rp_Funcao.Free;

      Application.CreateForm(Trp_Funcao, rp_Funcao);

      vm_ObjRelatorio := rp_Funcao;
      rp_Funcao.qr_Funcao.Active := False;
      rp_Funcao.qr_Funcao.Active := True;

      END;

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Compradores' THEN
      BEGIN

      IF rp_Comprador <> Nil THEN
         rp_Comprador.Free;

      Application.CreateForm(Trp_Comprador, rp_Comprador);

      vm_ObjRelatorio := rp_Comprador;
      rp_Comprador.qr_Comprador.Active := False;
      rp_Comprador.qr_Comprador.Active := True;

      END;

   IF cb_Cadastro.Items[cb_Cadastro.ItemIndex] = 'Serviços' THEN
      BEGIN

      IF rp_Servico <> Nil THEN
         rp_Servico.Free;

      Application.CreateForm(Trp_Servico, rp_Servico);

      vm_ObjRelatorio := rp_Servico;
      rp_Servico.qr_Servico.Active := False;
      rp_Servico.qr_Servico.Active := True;

      END;


   END;


IF pg_Relatorio.ActivePage = pg_Exame THEN
   BEGIN

   TRY
   IF ed_DatIni.Text = '  /  /    ' THEN
      vm_DatIni := StrToDate('01/01/1000')
   ELSE
      vm_DatIni := StrToDate(ed_DatIni.Text);

   IF ed_DatFin.Text = '  /  /    ' THEN
      vm_DatFin := StrToDate('01/01/9999')
   ELSE
      vm_DatFin := StrToDate(ed_DatFin.Text);
   EXCEPT
   Mensagem('Data Inválida!',StatusBar,True);
   Screen.Cursor := crDefault;
   Exit;
   END;

   IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Exame' THEN
      BEGIN

      TRY
      vm_NumExa := StrToInt(ed_NumExa.Text);
      EXCEPT
      Mensagem('Número do exame inválido!',StatusBar,True);
      ed_NumExa.SetFocus;
      Screen.Cursor := crDefault;
      Exit;
      END;

      IF rp_Exame <> Nil THEN
         rp_Exame.Free;

      Application.CreateForm(Trp_Exame, rp_Exame);

      vm_ObjRelatorio := rp_Exame;

      //tb_Parametro.Refresh;

      rp_Exame.Page.TopMargin  := tb_ParametroPAMarSup.Value;
      rp_Exame.Page.LeftMargin := tb_ParametroPAMarEsq.Value;

      rp_Exame.qr_Exame.Active          := False;
      rp_Exame.qr_Exame.Parameters[0].Value := vm_NumExa;
      rp_Exame.qr_Exame.Active          := True;
      rp_Exame.tb_ItemExame.Active      := False;
      rp_Exame.tb_ItemExame.Active      := True;

      rp_Exame.GerarGraficoExame(vm_NumExa);

      END;


   IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Exames no período' THEN
      BEGIN

      IF rp_ExamePeriodo <> Nil THEN
         rp_ExamePeriodo.Free;

      Application.CreateForm(Trp_ExamePeriodo, rp_ExamePeriodo);

      vm_ObjRelatorio := rp_ExamePeriodo;

      rp_ExamePeriodo.qr_ExamePeriodo.Active          := False;
      rp_ExamePeriodo.qr_ExamePeriodo.Parameters[0].Value := StrToIntDef(edEmpresaCodigo.Text, 0);
      rp_ExamePeriodo.qr_ExamePeriodo.Parameters[1].Value := vm_DatIni;
      rp_ExamePeriodo.qr_ExamePeriodo.Parameters[2].Value := vm_DatFin;
      rp_ExamePeriodo.qr_ExamePeriodo.Active          := True;

      rp_ExamePeriodo.lb_Periodo.Caption :=
             'Período: De '+DateToStr(vm_DatIni)+' à '+DateToStr(vm_DatFin);

      END;


   IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Pacientes com exames vencidos' THEN
      BEGIN

      IF ed_MesAno.Text = '  /    ' THEN
         BEGIN
         Mensagem('É necessário informar o Mês/Ano!',StatusBar,True);
         ed_MesAno.SetFocus;
         Screen.Cursor := crDefault;
         Exit;
         END;

      vm_Mes := StrToInt(Trim(Copy(ed_MesAno.Text,1,2)));
      vm_Ano := StrToInt(Trim(Copy(ed_MesAno.Text,4,4)));

      IF rp_ExameVencido <> Nil THEN
         BEGIN
         rp_ExameVencido.tb_TMPA.Active := False;
         rp_ExameVencido.Free;
         END;

      Application.CreateForm(Trp_ExameVencido, rp_ExameVencido);

      vm_ObjRelatorio := rp_ExameVencido;

      rp_ExameVencido.vm_Ano    := vm_Ano;
      rp_ExameVencido.vm_Mes    := vm_Mes;
      rp_ExameVencido.vm_CodEmp := StrToIntDef(edEmpresaCodigo.Text, 0);

      rp_ExameVencido.tb_TMPA.Active := False;
      rp_ExameVencido.tb_TMPA.Active := True;

      rp_ExameVencido.lb_MesAno.Caption :=
            'Mês/Ano: '+FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);

      END;


   IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Empresas com exames vencidos' THEN
      BEGIN

      IF ed_MesAno.Text = '  /    ' THEN
         BEGIN
         Mensagem('É necessário informar o Mês/Ano!',StatusBar,True);
         ed_MesAno.SetFocus;
         Screen.Cursor := crDefault;
         Exit;
         END;

      vm_Mes := StrToInt(Trim(Copy(ed_MesAno.Text,1,2)));
      vm_Ano := StrToInt(Trim(Copy(ed_MesAno.Text,4,4)));

      IF rp_EmpresaVencida <> Nil THEN
         BEGIN
         rp_EmpresaVencida.tb_TMPA.Active := False;
         rp_EmpresaVencida.Free;
         END;

      Application.CreateForm(Trp_EmpresaVencida, rp_EmpresaVencida);

      vm_ObjRelatorio := rp_EmpresaVencida;

      rp_EmpresaVencida.vm_Ano := vm_Ano;
      rp_EmpresaVencida.vm_Mes := vm_Mes;

      rp_EmpresaVencida.tb_TMPA.Active  := False;
      rp_EmpresaVencida.tb_TMPA.Active  := True;

      rp_EmpresaVencida.lb_MesAno.Caption :=
            'Mês/Ano: '+FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);

      END;

   END;



IF pg_Relatorio.ActivePage = pg_Faturamento THEN
   BEGIN

   TRY
   IF ed_DatIniFat.Text = '  /  /    ' THEN
      vm_DatIni := StrToDate('01/01/1000')
   ELSE
      vm_DatIni := StrToDate(ed_DatIniFat.Text);

   IF ed_DatFinFat.Text = '  /  /    ' THEN
      vm_DatFin := StrToDate('01/01/9999')
   ELSE
      vm_DatFin := StrToDate(ed_DatFinFat.Text);
   EXCEPT
   Mensagem('Data Inválida!',StatusBar,True);
   Screen.Cursor := crDefault;
   Exit;
   END;

   IF cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ctas Pagar' THEN
      BEGIN

      IF rg_CtasPagar.Items[rg_CtasPagar.ItemIndex] = 'Vencidas' THEN
         BEGIN

         IF rp_VencidaCtpg = Nil THEN
            Application.CreateForm(Trp_VencidaCtpg, rp_VencidaCtpg);

         vm_ObjRelatorio := rp_VencidaCtpg;
         rp_VencidaCtpg.qr_VencidaCtpg.Active := False;
         rp_VencidaCtpg.qr_VencidaCtpg.Parameters[0].Value := Date;
         rp_VencidaCtpg.qr_VencidaCtpg.Active := True;
         END;

      IF rg_CtasPagar.Items[rg_CtasPagar.ItemIndex] = 'Em Aberto' THEN
         BEGIN

         IF rp_AbertaCtpg = Nil THEN
            Application.CreateForm(Trp_AbertaCtpg, rp_AbertaCtpg);

         vm_ObjRelatorio := rp_AbertaCtpg;
         rp_AbertaCtpg.lb_Periodo.Caption   := 'De  '+DateToStr(vm_DatIni)+' à '+
                                               DateToStr(vm_DatFin);
         rp_AbertaCtpg.qr_AbertaCtpg.Active := False;
         rp_AbertaCtpg.qr_AbertaCtpg.Parameters[0].Value := vm_DatIni;
         rp_AbertaCtpg.qr_AbertaCtpg.Parameters[1].Value := vm_DatFin;
         rp_AbertaCtpg.qr_AbertaCtpg.Active := True;
         END;

      IF rg_CtasPagar.Items[rg_CtasPagar.ItemIndex] = 'Quitadas' THEN
         BEGIN

         IF rp_QuitadaCtpg = Nil THEN
            Application.CreateForm(Trp_QuitadaCtpg, rp_QuitadaCtpg);

         vm_ObjRelatorio := rp_QuitadaCtpg;
         rp_QuitadaCtpg.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                              DateToStr(vm_DatFin);
         rp_QuitadaCtpg.qr_QuitadaCtpg.Active := False;
         rp_QuitadaCtpg.qr_QuitadaCtpg.Parameters[0].Value := vm_DatIni;
         rp_QuitadaCtpg.qr_QuitadaCtpg.Parameters[1].Value := vm_DatFin;
         rp_QuitadaCtpg.qr_QuitadaCtpg.Active := True;
         END;


      END;

   IF cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Movimento de Caixa' THEN
      BEGIN

      IF rp_Caixa = Nil THEN
         Application.CreateForm(Trp_Caixa, rp_Caixa);

      vm_ObjRelatorio := rp_Caixa;
      rp_Caixa.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                            DateToStr(vm_DatFin);
      rp_Caixa.qr_Caixa.Active := False;
      rp_Caixa.qr_Caixa.Parameters[0].Value := vm_DatIni;
      rp_Caixa.qr_Caixa.Parameters[1].Value := vm_DatFin;
      rp_Caixa.qr_Caixa.Active := True;

      rp_Caixa.Total;

      END;

   IF cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Despesas' THEN
      BEGIN

      IF rg_Despesa.ItemIndex = 0 THEN // Resumido
         BEGIN
         IF rp_DespesaRes = Nil THEN
            Application.CreateForm(Trp_DespesaRes, rp_DespesaRes);

         vm_ObjRelatorio := rp_DespesaRes;
         rp_DespesaRes.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                               DateToStr(vm_DatFin);
         rp_DespesaRes.qr_DespesaRes.Active := False;
         rp_DespesaRes.qr_DespesaRes.Parameters[0].Value := vm_DatIni;
         rp_DespesaRes.qr_DespesaRes.Parameters[1].Value := vm_DatFin;
         rp_DespesaRes.qr_DespesaRes.Active := True;

         END;

      IF rg_Despesa.ItemIndex = 1 THEN // Detalhado
         BEGIN
         IF rp_DespesaDet = Nil THEN
            Application.CreateForm(Trp_DespesaDet, rp_DespesaDet);

         vm_ObjRelatorio := rp_DespesaDet;
         rp_DespesaDet.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                               DateToStr(vm_DatFin);
         rp_DespesaDet.qr_DespesaDet.Active := False;
         rp_DespesaDet.qr_DespesaDet.Parameters[0].Value  := cb_Despesa.KeyValue;
         rp_DespesaDet.qr_DespesaDet.Parameters[1].Value := vm_DatIni;
         rp_DespesaDet.qr_DespesaDet.Parameters[2].Value := vm_DatFin;
         rp_DespesaDet.qr_DespesaDet.Active := True;

         END;


      END;

      IF cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ficha Financeira do Cliente' THEN
         BEGIN

         IF rp_FichaCli = Nil THEN
            Application.CreateForm(Trp_FichaCli, rp_FichaCli);

         vm_ObjRelatorio := rp_FichaCli;
         rp_FichaCli.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                              DateToStr(vm_DatFin);
         rp_FichaCli.qr_FichaCli.Active := False;
         rp_FichaCli.qr_FichaCli.Parameters[0].Value  := cb_Cliente.KeyValue;
         rp_FichaCli.qr_FichaCli.Parameters[1].Value := vm_DatIni;
         rp_FichaCli.qr_FichaCli.Parameters[2].Value := vm_DatFin;
         rp_FichaCli.qr_FichaCli.Active := True;

         END;

      IF cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ficha Financeira do Fornecedor' THEN
         BEGIN

         IF rp_FichaFor = Nil THEN
            Application.CreateForm(Trp_FichaFor, rp_FichaFor);

         vm_ObjRelatorio := rp_FichaFor;
         rp_FichaFor.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                              DateToStr(vm_DatFin);
         rp_FichaFor.qr_FichaFor.Active := False;
         rp_FichaFor.qr_FichaFor.Parameters[0].Value := StrToIntDef(edFornecedorCodigo.Text, 0);
         rp_FichaFor.qr_FichaFor.Parameters[1].Value := vm_DatIni;
         rp_FichaFor.qr_FichaFor.Parameters[2].Value := vm_DatFin;
         rp_FichaFor.qr_FichaFor.Active := True;

         END;


   END;


 if pg_Relatorio.ActivePage = pg_Aparelho then begin
    if cb_Aparelho.Text = 'Usuários de aparelhos auditivos' then begin
       if rp_AparelhoUsuario = Nil then
          Application.CreateForm(Trp_AparelhoUsuario, rp_AparelhoUsuario);
       
       vm_ObjRelatorio := rp_AparelhoUsuario;
       rp_AparelhoUsuario.qr_AparelhoUsuario.Close;
       rp_AparelhoUsuario.qr_AparelhoUsuario.Open;
    end;

    if cb_Aparelho.Text = 'Novas testagens no período' then begin
         
       try
         if ed_DatIniApa.Text = '  /  /    ' then
            vm_DatIni := StrToDate('01/01/1000')
         else
            vm_DatIni := StrToDate(ed_DatIniApa.Text);

         if ed_DatFinApa.Text = '  /  /    ' then
            vm_DatFin := StrToDate('01/01/9999')
         else
            vm_DatFin := StrToDate(ed_DatFinApa.Text);
       except
         Mensagem('Data Inválida!',StatusBar,True);
         Screen.Cursor := crDefault;
         Exit;
       end;


       if rp_AparelhoRetorno = Nil then
          Application.CreateForm(Trp_AparelhoRetorno, rp_AparelhoRetorno);

       vm_ObjRelatorio := rp_AparelhoRetorno;

       rp_AparelhoRetorno.lb_Periodo.Caption := 'De  '+DateToStr(vm_DatIni)+' à '+
                                                       DateToStr(vm_DatFin);
       rp_AparelhoRetorno.qr_AparelhoRetorno.Active := False;
       rp_AparelhoRetorno.qr_AparelhoRetorno.Parameters[0].Value := vm_DatIni;
       rp_AparelhoRetorno.qr_AparelhoRetorno.Parameters[1].Value := vm_DatFin;
       rp_AparelhoRetorno.qr_AparelhoRetorno.Active := True;

    end;

 end;

Screen.Cursor := crDefault;

IF (vm_ObjRelatorio <> Nil) and (vm_ObjRelatorio.DataSet.IsEmpty = False) THEN
   BEGIN
   IF (Sender AS TSpeedButton).Name = 'bt_Video' THEN
      vm_ObjRelatorio.Preview
   ELSE
      vm_ObjRelatorio.Print;
   END
ELSE
   BEGIN
   vm_ObjCombo := TComboBox(FindComponent('cb_'+Copy(pg_Relatorio.ActivePage.Name,4,15)));
   Mensagem('Não existem '+vm_ObjCombo.Items[vm_ObjCombo.ItemIndex]+
             ' que satisfaçam a condição!',StatusBar,True);
   END;

end;

procedure Tfm_Relatorio.FormCreate(Sender: TObject);
begin
cb_Cadastro.ItemIndex    := 0;
cb_Exame.ItemIndex       := 0;
//cb_Empresa.KeyValue      := dm_Geral.tb_EmpresaEMCodEmp.Value;
cb_ExameClick(Sender);
cb_Faturamento.ItemIndex := 0;
//cb_Fornecedor.KeyValue   := dm_Geral.tb_FornecedorFOCodFor.Value;
cb_FaturamentoClick(Sender);
cb_Aparelho.ItemIndex    := 0;

lblEmpresa.Caption := '';

DecodeDate(Date,vm_Ano,vm_Mes,vm_Dia);
ed_MesAno.Text := FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);

tb_Parametro.Open;

end;


procedure Tfm_Relatorio.cb_ExameClick(Sender: TObject);
begin

pn_NumExa.Visible     := False;
pn_Empresa.Visible    := False;
pn_PeriodoExa.Visible := False;
pn_MesAno.Visible     := False;
rg_Margem.Visible     := False;

IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Exame' THEN
   BEGIN
   rg_Margem.Visible   := True;   
   pn_NumExa.Visible   := True;
   END;

IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Exames no período' THEN
   BEGIN
   edEmpresaCodigoExit(Sender);
   pn_Empresa.Visible    := True;
   pn_PeriodoExa.Visible := True;
   END;

IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Pacientes com exames vencidos' THEN
   BEGIN
   pn_Empresa.Visible    := True;
   pn_MesAno.Visible     := True;
   END;

IF cb_Exame.Items[cb_Exame.ItemIndex] = 'Empresas com exames vencidos' THEN
   BEGIN
   pn_MesAno.Visible     := True;
   END;

end;

procedure Tfm_Relatorio.cb_EmpresaEnter(Sender: TObject);
begin
dm_Geral.tb_Empresa.IndexFieldNames := 'EMFantasia';
end;

procedure Tfm_Relatorio.ed_DatIniExit(Sender: TObject);
VAR vm_TestData:TDateTime;
begin

// Evento compartilhado

TRY
IF TMaskEdit(Sender).Text <> '  /  /    ' THEN
   BEGIN
   vm_TestData:=StrToDate(TMaskEdit(Sender).Text);
   TMaskEdit(Sender).Text := DateToStr(vm_TestData);
   END;
EXCEPT
Mensagem('Data inválida!',StatusBar,True);
TMaskEdit(Sender).SetFocus;
END;

end;

procedure Tfm_Relatorio.ed_MesAnoExit(Sender: TObject);
begin

IF ed_MesAno.Text = '  /    ' THEN
   Exit;

TRY
vm_Mes := StrToInt(Trim(Copy(ed_MesAno.Text,1,2)));
EXCEPT
Mensagem('Mês inválido!',StatusBar,True);
ed_MesAno.SetFocus;
Exit;
END;

TRY
vm_Ano := StrToInt(Trim(Copy(ed_MesAno.Text,4,4)));
EXCEPT
Mensagem('Ano inválido!',StatusBar,True);
ed_MesAno.SetFocus;
Exit;
END;

IF (vm_Mes <= 0) OR (vm_Mes >=13) THEN
   BEGIN
   Mensagem('Mês inválido!',StatusBar,True);
   ed_MesAno.SetFocus;
   Exit;
   END;

vm_Dat := StrToDate('01/'+IntToStr(vm_Mes)+'/'+IntToStr(vm_Ano));
DecodeDate(vm_Dat,vm_Ano,vm_Mes,vm_Dia);

ed_MesAno.Text := FormatFloat('00',vm_Mes)+'/'+FormatFloat('0000',vm_Ano);

end;

procedure Tfm_Relatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

IF tb_Parametro.State IN [dsEdit,dsInsert] THEN
   tb_Parametro.Post;

dm_Geral.tb_Despesa.Active := False;   

IF rp_Paciente <> Nil THEN
   BEGIN
   rp_Paciente.Free;
   rp_Paciente := Nil;
   END;

IF rp_Empresa <> Nil THEN
   BEGIN
   rp_Empresa.Free;
   rp_Empresa := Nil;
   END;

IF rp_Convenio <> Nil THEN
   BEGIN
   rp_Convenio.Free;
   rp_Convenio := Nil;
   END;

IF rp_Patologia <> Nil THEN
   BEGIN
   rp_Patologia.Free;
   rp_Patologia := Nil;
   END;

IF rp_Meatoscopia <> Nil THEN
   BEGIN
   rp_Meatoscopia.Free;
   rp_Meatoscopia := Nil;
   END;

IF rp_Funcao <> Nil THEN
   BEGIN
   rp_Funcao.Free;
   rp_Funcao := Nil;
   END;

IF rp_Comprador <> Nil THEN
   BEGIN
   rp_Comprador.Free;
   rp_Comprador := Nil;
   END;

IF rp_Exame <> Nil THEN
   BEGIN
   rp_Exame.Free;
   rp_Exame := Nil;
   END;

IF rp_ExamePeriodo <> Nil THEN
   BEGIN
   rp_ExamePeriodo.Free;
   rp_ExamePeriodo := Nil;
   END;

IF rp_ExameVencido <> Nil THEN
   BEGIN
   rp_ExameVencido.tb_TMPA.Active := False;
   rp_ExameVencido.Free;
   rp_ExameVencido := Nil;
   END;

IF rp_EmpresaVencida <> Nil THEN
   BEGIN
   rp_EmpresaVencida.tb_TMPA.Active := False;
   rp_EmpresaVencida.Free;
   rp_EmpresaVencida := Nil;
   END;

IF rp_AparelhoUsuario <> Nil THEN
   BEGIN
   rp_AparelhoUsuario.Free;
   rp_AparelhoUsuario := Nil;
   END;

IF rp_AparelhoRetorno <> Nil THEN
   BEGIN
   rp_AparelhoRetorno.Free;
   rp_AparelhoRetorno := Nil;
   END;

IF rp_Servico <> Nil THEN
   BEGIN
   rp_Servico.Free;
   rp_Servico := Nil;
   END;

Action := caFree;
fm_Relatorio := Nil;

end;

procedure Tfm_Relatorio.tb_ParametroAfterPost(DataSet: TDataSet);
begin
//DbiSaveChanges(TTable(DataSet).Handle);
end;

procedure Tfm_Relatorio.cb_FaturamentoClick(Sender: TObject);
begin

rg_CtasReceber.Visible := False;
rg_CtasPagar.Visible   := False;
rg_Despesa.Visible     := False;
pn_PeriodoFat.Visible  := False;
pn_Despesa.Visible     := False;
pn_Cliente.Visible     := False;
pn_Fornecedor.Visible  := False;

IF (cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ctas Receber') THEN
   BEGIN
   rg_CtasReceber.Visible := True;
   rg_CtasReceberClick(rg_CtasReceber);
   END;

IF (cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ctas Pagar') THEN
   BEGIN
   rg_CtasPagar.Visible   := True;
   rg_CtasReceberClick(rg_CtasPagar);
   END;

IF (cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Movimento de Caixa') THEN
   pn_PeriodoFat.Visible := True;

IF (cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Despesas') THEN
   BEGIN
   dm_Geral.tb_Despesa.Active := true;
   pn_PeriodoFat.Visible := True;
   rg_Despesa.Visible    := True;
   rg_DespesaClick(rg_Despesa);
   END;

IF (cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ficha Financeira do Cliente') THEN
   BEGIN
   pn_Cliente.Visible      := True;
   pn_PeriodoFat.Visible := True;
   END;

IF (cb_Faturamento.Items[cb_Faturamento.ItemIndex] = 'Ficha Financeira do Fornecedor') THEN
   BEGIN
   pn_Fornecedor.Visible := True;
   pn_PeriodoFat.Visible := True;
   END;

end;

procedure Tfm_Relatorio.rg_CtasReceberClick(Sender: TObject);
begin

// Evento Compartilhado

pn_PeriodoFat.Visible  := False;

IF (TRadioGroup(Sender).Items[TRadioGroup(Sender).ItemIndex] = 'Em Aberto') OR
   (TRadioGroup(Sender).Items[TRadioGroup(Sender).ItemIndex] = 'Quitadas')  THEN
   pn_PeriodoFat.Visible  := True;


end;

procedure Tfm_Relatorio.rg_DespesaClick(Sender: TObject);
begin

IF rg_Despesa.ItemIndex = 0 THEN
   pn_Despesa.Visible := False;

IF rg_Despesa.ItemIndex = 1 THEN
   pn_Despesa.Visible := True;

end;

procedure Tfm_Relatorio.cb_AparelhoClick(Sender: TObject);
begin

pn_PeriodoApa.Visible := False;

IF (cb_Aparelho.Text = 'Novas testagens no período') THEN
   BEGIN
   pn_PeriodoApa.Visible := True;
   END;
end;

procedure Tfm_Relatorio.lblEmpresaLabelClick(Sender: TObject);
begin
  WITH Tfm_Busca.Create(Application, 'safaem', 'EMCodEmp', 'EMRazao') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      edEmpresaCodigo.Text := IntToStr(Codigo);

      MostrarEmpresa(Codigo);

    END;
  END;
end;

procedure Tfm_Relatorio.edEmpresaCodigoExit(Sender: TObject);
begin
  MostrarEmpresa(StrToIntDef(edEmpresaCodigo.Text, 0));
end;

procedure Tfm_Relatorio.edEmpresaCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblEmpresaLabelClick(Sender);

end;

procedure Tfm_Relatorio.lblFornecedorLabelClick(Sender: TObject);
begin

  WITH Tfm_Busca.Create(Application, 'safafo', 'FOCodFor', 'FONome') DO
  BEGIN
    IF ShowModal = mrOk THEN
    BEGIN
      edFornecedorCodigo.Text := IntToStr(Codigo);
      //vm_CodigoFornecedor := Codigo;

      edFornecedorCodigoExit(Sender);      

      MostrarFornecedor(Codigo);

    END;
  END;

end;

procedure Tfm_Relatorio.edFornecedorCodigoExit(Sender: TObject);
begin

  edFornecedorCodigo.Text := IntToStr(StrToIntDef( Trim(edFornecedorCodigo.Text) , 0));

  MostrarFornecedor(StrToIntDef(edFornecedorCodigo.Text, 0));

end;

procedure Tfm_Relatorio.edFornecedorCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

IF Key = vk_F2 THEN
   lblFornecedorLabelClick(Sender);

end;

procedure Tfm_Relatorio.pg_RelatorioChange(Sender: TObject);
begin

bt_Impressora.Enabled := true;
bt_Video.Enabled := true;

if pg_Relatorio.ActivePage = pg_Faturamento then
begin
  bt_Impressora.Enabled := vm_CodUsuSenha = 1;
  bt_Video.Enabled := vm_CodUsuSenha = 1;
end;

end;

end.
