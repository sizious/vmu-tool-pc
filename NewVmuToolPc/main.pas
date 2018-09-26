{$WARN UNIT_PLATFORM OFF}

unit main;

interface

uses
  Windows, SysUtils, Messages, Classes, Forms, Graphics, Dialogs, ShellApi,
  Controls, Menus, AppEvnts, ImgList, XPMan, XPMenu, ExtDlgs, StdCtrls, ComCtrls,
  JvComponent, JvBaseDlg, JvBrowseFolder, PiconeBarreTache, VmuToolPc,
  VmuToolPcListView, ExtCtrls, VirtualExplorerTree, VirtualTrees,
  VirtualShellUtilities, Buttons;

//AboutBox
const
  PRG_VERSION : string = '1.0';
  PRG_DATE    : string = '25 May 2006';

type
  EBitmapNotAssigned = class(Exception);

  TCheckSumFormat = (csDecimal, csHexa);
  TVmsSizeFormat  = (vsBlocks, vsBytes);
  TIconSizeFormat = (is24x24, is32x32, is16x16);

  THexEdit = packed record
    FileName    : string;
    Parameters  : string;
  end;

  TMain_Form = class(TForm)
    Image3: TImage;
    Image4: TImage;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    sbMain: TStatusBar;
    mmApp: TMainMenu;
    File1: TMenuItem;
    N6: TMenuItem;
    miExit: TMenuItem;
    View1: TMenuItem;
    Columns1: TMenuItem;
    Movecolumns1: TMenuItem;
    N7: TMenuItem;
    Details1: TMenuItem;
    Style1: TMenuItem;
    N5: TMenuItem;
    Style2: TMenuItem;
    Style3: TMenuItem;
    Style4: TMenuItem;
    Iconsize1: TMenuItem;
    Icon1: TMenuItem;
    N4: TMenuItem;
    Icon2: TMenuItem;
    Icon3: TMenuItem;
    Checksumformat1: TMenuItem;
    Checksum1: TMenuItem;
    Checksum2: TMenuItem;
    VMS_Size: TMenuItem;
    VMSSize1: TMenuItem;
    VMSSize2: TMenuItem;
    N8: TMenuItem;
    miRefresh: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    XPManifest: TXPManifest;
    tColorIcon: TTimer;
    pmVmuIcon: TPopupMenu;
    miDisplayFrames: TMenuItem;
    miFrame1: TMenuItem;
    miFrame2: TMenuItem;
    miFrame3: TMenuItem;
    N2: TMenuItem;
    miSaveIcon: TMenuItem;
    miAnimateIcon: TMenuItem;
    ilFilesIcons: TImageList;
    ilFrameAnim: TImageList;
    ilMenuIcons: TImageList;
    VmuToolPc: TVmuToolPc;
    ilInvalidFileIcons: TImageList;
    Help2: TMenuItem;
    N1: TMenuItem;
    miSaveReport2: TMenuItem;
    N9: TMenuItem;
    pmEyeCatch: TPopupMenu;
    miSaveEyeCatchTo: TMenuItem;
    flv: TVmuToolPcListView;
    pBottom: TPanel;
    pcMain: TPageControl;
    tsVMInfos: TTabSheet;
    pTabVmiInfos: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    eVmFilename: TEdit;
    eDCDescription: TEdit;
    eDate: TEdit;
    eVMDescription: TEdit;
    cbxType: TComboBox;
    cbCopy: TCheckBox;
    eDescription: TEdit;
    eCopyright: TEdit;
    Panel2: TPanel;
    iColorIconView: TImage;
    Panel4: TPanel;
    iEyeCatch: TImage;
    eResource: TEdit;
    eAppName: TEdit;
    eCheckSum: TEdit;
    eVmsSize: TEdit;
    tsReport: TTabSheet;
    tsDebug: TTabSheet;
    reDebug: TRichEdit;
    Image2: TImage;
    Image5: TImage;
    miOptions: TMenuItem;
    N3: TMenuItem;
    N10: TMenuItem;
    sdPict: TSavePictureDialog;
    miConfig: TMenuItem;
    pmVmiList: TPopupMenu;
    miCreateVmi: TMenuItem;
    miPictures: TMenuItem;
    miVmiIcon: TMenuItem;
    miSaveEyeCatchTo2: TMenuItem;
    N12: TMenuItem;
    miAnimateIcon2: TMenuItem;
    N13: TMenuItem;
    miDisplayFrames2: TMenuItem;
    miFrame2_1: TMenuItem;
    miFrame2_2: TMenuItem;
    miFrame2_3: TMenuItem;
    N14: TMenuItem;
    miSaveIcon2: TMenuItem;
    N15: TMenuItem;
    Refresh2: TMenuItem;
    reReport: TRichEdit;
    PiconeBarreTache: TPiconeBarreTache;
    pmTrayIcon: TPopupMenu;
    Open1: TMenuItem;
    N16: TMenuItem;
    Quit1: TMenuItem;
    miCopyTo: TMenuItem;
    N17: TMenuItem;
    miMoveTo: TMenuItem;
    miDelete: TMenuItem;
    miHexEdit: TMenuItem;
    lblSizeType: TLabel;
    pmReport: TPopupMenu;
    miCopyRichEdit: TMenuItem;
    Selectall1: TMenuItem;
    N19: TMenuItem;
    Saveto1: TMenuItem;
    sdRichEdit: TSaveDialog;
    bfdFile: TJvBrowseForFolderDialog;
    N20: TMenuItem;
    miSaveReport: TMenuItem;
    miCopyTo2: TMenuItem;
    N21: TMenuItem;
    miMoveTo2: TMenuItem;
    miDelete2: TMenuItem;
    miHexEdit2: TMenuItem;
    N22: TMenuItem;
    miCreateVmi2: TMenuItem;
    pmDebug: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N23: TMenuItem;
    miClearDebug: TMenuItem;
    N24: TMenuItem;
    miClearDebug2: TMenuItem;
    aeMain: TApplicationEvents;
    dtv: TVirtualExplorerTreeview;
    pComboTreeSelect: TPanel;
    Image1: TImage;
    vecbx: TVirtualExplorerCombobox;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    miCancelScan: TMenuItem;
    miCancelScan2: TMenuItem;
    bSaveInfos: TBitBtn;
    bAbort: TBitBtn;
    Label12: TLabel;
    Opencurrentfolder1: TMenuItem;
    pComboButtons: TPanel;
    bCancelScan: TBitBtn;
    bRefresh: TBitBtn;
    N11: TMenuItem;
    Opencurrentfolder2: TMenuItem;
    N18: TMenuItem;
    Websites1: TMenuItem;
    N25: TMenuItem;
    SiZiOUS1: TMenuItem;
    Speud1: TMenuItem;
    XPMenu: TXPMenu;
    procedure VmuToolPcEndScan(Sender: TObject);
    procedure VmuToolPcStatus(Sender: TObject; AMessage: String;
      MsgType: TMessageType);
    procedure VmuToolPcStartScan(Sender: TObject; Directory: String);
    procedure FormCreate(Sender: TObject);
    procedure Columns1Click(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure VmuToolPcEndFileScanned(Sender: TObject; VmiFile: String);
    procedure Movecolumns1Click(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure flvSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure tColorIconTimer(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure Icon1Click(Sender: TObject);
    procedure Style1Click(Sender: TObject);
    procedure Checksum1Click(Sender: TObject);
    procedure VMSSize1Click(Sender: TObject);
    procedure dtvClick(Sender: TObject);
    procedure dtvKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure miAnimateIconClick(Sender: TObject);
    procedure miFrame1Click(Sender: TObject);
    procedure miSaveIconClick(Sender: TObject);
    procedure miSaveEyeCatchToClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCreateVmiClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure reDebugChange(Sender: TObject);
    procedure miCopyRichEditClick(Sender: TObject);
    procedure reReportEnter(Sender: TObject);
    procedure reDebugEnter(Sender: TObject);
    procedure miCopyToClick(Sender: TObject);
    procedure miMoveToClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure miHexEditClick(Sender: TObject);
    procedure miClearDebugClick(Sender: TObject);
    procedure miSaveReportClick(Sender: TObject);
    procedure aeMainException(Sender: TObject; E: Exception);
    procedure vecbxPathChange(Sender: TCustomVirtualExplorerCombobox;
      SelectedNamespace: TNamespace);
    procedure miCancelScanClick(Sender: TObject);
    procedure VmuToolPcAborted(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bSaveInfosClick(Sender: TObject);
    procedure bAbortClick(Sender: TObject);
    procedure eVmFilenameChange(Sender: TObject);
    procedure cbxTypeChange(Sender: TObject);
    procedure cbCopyClick(Sender: TObject);
    procedure Opencurrentfolder1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure SiZiOUS1Click(Sender: TObject);
    procedure Speud1Click(Sender: TObject);
  private
    { Déclarations privées }
    fFirstStart : boolean;
    fCurrentRichEdit : TRichEdit;

    //procedure InitFileIconsImageList;
    function GetInvalidIconBitmap(Index : Integer) : TBitmap;
    function AddSubItem(ParentItem: TListItem; ColType: TColumnType ;
      Caption: string): boolean;
    procedure ClearFileDetails;
    procedure ExpandSelectedFile;
    procedure BuildReportDetails;
    function CheckMenuItem(BaseName: string ; Sender : TObject ;
      MaxItems : integer) : integer;
    procedure InsertIcon(var B : TBitmap); overload;
    procedure InsertIcon(var B : TBitmap ; Index : Integer); overload;
    procedure AddDebug(Msg: string ; MsgColor : TColor);
    procedure InitApplication;
    procedure UpdateViewPopupMenu;
    function QuitAppCommand : boolean;
    procedure ChangeTrayMenuState(State : boolean);
    function GetCheckSumFormat(Value : integer) : string;
    function GetVmsSizeFormat(Value: integer): string;
    function GetCopyFormat(Value: boolean): string;
    function GetTypeFormat(Value: TVmiType): string;
    procedure ChangeStateExpandFields(State : boolean);
    procedure UpdateViewItem(Index : integer ; NewInfos : TVmiInfo);
    procedure ChangeModifyButtons(State: boolean);
    procedure ResizeVisualMemoryIcon(var B, NewBmp: TBitmap);
//    procedure InitProgressBar;
  public
    { Déclarations publiques }
    fCurrentVmi         : integer; //indique l'indice dans le compo VmuToolPc du VMI sélectionné dans la ListView.
    fSelectedIndex      : integer; //indique simplement l'élément sélectionné dans la ListView.

    //Options           
    fScanAtStart        : boolean;
    fFromCmdLine        : boolean;
    fAutoScrollView     : boolean;
    fCheckSumFormat     : TCheckSumFormat;
    fVmsSizeFormat      : TVmsSizeFormat;
    fIconSizeFormat     : TIconSizeFormat;
    fStateClr           : TColor;
    fSuccessClr         : TColor;
    fErrorClr           : TColor;
    fShowErrornousVmi   : boolean;
    fAutoSelectFirst    : boolean;
    fAutoScrollLog      : boolean;
    fConfirmClose       : boolean;
    fHexEdit            : THexEdit;
    fUseSplash          : boolean;

    //Dossier de démarrage (on le choppe depuis la ligne de commande, dans dpr).
    fStartingDirectory : string;

    //Méthodes...
    procedure FillViewWithThat(Index : integer);
    procedure FillView;
    procedure InitListView;
    procedure ScanCurrentDir;
    procedure UpdateListViewCaptions;
    procedure SetVmuToolPcEngine;
  end;

var
  Main_Form: TMain_Form;

implementation

uses
  showcol, movecol, options, u_interpolation_bilineaire, u_config, utils,
  u_file_op_mgr, u_rcolors, u_gif_creator, debug_handler, buildvmi, about;

const
  BLOCK_SIZE           : integer = 512;
  ERR_VMS_IMG_IND      : integer = 1;
  ERR_VMI_READ_IMG_IND : integer = 0;

{$R *.dfm}

//------------------------------------------------------------------------------

{
  Valeurs disponibles :
    - 11 (+1 pour le nom) obligatoires

    'Check sum', 'Description',
    'Copyright', 'Date', 'VMS resource name', 'VM filename', 'Type', 'Copy',
    'VMS size', 'VM description', 'DC description', 'Application name',
    'Color icon frames', 'Color icon speed', 'Eyecatch type', 'CRC',
    'Data length'
}

//------------------------------------------------------------------------------

function TMain_Form.AddSubItem(ParentItem: TListItem; ColType: TColumnType
  ; Caption: string): boolean;
var
  Ind : Integer;

begin
  Ind := flv.GetColumnIndex(ColType);
  Result := (Ind <> -1);
  if not Result then Exit;

  {
    Erreur d'indice. En effet, Item et les SubItems sont séparés.
    Du coup, la fonction GetColumnIndex renvoie effectivement la bonne colonne,
    mais sans tenir compte que la première colonne est appellée "Item", la
    deuxième, SubItems[0], la troisième, SubItems[1].

    D'ou l'erreur suivante (exemple) :
    Si la colonne demandée est CheckSum, c'est la colonne 1.
    Donc GetColumnIndex va renvoyer 1. Le problème, c'est que c'est le SubItem
    non pas 1, mais 0 ! Il faut donc que je fasse - 1, pour tenir compte de la
    colonne Item.

    J'espère que c'est bien expliqué car en revoyant les commentaires que
    j'avais laissé dans le précédent VMU TOOL PC, ça fait peur, on comprend
    rien !
  }

  ParentItem.SubItems[Ind - 1] := Caption;
end;

//------------------------------------------------------------------------------

{procedure TMain_Form.InitProgressBar;
const
  PANEL_INDEX : integer = 4;

var
  i, Size : integer;

begin
  sbMain.Panels[PANEL_INDEX].Text := '';
  
  //pour que le ProgressBar se place sur le StatuBar
  pBar.Parent := sbMain;

  // le placement de la ProgressBar se fait maintenant par rapport au StatusBar
  Size := 0;

  for i := 0 to PANEL_INDEX - 1 do
    Size := Size + sbMain.Panels[i].Width;

  pBar.SetBounds(Size + 2, 2,
    sbMain.Panels[PANEL_INDEX].Width - 6, sbMain.Height - 3);
end; }

//------------------------------------------------------------------------------

procedure TMain_Form.FillView;
var
  i : integer;

begin
  InitListView;
  
  for i := 0 to VmuToolPc.Count - 1 do
    FillViewWithThat(i);
end;

//------------------------------------------------------------------------------

{procedure TMain_Form.InitFileIconsImageList;
var
  i : integer;
  bmp : TBitmap;

begin
  ilFilesIcons.Clear;

  bmp := TBitmap.Create;
  try
    for i := 0 to ilInvalidFileIcons.Count - 1 do
    begin
      ilInvalidFileIcons.GetBitmap(i, bmp);
      InsertIcon(bmp);
      //ilFilesIcons.Add(bmp, nil);
    end;
  finally
    bmp.Free;
  end;
end; }
 
//------------------------------------------------------------------------------

procedure TMain_Form.VmuToolPcEndScan(Sender: TObject);
begin
  miCancelScan.Enabled := False;
  miCancelScan2.Enabled := miCancelScan.Enabled;
  bCancelScan.Enabled := miCancelScan.Enabled;
  
  sbMain.Panels[1].Text := 'Idle...';
  sbMain.Panels[5].Text := VmuToolPc.Directory;
  Screen.Cursor := crDefault;

  //Sélectionner le premier
  if (flv.Items.Count > 0) and (fAutoSelectFirst) then
  begin
    flv.SetFocus;
    flv.ItemIndex := 0;
  end;

  //miCancelScan.Enabled := False;
  //miCancelScan2.Enabled := miCancelScan.Enabled;

//  pBar.Position := 0;
end;
 
//------------------------------------------------------------------------------

procedure TMain_Form.VmuToolPcStatus(Sender: TObject; AMessage: String;
  MsgType: TMessageType);
begin
  case MsgType of
    mtError   : AddDebug(AMessage, fErrorClr);
    mtSuccess : AddDebug(AMessage, fSuccessClr);
    mtState   : AddDebug(AMessage, fStateClr);
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.VmuToolPcStartScan(Sender: TObject;
  Directory: String);
begin
  sbMain.Panels[3].Text := '0';
  sbMain.Panels[1].Text := 'Scanning...';
  Application.ProcessMessages;
  InitListView;
  Screen.Cursor := crHourglass;
  miCancelScan.Enabled := True;
  miCancelScan2.Enabled := miCancelScan.Enabled;
  bCancelScan.Enabled := miCancelScan.Enabled;

//  pBar.Max := 7;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  Application.Title := Main_Form.Caption;

  InitApplication;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.Columns1Click(Sender: TObject);
begin
  ColView_Form := TColView_Form.Create(Application);
  try
    //Désactiver le menu en Tray
    ChangeTrayMenuState(False);

    //Afficher la fiche
    ColView_Form.ShowModal;

    //Activer le menu en Tray
    ChangeTrayMenuState(True);
  finally
    ColView_Form.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miExitClick(Sender: TObject);
begin
  QuitAppCommand;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.FillViewWithThat(Index: integer);
var
  Item : TListItem;
  j : integer;
  err : TErrorType;
  b : TBitmap;

begin
  err := VmuToolPc.Files[Index].Errornous;

  //Filtrer les fichiers VMI invalides en fonction des options.
  //(pour les VMS c'est dans le compo lui même).
  if (not fShowErrornousVmi) and (err <> etVmiNotFound) then
    if (err <> etNoError) then Exit;
  //if (fShowErrornousVmi) and (err = etVmiNotFound) then
    
  Item := flv.Items.Add;

  {
    Permet de faire la correspondance avec le tableau contenant
    les VMI et VMS. (Semblable au ItemData du VB, mais le Delphi c'est
    largement mieux, car ItemData du VB est limité à des integers, et celui
    de Delphi à n'importe quoi car il est de type Pointer !

    Je fais ça car si la liste est triée, les indices de la ListView et du
    tableau du TVmuToolPc sont différents.
  }
  Item.Data := Pointer(Index);

  //Nom du fichier Vmi.
  Item.Caption := ExtractFileName(VmuToolPc.Files[Index].FileName);

  //Charger l'icône (dans la ListView)
  //on change car lors de la mise à jour d'un élément précis on peut modifier l'icône.
{  case VmuToolPc.Files[Index].Errornous of
    etNoError       : begin
                        //Insérer l'icône du VMI en cours.
                        InsertIcon(VmuToolPc.Files[Index].Pictures.Frames[0]);
                        Item.ImageIndex := ilFilesIcons.Count - 1;
                      end;
     etVmiNotFound  : Item.ImageIndex := ERR_VMS_IMG_IND;
     else Item.ImageIndex := ERR_VMI_READ_IMG_IND;
  end; }
  case VmuToolPc.Files[Index].Errornous of
    etNoError     : InsertIcon(VmuToolPc.Files[Index].Pictures.Frames[0]);
    etVmiNotFound : begin
                      b := GetInvalidIconBitmap(ERR_VMS_IMG_IND);
                      InsertIcon(b);
                    end;
    else begin
      b := GetInvalidIconBitmap(ERR_VMI_READ_IMG_IND);
      InsertIcon(b);
    end;
  end;
  if Assigned(b) then b.Free;
  Item.ImageIndex := ilFilesIcons.Count - 1;

  {if VmuToolPc.Files[Index].Errornous = etNoError then
  begin
    InsertIcon(VmuToolPc.Files[Index].Pictures.Frames[0]);
    Item.ImageIndex := ilFilesIcons.Count - 1;
  end else begin
    Item.ImageIndex := 0;
    //Continue; //vmi invalide, on passe au suivant.
  end; }

  //*** Charger le reste des colonnes ***

  { Préparer le terrain... on est obligé de mettre les SubItems dans l'ordre,
    mais ça me casse les couilles. Avant j'avais fait une putain de tchernobylus,
    un truc de ouf, parce que j'étais trop con.
    Grâce à ce for tout con, je peux insérer les SubItems dans l'ordre que je
    veux !!!! }
  for j := 0 to flv.Columns.Count - 1 do
    Item.SubItems.Add('');

  //Ajouter le bordel.
  {case fCheckSumFormat of
    csDecimal : AddSubItem(Item, ctCheckSum, IntToStr(VmuToolPc.Files[Index].VmiInfo.VMI_checksum));
    csHexa    : AddSubItem(Item, ctCheckSum, '0x' + IntToHex(VmuToolPc.Files[Index].VmiInfo.VMI_checksum, 8));
  end;}
  AddSubItem(Item, ctCheckSum, GetCheckSumFormat(VmuToolPc.Files[Index].VmiInfo.VMI_checksum));
  AddSubItem(Item, ctDescription, VmuToolPc.Files[Index].VmiInfo.VMI_description);
  AddSubItem(Item, ctCopyright, VmuToolPc.Files[Index].VmiInfo.VMI_copyright);
  AddSubItem(Item, ctDate, VmuToolPc.Files[Index].VmiInfo.Creation_date);
  AddSubItem(Item, ctVmsResourceName, VmuToolPc.Files[Index].VmiInfo.VMS_resource_name);
  AddSubItem(Item, ctVmFileName, VmuToolPc.Files[Index].VmiInfo.VM_filename);
  {if VmuToolPc.Files[Index].VmiInfo.Copy_Allowed then
    AddSubItem(Item, ctCopy, 'OK')
  else AddSubItem(Item, ctCopy, 'Protected');}
  AddSubItem(Item, ctCopy, GetCopyFormat(VmuToolPc.Files[Index].VmiInfo.Copy_Allowed));
  {case VmuToolPc.Files[Index].VmiInfo.Type_File of
    vtData : AddSubItem(Item, ctType, 'DATA');
    vtGame : AddSubItem(Item, ctType, 'GAME');
  end;}
  AddSubItem(Item, ctType, GetTypeFormat(VmuToolPc.Files[Index].VmiInfo.Type_File));
  {case fVmsSizeFormat of
    vsBytes : AddSubItem(Item, ctVmsSize, IntToStr(VmuToolPc.Files[Index].VmiInfo.VMS_size));
    vsBlocks : AddSubItem(Item, ctVmsSize, IntToStr(VmuToolPc.Files[Index].VmiInfo.VMS_size div BLOCK_SIZE));
  end;}
  AddSubItem(Item, ctVmsSize, GetVmsSizeFormat(VmuToolPc.Files[Index].VmiInfo.VMS_size));
  AddSubItem(Item, ctVmDescription, VmuToolPc.Files[Index].VmiInfo.VM_description);
  AddSubItem(Item, ctDcDescription, VmuToolPc.Files[Index].VmiInfo.DC_description);
  AddSubItem(Item, ctApplicationName, VmuToolPc.Files[Index].VmiInfo.Application_name);
  AddSubItem(Item, ctColorIconFrames, IntToStr(VmuToolPc.Files[Index].VmiInfo.Color_icon_frames));
  AddSubItem(Item, ctColorIconSpeed, IntToStr(VmuToolPc.Files[Index].VmiInfo.Color_icon_speed));
  AddSubItem(Item, ctEyecatchType, IntToStr(VmuToolPc.Files[Index].VmiInfo.Eyecatch_type));
  {case fCheckSumFormat of
    csDecimal : AddSubItem(Item, ctCRC, IntToStr(VmuToolPc.Files[Index].VmiInfo.CRC));
    csHexa    : AddSubItem(Item, ctCRC, '0x' + IntToHex(VmuToolPc.Files[Index].VmiInfo.CRC, 8));
  end;}
  AddSubItem(Item, ctCRC, GetCheckSumFormat(VmuToolPc.Files[Index].VmiInfo.CRC));
  AddSubItem(Item, ctDataLength, IntToStr(VmuToolPc.Files[Index].VmiInfo.Data_length));
end;

//------------------------------------------------------------------------------

procedure TMain_Form.InitListView;
begin
  flv.Clear;
  ilFilesIcons.Clear;
  //InitFileIconsImageList;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.VmuToolPcEndFileScanned(Sender: TObject;
  VmiFile: String);
begin
  if (not VmuToolPc.Active) then Exit;
  
  FillViewWithThat(VmuToolPc.Count - 1); //remplir la ListView avec le nouveau fichier.
  sbMain.Panels[3].Text := IntToStr(VmuToolPc.Count);

//  pBar.Position := VmuToolPc.Count;

  if fAutoScrollView and (flv.Handle <> 0) then
    //PostMessage(flv.Handle, SB_BOTTOM, 0, 0);
    PostMessage(flv.Handle, WM_VSCROLL, SB_PAGEDOWN, 0);

  //Ralenti un peu l'application, mais permet de rendre la main à Windows.
  //Evite un effet de "bloquage" de l'application !
  Application.ProcessMessages;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.Movecolumns1Click(Sender: TObject);
begin
  MoveCol_Form := TMoveCol_Form.Create(Application);
  try
    ChangeTrayMenuState(False);

    //Afficher la fiche
    MoveCol_Form.ShowModal;

    ChangeTrayMenuState(True);
  finally
    MoveCol_Form.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miRefreshClick(Sender: TObject);
begin
  VmuToolPc.Stop;
  ScanCurrentDir;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.flvSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  ExpandSelectedFile;  //fCurrentVmi est mis à jour la dedant.
  UpdateViewPopupMenu; //on l'utilise ici pour désactiver le menu de création d'un VMI.
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ExpandSelectedFile;
var
  i               : Integer;
  CurrVi          : TVmiInfo;
  it              : TMenuItem;
  bmp             : TBitmap;
  _frames_state,
  ShowPopupMenu   : boolean;

begin
  ClearFileDetails;
  fSelectedIndex := flv.ItemIndex;
  if (fSelectedIndex = -1) or (fSelectedIndex >= flv.Items.Count) then Exit;

  fCurrentVmi := Integer(flv.Items[fSelectedIndex].Data);

  CurrVi := VmuToolPc.Files[fCurrentVmi].VmiInfo;

  //Charger le détail dans le RichEdit Report.
  BuildReportDetails;
  
  //Charger les différents champs
  eVmFilename.Text := CurrVi.VM_filename;
  eDCDescription.Text := CurrVi.DC_description;
  eDate.Text := CurrVi.Creation_date;
  eVMDescription.Text := CurrVi.VM_description;
  eDescription.Text := CurrVi.VMI_description;
  eCopyright.Text := CurrVi.VMI_copyright;
  eResource.Text := CurrVi.VMS_resource_name;
  eAppName.Text := CurrVi.Application_name;
  {case fCheckSumFormat of
    csDecimal : eCheckSum.Text := IntToStr(CurrVi.VMI_checksum);
    csHexa    : eCheckSum.Text := '0x' + IntToHex(CurrVi.VMI_checksum, 8);
  end;}
  eCheckSum.Text := GetCheckSumFormat(CurrVi.VMI_checksum);
  {case fVmsSizeFormat of
    vsBytes   : eVmsSize.Text := IntToStr(CurrVi.VMS_size);
    vsBlocks  : eVmsSize.Text := IntToStr(CurrVi.VMS_size div BLOCK_SIZE);
  end;}
  eVmsSize.Text := GetVmsSizeFormat(CurrVi.VMS_size);
  cbxType.ItemIndex := Integer(CurrVi.Type_File);
  cbCopy.Checked := CurrVi.Copy_Allowed;

  //Images...
  //Eyecatch :
  Self.iEyeCatch.Picture.Bitmap.Assign(VmuToolPc.Files[fCurrentVmi].Pictures.EyeCatch);

  //Frames
  ilFrameAnim.Clear;
  for i := 0 to 2 do
  begin
    bmp := VmuToolPc.Files[fCurrentVmi].Pictures.Frames[i];

    if Assigned(bmp) then
      ilFrameAnim.Add(bmp, nil);

    //activer les différents menus
    it := (FindComponent('miFrame' + IntToStr(i+1)) as TMenuItem);
    it.Enabled := Assigned(bmp);
  end;

  //Si l'image a au moins 2 pictures on va animer l'icône en activant le timer.
  iColorIconView.Picture.Bitmap.Assign(VmuToolPc.Files[fCurrentVmi].Pictures.Frames[0]);
  tColorIcon.Enabled := Assigned(VmuToolPc.Files[fCurrentVmi].Pictures.Frames[1]);

  miAnimateIcon.Checked := tColorIcon.Enabled;
  miAnimateIcon.Enabled := tColorIcon.Enabled;
  _frames_state := ((miFrame1.Enabled) or (miFrame2.Enabled)
    or (miFrame3.Enabled));
  miDisplayFrames.Enabled := (not miAnimateIcon.Checked) and _frames_state;
  miSaveIcon.Enabled := not iColorIconView.Picture.Bitmap.Empty;

  //Pour l'eyecatch
  miSaveEyeCatchTo.Enabled := not iEyeCatch.Picture.Bitmap.Empty;
  if not miSaveEyeCatchTo.Enabled then
    iEyeCatch.PopupMenu := nil
  else iEyeCatch.PopupMenu := pmEyeCatch;

  //Sélectionner la première frame. Ceci sera visible si l'icône est seule.
  //En effet l'icône étant animée par défaut le bon item sera coché dès que le
  //gars arrêtera l'animation.
  miFrame1.Click;

  //C'est inutile d'afficher le popup menu si tous les items sont grisés !
  ShowPopupMenu := (miDisplayFrames.Enabled) or (miAnimateIcon.Enabled)
    or (miSaveIcon.Enabled);
  if not ShowPopupMenu then
    iColorIconView.PopupMenu := nil
  else iColorIconView.PopupMenu := pmVmuIcon;

  // *** COPIE DU MENU DANS LE MENU GENERAL ***
  //Appliquer tous les changements du popupmenu au menu général
  miVmiIcon.Enabled := Assigned(iColorIconView.PopupMenu);
  miDisplayFrames2.Enabled := miDisplayFrames.Enabled;
  miFrame2_1.Enabled := miFrame1.Enabled;
  miFrame2_2.Enabled := miFrame2.Enabled;
  miFrame2_3.Enabled := miFrame3.Enabled;
  miSaveIcon.Enabled := miSaveIcon2.Enabled;
  miAnimateIcon2.Enabled := miAnimateIcon.Enabled;
  miSaveEyeCatchTo2.Enabled := miSaveEyeCatchTo.Enabled;

  miPictures.Enabled := miVmiIcon.Enabled or miSaveEyeCatchTo2.Enabled;

  //Activer l'édition
  if (VmuToolPc.Files[fCurrentVmi].Errornous = etNoError)
    and (VmuToolPc.Files[fCurrentVmi].FileType = ftVmi) then
  begin
    ChangeStateExpandFields(True);
    //ChangeModifyButtons(False); //on a encore rien modifié
    //(mais le OnChange est déclanché par Delphi en remplissant les champs).
  end;
end;
 
//------------------------------------------------------------------------------

procedure TMain_Form.tColorIconTimer(Sender: TObject);
begin
  //Si l'ImageList est vide on reset le timer.
  if ilFrameAnim.Count = 0 then
  begin
    tColorIcon.Enabled := False;
    tColorIcon.Tag := 0;
    Exit;
  end;

  //Sinon on va afficher grace à la propriété tag pour garder en mémoire
  //le numéro affiché.
  {if (tColorIcon.Tag < ilFrameAnim.Count - 1) then
  begin
    tColorIcon.Tag := tColorIcon.Tag + 1;
  end else tColorIcon.Tag := 0; }
  tColorIcon.Tag := (tColorIcon.Tag + 1) mod ilFrameAnim.Count;

  //prévenir un bug de windows de supperposition d'image.
  iColorIconView.Picture.Bitmap := nil;
  ilFrameAnim.GetBitmap(tColorIcon.Tag, iColorIconView.Picture.Bitmap);
  iColorIconView.Refresh;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miOptionsClick(Sender: TObject);
begin
  Options_Form := TOptions_Form.Create(Application);
  try
    ChangeTrayMenuState(False);

    Options_Form.ShowModal;

    ChangeTrayMenuState(True);
  finally
    Options_Form.Free;
  end;
end;

//------------------------------------------------------------------------------

function TMain_Form.CheckMenuItem(BaseName: string ; Sender : TObject ;
  MaxItems : integer): integer;
var
  i : integer;

begin
  Result := -1;

  for i := 1 to MaxItems do
    (FindComponent(BaseName + IntToStr(i)) as TMenuItem).Checked := False;

  if (not Assigned(Sender)) or (not (Sender is TMenuItem)) then Exit;
  (Sender as TMenuItem).Checked := True;

  Result := (Sender as TMenuItem).Tag;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.Icon1Click(Sender: TObject);
var
  selected : integer;

begin
  selected := CheckMenuItem('Icon', Sender, 3);
  case selected of
    1 : begin
          fIconSizeFormat := is24x24;
          ilFilesIcons.Height := 24;
          ilFilesIcons.Width := 24;
        end;
    2 : begin
          fIconSizeFormat := is32x32;
          ilFilesIcons.Height := 32;
          ilFilesIcons.Width := 32;
        end;
    3 : begin
          fIconSizeFormat := is16x16;
          ilFilesIcons.Height := 16;
          ilFilesIcons.Width := 16;
        end;
  end;

  //Le nil est pourri, mais sinon l'ImageList ne change pas de taille !
  flv.LargeImages := nil;
  flv.SmallImages := nil;
  flv.LargeImages := ilFilesIcons;
  flv.SmallImages := ilFilesIcons;
  
  FillView;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.Style1Click(Sender: TObject);
var
  selected : integer;

begin
  selected := CheckMenuItem('Style', Sender, 4);
  case selected of
    1 : flv.ViewStyle := vsReport;
    2 : flv.ViewStyle := vsList;
    3 : flv.ViewStyle := vsSmallIcon;
    4 : flv.ViewStyle := vsIcon;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.Checksum1Click(Sender: TObject);
var
  selected : integer;

begin
  selected := CheckMenuItem('Checksum', Sender, 2);
  case selected of
    1 : fCheckSumFormat := csDecimal;
    2 : fCheckSumFormat := csHexa;
  end;
  FillView;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.VMSSize1Click(Sender: TObject);
var
  selected : integer;

begin
  selected := CheckMenuItem('VMSSize', Sender, 2);
  case selected of
    1 : fVmsSizeFormat := vsBlocks;
    2 : fVmsSizeFormat := vsBytes;
  end;
  UpdateListViewCaptions;
  FillView;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ResizeVisualMemoryIcon(var B : TBitmap ; var NewBmp : TBitmap);
var
  _height, _width : integer;

begin
  _height := 32;
  _width := 32;

  if not Assigned(NewBmp) then
    raise EBitmapNotAssigned.Create('Error in parameters !!! Bitmap not assigned for resizing it !');

  //if (fIconSizeFormat = is32x32) then
  //  ilFilesIcons.Add(B, nil)
  //else begin

    //NewBmp := TBitmap.Create;
    //try
      if Assigned(B) then
        NewBmp.Assign(B);

      case fIconSizeFormat of
        is24x24 : begin
                    _height := 24;
                    _width := 24;
                  end;
        is16x16 : begin
                    _height := 16;
                    _width := 16;
                  end;
      end;

      if not ReSizeBmpPict(NewBmp, _height, _width) then
        AddDebug('Error : Error when resizing icon (Index : '
          + IntToStr(ilFilesIcons.Count) + ') !', fErrorClr);

      NewBmp.Height := _height;
      NewBmp.Width := _width;
      
      //NewBmp.SaveToFile('c:\temp\yo.bmp');

      //showmessage(inttostr(ilFilesIcons.Width));
      //ilFilesIcons.Add(NewBmp, nil);
    //finally
    //  NewBmp.Free;
    //end;
    
  //end;

end;

//------------------------------------------------------------------------------

procedure TMain_Form.InsertIcon(var B : TBitmap);
var
  _resized_bmp : TBitmap;

begin
  _resized_bmp := TBitmap.Create;
  try
    ResizeVisualMemoryIcon(B, _resized_bmp);

    ilFilesIcons.Add(_resized_bmp, nil);
  finally
    _resized_bmp.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.InsertIcon(var B : TBitmap ; Index : Integer); 
var
  _resized_bmp : TBitmap;

begin
  _resized_bmp := TBitmap.Create;
  try
    ResizeVisualMemoryIcon(B, _resized_bmp);
    ilFilesIcons.Replace(Index, _resized_bmp, nil);
  finally
    _resized_bmp.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ScanCurrentDir;
begin
  Application.ProcessMessages;
  if VmuToolPc.Active then Exit;//VmuToolPc.Stop;
  { begin
    VmuToolPc.Stop;              //ca plante affreusement...
    Application.ProcessMessages;
    Sleep(10);
  end; }

  { Houston on a un problème :)
    L'engine n'existe plus !
    Appliquez les mesures d'urgence !
    ...
    Quoi un peu d'humour, merde ! :) }
  if not FileExists(VmuToolPc.Executable) then
    SetVmuToolPcEngine; //on va reconfigurer...

  Application.ProcessMessages;
    
  //Scannez le dossier, commandant ! ^^
  VmuToolPc.Directory := dtv.SelectedPath;
  VmuToolPc.ScanDirectory;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.dtvClick(Sender: TObject);
begin
  if UpperCase(VmuToolPc.Directory) = UpperCase(dtv.SelectedPath) then Exit;
  ScanCurrentDir;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.UpdateListViewCaptions;
var
  ind : integer;
  s : string;

begin
  //déterminer si Vms Size est en blocks ou bytes
  case fVmsSizeFormat of
    vsBytes   : s := 'bytes';
    vsBlocks  : s := 'blocks';
  end;
  lblSizeType.Caption := s;

  //colonne VMS Size
  ind := flv.GetColumnIndex(ctVmsSize);
  if ind <> -1 then
  begin
    s := ColumnsLabels[Integer(ctVmsSize)] + ' (' + s + ')';
    flv.Column[ind].Caption := s;
  end;

  //colonne Data Length
  ind := flv.GetColumnIndex(ctDataLength);
  if ind <> -1 then
  begin
    s := ColumnsLabels[Integer(ctDataLength)] + ' (bytes)';
    flv.Columns[ind].Caption := s;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.dtvKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  dtvClick(Sender);
  //if UpperCase(VmuToolPc.Directory) = UpperCase(dtv.SelectedPath) then Exit;
  //ScanCurrentDir;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miAnimateIconClick(Sender: TObject);
begin
  miAnimateIcon.Checked := not miAnimateIcon.Checked;
  tColorIcon.Enabled := miAnimateIcon.Checked;
  miDisplayFrames.Enabled := not tColorIcon.Enabled;

  //Cocher le bon menu en fonction de l'icône affichée.
  //+1 à cause du Tag qui varie de 0 à 2 (le menu est de 1 à 3).
  (FindComponent('miFrame' + IntToStr(tColorIcon.Tag + 1)) as TMenuItem).Click;

  // *** RECOPIE DANS LE MENU GENERAL ***
  miAnimateIcon2.Checked := miAnimateIcon.Checked;
  miDisplayFrames2.Enabled := not tColorIcon.Enabled;
  (FindComponent('miFrame2_' + IntToStr(tColorIcon.Tag + 1)) as TMenuItem).Click;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miFrame1Click(Sender: TObject);
var
  _checked : integer;

begin
  {
    Nous avons un problème causé par le Sender. En effet il dépend du menu qui
    envoie le message. Pour différencier les deux menus et ainsi cocher les deux menus
    (à savoir miFrame2_X, situé dans le menu principal, et miFrameX situé dans le
    context menu de l'icône) on fait un Pos pour savoir si le caractère "_" est
    dans le nom. Si oui, c'est le menu principal, sinon le popupmenu.

    Reste plus qu'a faire une copie du checked de l'élément coché vers l'autre qui
    n'a pas été activé ce coup ci, en gros le Sender sera coché de manière normale
    et l'autre sera recopié en fonction du Sender.

    On fait un CheckMenuItem avec un nil pour décocher tout le groupe de TMenuItem,
    et après on recopie le checked du sender vers celui qui n'a pas été sender ce
    coup-ci !
  }
  if Pos('_', (Sender as TMenuItem).Name) > 0 then
  begin
    //C'est le menu principal
    _checked := CheckMenuItem('miFrame2_', Sender, 3);
    CheckMenuItem('miFrame', nil, 3);
    (FindComponent('miFrame' + IntToStr(_checked)) as TMenuItem).Checked := True;
  end else begin
    //c'est le popupmenu
    _checked := CheckMenuItem('miFrame', Sender, 3);
    CheckMenuItem('miFrame2_', nil, 3);
    (FindComponent('miFrame2_' + IntToStr(_checked)) as TMenuItem).Checked := True;
  end;

  iColorIconView.Picture.Bitmap := nil;
  ilFrameAnim.GetBitmap(_checked - 1, iColorIconView.Picture.Bitmap);
  iColorIconView.Refresh;
end;

//------------------------------------------------------------------------------

procedure LoadImageFilter;
begin
  with Main_Form.sdPict do
  begin
    Filter := 'All pictures (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|'
      +   '*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf|'
      + 'Portable Network Graphics (*.png)|*.png|'
      + 'CompuServe GIF Image (*.gif)|*.gif|'
      + 'JPEG Image (*.jpg;*.jpeg)|*.jpg;*.jpeg|'
      + 'Bitmaps (*.bmp)|*.bmp|'
      + 'Windows Icons (*.ico)|*.ico|'
      + 'Enhanced Metafiles (*.emf)|*.emf|'
      + 'Metafiles (*.wmf)|*.wmf|'
      + 'All files (*.*)|*.*';
    FilterIndex := 1;
    DefaultExt := '.bmp';
  end;
end;

//------------------------------------------------------------------------------

procedure SaveImagePict(Image : TImage);
begin
  LoadImageFilter;

  with Main_Form.sdPict do
  begin
    FileName := ExtractFileName(ChangeFileExt(Main_Form.VmuToolPc.Files[Main_Form.fCurrentVmi].FileName, ''));

    if Execute then
      case FilterIndex of
        2 : SaveBmpToPng(Image.Picture.Bitmap, FileName); //png
        3 : SaveBmpToGif(Image.Picture.Bitmap, FileName); //gif
        4 : SaveBmpToJpeg(Image.Picture.Bitmap, FileName); //jpeg
        6 : SaveBmpToIcon(Image.Picture.Bitmap, FileName, False);
        7 : SaveBmpToMetaFile(Image.Picture.Bitmap, FileName, True); //ewf
        8 : SaveBmpToMetaFile(Image.Picture.Bitmap, FileName, False); //mwf
        else Image.Picture.SaveToFile(FileName);
        //all pictures (1), all files (9) et bitmap (5)
      end;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miSaveIconClick(Sender: TObject);

  procedure LoadAnimatedFilter;
  begin
    with sdPict do
    begin
      Filter := 'CompuServe GIF Image (*.gif)|*.gif|'
        + 'All files (*.*)|*.*';
      FilterIndex := 1;
      DefaultExt := '.gif';
    end;
  end;

begin
  if tColorIcon.Enabled then
  begin
    //L'icône est animée
    LoadAnimatedFilter;

    with sdPict do
    begin
      FileName := ExtractFileName(ChangeFileExt(VmuToolPc.Files[fCurrentVmi].FileName, ''));

      if Execute then
      begin
        MakeAnimatedGif(VmuToolPc.Files[fCurrentVmi].Pictures.Frames, False,
          tColorIcon.Interval, FileName);
      end;

    end;

  end else begin
    //L'icône n'est pas animée
    SaveImagePict(iColorIconView);
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miSaveEyeCatchToClick(Sender: TObject);
begin
  SaveImagePict(iEyeCatch);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.AddDebug(Msg: string ; MsgColor : TColor);
begin
  reDebug.SelLength := 0;
  //reDebug.SelStart := 0;
  reDebug.SelAttributes.Color := MsgColor;
  reDebug.Lines.Add(Msg);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ClearFileDetails;
begin
  ChangeModifyButtons(False);
  ChangeStateExpandFields(False);
  reReport.Clear;
  eVmFilename.Clear;
  eDCDescription.Clear;
  eDate.Clear;
  eVMDescription.Clear;
  eDescription.Clear;
  eCopyright.Clear;
  eResource.Clear;
  eAppName.Clear;
  eCheckSum.Clear;
  eVmsSize.Clear;
  cbCopy.Checked := False;
  cbxType.ItemIndex := 0;
  iEyeCatch.Picture.Bitmap := nil;
  tColorIcon.Enabled := False;
  iColorIconView.Picture.Bitmap := nil;
  iColorIconView.PopupMenu := nil;
  iEyeCatch.PopupMenu := nil;
  miPictures.Enabled := False;
  reReport.PopupMenu := nil;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.FormClose(Sender: TObject; var Action: TCloseAction);


begin
  if not PiconeBarreTache.ReduireSiFin then
    if not QuitAppCommand then Action := caNone;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miCreateVmiClick(Sender: TObject);
var
  TargetVms,
  TargetVmi : string;
  _bmp : TBitmap;
  _curr_item : TListItem;

begin
  BuildVmi_Form := TBuildVmi_Form.Create(Application);
  try
    TargetVms := VmuToolPc.Files[fCurrentVmi].FileName; //générer un VMI pour ce fichier VMS.
    BuildVmi_Form.Init(TargetVms);
    BuildVmi_Form.ShowModal;

    //Mise à jour.
    TargetVmi := ChangeFileExt(TargetVms, '.vmi');
    if FileExists(TargetVmi) then
    begin
      VmuToolPc.Files[fCurrentVmi].FileName := TargetVmi;
      VmuToolPc.UpdateInfosEntry(fCurrentVmi);

      //update de la listview
      _bmp := VmuToolPc.Files[fCurrentVmi].Pictures.Frames[0];
      _curr_item := Self.flv.Items[fSelectedIndex];

      //ilFilesIcons.Replace(_curr_item.ImageIndex, _bmp, nil);
      InsertIcon(_bmp, _curr_item.ImageIndex);

      UpdateViewItem(fSelectedIndex, VmuToolPc.Files[fCurrentVmi].VmiInfo);
      ExpandSelectedFile; //rafraichir la vue en bas.
    end;
  finally
    BuildVmi_Form.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.InitApplication;
begin
  //24x24 par défaut
  Main_Form.Icon1.Click;

  fCheckSumFormat := csDecimal;
  fVmsSizeFormat := vsBlocks;
  UpdateListViewCaptions;

  fStateClr   := clBlue;
  fSuccessClr := clGreen;
  fErrorClr   := clRed;

  fShowErrornousVmi := True;
  fAutoSelectFirst  := False;
  fAutoScrollLog := True;

  //Executable par défaut
  VmuToolPc.Executable := GetEngineFileName;

  fCurrentRichEdit := nil;

  fUseSplash := True;
  fConfirmClose := True;
  fAutoScrollView := True;
  fScanAtStart := True;
  
  Position := poScreenCenter;

  pcMain.ActivePageIndex := 0;
  ChangeStateExpandFields(False);

//  InitProgressBar;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.Open1Click(Sender: TObject);
begin
  PiconeBarreTache.MontrerApplication;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.SetVmuToolPcEngine;
{ var
  _new_exe : string; }

begin
{  case Main_Form.fEngineType of
    etInternal : _new_exe := GetEngineFileName;
    etExternal : _new_exe := fExternalExecutable;
  end;  

  if not FileExists(_new_exe) then
    begin
      MsgBox(Main_Form.Handle, 'Error, the specified engine doesn''t exists.'
        + ' Default''ll be used.' + WrapStr + 'File : "' + _new_exe + '".',
          'Warning', MB_ICONWARNING);
      VmuToolPc.Executable := GetEngineFileName;
    end
  else VmuToolPc.Executable := _new_exe; }
end;

//------------------------------------------------------------------------------

procedure TMain_Form.About1Click(Sender: TObject);
begin
  ShowAboutBox;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.reDebugChange(Sender: TObject);
begin
  if fAutoScrollLog and (reDebug.Handle <> 0) then
    PostMessage(reDebug.Handle, SB_BOTTOM, 0, 0);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miCopyRichEditClick(Sender: TObject);
var
  MI : TMenuItem;

begin
  if not Assigned(Sender) or (not (Sender is TMenuItem))
    or (not Assigned(fCurrentRichEdit)) then Exit;
  MI := Sender as TMenuItem;

  case MI.Tag of
    0 : fCurrentRichEdit.CopyToClipboard;
    1 : fCurrentRichEdit.SelectAll;
    2 : with sdRichEdit do
        begin
          FilterIndex := 1;

          if fCurrentRichEdit = reReport then
            FileName := ExtractFileName(ChangeFileExt(VmuToolPc.Files[fCurrentVmi].FileName, ''))
          else FileName := 'debug';

          DefaultExt := 'rtf';

          if Execute then
          begin
            fCurrentRichEdit.PlainText := (FilterIndex <> 1);
            fCurrentRichEdit.Lines.SaveToFile(FileName);
          end;
        end;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.reReportEnter(Sender: TObject);
begin
  fCurrentRichEdit := reReport;
  fCurrentRichEdit.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.reDebugEnter(Sender: TObject);
begin
  fCurrentRichEdit := reDebug;
  fCurrentRichEdit.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.BuildReportDetails;
var
  _infos : TVmiInfo;
  CurrVmi : TSaveFile;
  s : string;

begin
  reReport.Clear;

  reReport.SelStart := 0;
  reReport.Font.Color := clBlack;
  reReport.Font.Style := [];
  
  CurrVmi := VmuToolPc.Files[fCurrentVmi];
  _infos := CurrVmi.VmiInfo;

  //En-tête
  reReport.SelAttributes.Color := clBlue;
  reReport.SelAttributes.Size := 10;
  reReport.SelAttributes.Style := [fsBold, fsUnderline];
  reReport.Lines.Add('Full report for "'
    + ExtractFileName(VmuToolPc.Files[fCurrentVmi].FileName) + '" :');
  reReport.Lines.Add('');

  //unité...
  case fVmsSizeFormat of
    vsBytes   : s := '(bytes)';
    vsBlocks  : s := '(blocks)';
  end;

  //Détails
  AddReportInfo('VMI checksum', GetCheckSumFormat(_infos.VMI_checksum));
  AddReportInfo('VMI description', _infos.VMI_description);
  AddReportInfo('VMI copyright', _infos.VMI_copyright);
  AddReportInfo('Creation date', _infos.Creation_date);
  AddReportInfo('VMS resource name', _infos.VMS_resource_name);
  AddReportInfo('VM filename', _infos.VM_filename);
  AddReportInfo('Type', GetTypeFormat(_infos.Type_File));
  AddReportInfo('Copy', GetCopyFormat(_infos.Copy_Allowed));
  AddReportInfo('VMS size ' + s, GetVmsSizeFormat(_infos.VMS_size));
  AddReportInfo('VM description', _infos.VM_description);
  AddReportInfo('DC description', _infos.DC_description);
  AddReportInfo('Application name', _infos.Application_name);
  AddReportInfo('Color icon frames', IntToStr(_infos.Color_icon_frames));
  AddReportInfo('Color icon speed', IntToStr(_infos.Color_icon_speed));
  AddReportInfo('Eyecatch type', IntToStr(_infos.Eyecatch_type));
  AddReportInfo('CRC', GetCheckSumFormat(_infos.CRC));
  AddReportInfo('Data length (bytes)', IntToStr(_infos.Data_length));

  //Pied de page
  reReport.Lines.Add('');
  reReport.SelAttributes.Color := clGray;
  reReport.SelAttributes.Style := [fsItalic];
  reReport.Lines.Add('Information created from the file "' + CurrVmi.FileName + '" at '
    + DateToStr(Date) + ', ' + TimeToStr(Time) + '.');
  reReport.SelAttributes.Color := clGray;
  reReport.SelAttributes.Style := [fsItalic];
  reReport.Lines.Add('Generated by ' + Application.Title + '.');
  reReport.Lines.Add('');
  reReport.SelStart := 0;
  reReport.SelAttributes.Color := clBlack;
  reReport.SelAttributes.Style := [];

  //Activer le report...
  reReport.PopupMenu := pmReport;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.UpdateViewPopupMenu;
var
  _selected : integer;

  procedure ChangeGenericMenus(State : boolean);
  begin
    miCopyTo.Enabled := State;
    miMoveTo.Enabled := State;
    miDelete.Enabled := State;
    miHexEdit.Enabled := State and FileExists(Main_Form.fHexEdit.FileName);

    miCopyTo2.Enabled := miCopyTo.Enabled;
    miMoveTo2.Enabled := miMoveTo.Enabled;
    miDelete2.Enabled := miDelete.Enabled;
    miHexEdit2.Enabled := miHexEdit.Enabled;
  end;

  procedure ChangeVmiMenus(State : boolean);
  begin
    //miModifyVmi.Enabled := State;
    miSaveReport.Enabled := State;
    //miModifyVmi2.Enabled := State;
    miSaveReport2.Enabled := State;
  end;

begin
  miCreateVmi.Enabled := False;
  miCreateVmi2.Enabled := False;
  ChangeGenericMenus(False);
  ChangeVmiMenus(False);

  _selected := flv.ItemIndex;
  if (_selected < 0) or (_selected >= flv.Items.Count) then Exit;

  //miCreateVmi.Enabled := (flv.Items[_selected].ImageIndex = ERR_VMS_IMG_IND);
  miCreateVmi.Enabled := (VmuToolPc.Files[fCurrentVmi].Errornous = etVmiNotFound);
  miCreateVmi2.Enabled := miCreateVmi.Enabled;
  
  //ShowMessage(IntToStr(Integer(VmuToolPc.Files[fCurrentVmi].Errornous)));

  ChangeGenericMenus(True);
  ChangeVmiMenus(not miCreateVmi.Enabled);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miCopyToClick(Sender: TObject);
begin
  {MsgBox(Main_Form.Handle, 'In progress... avialable soon! :D', 'Not yet');
  Exit;}

  DoCopyFilesOperation;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miMoveToClick(Sender: TObject);
begin
  {MsgBox(Main_Form.Handle, 'In progress... avialable soon! :D', 'Not yet');
  Exit;}
  
  DoCopyFilesOperation(True);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miDeleteClick(Sender: TObject);
begin
  DoDeleteFilesOperation;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miHexEditClick(Sender: TObject);
var
  Params : string;

begin
  if (fCurrentVmi < 0) or (fCurrentVmi >= flv.Items.Count) then Exit;

  Params := Main_Form.fHexEdit.Parameters;

  if (VmuToolPc.Files[fCurrentVmi].Errornous = etNoError) and
    (VmuToolPc.Files[fCurrentVmi].FileType = ftVmi) then
      Params := Params + ' "' + ChangeFileExt(VmuToolPc.Files[fCurrentVmi].FileName,
        ApplyCase('.vms', ExtractFileExt(VmuToolPc.Files[fCurrentVmi].FileName))) + '"'

  else Params := Params + ' "' + VmuToolPc.Files[fCurrentVmi].FileName + '"';

  if FileExists(Main_Form.fHexEdit.FileName) then
    ShellExecute(Main_Form.Handle, 'open', PChar(Main_Form.fHexEdit.FileName),
      PChar(Params), '', SW_SHOWNORMAL);
end;

//------------------------------------------------------------------------------

function TMain_Form.QuitAppCommand : boolean;
var
  _ok : integer;

begin
  Result := True;

  if fConfirmClose then
  begin
    _ok := MsgBox(Main_Form.Handle, 'OK to quit the application ?', 'Confirm Exit',
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
    if _ok = IDNO then
    begin
      Result := False;
      Exit;
    end;
  end;

  QuitApplication;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ChangeTrayMenuState(State: boolean);
begin
  case State of
    True  : PiconeBarreTache.MenuPop := pmTrayIcon;
    False : PiconeBarreTache.MenuPop := nil;
  end;
end;

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

function TMain_Form.GetCopyFormat(Value : boolean) : string;
begin
  if Value then
    Result := 'OK'
  else Result := 'Protected';
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

procedure TMain_Form.miClearDebugClick(Sender: TObject);
var
  _ok : integer;

begin
  _ok := MsgBox(Handle, 'Are you sure to reset the debug log ?', 'Confirmation',
    MB_ICONQUESTION + MB_YESNO);
  if _ok = IDNO then Exit;

  reDebug.Clear;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miSaveReportClick(Sender: TObject);
begin
  with sdRichEdit do
  begin
    FilterIndex := 1;
    FileName := ExtractFileName(ChangeFileExt(VmuToolPc.Files[fCurrentVmi].FileName, ''));
    DefaultExt := 'rtf';

    if Execute then
    begin
      reReport.PlainText := (FilterIndex <> 1);
      reReport.Lines.SaveToFile(FileName);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.aeMainException(Sender: TObject; E: Exception);
begin
  DebugHandler_Form.fErrorMsg := E.Message;
  DebugHandler_Form.fErrorType := E.ClassName;
  if Assigned(Sender) then
    DebugHandler_Form.fErrorSender := Sender.ClassName
  else DebugHandler_Form.fErrorSender := 'nil';

  ChangeTrayMenuState(False);
  DebugHandler_Form.ShowModal;
  ChangeTrayMenuState(True);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.vecbxPathChange(
  Sender: TCustomVirtualExplorerCombobox; SelectedNamespace: TNamespace);
begin
  //if UpperCase(VmuToolPc.Directory) = UpperCase(dtv.SelectedPath) then Exit;
  //ScanCurrentDir;
  dtvClick(Sender);  
end;

//------------------------------------------------------------------------------

procedure TMain_Form.miCancelScanClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then (Sender as TMenuItem).Enabled := False;
  if (Sender is TButton) then (Sender as TButton).Enabled := False;

  VmuToolPc.Stop;

  miCancelScan.Enabled := False;
  miCancelScan2.Enabled := miCancelScan.Enabled;
  bCancelScan.Enabled := miCancelScan.Enabled;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.VmuToolPcAborted(Sender: TObject);
begin
  AddDebug('Error : Scan of directory scan "' + VmuToolPc.Directory
    + '" canceled !', fErrorClr);
  //sbMain.Panels[1].Text := 'Canceled !';
  //Sleep(500);
  sbMain.Panels[1].Text := 'Idle...';
end;

//------------------------------------------------------------------------------

procedure TMain_Form.FormShow(Sender: TObject);
begin
  fFirstStart := True;

  //Sélectionner le bureau
  VmuToolPc.Directory := vecbx.Path;
  ScanCurrentDir;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.FormActivate(Sender: TObject);
var
  _must_scan : boolean;

begin
  if fFirstStart then
  begin
    //On scanne uniquement si c'est de la commandeline (un paramètre donc)
    //Ou bien si l'utilisateur le veux (car ça peut être lent et chiant).
    _must_scan := fFromCmdLine or fScanAtStart;

    if _must_scan and DirectoryExists(fStartingDirectory) then
      Main_Form.vecbx.Path := fStartingDirectory;

    //Main_Form.BringToFront;
    //PostMessage(Main_Form.Handle, WM_SETFOCUS, 0, 0);
  end;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.bSaveInfosClick(Sender: TObject);
var
  VmiFile   : string;
  VmiStruct : TVmiInfo;
  Attr      : Integer;

begin
  VmiFile := VmuToolPc.Files[fCurrentVmi].FileName;

  // vérifier si c'est en lecture seule
  Attr := FileGetAttr(VmiFile);
  
  if Attr and faReadOnly = 0 then
  begin
    // remplir les champs
    VmiStruct.VM_description := eVMDescription.Text;
    VmiStruct.DC_description := eDCDescription.Text;
    VmiStruct.VMS_resource_name := eResource.Text;
    VmiStruct.Application_name := eAppName.Text;
    VmiStruct.Type_File := TVmiType(cbxType.ItemIndex);
    VmiStruct.Copy_Allowed := cbCopy.Checked;
    VmiStruct.VMI_description := eDescription.Text;
    VmiStruct.VM_filename := eVmFilename.Text;
    VmiStruct.VMI_copyright := eCopyright.Text;

    // ecrire les modifs
    VmuToolPc.WriteVmiInfos(VmiFile, VmiStruct);
  end else begin
    MsgBox(Handle, 'Can''t save modifications : File is read only.', 'Warning', MB_ICONWARNING);
    AddDebug('Error : Can''t save modifications : File "' + VmiFile + '" is read only.', clRed);
  end;

  VmuToolPc.UpdateInfosEntry(fCurrentVmi); //rafraichir les données dans le composant.
  UpdateViewItem(fSelectedIndex, VmuToolPc.Files[fCurrentVmi].VmiInfo); //rafraichir les infos dans les colonnes.
  InsertIcon(VmuToolPc.Files[fCurrentVmi].Pictures.Frames[0], fSelectedIndex);   //rafraichir l'icone de la listview.

  try
    flv.ItemIndex := fSelectedIndex;
    flv.SetFocus;
  except
    AddDebug('Error when focusing file list view.', clRed);
  end;

  ExpandSelectedFile; //pour rafraichir le volet en bas.

  ChangeModifyButtons(False);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.bAbortClick(Sender: TObject);
begin
  ExpandSelectedFile;
  ChangeModifyButtons(False);
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ChangeStateExpandFields(State: boolean);

  procedure ChangeEditState(Edit : TEdit ; State : boolean);
  begin
    Edit.ReadOnly := not State;
    if State then
      Edit.Color := clWindow
    else Edit.Color := clBtnFace;
  end;

begin
  ChangeEditState(eVmFilename, State);
  //ChangeEditState(eDCDescription, State);
  //ChangeEditState(eVMDescription, State);
  cbxType.Enabled := State;
  ChangeEditState(eCopyright, State);
  ChangeEditState(eDescription, State);
  ChangeEditState(eResource, State);
  //ChangeEditState(eAppName, State);
  cbCopy.Enabled := State;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.UpdateViewItem(Index: integer; NewInfos: TVmiInfo);
var
  Item : TListItem;

begin
  if (Index < 0) or (Index >= flv.Items.Count) then Exit;
  
  Item := flv.Items[Index];
  AddSubItem(Item, ctCheckSum, GetCheckSumFormat(NewInfos.VMI_checksum));
  AddSubItem(Item, ctDescription, NewInfos.VMI_description);
  AddSubItem(Item, ctCopyright, NewInfos.VMI_copyright);
  AddSubItem(Item, ctDate, NewInfos.Creation_date);
  AddSubItem(Item, ctVmsResourceName, NewInfos.VMS_resource_name);
  AddSubItem(Item, ctVmFileName, NewInfos.VM_filename);
  AddSubItem(Item, ctType, GetTypeFormat(NewInfos.Type_File));
  AddSubItem(Item, ctCopy, GetCopyFormat(NewInfos.Copy_Allowed));
  AddSubItem(Item, ctVmsSize, GetVmsSizeFormat(NewInfos.VMS_size));
  AddSubItem(Item, ctVmDescription, NewInfos.VM_description);
  AddSubItem(Item, ctDcDescription, NewInfos.DC_description);
  AddSubItem(Item, ctApplicationName, NewInfos.Application_name);
  AddSubItem(Item, ctColorIconFrames, IntToStr(NewInfos.Color_icon_frames));
  AddSubItem(Item, ctColorIconSpeed, IntToStr(NewInfos.Color_icon_speed));
  AddSubItem(Item, ctEyecatchType, IntToStr(NewInfos.Eyecatch_type));
  AddSubItem(Item, ctCRC, GetCheckSumFormat(NewInfos.CRC));
  AddSubItem(Item, ctDataLength, IntToStr(NewInfos.Data_length));
end;

//------------------------------------------------------------------------------

procedure TMain_Form.ChangeModifyButtons(State : boolean);
begin
  bSaveInfos.Enabled := State;
  bAbort.Enabled := State;
end;

//------------------------------------------------------------------------------

procedure TMain_Form.eVmFilenameChange(Sender: TObject);
begin
  if not (Sender as TEdit).ReadOnly then
    ChangeModifyButtons(True);
end;

procedure TMain_Form.cbxTypeChange(Sender: TObject);
begin
  if (Sender as TComboBox).Enabled then
    ChangeModifyButtons(True);
end;

procedure TMain_Form.cbCopyClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Enabled then
    ChangeModifyButtons(True);
end;

function TMain_Form.GetInvalidIconBitmap(Index: Integer): TBitmap;
begin
  Result := TBitmap.Create;
  try
    ilInvalidFileIcons.GetBitmap(Index, Result);
  except
    Result.Free;
    Result := nil;
  end;
end;

procedure TMain_Form.Opencurrentfolder1Click(Sender: TObject);
var
  p : string;

begin
  p := vecbx.Path;
  ShellExecute(Application.Handle, 'open', PChar(p), '', '', SW_SHOWNORMAL);
end;

procedure TMain_Form.Help2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    PChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'help\vmutool.chm'), '', '', SW_SHOWNORMAL);
end;

procedure TMain_Form.SiZiOUS1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://sbibuilder.shorturl.com/', '', '', SW_SHOWNORMAL);
end;

procedure TMain_Form.Speud1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://blueswirl.shorturl.com/', '', '', SW_SHOWNORMAL);
end;

end.
