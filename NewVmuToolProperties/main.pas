{$WARN UNIT_PLATFORM OFF}

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, XPMan, Buttons, VmuToolPc,
  ImgList, FileCtrl, ShellApi;

type
  TCheckSumFormat = (csDecimal, csHexa);
  TVmsSizeFormat  = (vsBytes, vsBlocks);

  TMain_Form = class(TForm)
    bClose: TBitBtn;
    pcMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    XPManifest: TXPManifest;
    iColorIconView: TImage;
    lFileName: TLabel;
    Bevel1: TBevel;
    Location_Label: TLabel;
    CreationDate_Label: TLabel;
    VmiCopyright_Label: TLabel;
    VmsResourceName_Label: TLabel;
    Bevel2: TBevel;
    VmFileName_Label: TLabel;
    Type_Label: TLabel;
    VmsSize_Label: TLabel;
    DataLength_Label: TLabel;
    ColorIconFrames_Label: TLabel;
    ColorIconSpeed_Label: TLabel;
    EyeCatchType_Label: TLabel;
    DcDescription_Label: TLabel;
    VmDescription_Label: TLabel;
    cbCopy: TCheckBox;
    Crc_Label: TLabel;
    bVmuToolPc: TBitBtn;
    iEyeCatch: TImage;
    ApplicationName_Label: TLabel;
    VmiCheckSum_Label: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    lLocation: TLabel;
    lCreationDate: TLabel;
    lVmiCopyright: TLabel;
    lVmsResourceName: TLabel;
    lVmFilename: TLabel;
    lDcDescription: TLabel;
    lVmDescription: TLabel;
    lVmsSize: TLabel;
    lDataLength: TLabel;
    lApplicationName: TLabel;
    lVmiCheckSum: TLabel;
    lCRC: TLabel;
    lColorIconSpeed: TLabel;
    lEyeCatchType: TLabel;
    lColorIconFrames: TLabel;
    tColorIcon: TTimer;
    Copy_Label: TLabel;
    lType: TLabel;
    iIconFrames: TImageList;
    Infos_Label: TLabel;
    bRunVmuToolPcStandard: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    VmiDescrition_Label: TLabel;
    lVmiDescription: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tColorIconTimer(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bVmuToolPcClick(Sender: TObject);
    procedure bRunVmuToolPcStandardClick(Sender: TObject);
  private
    function GetCheckSumFormat(Value: integer): string;
    function GetTypeFormat(Value: TVmiType): string;
    function GetVmsSizeFormat(Value: integer): string;
    procedure RunVmuTool(Parameters : string);
    { Déclarations privées }
  public
    { Déclarations publiques }

    fVmiStruct          : TSaveFile;

    //Config
    fCheckSumFormat     : TCheckSumFormat;
    fVmsSizeFormat      : TVmsSizeFormat;

    fFileName : string;
    procedure AnalyzeFile(const VmiFile : string);
    procedure VmuToolPcStatus(Sender: TObject; AMessage: String;
      MsgType: TMessageType);
  end;

var
  Main_Form: TMain_Form;

implementation

{$R *.dfm}

uses
  Utils, u_vmu_analyze;
  
const
  BLOCK_SIZE : integer = 512;
  
//------------------------------------------------------------------------------

function TMain_Form.GetCheckSumFormat(Value: integer): string;
begin
  case fCheckSumFormat of
    csDecimal : Result := IntToStr(Value);
    csHexa    : Result := '0x' + IntToHex(Value, 8);
  end;
end;

//------------------------------------------------------------------------------

function TMain_Form.GetVmsSizeFormat(Value : integer) : string;
begin
  case fVmsSizeFormat of
    vsBytes   : Result := IntToStr(Value);
    vsBlocks  : Result := IntToStr(Value div BLOCK_SIZE);
  end;
end;

//------------------------------------------------------------------------------

function TMain_Form.GetTypeFormat(Value : TVmiType) : string;
begin
  case Value of
    vtData : Result := 'DATA';
    vtGame : Result := 'GAME';
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.AnalyzeFile(const VmiFile: string);
var
  i : integer;
  b : TBitmap;

begin
  if not GetInfos(VmiFile, fVmiStruct) then Halt(1);//Exit;

  //Remplir la fiche.
  lVmiDescription.Caption := fVmiStruct.VmiInfo.VMI_description;
  lFileName.Caption := ExtractFileName(fVmiStruct.FileName);
  lLocation.Caption := MinimizeName(ExtractFilePath(fVmiStruct.FileName),
    Main_Form.lLocation.Canvas, Main_Form.lLocation.Width);
  lCreationDate.Caption := fVmiStruct.VmiInfo.Creation_date;
  lVmiCopyright.Caption := fVmiStruct.VmiInfo.VMI_copyright;
  lVmsResourceName.Caption := fVmiStruct.VmiInfo.VMS_resource_name;
  lVmFilename.Caption := fVmiStruct.VmiInfo.VM_filename;
  lDcDescription.Caption := fVmiStruct.VmiInfo.DC_description;
  lVmDescription.Caption := fVmiStruct.VmiInfo.VM_description;
  lVmsSize.Caption := GetVmsSizeFormat(fVmiStruct.VmiInfo.VMS_size);
  lDataLength.Caption := IntToStr(fVmiStruct.VmiInfo.Data_length);
  lApplicationName.Caption := fVmiStruct.VmiInfo.Application_name;
  lVmiCheckSum.Caption := GetCheckSumFormat(fVmiStruct.VmiInfo.VMI_checksum);
  lType.Caption := GetTypeFormat(fVmiStruct.VmiInfo.Type_File);
  lCRC.Caption := GetCheckSumFormat(fVmiStruct.VmiInfo.CRC);
  lColorIconSpeed.Caption := IntToStr(fVmiStruct.VmiInfo.Color_icon_speed);
  lColorIconFrames.Caption := IntToStr(fVmiStruct.VmiInfo.Color_icon_frames);
  lEyeCatchType.Caption := IntToStr(fVmiStruct.VmiInfo.Eyecatch_type);
  cbCopy.Checked := fVmiStruct.VmiInfo.Copy_Allowed;
  iEyeCatch.Picture.Bitmap.Assign(fVmiStruct.Pictures.EyeCatch);

  //Charger pour l'icône
  for i := 0 to 2 do
  begin
    b := fVmiStruct.Pictures.Frames[i];
    if Assigned(b) and (not b.Empty) then
      iIconFrames.Add(b, nil);
  end;

  if iIconFrames.Count <> 0 then
    iIconFrames.GetBitmap(0, iColorIconView.Picture.Bitmap);
    
  tColorIcon.Enabled := iIconFrames.Count > 1;

  //Changer le nom de la form
  Main_Form.Caption := Main_Form.Caption + lFileName.Caption;
  Application.Title := Main_Form.Caption;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  //Application.Title := Main_Form.Caption;
  pcMain.ActivePageIndex := 0;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.tColorIconTimer(Sender: TObject);
begin
  //Si l'ImageList est vide on reset le timer.
  if iIconFrames.Count = 0 then
  begin
    tColorIcon.Enabled := False;
    tColorIcon.Tag := 0;
    Exit;
  end;

  //Sinon on va afficher grace à la propriété tag pour garder en mémoire
  //le numéro affiché.
  tColorIcon.Tag := (tColorIcon.Tag + 1) mod iIconFrames.Count;

  //prévenir un bug de windows de supperposition d'image.
  iColorIconView.Picture.Bitmap := nil;
  iIconFrames.GetBitmap(tColorIcon.Tag, iColorIconView.Picture.Bitmap);
  iColorIconView.Refresh;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.bCloseClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.bVmuToolPcClick(Sender: TObject);
begin
  RunVmuTool(ExtractFilePath(fFileName));
  //Close;
//  Halt(0);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.RunVmuTool(Parameters: string);
var
  VmuToolExe : string;
//  F : TextFile;
  
begin
  VmuToolExe := GetRealPath(ExtractFilePath(Application.ExeName)) + 'vmutool.exe';

  if not FileExists(VmuToolExe) then
  begin
    MsgBox(Handle, 'Error, VMU TOOL PC not found !!!'
      + WrapStr + 'File : "' + VmuToolExe + '".', 'Launcher failed', MB_ICONERROR);
    Exit;
  end;

  {AssignFile(F, IncludeTrailingPathDelimiter(GetTempDir) + 'run_vmutool.bat');
  ReWrite(F);
  WriteLn(F, '@echo off');
  WriteLn(F, 'REM Written by ' + Infos_Label.Caption);
  WriteLn(F, '"', VmuToolExe, '" "', Parameters, '"');
  WriteLn(F, ':CLEAN');
  WriteLn(F, 'DELETE %0');
  WriteLn(F, 'IF EXISTS %0 GOTO CLEAN');
  CloseFile(F);}

  ShellExecute(Handle, 'open', PChar('"' + VmuToolExe + '"'),
    PChar('"' + Parameters + '" -extern "' + Main_Form.Caption + '"'), '', SW_SHOWNORMAL);
  // on passe la caption de cette fenêtre pour fermer le programme dans VMU TOOL PC
  // sinon il y'a un bug de collision de fenêtre (VMU TOOL PC passe derrière les fenêtres)
end;

//------------------------------------------------------------------------------

procedure TMain_Form.bRunVmuToolPcStandardClick(Sender: TObject);
begin
  RunVmuTool('<no_dir>'); //décaler les ParamStr
  //Close;
//  Halt(0);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.VmuToolPcStatus(Sender: TObject; AMessage: String; MsgType: TMessageType);
begin
  Errornous := (not Errornous) and (MsgType = mtError);
  if Errornous then ErrorMsg := AMessage;
end;

end.
