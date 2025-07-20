unit funcoes;

interface

Uses Windows,SysUtils,DBTables,DB,Dialogs, comctrls, FileCtrl, Bde, Forms, classes, ADODB;

FUNCTION ObtemValorBD(vm_ParSQL : String; vm_Connection : TADOConnection): Variant;
PROCEDURE RefreshTable(Sender:TObject);
FUNCTION  CGC(vm_ParCgc:String):Boolean;
PROCEDURE CriarTMP(DataSet: TADOQuery);
PROCEDURE DeletarTMP(DataSet: TDataSet);
PROCEDURE Mensagem(vm_ParStrMen:String;vm_ParObjStaBar:TStatusBar;vm_ParBooBeep:Boolean);
PROCEDURE SaveChange(DataSet:TDataSet);
FUNCTION Year(vm_ParDat:TDateTime):Word;
FUNCTION Month(vm_ParDat:TDateTime):Word;
FUNCTION Day(vm_ParDat:TDateTime):Word;
FUNCTION MaiorDiaDoMes(vm_ParDat:TDateTime):Word;
FUNCTION Se(vm_ParBoo:Boolean;vm_ParTrue,vm_ParFalse:Variant):Variant;
FUNCTION IncMes(vm_ParDat:TDateTime; X: Word):TDateTime;
FUNCTION DecMes(vm_ParDat:TDateTime; X: Word):TDateTime;
FUNCTION IniOk:Boolean;
FUNCTION GetCfgValue(key: String):String;
function LPad(const Str: String; const TamStr: Byte): String;
function RPad(const Str: String; const TamStr: Byte): String;
PROCEDURE FecharTodosForm(vm_ParStrMensagem:String);
PROCEDURE AbrirTodosForm;
function PodeExcluir(pTabOrigem:TTable;pTabNome,pFieldNome:String;
                     pVetChaveOrigem,
                     pVetTabVinculo,pVetChaveVinculo,pVetTabMsg:Array of string):String; overload;
function PodeExcluir(pTabTmp,pTabOrigem:TTable;pTabNome,pFieldNome:String;
                     pVetChaveTmp,pVetChaveOrigem,
                     pVetTabVinculo,pVetChaveVinculo,pVetTabMsg:Array of string):String; overload;
//function PodeExcluir(pTabOrigem:TTable;pChaveOrigem,TabNome,pFieldNome:String;
//                     pVetTabVinculo,pVetChaveVinculo,pVetTabMsg:Array of string):String; Overload;
function GetNomeFileTMP:String;

FUNCTION CLCRIPTO(CONST vm_ParMem, vm_ParCha : STRING) : STRING;

implementation

VAR
 vmF_VetObj:ARRAY[1..400] OF TObject;
 vmF_QtdObj:Integer;


FUNCTION ObtemValorBD(vm_ParSQL : String; vm_Connection : TADOConnection): Variant;
var oQuery: TADOQuery;
BEGIN

  try

    oQuery := TADOQuery.Create(Nil);

    oQuery.Connection :=  vm_Connection;

    oQuery.SQL.Text := vm_ParSQL;

    oQuery.Open;

    Result := oQuery.Fields[0].Value;

  finally
    oQuery.Close;
    oQuery.Free;
  end;

END;



PROCEDURE RefreshTable(Sender:TObject);
BEGIN

IF (Not(Sender as TDataSet).Eof) and (Not(Sender as TDataSet).Bof) THEN
   IF Not((Sender as TDataSet).State in [dsInsert,dsEdit]) THEN
      (Sender as TDataSet).Refresh;

END;


FUNCTION CGC(vm_ParCgc:String):Boolean;
VAR vm_Indica:Boolean;
    I:Byte;
    vm_Calc1,vm_Calc2,vm_Calc3,vm_Digito1,vm_Digito2:Integer;
BEGIN
TRY
Delete(vm_ParCgc,3,1);
Delete(vm_ParCgc,6,1);
vm_Indica:=True;
vm_Calc1  :=0;
vm_Calc2  :=2;
vm_Calc3  :=0;
vm_Digito1:=0;
I:=13;
WHILE I >= 1  DO
    BEGIN
    IF I=9 THEN
       I:=I-1;
    IF vm_Calc2=10 THEN
       vm_Calc2:=2;
    vm_Calc1:=StrToInt(Copy(vm_ParCgc,I,1))*vm_Calc2;
    vm_Calc2:=vm_Calc2+1;
    vm_Calc3:=vm_Calc3+vm_Calc1;
    I:=I-1;
    END;
IF ((vm_Calc3 mod 11) = 0) OR ((vm_Calc3 mod 11) = 1) THEN
   vm_Digito1 :=0
ELSE
   vm_Digito1 := 11 - (vm_Calc3 mod 11);
vm_Calc1  :=0;
vm_Calc2  :=3;
vm_Calc3  :=vm_Digito1*2;
vm_Digito2:=0;
I:=13;
WHILE I >= 1 DO
    BEGIN
    IF I=9 THEN
       I:=I-1;
    IF vm_Calc2=10 THEN
       vm_Calc2:=2;
    vm_Calc1:=StrToint(Copy(vm_ParCgc,I,1))*vm_Calc2;
    vm_Calc2:=vm_Calc2+1;
    vm_Calc3:=vm_Calc3+vm_Calc1;
    I:=I-1;
    END;
IF ((vm_Calc3 mod 11) = 0) OR ((vm_Calc3 mod 11) = 1) THEN
   vm_Digito2:=0
ELSE
   vm_Digito2:=11 - (vm_Calc3 mod 11);
IF StrToInt(IntToStr(vm_Digito1)+IntToStr(vm_Digito2)) <> StrToInt(Copy(vm_ParCgc,15,2)) THEN
   BEGIN
   MessageDlg('Dígito C.G.C Inválido ',MtInformation,[mbOk],0);
   vm_Indica:=False;
   END;
CGC:=vm_Indica;
EXCEPT
MessageDlg('Dígito C.G.C Inválido ',MtInformation,[mbOk],0);
CGC:=False;
END;
END;

PROCEDURE CriarTMP(DataSet: TADOQuery);
VAR vm_NomeArquivo:String;
    oQuery: TADOQuery;
    I:Integer;
begin

  try
    oQuery := TADOQuery.Create(Nil);
    oQuery.Connection :=  DataSet.Connection;

    oQuery.SQL.Text := 'IF OBJECT_ID(''tempdb..#SAFACO'') IS NOT NULL DROP TABLE #SAFACO';
    oQuery.ExecSQL();


    //oQuery.SQL.Add('IF NOT EXISTS(SELECT name FROM tempdb..sysobjects WHERE name like ''#SAFACO%'' AND xtype=''U'')');
    oQuery.SQL.Clear;
    oQuery.SQL.Add(' CREATE TABLE #SAFACO(');
    oQuery.SQL.Add('  CodCon int NULL,');
    oQuery.SQL.Add('  Descricao varchar(15) NULL,');
    oQuery.SQL.Add('  Controle varchar(5) NULL,');
    oQuery.SQL.Add('  UniMed varchar(5) NULL');
    oQuery.SQL.Add('  )');
    oQuery.ExecSQL();
  finally
    oQuery.Close;
    oQuery.Free;
  end;

  DataSet.SQL.Text := 'SELECT * FROM #SAFACO ORDER BY CodCon';

end;



PROCEDURE DeletarTMP(DataSet: TDataSet);
begin
TTable(DataSet).DeleteTable;
TTable(DataSet).TableName := '';
end;

FUNCTION IniOk:Boolean;
VAR vm_TxtArq: TextFile;
    vm_StrLin,vm_UltLinha,vm_NomMaq: String;
    vm_LocalMachine: ARRAY [0..MAX_COMPUTERNAME_LENGTH] OF Char;
    vm_Size: DWORD;
BEGIN

vm_Size := SizeOf(vm_LocalMachine);
IF GetComputerName(vm_LocalMachine,vm_Size) = True THEN
   vm_NomMaq:=vm_LocalMachine;

vm_StrLin   := '';
vm_UltLinha := '';

Result := True;
IF FileExists('Mensagem.TXT') = True THEN
   BEGIN
   AssignFile(vm_TxtArq, 'Mensagem.TXT');
   Reset(vm_TxtArq);
   WHILE Eof(vm_TxtArq) = False DO
     BEGIN
     ReadLn(vm_TxtArq,vm_StrLin);
     IF Copy(vm_StrLin,1,length(vm_NomMaq)) = vm_NomMaq THEN
        vm_UltLinha := vm_StrLin;
     END;
   IF Pos('Fechando',vm_UltLinha) = 0 THEN
      Result := False;
   CloseFile(vm_TxtArq);
   END;

END;

FUNCTION GetCfgValue(key: String):String;
var
    arqCfg: TStringList;
BEGIN

  Result := '';

  arqCfg := TStringList.Create;

  IF FileExists('Audio.Config') THEN
  BEGIN
     arqCfg.LoadFromFile('Audio.Config');

     result := arqCfg.Values[key];
  END
  ELSE
  BEGIN
     Mensagem(' Arquivo Audio.Config não encontrado',Nil,False);
  END;

END;



PROCEDURE Mensagem(vm_ParStrMen:String;vm_ParObjStaBar:TStatusBar;vm_ParBooBeep:Boolean);
VAR vm_TxtArq: TextFile;
    vm_StrLin: String;
    vm_Size: DWORD;
    vm_LocalMachine: ARRAY [0..MAX_COMPUTERNAME_LENGTH] OF Char;
    vm_NomMaq:String;
    I:Integer;
BEGIN

FOR I:=1 TO 1000 DO
  TRY
  vm_Size := SizeOf(vm_LocalMachine);
  IF GetComputerName(vm_LocalMachine,vm_Size) = True THEN
     vm_NomMaq:=vm_LocalMachine;

  AssignFile(vm_TxtArq, 'Mensagem.TXT');

  IF FileExists('Mensagem.TXT') = True THEN
     TRY
     IF vm_ParObjStaBar = Nil THEN
        BEGIN
        Reset(vm_TxtArq);
        ReadLn(vm_TxtArq,vm_StrLin);
        IF StrToDate(Trim(Copy(vm_StrLin,1,10)))+7 < Date THEN
           BEGIN
           ReWrite(vm_TxtArq);
           Writeln(vm_TxtArq, DateToStr(Date));
           END;
        END;
     EXCEPT
     ReWrite(vm_TxtArq);
     Writeln(vm_TxtArq, DateToStr(Date));
     END
  ELSE
     BEGIN
     ReWrite(vm_TxtArq);
     Writeln(vm_TxtArq, DateToStr(Date));
     END;

  Append(vm_TxtArq);

  IF vm_ParObjStaBar <> Nil THEN
     BEGIN
     Writeln(vm_TxtArq, vm_NomMaq+' - '+DateToStr(Date)+'  - '+
             Copy(vm_ParObjStaBar.Parent.Name,4,20)+' - '+vm_ParStrMen);
     vm_ParObjStaBar.SimpleText := vm_ParStrMen;
     END
  ELSE
     Writeln(vm_TxtArq, vm_NomMaq+' - '+DateToStr(Date)+'  - '+vm_ParStrMen);

  CloseFile(vm_TxtArq);

  IF vm_ParBooBeep = True THEN
     Beep;

  Break;
  EXCEPT
  
  END;

END;


PROCEDURE SaveChange(DataSet:TDataSet);
BEGIN
DbiSaveChanges(TTable(DataSet).Handle);
END;

FUNCTION Year(vm_ParDat:TDateTime):Word;
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
BEGIN

DecodeDate(vm_ParDat,vm_Ano,vm_Mes,vm_Dia);
Year:=vm_Ano;

END;

FUNCTION Month(vm_ParDat:TDateTime):Word;
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
BEGIN

DecodeDate(vm_ParDat,vm_Ano,vm_Mes,vm_Dia);
Month:=vm_Mes;

END;

FUNCTION Day(vm_ParDat:TDateTime):Word;
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
BEGIN

DecodeDate(vm_ParDat,vm_Ano,vm_Mes,vm_Dia);
Day:=vm_Dia;

END;


FUNCTION MaiorDiaDoMes(vm_ParDat:TDateTime):Word;
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_Dia:Word;
BEGIN

DecodeDate(vm_ParDat,vm_Ano,vm_Mes,vm_Dia);

vm_Dia := 31;

WHILE True DO
  TRY
  EncodeDate(vm_Ano,vm_Mes,vm_Dia);
  Break;
  EXCEPT
  vm_Dia:=vm_Dia-1;
  END;

MaiorDiaDoMes := vm_Dia;

END;


FUNCTION Se(vm_ParBoo:Boolean;vm_ParTrue,vm_ParFalse:Variant):Variant;
BEGIN

IF vm_ParBoo = True THEN
   Se := vm_ParTrue
ELSE
   Se := vm_ParFalse;

END;


FUNCTION IncMes(vm_ParDat:TDateTime; X: Word):TDateTime;
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_TesteDat:TDateTime;
    I:Byte;
BEGIN

vm_Ano := Year(vm_ParDat);
vm_Mes := Month(vm_ParDat)+X;

WHILE vm_Mes > 12 DO
  BEGIN
  vm_Mes := vm_Mes - 12;
  vm_Ano := vm_Ano + 1;
  END;

FOR I:=0 TO 4 DO
  TRY
  vm_TesteDat := EncodeDate(vm_Ano,vm_Mes,Day(vm_ParDat-I));
  Break;
  EXCEPT

  END;

IncMes := vm_TesteDat;

END;


FUNCTION DecMes(vm_ParDat:TDateTime; X: Word):TDateTime;
VAR vm_Ano:Word;
    vm_Mes:Word;
    vm_TesteDat:TDateTime;
    I:Byte;
BEGIN

vm_Ano := Year(vm_ParDat);
vm_Mes := Month(vm_ParDat)-X;

WHILE vm_Mes < 0 DO
  BEGIN
  vm_Mes := vm_Mes + 12;
  vm_Ano := vm_Ano - 1;
  END;

FOR I:=0 TO 4 DO
  TRY
  vm_TesteDat := EncodeDate(vm_Ano,vm_Mes,Day(vm_ParDat-I));
  Break;
  EXCEPT

  END;

DecMes := vm_TesteDat;

END;

function LPad(const Str: String; const TamStr: Byte): String;
begin
 Result := StringOfChar(' ',TamStr-Length(Str))+Str;
end;

function RPad(const Str: String; const TamStr: Byte): String;
begin
 Result := Str+StringOfChar(' ',TamStr-Length(Str))
end;

PROCEDURE FecharTodosForm(vm_ParStrMensagem:String);
VAR I:Integer;
    Z:Integer;
BEGIN

vmF_QtdObj:=1;

FOR I:=1 TO 400 DO vmF_VetObj[I] := Nil;

Mensagem(vm_ParStrMensagem,Nil,False);

FOR I := 0 TO Screen.FormCount-1 DO
    BEGIN

    IF Screen.Forms[I] <> Screen.ActiveForm THEN
       BEGIN
       IF Screen.Forms[I].Visible = True THEN
          BEGIN
          Screen.Forms[I].Close;
          vmF_VetObj[vmF_QtdObj] := Screen.Forms[I];
          Inc(vmF_QtdObj);
          END;
       END;

    FOR Z:=0 TO Screen.Forms[I].ComponentCount-1 DO
        BEGIN
        IF (Screen.Forms[I].Components[Z] IS TTable)              AND
           (TTable(Screen.Forms[I].Components[Z]).Active = True) THEN
           BEGIN
           TTable(Screen.Forms[I].Components[Z]).Close;
           vmF_VetObj[vmF_QtdObj] := TTable(Screen.Forms[I].Components[Z]);
           Inc(vmF_QtdObj);
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
           vmF_VetObj[vmF_QtdObj] := TTable(Screen.DataModules[I].Components[Z]);
           Inc(vmF_QtdObj);
           END;
        END;

    END;
    
END;

PROCEDURE AbrirTodosForm;
VAR
    I:Integer;
BEGIN

FOR I:=1 TO vmF_QtdObj DO
    BEGIN

    IF vmF_VetObj[I] IS TForm  THEN
       TForm(vmF_VetObj[I]).Show;
    IF vmF_VetObj[I] IS TTable THEN
       TTable(vmF_VetObj[I]).Open;

    END;

END;

function PodeExcluir(pTabOrigem:TTable;pTabNome,pFieldNome:String;
                     pVetChaveOrigem,
                     pVetTabVinculo,pVetChaveVinculo,pVetTabMsg:Array of string):String;
begin
         Result :=   PodeExcluir(Nil, pTabOrigem, pTabNome, pFieldNome,
                                 [],  pVetChaveOrigem,
                                 pVetTabVinculo,pVetChaveVinculo,pVetTabMsg);
end;


function PodeExcluir(pTabTmp,pTabOrigem:TTable;pTabNome,pFieldNome:String;
                     pVetChaveTmp,pVetChaveOrigem,
                     pVetTabVinculo,pVetChaveVinculo,pVetTabMsg:Array of string):String;
var vValChave,vDesChave:Array of string;
    lValChave,lChaveVinculo:TStringList;
    bEncontrou, bTmpEnableCtrl, bOrigemEnableCtrl:Boolean;
    i,x,y:Integer;
    cSqlField,cSqlWhere,cSql:String;
    oQuery:TQuery;
    TabTmpBookMark: TBookmark;
begin

 Result := '';

 if pTabTmp <> Nil then begin

    TabTmpBookMark := pTabTmp.GetBookmark;

    bTmpEnableCtrl    := Not(pTabTmp.ControlsDisabled);
    bOrigemEnableCtrl := Not(pTabOrigem.ControlsDisabled);

    if bTmpEnableCtrl    then pTabTmp.DisableControls;
    if bOrigemEnableCtrl then pTabOrigem.DisableControls;

    pTabOrigem.First;
    while pTabOrigem.Eof = False do begin
      pTabTmp.First; bEncontrou := False;
      while pTabTmp.Eof = False do begin
        bEncontrou := True;
        for i:=low(pVetChaveTmp) to high(pVetChaveTmp) do begin
          if (pVetChaveTmp[i] <> '') and
             (pTabTmp.FieldByName(pVetChaveTmp[i]).AsString <> pTabOrigem.FieldByName(pVetChaveOrigem[i]).AsString) then begin
             bEncontrou := False;
             Break;
          end;
        end;
    
        if bEncontrou then Break;

        pTabTmp.Next;
    
      end;
    
      if bEncontrou = False then begin
         SetLength(vValChave, Length(vValChave)+1);
         SetLength(vDesChave, Length(vDesChave)+1);         
         vValChave[High(vValChave)] := '';
         vDesChave[High(vDesChave)] := pTabOrigem.FieldByName(pFieldNome).AsString;         
         for i:=low(pVetChaveOrigem) to high(pVetChaveOrigem) do begin
             vValChave[High(vValChave)] := vValChave[High(vValChave)] + pTabOrigem.FieldByName(pVetChaveOrigem[i]).AsString;
             if i <> high(pVetChaveOrigem) then vValChave[High(vValChave)] := vValChave[High(vValChave)]+';';
         end;
      end;

      pTabOrigem.Next;
    end;

    if bTmpEnableCtrl    then pTabTmp.EnableControls;
    if bOrigemEnableCtrl then pTabOrigem.EnableControls;

    pTabTmp.GotoBookmark(TabTmpBookMark);
    pTabTmp.FreeBookMark(TabTmpBookMark);

 end else begin
    SetLength(vValChave,  Length(vValChave)+1);
    SetLength(vDesChave,  Length(vDesChave)+1);
    vValChave[High(vValChave)] := '';
    vDesChave[High(vDesChave)] := pTabOrigem.FieldByName(pFieldNome).AsString;
    for i:=low(pVetChaveOrigem) to high(pVetChaveOrigem) do begin
        if pTabOrigem.FieldByName(pVetChaveOrigem[i]).DataType = ftString then
           vValChave[High(vValChave)] := vValChave[High(vValChave)] + #39+pTabOrigem.FieldByName(pVetChaveOrigem[i]).AsString+#39
        else begin
           vValChave[High(vValChave)] := vValChave[High(vValChave)] + pTabOrigem.FieldByName(pVetChaveOrigem[i]).AsString;
        end;
        if i <> high(pVetChaveOrigem) then vValChave[High(vValChave)] := vValChave[High(vValChave)]+';';
    end;
 end;

 oQuery := TQuery.Create(Nil);

 for i:=low(vValChave) to high(vValChave) do begin
    lValChave := TStringList.Create;
    lValChave.Text := StringReplace(vValChave[i],';',#13,[rfReplaceAll]);
    for x:=low(pVetTabVinculo) to high(pVetTabVinculo) do begin
        cSqlField := ''; cSqlWhere := '';
        lChaveVinculo := TStringList.Create;
        lChaveVinculo.Text := StringReplace(pVetChaveVinculo[x],';',#13,[rfReplaceAll]);
        for y:=0 to lChaveVinculo.Count-1 do begin
            if cSqlField =  '' then cSqlField := 'min('+lChaveVinculo.Strings[y]+')';
            if cSqlWhere <> '' then cSqlWhere := cSqlWhere  + ' AND ';
            cSqlWhere := cSqlWhere + lChaveVinculo[y]+' = '+lValChave[y];
        end;
        lChaveVinculo.Free;
        cSql := 'SELECT '+cSqlField+' VIRTUAL FROM '+pVetTabVinculo[x]+' WHERE '+cSqlWhere;
        oQuery.SQL.Text := cSql;
        oQuery.Open;
        if (oQuery.IsEmpty = False) and (oQuery.FieldByName('VIRTUAL').IsNull = False) then begin
           Result := pTabNome+': '+vDesChave[i]+' não pode ser excluído porque existem '+#13#10+
                     pVetTabMsg[x]+' vinculados a ele!';
           Break
        end;

        oQuery.Close;
    end;

    lValChave.Free;

    if Result <> '' then Break;

 end;

 oQuery.Free;

end;

function GetNomeFileTMP:String;
var i:Integer;
begin
 for i:=1 to 9999 do begin
     try
      if FileExists( '_TMP'+FormatFloat('0000',i)+'.DB' ) = False then begin
         Result := 'TMP'+FormatFloat('0000',i);
         Break;
      end;
     except
//       on E:Exception do begin
//         ShowMessage(E.Message);
//       end;
     end;
 end;
end;

FUNCTION CLCRIPTO(CONST vm_ParMem, vm_ParCha : STRING) : STRING;
VAR vm_TamCha           : Integer;
    vm_TamMem           : Integer;
    vm_Contad           : Integer;
    vm_MemCri,vm_TemMem : STRING[10];
    S,vm_VarMem         : STRING;
    vm_VetASCMem        : ARRAY[1..10] OF Integer;
    vm_ASC              : STRING[97];
    I                   : Byte;
begin

vm_TamCha := length(vm_ParMem);
vm_TamMem := 0;
vm_Contad := 0;
vm_MemCri := '';
vm_VarMem := vm_ParMem;
S         := '';

{ vm_ASC = SPACE(105) }
FOR I:=1 TO 96 DO
    S:=S+' ';
vm_ASC      := S;

vm_ASC[001] := '!';
vm_ASC[002] := '#';
vm_ASC[003] := '$';
vm_ASC[004] := '%';
vm_ASC[005] := '&';
vm_ASC[006] := '(';
vm_ASC[007] := '*';
vm_ASC[008] := '+';
vm_ASC[009] := ',';
vm_ASC[010] := '-';
vm_ASC[011] := '.';
vm_ASC[012] := '/';
vm_ASC[013] := '0';
vm_ASC[014] := '1';
vm_ASC[015] := '2';
vm_ASC[016] := '3';
vm_ASC[017] := '4';
vm_ASC[018] := '5';
vm_ASC[019] := '6';
vm_ASC[020] := '7';
vm_ASC[021] := '8';
vm_ASC[022] := '9';
vm_ASC[023] := ':';
vm_ASC[024] := ';';
vm_ASC[025] := '<';
vm_ASC[026] := '=';
vm_ASC[027] := '>';
vm_ASC[028] := '?';
vm_ASC[029] := '@';
vm_ASC[030] := 'A';
vm_ASC[031] := 'B';
vm_ASC[032] := 'C';
vm_ASC[033] := 'D';
vm_ASC[034] := 'E';
vm_ASC[035] := 'F';
vm_ASC[036] := 'G';
vm_ASC[037] := 'H';
vm_ASC[038] := 'I';
vm_ASC[039] := 'J';
vm_ASC[040] := 'K';
vm_ASC[041] := 'L';
vm_ASC[042] := 'M';
vm_ASC[043] := 'N';
vm_ASC[044] := 'O';
vm_ASC[045] := 'P';
vm_ASC[046] := 'Q';
vm_ASC[047] := 'R';
vm_ASC[048] := 'S';
vm_ASC[049] := 'T';
vm_ASC[050] := 'U';
vm_ASC[051] := 'V';
vm_ASC[052] := 'W';
vm_ASC[053] := 'X';
vm_ASC[054] := 'Y';
vm_ASC[055] := 'Z';
vm_ASC[056] := '[';
vm_ASC[057] := '\';
vm_ASC[058] := ']';
vm_ASC[059] := '^';
vm_ASC[060] := '_';
vm_ASC[061] := 'a';
vm_ASC[062] := 'b';
vm_ASC[063] := 'c';
vm_ASC[064] := 'd';
vm_ASC[065] := 'e';
vm_ASC[066] := 'f';
vm_ASC[067] := 'g';
vm_ASC[068] := 'h';
vm_ASC[069] := 'i';
vm_ASC[070] := 'j';
vm_ASC[071] := 'k';
vm_ASC[072] := 'l';
vm_ASC[073] := 'm';
vm_ASC[074] := 'n';
vm_ASC[075] := 'o';
vm_ASC[076] := 'p';
vm_ASC[077] := 'q';
vm_ASC[078] := 'r';
vm_ASC[079] := 's';
vm_ASC[080] := 't';
vm_ASC[081] := 'u';
vm_ASC[082] := 'v';
vm_ASC[083] := 'w';
vm_ASC[084] := 'x';
vm_ASC[085] := 'y';
vm_ASC[086] := 'z';
vm_ASC[087] := 'ç';
vm_ASC[088] := '{';
vm_ASC[089] := '|';
vm_ASC[090] := '}';
vm_ASC[091] := '~';
vm_ASC[092] := 'á';
vm_ASC[093] := 'é';
vm_ASC[094] := 'í';
vm_ASC[095] := 'ó';
vm_ASC[096] := 'ú';


FOR vm_Contad := 1 TO vm_TamCha DO
    BEGIN
    vm_VetASCMem[vm_Contad] := pos(copy(vm_ParCha, vm_Contad, 1),vm_ASC);
    END;

FOR vm_Contad := 1 TO vm_TamCha DO
    BEGIN
    FOR vm_TamMem := 1 TO length(vm_VarMem) DO
        IF vm_TamMem >= vm_TamCha THEN
           vm_MemCri := vm_MemCri + vm_ASC[(pos(copy(vm_VarMem, vm_TamMem, 1),vm_ASC)+
                        vm_VetASCMem[1+(vm_TamMem MOD vm_TamCha)])  MOD 96]
        ELSE
           vm_MemCri := vm_MemCri + vm_ASC[(pos(copy(vm_VarMem, vm_TamMem, 1),vm_ASC)+
                        vm_VetASCMem[vm_TamMem MOD vm_TamCha])      MOD 96];
    vm_TemMem := vm_MemCri;
    vm_VarMem := vm_MemCri;
    vm_MemCri := '';
    END;

CLCRIPTO:=vm_TemMem;


END;


end.
