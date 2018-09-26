unit options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, VmuToolPc, PiconeBarreTache,
  Buttons;

type
  TOptions_Form = class(TForm)
    Bevel1: TBevel;
    pcOptions: TPageControl;
    tsGeneral: TTabSheet;
    tsTray: TTabSheet;
    rgTrayIcon: TRadioGroup;
    tsDebug: TTabSheet;
    GroupBox3: TGroupBox;
    cbLogScanDirEvents: TCheckBox;
    cbLogStateEvents: TCheckBox;
    clrbState: TColorBox;
    clrbSuccess: TColorBox;
    cbLogSuccessEvents: TCheckBox;
    cbLogErrorEvents: TCheckBox;
    clrbError: TColorBox;
    cbAutoScroll: TCheckBox;
    lblInfos: TLabel;
    GroupBox2: TGroupBox;
    cbAssociate: TCheckBox;
    tsView: TTabSheet;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    cbAutoSelect: TCheckBox;
    cbShowErrornousFiles: TCheckBox;
    cbShowInvalidVms: TCheckBox;
    GroupBox4: TGroupBox;
    cbConfirmClose: TCheckBox;
    tsHexEdit: TTabSheet;
    GroupBox5: TGroupBox;
    eHexEdit: TEdit;
    odHexEdit: TOpenDialog;
    bHexEdit: TBitBtn;
    GroupBox6: TGroupBox;
    eHexEditParams: TEdit;
    cbShowSplash: TCheckBox;
    cbAutoScrollView: TCheckBox;
    cbScanAtStart: TCheckBox;
    bCancel: TBitBtn;
    bOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure pcOptionsChange(Sender: TObject);
    procedure cbLogStateEventsClick(Sender: TObject);
    procedure cbLogSuccessEventsClick(Sender: TObject);
    procedure bBrowseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bHexEditClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure ApplyShellIntegration;
  public
    { Déclarations publiques }
    procedure LoadOptions;
    procedure SaveOptions;
  end;

var
  Options_Form: TOptions_Form;

implementation

{$R *.dfm}

uses
  Main, u_shellext_wrapper, Utils;

//------------------------------------------------------------------------------

procedure TOptions_Form.FormShow(Sender: TObject);
begin
  lblInfos.Caption := '';
  pcOptions.ActivePageIndex := 0;
  pcOptionsChange(Sender);

  LoadOptions;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.LoadOptions;
var
  _vtp_opt : TOptions;
  _picone  : TPiconeBarreTache;
  
begin
  _vtp_opt := Main_Form.VmuToolPc.Options;

  //Avoir l'état de la petite icône
  _picone := Main_Form.PiconeBarreTache;
  if _picone.CacherSiMinimize then rgTrayIcon.ItemIndex := 0;
  if _picone.ReduireSiFin then rgTrayIcon.ItemIndex := 1;
  if (not _picone.PetiteIconeVisible) then rgTrayIcon.ItemIndex := 2;

  //Couleurs du Debug
  clrbState.Selected := Main_Form.fStateClr;
  clrbSuccess.Selected := Main_Form.fSuccessClr;
  clrbError.Selected := Main_Form.fErrorClr;
  //Autres options du debug
  cbAutoScroll.Checked := Main_Form.fAutoScrollLog;
  cbLogScanDirEvents.Checked := _vtp_opt.LogScanDirMsg;
  cbLogStateEvents.Checked := _vtp_opt.LogStateMsg;
  cbLogSuccessEvents.Checked := _vtp_opt.LogSuccessMsg;

  //Onglet general
  cbShowErrornousFiles.Checked := Main_Form.fShowErrornousVmi;
  cbAutoSelect.Checked := Main_Form.fAutoSelectFirst;
  cbShowInvalidVms.Checked := _vtp_opt.ScanInvalidVms;
  cbConfirmClose.Checked := Main_Form.fConfirmClose;
  cbShowSplash.Checked := Main_Form.fUseSplash;
  cbAutoScrollView.Checked := Main_Form.fAutoScrollView;
  cbScanAtStart.Checked := Main_Form.fScanAtStart;

  //Onglet Engine
  //rgEngineType.ItemIndex := Integer(Main_Form.fEngineType);
  //eExternal.Text := Main_Form.fExternalExecutable;

  //Onglet HexEdit
  eHexEdit.Text := Main_Form.fHexEdit.FileName;
  eHexEditParams.Text := Main_Form.fHexEdit.Parameters;

  //Shell Integration
  cbAssociate.Checked := IsExtensionsRegistered and IsMenuRegistered;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.pcOptionsChange(Sender: TObject);
begin
  //ne pas changer l'ordre sinon ça correspond plus...
  case pcOptions.ActivePageIndex of
    0 : lblInfos.Caption := 'Personalize your application here ! ;)';
    1 : lblInfos.Caption := 'Please refresh the view to apply changes.';
    2 : lblInfos.Caption := 'Look at your System Tray :)';
    3 : lblInfos.Caption := 'Old debug log colors aren''t modified.';
    4 : lblInfos.Caption := 'Leave blank the filename field to disable this option.';
    else lblInfos.Caption := '';
  end;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.SaveOptions;
var
  _vtp_opt : TOptions;
  _picone  : TPiconeBarreTache;
  
begin
  _vtp_opt := Main_Form.VmuToolPc.Options;

  //Avoir l'état de la petite icône
  _picone := Main_Form.PiconeBarreTache;
  case rgTrayIcon.ItemIndex of
    0 : begin
          _picone.PetiteIconeVisible := True;
          _picone.CacherSiMinimize := True;
          _picone.ReduireSiFin := False;
        end;
    1 : begin
          _picone.PetiteIconeVisible := True;
          _picone.CacherSiMinimize := False;
          _picone.ReduireSiFin := True;
        end;
    2 : begin
          _picone.PetiteIconeVisible := False;
          _picone.CacherSiMinimize := False;
          _picone.ReduireSiFin := False;
        end;
  end;

  //Couleurs du Debug
  Main_Form.fStateClr := clrbState.Selected;
  Main_Form.fSuccessClr := clrbSuccess.Selected;
  Main_Form.fErrorClr := clrbError.Selected;
  //Autres options
  Main_Form.fAutoScrollLog := cbAutoScroll.Checked;
  _vtp_opt.LogScanDirMsg := cbLogScanDirEvents.Checked;
  _vtp_opt.LogStateMsg := cbLogStateEvents.Checked;
  _vtp_opt.LogSuccessMsg := cbLogSuccessEvents.Checked;

  //Onglet general
  Main_Form.fShowErrornousVmi := cbShowErrornousFiles.Checked;
  Main_Form.fAutoSelectFirst := cbAutoSelect.Checked;
  _vtp_opt.ScanInvalidVms := cbShowInvalidVms.Checked;
  Main_Form.fConfirmClose := cbConfirmClose.Checked;
  Main_Form.fUseSplash := cbShowSplash.Checked;
  Main_Form.fAutoScrollView := cbAutoScrollView.Checked;
  Main_Form.fScanAtStart := cbScanAtStart.Checked;

  //Onglet Engine
  //Main_Form.fEngineType := TEngineType(rgEngineType.ItemIndex);
  //Main_Form.fExternalExecutable := eExternal.Text;
  //Main_Form.SetVmuToolPcEngine;

  //Onglet HexEdit
  Main_Form.fHexEdit.FileName := eHexEdit.Text;
  Main_Form.fHexEdit.Parameters := eHexEditParams.Text;

  //ShellIntegration
  ApplyShellIntegration;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.cbLogStateEventsClick(Sender: TObject);
begin
  clrbState.Enabled := cbLogStateEvents.Checked;
  if clrbState.Enabled then
    clrbState.Color := clWindow
  else clrbState.Color := clBtnFace;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.cbLogSuccessEventsClick(Sender: TObject);
begin
  clrbSuccess.Enabled := cbLogSuccessEvents.Checked;
  if clrbSuccess.Enabled then
    clrbSuccess.Color := clWindow
  else clrbSuccess.Color := clBtnFace;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.bBrowseClick(Sender: TObject);
begin

end;
 
//------------------------------------------------------------------------------

procedure TOptions_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_ESCAPE) then
  begin
    Key := #0;
    Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.FormCreate(Sender: TObject);
begin
  //lblEngineNote.Caption := lblEngineNote.Caption + GetEngineVersion + '.';
end;

//------------------------------------------------------------------------------

procedure TOptions_Form.bHexEditClick(Sender: TObject);
begin
  with odHexEdit do
    if Execute then eHexEdit.Text := FileName;
end;

procedure TOptions_Form.ApplyShellIntegration;
var
  VmuProperties : string;
  CurrState : boolean;
  _rep : integer;
  _ok : boolean;

begin
  VmuProperties := GetRealPath(ExtractFilePath(Application.ExeName)) + 'vmuprop.exe';

  //Vérifier si ça à changé
  CurrState := IsExtensionsRegistered and IsMenuRegistered;
  if cbAssociate.Checked = CurrState then Exit; //non.. ça a pas changé.

  case cbAssociate.Checked of
    True :  begin
              if not FileExists(VmuProperties) then
              begin
                MsgBox(Handle, 'Error, component "VMU TOOL PC Shell Properties'
                  + ' Integration" not found !' + WrapStr + 'Shell integration'
                  + ' aborted. Please re-install VMU TOOL PC...' + WrapStr
                  + 'File : "' + VmuProperties + '".', 'Error', MB_ICONERROR);
                Exit;
              end;

              //Confirmation.
              _rep := MsgBox(Handle, 'Are you sure to create (or modify) extensions'
                + ' "*.VMS", "*.VMI", "*.DCI" and' + WrapStr +
                'associate VMU TOOL PC with them ?',
                'Confirm association please', MB_ICONQUESTION + MB_YESNO);
              if _rep = IDNO then Exit;

              _ok := RegisterExtensions;
              _ok := _ok and RegisterMenu(PChar(VmuProperties));

              if _ok then
                MsgBox(Handle, 'OK, now VMU TOOL PC is associated with "*.VMS"'
                + ', "*.VMI" and "*.DCI".', 'Information', MB_ICONINFORMATION)
              else MsgBox(Handle, 'Error when associating VMU TOOL PC !', 'Error',
                MB_ICONERROR);
            end;
    False : begin
              _ok := UnregisterMenu;
              _ok := _ok and UnregisterExtensions;

              if _ok then
                MsgBox(Handle, 'VMU TOOL PC isn''t associated with "*.VMS"'
                + ', "*.VMI" and "*.DCI" now.' + WrapStr + 'Previous association has been restored.',
                  'Information', MB_ICONINFORMATION)
              else MsgBox(Handle, 'Error when destroying VMU TOOL PC associations !', 'Error',
                MB_ICONERROR);
            end;
  end;
end;

procedure TOptions_Form.bOKClick(Sender: TObject);
begin
  if (eHexEdit.Text <> '') and (not FileExists(eHexEdit.Text)) then
  begin
    MsgBox(Options_Form.Handle, 'Error, the Hex Editor wasn''t found.'
    + WrapStr + 'File : "' + eHexEdit.Text + '".', 'Warning', MB_ICONWARNING);
      ModalResult := mrNone;
    Exit;
  end;

  SaveOptions;
end;

end.
