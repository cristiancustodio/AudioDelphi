unit Saffgera;

interface

Uses Windows,SysUtils,DBTables,DB,Dialogs, comctrls{, FileCtrl};

PROCEDURE RefreshTable(Sender:TObject);
FUNCTION  CGC(vm_ParCgc:String):Boolean;
PROCEDURE CriarTMP(DataSet: TDataSet);
PROCEDURE DeletarTMP(DataSet: TDataSet);
PROCEDURE Mensagem(vm_ParStrMen:String;vm_ParObjStaBar:TStatusBar;vm_ParBooBeep:Boolean);


implementation


PROCEDURE RefreshTable(Sender:TObject);
BEGIN

IF (Not(Sender as TTable).Eof) and (Not(Sender as TTable).Bof) THEN
   IF Not((Sender as TTable).State in [dsInsert,dsEdit]) THEN
      (Sender as TTable).Refresh;

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

PROCEDURE CriarTMP(DataSet: TDataSet);
VAR vm_NomeArquivo:String;
    I:Integer;
begin

IF TTable(DataSet).TableName <> '' THEN
   BEGIN
   TTable(DataSet).EmptyTable;
   Exit;
   END;

FOR I:=1 TO 9999 DO
  TRY
  vm_NomeArquivo := Copy(DataSet.Name,4,4)+FormatFloat('0000',I);
  TTable(DataSet).Active    := False;
  TTable(DataSet).TableName := vm_NomeArquivo;
  TTable(DataSet).CreateTable;
  Break;
  EXCEPT

  END;


end;



PROCEDURE DeletarTMP(DataSet: TDataSet);
begin
TTable(DataSet).DeleteTable;
TTable(DataSet).TableName := '';
end;

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
     vm_NomMaq:=' -  '+vm_LocalMachine;

  AssignFile(vm_TxtArq, 'Mensagem.TXT');

  IF FileExists('Mensagem.TXT') = True THEN
     TRY
     IF vm_ParObjStaBar = Nil THEN
        BEGIN
        Reset(vm_TxtArq);
        ReadLn(vm_TxtArq,vm_StrLin);
        IF StrToDate(Trim(Copy(vm_StrLin,1,10)))+7 < Date THEN
           ReWrite(vm_TxtArq);
        END;
     EXCEPT
     END
  ELSE
     ReWrite(vm_TxtArq);

  Append(vm_TxtArq);

  IF vm_ParObjStaBar <> Nil THEN
     BEGIN
     Writeln(vm_TxtArq, DateToStr(Date)+'  - '+
             vm_ParObjStaBar.Parent.Name+' - '+vm_ParStrMen+vm_NomMaq);
     vm_ParObjStaBar.SimpleText := vm_ParStrMen;
     END
  ELSE
     Writeln(vm_TxtArq, DateToStr(Date)+'  - '+vm_ParStrMen+vm_NomMaq);

  CloseFile(vm_TxtArq);

  IF vm_ParBooBeep = True THEN
     Beep;

  Break;
  EXCEPT
  END;

END;
end.
