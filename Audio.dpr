program audio;

uses
  WinTypes,
  Controls,
  SysUtils,
  Dialogs,
  Menus,
  Forms,
  safumenu in 'safumenu.pas' {fm_Menu},
  safupara in 'safupara.pas' {fm_Parametro},
  safurela in 'safurela.pas' {fm_Relatorio},
  safucada in 'safucada.pas' {fm_Cadastro},
  safdgera in 'safdgera.pas' {dm_Geral: TDataModule},
  safuexam in 'safuexam.pas' {fm_Exame},
  safusobr in 'safusobr.pas' {fm_Sobre},
  safuaber in 'safuaber.pas' {fm_Abertura},
  safuppte in 'safuppte.pas' {fm_ProcuraTestagem},
  safrpaci in 'SAFRPACI.PAS' {rp_Paciente: TQuickRep},
  safrExam in 'safrExam.pas' {rp_Exame: TQuickRep},
  safucoex in 'safucoex.pas' {fm_ExameAnterior},
  safrexpe in 'safrexpe.pas' {rp_ExamePeriodo: TQuickRep},
  safrexve in 'safrexve.pas' {rp_ExameVencido: TQuickRep},
  safremve in 'safremve.pas' {rp_EmpresaVencida: TQuickRep},
  safrempr in 'safrempr.pas' {rp_Empresa: TQuickRep},
  safrconv in 'safrconv.pas' {rp_Convenio: TQuickRep},
  safrpato in 'safrpato.pas' {rp_Patologia: TQuickRep},
  safrmeat in 'safrmeat.pas' {rp_Meatoscopia: TQuickRep},
  safrfunc in 'safrfunc.pas' {rp_Funcao: TQuickRep},
  safucomp in 'safucomp.pas' {fm_Compactar},
  Safuctpg in 'Safuctpg.pas' {fm_CtasPagar},
  Safufifo in 'Safufifo.pas' {fm_FichaFornecedor},
  Safucaix in 'Safucaix.pas' {fm_Caixa},
  Safrcrve in 'Safrcrve.pas' {rp_VencidaCtrc: TQuickRep},
  safrabar in 'safrabar.pas' {rp_AbertaCtrc: TQuickRep},
  Safrqtcr in 'Safrqtcr.pas' {rp_QuitadaCtrc: TQuickRep},
  safrvecp in 'safrvecp.pas' {rp_VencidaCtpg: TQuickRep},
  Safrabpg in 'Safrabpg.pas' {rp_AbertaCtpg: TQuickRep},
  Safrqtpg in 'Safrqtpg.pas' {rp_QuitadaCtpg: TQuickRep},
  Safrcaix in 'Safrcaix.pas' {rp_Caixa: TQuickRep},
  Safrdere in 'Safrdere.pas' {rp_DespesaRes: TQuickRep},
  Safrdede in 'Safrdede.pas' {rp_DespesaDet: TQuickRep},
  Safrficl in 'Safrficl.pas' {rp_FichaCli: TQuickRep},
  Safrfifo in 'Safrfifo.pas' {rp_FichaFor: TQuickRep},
  funcoes in 'funcoes\funcoes.pas',
  safutest in 'safutest.pas' {fm_Testagem},
  SAFULCAP in 'SAFULCAP.pas' {fm_Controle},
  safuppex in 'safuppex.pas' {fm_ProcuraExame},
  safrapusu in 'safrapusu.pas' {rp_AparelhoUsuario: TQuickRep},
  SAFRAPRE in 'SAFRAPRE.pas' {rp_AparelhoRetorno: TQuickRep},
  safrcomp in 'safrcomp.pas' {rp_Comprador: TQuickRep},
  safrserv in 'safrserv.pas' {rp_Servico: TQuickRep},
  safuvend in 'safuvend.pas' {fm_Venda},
  Safubusc in 'Safubusc.pas' {fm_Busca},
  saffgrex in 'saffgrex.pas',
  Safusenh in 'Safusenh.pas' {fm_Senha};

//  safuauto in 'safuauto.pas' {fm_Autorizacao};

{$R *.RES}

VAR Hwnd : THandle;
    I:Integer;

begin

Hwnd := 0;
Hwnd := FindWindow('Tfm_Menu', 'CRTec Audio Software');
//IF Hwnd <> 0 THEN
//  BEGIN
//  MessageDlg ('Você não pode executar uma segunda cópia da aplicação !', mtInformation, [mbOk], 0);
//  SetForegroundWindow(Hwnd);
//  END
//ELSE
//  BEGIN
  Screen.Cursor := crHourGlass;

  fm_Abertura := TFm_Abertura.Create(Application);
  fm_Abertura.Show;
  fm_Abertura.Update;

  Application.Initialize;
  Application.CreateForm(Tfm_Menu, fm_Menu);
  //Application.CreateForm(Tfm_Busca, fm_Busca);
  Application.CreateForm(Tdm_Geral, dm_Geral);
  //  IF IniOk AND dm_Geral.TabelasOk THEN
//  BEGIN
  Mensagem(TimeToStr(Time)+' - Abrindo sistema',Nil,False);
//  Application.CreateForm(Tfm_Parametro, fm_Parametro);
//  Application.CreateForm(Tfm_Cadastro, fm_Cadastro);
  { habilitar
    Application.CreateForm(Tfm_Relatorio, fm_Relatorio);
    Application.CreateForm(Tfm_Exame, fm_Exame);
    Application.CreateForm(Tfm_CtasPagar, fm_CtasPagar);
    Application.CreateForm(Tfm_FichaFornecedor, fm_FichaFornecedor);
    Application.CreateForm(Tfm_Caixa, fm_Caixa);
    Application.CreateForm(Tfm_Testagem, fm_Testagem);
    Application.CreateForm(Tfm_Venda, fm_Venda);
  }
  //END ELSE BEGIN // Houve erro na abertura das tabelas
  //  FOR I:=0 TO fm_Menu.ComponentCount-1 DO BEGIN
  //    if ((Copy(fm_Menu.Components[I].Name,1,3) = 'mi_')  OR
  //        (Copy(fm_Menu.Components[I].Name,1,3) = 'bt_')) AND
  //       (fm_Menu.Components[I].Name <> 'mi_Sair')        AND
  //       (fm_Menu.Components[I].Name <> 'mi_Compactar')   AND
  //       (fm_Menu.Components[I].Name <> 'mi_Manutencao')   AND
  //       (fm_Menu.Components[I].Name <> 'mi_Restaurar')   THEN
  //       BEGIN
  //       IF fm_Menu.Components[I].ClassName = 'TMenuItem' THEN
  //          TMenuItem(fm_Menu.Components[I]).Enabled := False
  //       ELSE
  //          TControl(fm_Menu.Components[I]).Enabled := False;
  //       fm_Menu.mi_Restaurar.Visible := True;
  //       END;
  //  END;
  //  fm_Menu.Caption := 'Modo de segurança (Sistema não foi encerrado adequadamente). Recomendação: Escolha COMPACTAR em manutenções';
  //END;
  fm_Abertura.Hide;
  fm_Abertura.Free;
  Screen.Cursor := crDefault;
  Application.Run;
//  END;

end.
