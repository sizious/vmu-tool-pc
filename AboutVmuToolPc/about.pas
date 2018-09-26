unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ShellApi;

type
  TAbout_Form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lVersion: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lReleased: TLabel;
    Bevel3: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    lURL: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lURLMouseEnter(Sender: TObject);
    procedure lURLMouseLeave(Sender: TObject);
    procedure lURLMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lURLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  About_Form: TAbout_Form;

procedure ShowAboutBox;

implementation

uses oldskool, main;

{$R *.dfm}

procedure ShowAboutBox;
begin
  About_Form := TAbout_Form.Create(Application);
  try
    About_Form.ShowModal;
  finally
    About_Form.Free;
  end;
end;

procedure TAbout_Form.BitBtn1Click(Sender: TObject);
begin
  ShowOldSkoolAbout; 
end;

procedure TAbout_Form.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TAbout_Form.FormCreate(Sender: TObject);
begin
  lVersion.Caption := lVersion.Caption + 'v' + PRG_VERSION + '.';
  lReleased.Caption := lReleased.Caption + ' ' + PRG_DATE + '.';
end;

procedure TAbout_Form.lURLMouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Style := [fsUnderline];
  (Sender as TLabel).Font.Color := clRed;
  (Sender as TLabel).Cursor := crHandPoint;
end;

procedure TAbout_Form.lURLMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Style := [];
  (Sender as TLabel).Font.Color := clBlue;
  (Sender as TLabel).Cursor := crDefault;
end;

procedure TAbout_Form.lURLMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TLabel).Font.Color := clGreen;
end;

procedure TAbout_Form.lURLMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TLabel).Font.Color := clRed;
  ShellExecute(Handle, 'open', PChar((Sender as TLabel).Caption), '', '', SW_SHOWNORMAL);
end;

end.
