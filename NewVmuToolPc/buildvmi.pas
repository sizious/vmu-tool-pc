{$WARN UNIT_PLATFORM OFF}

unit buildvmi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg, FileCtrl;

type
  TBuildVmi_Form = class(TForm)
    cbCopy: TCheckBox;
    eDescription: TEdit;
    eCopyright: TEdit;
    eDcFilename: TEdit;
    Shape1: TShape;
    Bevel1: TBevel;
    pBottom: TPanel;
    bWrite: TBitBtn;
    Bevel2: TBevel;
    rbData: TRadioButton;
    rbGame: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    lDcFileName: TLabel;
    Label4: TLabel;
    bCancel: TBitBtn;
    lTitle: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Label6: TLabel;
    lTargetVms: TLabel;
    sd: TSaveDialog;
    procedure bWriteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbDataClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure eDcFilenameChange(Sender: TObject);
  private
    { Déclarations privées }
    fTargetVms : string;
    fSelectedType : Integer;
  public
    { Déclarations publiques }
    procedure Init(TargetVms : string);
  end;
  
var
  BuildVmi_Form: TBuildVmi_Form;

implementation

uses
  VmuToolPc, buildvmi_wrapper, utils;
  
{$R *.dfm}

procedure TBuildVmi_Form.bWriteClick(Sender: TObject);
var
  OK : Boolean;

begin
  if eDcFileName.Text = '' then
  begin
    MsgBox(BuildVmi_Form.Handle, 'Please fill the required field DC Filename.',
      'Warning', MB_ICONWARNING);
    lDcFileName.Font.Color := clRed;
    eDcFileName.SetFocus;
    Exit;
  end;

  with sd do
  begin
    FileName := GenerateDefaultVmiFileName(fTargetVms);
    
    if Execute then
    begin
      OK := CreateVmiFile(PChar(fTargetVms), PChar(FileName), PChar(eDescription.Text),
        PChar(eCopyright.Text), PChar(eDcFilename.Text), TVmiType(fSelectedType),
          not cbCopy.Checked); //le dernier paramètre est pour activer la copie protection.

      if OK then
      begin
        MsgBox(BuildVmi_Form.Handle, ExtractFileName(FileName) + ' successfully created.',
          'Information', MB_ICONINFORMATION);
        Close;
      end else MsgBox(BuildVmi_Form.Handle, 'Error when creating the file.'
        + WrapStr + 'File : "' + FileName + '".', 'Error', MB_ICONERROR);
    end;

  end;
end;

procedure TBuildVmi_Form.Init(TargetVms: string);
begin
  fTargetVms := TargetVms;
  lTargetVms.Caption := MinimizeName(fTargetVms, lTargetVms.Canvas, 250);
end;

procedure TBuildVmi_Form.FormCreate(Sender: TObject);
begin
  fSelectedType := 0;
  //Init('F:\Documents and Settings\SiZiOUS\Bureau\buildvmi\dllcode\rsrc\testapp\bin\00000000.VMS');
end;

procedure TBuildVmi_Form.rbDataClick(Sender: TObject);
begin
  fSelectedType := (Sender as TRadioButton).Tag;
end;

procedure TBuildVmi_Form.bCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBuildVmi_Form.eDcFilenameChange(Sender: TObject);
begin
  lDcFileName.Font.Color := clBlack;
end;

end.
