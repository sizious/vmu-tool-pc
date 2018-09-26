//{$DEFINE DEBUG}
{$WARN UNIT_PLATFORM OFF}

unit VmuToolPc;

interface

uses
  Windows, SysUtils, Classes, Graphics, ShellApi;

type
  TEngineNotFound = class(Exception);

  TFileType = (ftVmi, ftVms, ftDci);
  TVmiType = (vtData, vtGame);
  TErrorType = (etNoError, etVmiReadError, etScanListError, etVmsNotFound,
    etVmiNotFound);
  TMessageType = (mtError, mtSuccess, mtState);
  
  TStatusEvent    = procedure(Sender : TObject ; AMessage : string ; MsgType : TMessageType) of object;
  TScanEvent      = procedure(Sender : TObject ; Directory : string) of object;
  TFileEvent      = procedure(Sender : TObject ; VmiFile : string) of object;
  TFrameEvent     = procedure(Sender : TObject ; VmiFile : string ;
    FrameNumber : integer ; const FrameBmp : TBitmap) of object;
  TEyeCatchEvent  = procedure(Sender : TObject ; VmiFile : string ;
    const EyeCatchBmp : TBitmap) of object;

  TVmiListInfos = class(TStringList)
  private
    fDelimiterStr : string;
  public
    constructor Create;
    procedure LoadFromFile(const FileName : string); override;
  published
    property DelimiterStr : string read fDelimiterStr write fDelimiterStr;
  end;
  
  TPictureInfo = packed record
    Frames            : array[0..2] of TBitmap;
    EyeCatch          : TBitmap;
  end;

  TVmiInfo = packed record
    VMI_checksum      : integer;
    VMI_description   : string;
    VMI_copyright     : string;
    Creation_date     : string;
    VMS_resource_name : string;
    VM_filename       : string;
    Type_File         : TVmiType;
    Copy_Allowed      : boolean;
    VMS_size          : integer;
    VM_description    : string;
    DC_description    : string;
    Application_name  : string;
    Color_icon_frames : integer;
    Color_icon_speed  : integer;
    Eyecatch_type     : integer;
    CRC               : integer;
    Data_length       : integer;
  end;

  TSaveFile = packed record
    FileName  : string;
    VmiInfo   : TVmiInfo;
    Pictures  : TPictureInfo;
    Errornous : TErrorType;
    FileType  : TFileType;
  end;
  
  TOptions = class(TPersistent)
  private
    fLogSuccessMsg: boolean;
    fAutoDeleteFiles: boolean;
    fLogStateMsg: boolean;
    fLogScanDirMsg: boolean;
    fScanInvalidVms: boolean;
  public
    constructor Create;
  published
    property LogSuccessMsg: boolean read fLogSuccessMsg write fLogSuccessMsg default True;
    property LogStateMsg: boolean read fLogStateMsg write fLogStateMsg default True;
    property AutoDeleteFiles: boolean read fAutoDeleteFiles write fAutoDeleteFiles
      default True;
    property LogScanDirMsg: boolean read fLogScanDirMsg write fLogScanDirMsg
      default True;
    property ScanInvalidVms: boolean read fScanInvalidVms write fScanInvalidVms
      default True;
  end;

  TVmuToolPc = class(TComponent)
  private
    fCount : integer;
    fAborted : boolean;
    fActive : boolean;
    fDirectory: string;
    fExecutable: TFileName;
    fOnStatus: TStatusEvent;
    fOptions: TOptions;
    fOnStartScan: TScanEvent;
    fOnGetFileEyeCatch: TEyeCatchEvent;
    fOnGetFileInfo: TFileEvent;
    fOnFileFound: TFileEvent;
    fOnGetFileFrame: TFrameEvent;
    fOnEndScan: TNotifyEvent;
    fOnEndFileScanned: TFileEvent;
    fOnNewInvalidVms: TFileEvent;
    fOnAborted: TNotifyEvent;
    fOnWriteInfo: TFileEvent;
    fOnUpdateInfo: TNotifyEvent;
    function GetFileList(var SL: TStringList ; Filter : string) : boolean;
    procedure CreateArray(ArrLength : integer);
    function RunExec(Parameters, SrcFile, DestFile : string) : boolean;
    function GetIconFrame(Index : integer ; SrcFile : string ; var DestBmp : TBitmap) : boolean;
    function GetEyeCatch(SrcFile : string ; var DestBmp : TBitmap) : boolean;
    function GetVmuToolDir : string;
    function IsValidBmp(FileName : string) : boolean;
    function Droite(substr, s: string): string;
    function GetTempDir: string;
    function RunAndWait(FileName: string): boolean;
    procedure DestroyArray;
    function Gauche(substr, s: string): string;
    function ExtractStr(SubStrL, SubStrR, S : string) : string;
    function ExtractVmiInfos(VmiFile : string) : string;
    //procedure DeleteDir(TheFolder: string);
    function GetRealPath(Path: string): string;
    procedure SetOptions(const Value: TOptions);
    procedure Log(Msg : string ; MessageType : TMessageType);
    procedure GetInvalidVms(var VmiList: TStringList);
    function IsAborted : boolean;
    procedure InitFields(var VmiStruct: TSaveFile);
  protected
    function GetResource(const VmiFile : TFileName) : string;
//    function IsLowCase(c : Char) : Boolean;
//    function ApplyCase(StrToGenerate, StrModel : string) : string;
  public
    Files : array of TSaveFile;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function Count : integer;
    function GetVmiInfos(VmiFile : string ; var VmiStruct : TSaveFile) : boolean;
    function ScanDirectory : boolean;
    function Active : boolean;
    procedure Stop;
    procedure WriteVmiInfos(VmiFile: string; var VmiStructToWrite: TVmiInfo);
    function UpdateInfosEntry(EntryID : integer) : boolean;
  published
    { Déclarations publiées }
    property Directory : string read fDirectory write fDirectory;
    property Executable : TFileName read fExecutable write fExecutable;
    property Options : TOptions read fOptions write SetOptions;
    
    property OnStatus : TStatusEvent read fOnStatus write fOnStatus;

    property OnStartScan : TScanEvent read fOnStartScan write fOnStartScan;
    property OnEndScan : TNotifyEvent read fOnEndScan write fOnEndScan;
    property OnFileFound : TFileEvent read fOnFileFound write fOnFileFound;
    property OnGetFileInfo : TFileEvent read fOnGetFileInfo
      write fOnGetFileInfo;
    property OnEndFileScanned : TFileEvent read fOnEndFileScanned
      write fOnEndFileScanned;
    property OnGetFileFrame : TFrameEvent read fOnGetFileFrame
      write fOnGetFileFrame;
    property OnGetFileEyeCatch : TEyeCatchEvent read fOnGetFileEyeCatch
      write fOnGetFileEyeCatch;
    property OnNewInvalidVms : TFileEvent read fOnNewInvalidVms write
      fOnNewInvalidVms;
    property OnAborted : TNotifyEvent read fOnAborted write fOnAborted;
    property OnWriteInfo : TFileEvent read fOnWriteInfo write fOnWriteInfo;
    property OnUpdateInfo : TNotifyEvent read fOnUpdateInfo write fOnUpdateInfo;
  end;

procedure Register;

implementation

const
  WrapStr         : string = #13 + #10;
  VMI_FILTER      : string = '.vmi';
  VMS_FILTER      : string = '.vms';
  DCI_FILTER      : string = '.dci';
  VMI_INFOS       : string = '.inf';
  VMUTOOLPC_DIR   : string = 'VMUTOOL_PC';

  VMUTOOL_ERRORS  : array[0..1] of string = ('read_file:', 'scan_list:');

  SW_INFOS        : string = '-infos';
  SW_FRAME        : string = '-bmpframe';
  SW_EYECATCH     : string = '-bmpeyecatch';

//------------------------------------------------------------------------------

procedure Register;
begin
  RegisterComponents('VMU TOOL PC', [TVmuToolPc]);
end;

//------------------------------------------------------------------------------

function TVmuToolPc.GetRealPath(Path : string) : string;
var
  i : integer;
  LastCharWasSeparator : Boolean;

begin
  Result := '';
  LastCharWasSeparator := False;

  Path := Path + '\';

  for i := 1 to Length(Path) do
  begin
    if Path[i] = '\' then
    begin
      if not LastCharWasSeparator then
      begin
        Result := Result + Path[i];
        LastCharWasSeparator := True;
      end
    end
    else
    begin
       LastCharWasSeparator := False;
       Result := Result + Path[i];
    end;
  end;
end;

//---RunAndWait---
function TVmuToolPc.RunAndWait(FileName : string) : boolean;
var
  StartInfo : TStartupInfo;
  ProcessInformation : TProcessInformation;  

begin
  //Result := False;

  Result := True;
  ZeroMemory(@StartInfo, SizeOf(StartInfo)); // remplie de 0 StartInfo

  with StartInfo do
  begin
    CB := SizeOf(StartInfo);
    {$IFDEF DEBUG}
    wShowWindow := SW_SHOWNORMAL;
    {$ELSE}
    wShowWindow := SW_HIDE;
    {$ENDIF}
    lpReserved := nil;
    lpDesktop := nil;
    lpTitle := nil;
    dwFlags := STARTF_USESHOWWINDOW;
    cbReserved2 := 0;
    lpReserved2 := nil;
  end;

  if CreateProcess(nil, PChar(FileName), nil, nil, True, 0, nil, nil, StartInfo,
    ProcessInformation)
  then WaitForSingleObject(ProcessInformation.hProcess, INFINITE)

  // WaitForSingleObject attend que l'application désignée par le handle
  //ProcessInformation.hProcess soit terminée
  else Result := False;
end; 

//---GetTempDir---
function TVmuToolPc.GetTempDir : string;
var
  Dossier: array[0..MAX_PATH] of Char;

begin
  Result := '';
  if GetTempPath(SizeOf(Dossier), Dossier)<>0 then Result := StrPas(Dossier);
end;

//---Droite---
function TVmuToolPc.Droite(substr : string ; s : string) : string;
begin
  if pos(substr,s)=0 then result:='' else
    result:=copy(s, pos(substr, s)+length(substr), length(s)-pos(substr, s)+length(substr));
end;

function TVmuToolPc.Gauche(substr : string ; s : string) : string;
begin
  result:=copy(s, 1, pos(substr, s)-1);
end;

//==============================================================================

{ TVmuToolPc }

function TVmuToolPc.RunExec(Parameters, SrcFile, DestFile : string): boolean;
var
  CommandLine,
  SavedCurrDir : string;

begin
  Result := FileExists(fExecutable);

  //BOOM !
  if not FileExists(fExecutable) then
  begin
    raise TEngineNotFound.Create('Engine not found !!! ('
      + 'File : "' + Executable + '").');
    Exit;
  end;

  Result := Result and FileExists(SrcFile);
  if not Result then Exit;

  SavedCurrDir := GetCurrentDir;
  SetCurrentDir(ExtractFilePath(SrcFile));

  CommandLine := '"' + fExecutable + '" "' + SrcFile + '" '
    + Parameters;

  if DestFile <> '' then
    CommandLine := CommandLine + '  -o "' + DestFile + '"';

  //showmessage(CommandLine);

  Result := (RunAndWait(CommandLine)) and FileExists(DestFile);

  SetCurrentDir(SavedCurrDir);
end;

//------------------------------------------------------------------------------

constructor TVmuToolPc.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  fOptions := TOptions.Create;

  if not DirectoryExists(GetVmuToolDir) then
    ForceDirectories(GetVmuToolDir);

  fActive := False;
  fAborted := False;
  fCount := 0;
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.CreateArray(ArrLength : integer);
begin
  DestroyArray;

  SetLength(Files, ArrLength);
  //Count := ArrLength;
end;

//------------------------------------------------------------------------------

destructor TVmuToolPc.Destroy;
begin
  DestroyArray;

  fOptions.Free;
  
  //DeleteDir(GetVmuToolDir);

  inherited Destroy;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.GetFileList(var SL: TStringList ; Filter : string) : boolean;
var
  ADir,
  FileFound : string;
  Res   : integer;
  SearchRec : TSearchRec;

begin
  Result := Assigned(SL) and DirectoryExists(fDirectory);
  if not Result then Exit;

  if fDirectory[Length(fDirectory)] = '\' then
    ADir := Copy(fDirectory, 1, Length(fDirectory) - 1)
  else ADir := fDirectory;

  Res := FindFirst(ADir + '\' + Filter, faAnyFile, SearchRec);
  while Res = 0 do
  begin
    //Application.ProcessMessages; // rend la main à windows pour qu'il traite les autres applications (évite que l'application garde trop longtemps la main
    Sleep(10);
    
    if ((SearchRec.Attr and faDirectory) <= 0) then // On a trouvé un Fichier (et non un dossier)
    begin
      FileFound := ADir + '\' + SearchRec.Name;
      SL.Add(FileFound); // FICHIER TROUVE : DECLENCHEMENT DE NOTRE procedure

      if Assigned(fOnFileFound) then
        fOnFileFound(Self, FileFound);
    end;
    
    Res := FindNext(SearchRec);
  end;

  FindClose(SearchRec);// libération de la mémoire
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.GetInvalidVms(var VmiList : TStringList);
var
  VmsList : TStringList;
  i : integer;
  _vmi_associated_to_the_vms,
  _real_resource_name : string;

begin
  VmsList := TStringList.Create;
  try
    //On scanne le dossier courant à la recherche de tous les VMS.
    GetFileList(VmsList, '*' + VMS_FILTER);

    //Ajouter à la liste des VMI déjà scannés les VMS orphelins !
    for i := 0 to VmsList.Count - 1 do
    begin
      //si le fichier VMI associé au VMS n'existe pas on l'ajoute
      _vmi_associated_to_the_vms := ChangeFileExt(VmsList[i], VMI_FILTER);
      if not FileExists(_vmi_associated_to_the_vms) then
        VmiList.Add(VmsList[i])

      else begin
        {
          nouveau cas : si le fichier VMI associé au VMS existe mais ne
          correspond pas à la "ressource" du VMI.
          ex : 00000032.VMI et 00000032.VMS existent mais 00000032.VMI a un
          ressource égale à 10000032 (au lieu de 00000032)
        }

        _real_resource_name := ExtractFileName(ChangeFileExt(_vmi_associated_to_the_vms, ''));

        //on a détecté notre problème
        if LowerCase(GetResource(_vmi_associated_to_the_vms)) <> LowerCase(_real_resource_name) then
          VmiList.Add(VmsList[i]);
      end;
        
    end;

  finally
    VmsList.Free;
  end;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.ScanDirectory : boolean;
var
  FileList : TStringList;
  i  : integer;
  TotalVmi : integer;
  ext : string;

begin
  Result := (DirectoryExists(fDirectory)) and (not fActive);
  if not Result then Exit;
  fAborted := False;
  fActive := True;

  if Assigned(fOnStartScan) then
    fOnStartScan(Self, fDirectory);

  //Démarrage du scanning...
  if fOptions.fLogScanDirMsg then
    Log('Starting scan of directory "' + fDirectory + '"...', mtState);
  
  FileList := TStringList.Create;
  try
    //Récuperer tous les fichiers vmi du dossier courant.
    GetFileList(FileList, '*' + VMI_FILTER);
    GetFileList(FileList, '*' + DCI_FILTER); //new ! support des DCI.

    if fOptions.fScanInvalidVms then
      GetInvalidVms(FileList);            

    TotalVmi := FileList.Count;

    //Redimmentionner le tableau des fichiers vmis.
    CreateArray(TotalVmi);
    fCount := 0; //on le met ici. la fonction DestroyArray a besoin de l'ancien
                //Count pour détruire toutes les infos.
    
    //Recuperer toutes les infos
    for i := 0 to TotalVmi - 1 do
    begin

      //Annulé ?
      if IsAborted then Break;

      //Traiter la liste
      Inc(fCount);

      ext := LowerCase(ExtractFileExt(FileList[i]));
      if (ext = VMI_FILTER) or (ext = DCI_FILTER) then
      begin
        if IsAborted then Break;

        GetVmiInfos(FileList[i], Files[i])
      end else begin
        //il s'agit d'un VMS ! et en plus orphelin.
        InitFields(Files[fCount - 1]);

        Files[fCount - 1].FileName := FileList[i];
        Files[fCount - 1].Errornous := etVmiNotFound;
        Files[fCount - 1].FileType := ftVms; //c'est un VMS.

        if Assigned(fOnNewInvalidVms) then
          fOnNewInvalidVms(Self, FileList[i]);

        Log('Unable to read associated VMI ' + FileList[i] + '. (VMI not found).',
          mtError);
      end;


    end;

  finally
    FileList.Free;

    if fOptions.fLogScanDirMsg then
      Log('End of the directory scan "' + fDirectory + '" at ' + DateToStr(Date)
        + ', ' + TimeToStr(Time) + ' (' + IntToStr(fCount) + ' found).', mtState);
      
    if Assigned(fOnEndScan) then
      fOnEndScan(Self);

    fActive := False;
  end;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.ExtractVmiInfos(VmiFile: string): string;
var
  Output : string;

begin
  Output := GetVmuToolDir + ExtractFileName(ChangeFileExt(VmiFile, VMI_INFOS));
  RunExec(SW_INFOS, VmiFile, Output);
  Result := Output;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.GetVmuToolDir: string;
begin
  Result := GetRealPath(GetTempDir + '\' + VMUTOOLPC_DIR);
end;

//------------------------------------------------------------------------------

function TVmuToolPc.GetIconFrame(Index: integer; SrcFile: string;
  var DestBmp : TBitmap): boolean;
var
  OK, FExist : boolean;
  DestFile : string;
  
begin
  Result := Assigned(DestBmp);
  if not Result then Exit;

  DestFile := GetVmuToolDir + ExtractFileName(ChangeFileExt(SrcFile, '_frame' + IntToStr(Index) + '.bmp'));
  OK := RunExec(SW_FRAME + IntToStr(Index), SrcFile, DestFile);
  FExist := FileExists(DestFile);
  Result := OK and FExist and IsValidBmp(DestFile);

  if Result then
    DestBmp.LoadFromFile(DestFile)
  else begin
    DestBmp.Free;
    DestBmp := nil;
  end;

  if FExist and fOptions.fAutoDeleteFiles then
    DeleteFile(DestFile);
end;

//------------------------------------------------------------------------------

function TVmuToolPc.GetEyeCatch(SrcFile: string;
  var DestBmp: TBitmap): boolean;
var
  OK, FExist : boolean;
  DestFile : string;
  
begin
  Result := Assigned(DestBmp);
  if not Result then Exit;

  DestFile := GetVmuToolDir + ExtractFileName(ChangeFileExt(SrcFile, '_eyecatch.bmp'));
  OK := RunExec(SW_EYECATCH, SrcFile, DestFile);
  FExist := FileExists(DestFile);
  Result := OK and FExist and IsValidBmp(DestFile);

  if Result then
    DestBmp.LoadFromFile(DestFile)
  else begin
    DestBmp.Free;
    DestBmp := nil;
  end;

  if FExist and fOptions.fAutoDeleteFiles then
    DeleteFile(DestFile);
end;

//------------------------------------------------------------------------------

//---IsValidBmp---
//Le fichier passé en paramètre est-t-il une image Bitmap valide ?
function TVmuToolPc.IsValidBmp(FileName : string) : boolean;
const
  BmHeader : string = 'BM';

var
  F     : File;
  temp  : array[0..1] of Char;
//  i     : integer;

begin
  Result := False;
  temp := '';
  if not FileExists(FileName) then Exit;

  AssignFile(F, FileName);
  ReSet(F, 1);

  //Si le fichier est vide ca va planter
  if FileSize(F) < Length(BmHeader) then
  begin
    CloseFile(F);
    Exit;
  end;

  BlockRead(F, temp, Length(BmHeader));

  CloseFile(F);

  if temp = BmHeader then
    Result := True
  else Result := False;
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.DestroyArray;
var
  i, j : integer;

begin
  for i := 0 to fCount - 1 do
  begin
    Files[i].Pictures.EyeCatch.Free;

    for j := 0 to 2 do
      Files[i].Pictures.Frames[j].Free;
  end;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.ExtractStr(SubStrL, SubStrR, S: string): string;
begin
  Result := Gauche(SubStrR, S);
  Result := Droite(SubStrL, Result);
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.InitFields(var VmiStruct : TSaveFile);
var
  i : integer;
  
begin
  VmiStruct.VmiInfo.VMI_checksum := 0;
  VmiStruct.VmiInfo.VMI_description := '';
  VmiStruct.VmiInfo.VMI_copyright := '';
  VmiStruct.VmiInfo.Creation_date := '';
  VmiStruct.VmiInfo.VMS_resource_name := '';
  VmiStruct.VmiInfo.VM_filename := '';
  VmiStruct.VmiInfo.Type_File := vtData;
  VmiStruct.VmiInfo.Copy_Allowed := False;
  VmiStruct.VmiInfo.VMS_size := 0;
  VmiStruct.VmiInfo.VM_description := '';
  VmiStruct.VmiInfo.DC_description := '';
  VmiStruct.VmiInfo.Application_name := '';
  VmiStruct.VmiInfo.Color_icon_frames := 0;
  VmiStruct.VmiInfo.Color_icon_speed := 0;
  VmiStruct.VmiInfo.Eyecatch_type := 0;
  VmiStruct.VmiInfo.CRC := 0;
  VmiStruct.VmiInfo.Data_length := 0;

  //Une erreur s'est produite on va mettre nil à chaque image.
  for i := 0 to 2 do
    VmiStruct.Pictures.Frames[i] := nil;
  VmiStruct.Pictures.EyeCatch := nil;

  //VmiStruct.Pictures.EyeCatch := TBitmap.Create;

  //créer l'image 1 (car même si y'a un bug elle doit être crée pour être passée
  //en paramètre à la fonction ResizeVmuIcon.
  //if VmiStruct.Pictures.Frames[0] = nil then
  // VmiStruct.Pictures.Frames[0].Free;
    
{  VmiStruct.Pictures.Frames[0] := TBitmap.Create;

  //initialisation des différentes frames.
  for i := 1 to 2 do
  begin
    if Assigned(VmiStruct.Pictures.Frames[i]) then
      VmiStruct.Pictures.Frames[i].Free; //on pète l'ancienne image
      
    VmiStruct.Pictures.Frames[i] := TBitmap.Create;
  end;

  //if not Assigned(VmiStruct.Pictures.Frames[j]) then

  VmiStruct.Pictures.EyeCatch.Free; //détruire l'eyecatch
  VmiStruct.Pictures.EyeCatch := TBitmap.Create;     }
end;

//------------------------------------------------------------------------------

function TVmuToolPc.GetVmiInfos(VmiFile: string; var VmiStruct: TSaveFile): boolean;
const
  INFO_FIELD_LENGTH : integer = 23;
    
  function GetParsedInfo(VmiLine : string) : string;
  begin
    Result := Copy(VmiLine, INFO_FIELD_LENGTH, Length(VmiLine) - 1);
  end;

var
  InfosFile,
  VmsFile, Err, Ext : string;
 
  VmiInfos  : TVmiListInfos;
  j, Frame : integer;

begin
  Log('Loading "' + VmiFile + '"...', mtState);

  //initialisation des champs.
  InitFields(VmiStruct);

  //Si le fichier existe pas on sort.
  Result := FileExists(VmiFile);
  if not Result then Exit;

  if IsAborted then Exit;

  //Déclancher evenement.
  if Assigned(fOnGetFileInfo) then
    fOnGetFileInfo(Self, VmiFile);
    
  VmiStruct.FileName := VmiFile;

  Ext := LowerCase(ExtractFileExt(VmiFile));
  if Ext = VMI_FILTER then
    VmiStruct.FileType := ftVmi;
  if Ext = DCI_FILTER then
    VmiStruct.FileType := ftDci;
  if Ext = VMS_FILTER then Exit; //VMS INVALIDE ICI...

  InfosFile := ExtractVmiInfos(VmiStruct.FileName);

  //Vérification de la présence du fichier.
  if not FileExists(InfosFile) then
  begin
    Log('VMI infos extraction error !', mtError);
    VmiStruct.Errornous := etVmiReadError;
    Exit;
  end;

  //OK!...Lecture des infos.
  VmiInfos := TVmiListInfos.Create;
  try
    VmiStruct.Errornous := etNoError;

    VmiInfos.LoadFromFile(InfosFile);
    if fOptions.fAutoDeleteFiles then
      DeleteFile(InfosFile);

    //update : erreur supplémentaire : si la ressource est introuvable
    //messageboxa(0, pchar('vms resource name: ' + VmiStruct.VmiInfo.VMS_resource_name), '', 0);
    //-- ceci est fait dans la fonction qui scanne les VMS finalement.

    //Une erreur s'est-t-elle produite lors de la récuperation des infos ?
    for j := Low(VMUTOOL_ERRORS) to High(VMUTOOL_ERRORS) do
      if Pos(VMUTOOL_ERRORS[j], VmiInfos.Text) <> 0 then
      begin
        //fock ! une erreur s'est produite.

        //Déterminer le type de l'erreur
        case j of
          0 : begin
                //VmsFileExtr := ExtractStr(FILE_ERR_STR_L, FILE_ERR_STR_R, VmiInfos.Text) + '.vms';
                VmsFile := ChangeFileExt(VmiFile, '.vms');
                {
                  VmsFileExtr : Contient le fichier attendu par vmutool_pc.
                  VmsFile     : Le fichier réel, grâce au Vmi passé en paramètre.

                  Pourquoi ce test ? Pour savoir si vraiment le vms n'existe pas,
                  ou si c'est vmutool_pc qui fait des siennes (avec un VMS bidon).
                }
                if (not FileExists(VmsFile)) then
                  VmiStruct.Errornous := etVmsNotFound
                else VmiStruct.Errornous := etVmiReadError;
              end;
          1 : VmiStruct.Errornous := etScanListError;
        end;

        //Logger l'erreur
        Err := StringReplace(VmiInfos.Text, #$0A + WrapStr, '', [rfReplaceAll]);
        case VmiStruct.Errornous of
          etVmsNotFound   : Err := Err + ' (VMS not found).';
          etVmiReadError  : Err := Err + ' (VMI read error).';
          etScanListError : Err := Err + ' (Scan list error).';
        end;
        Log(Err, mtError);
      end;

    //Pas d'erreur on va analyser le fichier contenant les infos
    if VmiStruct.Errornous = etNoError then
    begin
      //Remplissage des informations supplémentaires (VMI seulement normalement)
      VmiStruct.VmiInfo.VMI_checksum := StrToIntDef(GetParsedInfo(VmiInfos[0]), 0);
      VmiStruct.VmiInfo.VMI_description := GetParsedInfo(VmiInfos[1]);
      VmiStruct.VmiInfo.VMI_copyright := GetParsedInfo(VmiInfos[2]);
      VmiStruct.VmiInfo.Creation_date := GetParsedInfo(VmiInfos[3]);
      VmiStruct.VmiInfo.VMS_resource_name := GetParsedInfo(VmiInfos[4]);
      VmiStruct.VmiInfo.VM_filename := GetParsedInfo(VmiInfos[5]);
      if UpperCase(GetParsedInfo(VmiInfos[6])) = 'DATA' then
        VmiStruct.VmiInfo.Type_File := vtData
      else VmiStruct.VmiInfo.Type_File := vtGame;
      VmiStruct.VmiInfo.Copy_Allowed := UpperCase(GetParsedInfo(VmiInfos[7])) = 'OK';
      VmiStruct.VmiInfo.VMS_size := StrToIntDef(ExtractStr('. ', ' b', VmiInfos[8]), 0);
      VmiStruct.VmiInfo.VM_description := GetParsedInfo(VmiInfos[9]);
      VmiStruct.VmiInfo.DC_description := GetParsedInfo(VmiInfos[10]);
      VmiStruct.VmiInfo.Application_name := GetParsedInfo(VmiInfos[11]);
      VmiStruct.VmiInfo.Color_icon_frames := StrToIntDef(GetParsedInfo(VmiInfos[12]), 0);
      VmiStruct.VmiInfo.Color_icon_speed := StrToIntDef(GetParsedInfo(VmiInfos[13]), 0);
      VmiStruct.VmiInfo.Eyecatch_type := StrToIntDef(GetParsedInfo(VmiInfos[14]), 0);
      VmiStruct.VmiInfo.CRC := StrToIntDef(GetParsedInfo(VmiInfos[15]), 0);
      VmiStruct.VmiInfo.Data_length := StrToIntDef(ExtractStr('. ', ' b', VmiInfos[16]), 0);

      //Extraires les images.
      for j := 0 to 2 do
      begin
        Frame := j + 1;
        VmiStruct.Pictures.Frames[j] := TBitmap.Create;
        
        try
          GetIconFrame(Frame, VmiStruct.FileName, VmiStruct.Pictures.Frames[j]);

          if Assigned(fOnGetFileFrame) then
            fOnGetFileFrame(Self, VmiFile, Frame, VmiStruct.Pictures.Frames[j]);
        except
          Log('Error when loading the bitmap frame ' + IntToStr(Frame)
            + ' for ' + ExtractFileName(VmiFile) + ' !', mtError);
        end;
      end;

      //Extraire l'EyeCatch
      VmiStruct.Pictures.EyeCatch := TBitmap.Create;
      try
        GetEyeCatch(VmiStruct.FileName, VmiStruct.Pictures.EyeCatch);

        if Assigned(fOnGetFileEyeCatch) then
          fOnGetFileEyeCatch(Self, VmiFile, VmiStruct.Pictures.EyeCatch);
      except
        Log('Error when loading the bitmap eyecatch for '
          + ExtractFileName(VmiFile) + ' !', mtError);
      end;

      Log('"' + VmiFile + '" loaded.', mtSuccess);
    end; {else begin
      //Une erreur s'est produite on va mettre nil à chaque image.
      for j := 0 to 2 do
        VmiStruct.Pictures.Frames[j] := nil;
      VmiStruct.Pictures.EyeCatch := nil;
    end;  }

  finally
    VmiInfos.Free;
  end;

  if IsAborted then Exit;
  
  if Assigned(fOnEndFileScanned) then
    fOnEndFileScanned(Self, VmiFile);
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.SetOptions(const Value: TOptions);
begin
  //fOptions := Value;
  if Assigned(Value) then fOptions.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.Log(Msg: string; MessageType: TMessageType);
begin
  if not Assigned(fOnStatus) then Exit;

  case MessageType of
    mtError   : fOnStatus(Self, 'Error : ' + Msg, MessageType);
    mtSuccess : if fOptions.fLogSuccessMsg then
                  fOnStatus(Self, 'Success : ' + Msg, MessageType);
    mtState   : if fOptions.fLogStateMsg then
                  fOnStatus(Self, 'Status : ' + Msg, MessageType);
  end;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.Active: boolean;
begin
  Result := fActive;
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.Stop;
begin
  if not fActive then Exit;
  fActive := False;

  fAborted := True;
end;

function TVmuToolPc.IsAborted: boolean;
begin
  Result := False;

  //Annulé ?
  if fAborted then
  begin
    if Assigned(fOnAborted) then
      fOnAborted(Self);
          
      fAborted := False;
      Result := True;
      fActive := False;
    end;
end;

//------------------------------------------------------------------------------

procedure TVmuToolPc.WriteVmiInfos(VmiFile: string; var VmiStructToWrite: TVmiInfo);
begin
  if Assigned(fOnStatus) then
    fOnStatus(Self, 'Writing new information to ' + VmiFile + ' ...', mtState);

  { -w_desc <desc>: write the description <desc> in VMI file <path>.
	-w_cpyrgt <cpyrgt>: write the copyright <cpyrgt> in VMI file <path>'.
	-w_rsrc <rsrc>: write the VMS resource name <rsrc> in VMI file <path>.
	-w_name <name>: write the VM filename <name> in VMI file <path>.
	-w_type <type>: write the type <type> of VMI file <path>.
	-w_copy <copy>: write the copy protection <copy> in VMI file <path>.

	-w_vmdesc <vmdesc>: write the VM description <vmdesc> in VMS file <path>.
	-w_dcdesc <dcdesc>: write the DC description <dcdesc> in VMS file <path>.
	-w_app <app>: write the application name <app> in VMS file <path>. }

  RunExec('-w_desc "' + VmiStructToWrite.VMI_description + '"', VmiFile, '');
  RunExec('-w_cpyrgt "' + VmiStructToWrite.VMI_copyright + '"', VmiFile, '');
  RunExec('-w_rsrc "' + VmiStructToWrite.VMS_resource_name + '"', VmiFile, '');
  RunExec('-w_name "' + VmiStructToWrite.VM_filename + '"', VmiFile, '');

  case VmiStructToWrite.Type_File of
    vtData : RunExec('-w_type DATA', VmiFile, '');
    vtGame : RunExec('-w_type GAME', VmiFile, '');
  end;
  
  if VmiStructToWrite.Copy_Allowed then
    RunExec('-w_copy OK', VmiFile, '')
  else RunExec('-w_copy PRTCT', VmiFile, '');

  RunExec('-w_vmdesc "' + VmiStructToWrite.VM_description + '"', VmiFile, '');
  RunExec('-w_dcdesc "' + VmiStructToWrite.DC_description + '"', VmiFile, '');
  RunExec('-w_appname "' + VmiStructToWrite.Application_name + '"', VmiFile, '');

  if Assigned(fOnWriteInfo) then
    fOnWriteInfo(Self, VmiFile);

  if Assigned(fOnStatus) then
    fOnStatus(Self, 'New information to ' + VmiFile + ' successfully written.', mtSuccess);
end;

//------------------------------------------------------------------------------

function TVmuToolPc.Count: integer;
begin
  Result := fCount;
end;

//------------------------------------------------------------------------------

function TVmuToolPc.UpdateInfosEntry(EntryID: integer): boolean;
var
  NewVmiInfos : TSaveFile;

begin
  Result := False;
  if (EntryID < 0) or (EntryID >= fCount) then Exit;

  GetVmiInfos(Files[EntryID].FileName, NewVmiInfos);
  Files[EntryID] := NewVmiInfos;

  if Assigned(OnUpdateInfo) then
    OnUpdateInfo(Self);
end;

//==============================================================================

function TVmuToolPc.GetResource(const VmiFile: TFileName): string;
var
  f : file;
  str : array[0..7] of Char;
  i : Integer;

begin
  //lire dans le vmi courant la ressource.
  AssignFile(f, VmiFile);
  FileMode := fmOpenRead; // en lecture seule
  Reset(f, 1);

  Seek(f, $50);
  BlockRead(f, str, SizeOf(str));

  Result := '';
  for i := Low(str) to High(str) do  // recomposer le nom du fichier.
  begin
    if str[i] = #0 then Break;
    Result := Result + str[i];
  end;

  // messageboxa(0, pchar(inttostr(length(result))), '', 0);
  
  CloseFile(f);
end;

{ TOptions }

constructor TOptions.Create;
begin
  fLogSuccessMsg := True;
  fAutoDeleteFiles := True;
  fLogStateMsg := True;
  fLogScanDirMsg := True;
  fScanInvalidVms := True;
end;

//==============================================================================

{ TVmiInfos }

constructor TVmiListInfos.Create;
begin
  //fDelimiterStr := #13;
  fDelimiterStr := #$1D + #$0A;  
end;

procedure TVmiListInfos.LoadFromFile(const FileName: string);
var
  FS  : TFileStream;
  Buf : Char;
  tmp : string;
  _delimiter_found : boolean;
  _delimiter_num : integer;

begin
  FS := TFileStream.Create(FileName, fmOpenRead);
  try

    with FS do
    begin
      Position := 0;
      tmp := '';
      _delimiter_found := False;
      _delimiter_num := 1;

      while not (Position = Size) do
      begin
        Read(Buf, 1);

        //si j'ai pas trouvé de delimiter... alors je regarde si c'est pas ce coup là
        if (not _delimiter_found) and (Buf = fDelimiterStr[1]) then
          _delimiter_found := True;

        if Buf = fDelimiterStr[_delimiter_num] then
            Inc(_delimiter_num) //c'est un delimiter on va rajouter + 1 pour voir si on le trouve après
          else tmp := tmp + buf; //caractère normal

        if Length(fDelimiterStr) < _delimiter_num then
        begin
          Add(tmp);
          tmp := '';
          _delimiter_found := False;
          _delimiter_num := 1;
        end;

      end;

      if tmp <> '' then //la dernière n'a pas de caractère delimiter
      begin
        if (Copy(tmp, Length(tmp) - 1, 2) = #$0D + #$0A) then //enlever les "fins de fichiers"
          tmp := StringReplace(tmp, #$0D + #$0A, '', [rfReplaceAll]);
          
        Add(tmp); 
      end;
      
    end;

  finally
    FS.Free;
  end;
end;

end.

