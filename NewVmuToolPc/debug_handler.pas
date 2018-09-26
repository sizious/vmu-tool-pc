unit debug_handler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TDebugHandler_Form = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lError: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    fErrorMsg : string;
    fErrorType : string;
    fErrorSender : string;    
  end;

var
  DebugHandler_Form: TDebugHandler_Form;

implementation

uses
  main, utils;

{$R *.dfm}

//------------------------------------------------------------------------------

procedure AddException(Msg : string);
begin
  Main_Form.reDebug.SelLength := 0;
  Main_Form.reDebug.SelAttributes.Color := clRed;
  Main_Form.reDebug.SelAttributes.Style := [fsBold];
  Main_Form.reDebug.Lines.Add('Fatal : ' + Msg);
end;

//------------------------------------------------------------------------------

procedure TDebugHandler_Form.FormShow(Sender: TObject);
var
  err : string;

begin
  err := fErrorMsg + ' (class : ' + fErrorType + ', sender : ' + fErrorSender
    + ', date : ' + DateToStr(Date) + ', time : ' + TimeToStr(Time) + ').';
  MessageBeep(MB_ICONERROR);
  lError.Caption := fErrorMsg;
  AddException(err);
end;

//------------------------------------------------------------------------------

procedure TDebugHandler_Form.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

procedure TDebugHandler_Form.BitBtn3Click(Sender: TObject);
var
  _ok : integer;

begin
  _ok := MsgBox(Handle, 'Sure to quit the application ?'
    + WrapStr + 'Warning, the configuration file''ll NOT be saved...',
    'Exit application ?!', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2);
  if _ok = IDNO then Exit;

  Application.Terminate;
  Halt(255);
end;

//------------------------------------------------------------------------------

procedure TDebugHandler_Form.BitBtn2Click(Sender: TObject);
begin
  with Main_Form.sdRichEdit do
    if Execute then
    begin
      Main_Form.reDebug.PlainText := (FilterIndex <> 1);
      Main_Form.reDebug.Lines.SaveToFile(FileName);
    end;
end;

//------------------------------------------------------------------------------

end.
