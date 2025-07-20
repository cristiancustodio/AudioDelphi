unit safusobr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  Tfm_Sobre = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Sobre: Tfm_Sobre;

implementation

{$R *.DFM}

procedure Tfm_Sobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

end.
