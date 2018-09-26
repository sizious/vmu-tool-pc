unit utils;

interface

uses
  Windows, SysUtils, Graphics, Classes, Controls, Jpeg, PngImage, Forms;

const
  WrapStr : string = #13 + #10;

function GetRealPath(Path : string) : string;
function MsgBox(Handle : THandle ; Msg, Caption : string ;
  Flags : integer = 0) : integer;
function SaveBmpToIcon(Bmp : TBitmap ; DestIconFile : TFileName ;
  Transparent : boolean = False) : boolean;
function SaveBmpToJpeg(Bmp : TBitmap ; Output : TFileName) : boolean;
function SaveBmpToPng(Bmp : TBitmap ; Output : TFileName) : boolean;
function SaveBmpToMetaFile(Bmp : TBitmap ; Output : TFileName ; SaveToEMF : boolean) : boolean;
function GetEngineFileName : string;
function ClearTempDirectory : boolean;
function ApplyCase(StrToGenerate, StrModel : string) : string;

implementation

const
  VMUTOOL_PC  : string = 'vmutool_pc.exe';
  VMUTOOL_DIR : string = 'VMUTOOL_PC';

//------------------------------------------------------------------------------

//Savoir si un caractère passé en paramètre est en minuscule.
function IsLowCase(c : Char) : Boolean;
var
  _ord_c : Byte;

begin
  _ord_c := Ord(c);

  Result := (_ord_c > Ord('a')) and (_ord_c < Ord('z'));
end;

//------------------------------------------------------------------------------

{	Fonction qui permet de changer la case d'une chaine source en fonction d'un modèle.
	Exemple : ApplyCase('hello', 'SaLuT') renvoit HeLlo. }
function ApplyCase(StrToGenerate, StrModel : string) : string;
var
  i : Integer;
  
begin
  Result := '';
  
  for i := 1 to Length(StrModel) do
    if IsLowCase(StrModel[i]) then
      Result := Result + LowerCase(StrToGenerate[i])
    else Result := Result + UpperCase(StrToGenerate[i]);
end;

//------------------------------------------------------------------------------

function GetVmuToolTempDir : string;

  function GetTempDir : string;
  var
    Dossier: array[0..MAX_PATH] of Char;

  begin
    Result := '';
    if GetTempPath(SizeOf(Dossier), Dossier)<>0 then Result := StrPas(Dossier);
  end;

begin
  Result := GetRealPath(GetTempDir + '\' + VMUTOOL_DIR);
end;

//------------------------------------------------------------------------------

function GetRealPath(Path : string) : string;
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

//------------------------------------------------------------------------------

function MsgBox(Handle : THandle ; Msg, Caption : string ; Flags : integer = 0) : integer;
begin
  Result := MessageBoxA(Handle, PChar(Msg), PChar(Caption), Flags);
end;

//------------------------------------------------------------------------------

function GetEngineFileName : string;
begin
  Result := GetRealPath(ExtractFilePath(Application.ExeName)) + VMUTOOL_PC;
end;

//------------------------------------------------------------------------------

function ClearTempDirectory : boolean;

  procedure DeleteDir(TheFolder : string);
  var
    aResult : Integer;
    aSearchRec : TSearchRec;

  begin
    if TheFolder = '' then Exit;
    if TheFolder[Length(TheFolder)] <> '\' then TheFolder := TheFolder + '\';
    aResult := FindFirst(TheFolder + '*.*', faAnyFile, aSearchRec);
    while aResult=0 do
    begin
      if ((aSearchRec.Attr and faDirectory)<=0) then
      begin
        try
          if (FileGetAttr(TheFolder+aSearchRec.Name) and faReadOnly) > 0 then FileSetAttr(TheFolder+aSearchRec.Name, FileGetAttr(TheFolder+aSearchRec.Name) xor faReadOnly);
          //if FileGetAttr(TheFolder) > 0 then FileSetAttr(TheFolder, faAnyFile);
          DeleteFile(TheFolder+aSearchRec.Name)
        except
        end;
      end
      else
      begin
        try
          if aSearchRec.Name[1]<>'.' then   // pas le repertoire '.' et '..'sinon on tourne en rond
          begin
            DeleteDir(TheFolder+aSearchRec.Name); // vide les sous-repertoires de facon recursive
            RemoveDir(TheFolder+aSearchRec.Name);
          end;
        except // exception silencieuse si ne peut détrure le fichier car il est en cours d'utilisation : sera détruit la fois prochaine....
        end;
      end;
      aResult:=FindNext(aSearchRec);
    end;
    FindClose(aSearchRec); // libération de aSearchRec

    if DirectoryExists(TheFolder) = True then RemoveDir(TheFolder);
  end;

begin
  if DirectoryExists(GetVmuToolTempDir) then
    DeleteDir(GetVmuToolTempDir);

  Result := not DirectoryExists(GetVmuToolTempDir);
end;

//------------------------------------------------------------------------------

function SaveBmpToIcon(Bmp : TBitmap ; DestIconFile : TFileName ; Transparent : boolean = False) : boolean;
var
  Icon: TIcon;
  ImageList: TImageList;

begin
  Result := False;
  if not Assigned(Bmp) then Exit;

  Icon := TIcon.Create;
  try

    ImageList := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    try
      if Transparent then
        ImageList.AddMasked(Bmp, Bmp.TransparentColor)
      else ImageList.Add(Bmp, nil);

      ImageList.GetIcon(0, Icon);

      Icon.SaveToFile(DestIconFile);
      Result := FileExists(DestIconFile);
    finally
      ImageList.Free;
    end;

  finally
    Icon.Free;
  end;
end;

//------------------------------------------------------------------------------

function SaveBmpToJpeg(Bmp : TBitmap ; Output : TFileName) : boolean;
var
  JPG : TJPEGImage;

begin
  Result := False;
  if not Assigned(Bmp) then Exit;

  JPG := TJPEGImage.Create;
  try
    JPG.Assign(BMP);
    JPG.SaveToFile(Output);
    Result := FileExists(Output);
  finally
    JPG.Free;
  end;
end;

//------------------------------------------------------------------------------

function SaveBmpToPng(Bmp : TBitmap ; Output : TFileName) : boolean;
var
  PNG : TPNGObject;

begin
  Result := False;
  if not Assigned(Bmp) then Exit;

  PNG := TPNGObject.Create;
  try
    PNG.Assign(BMP);
    PNG.SaveToFile(Output);
    Result := FileExists(Output);
  finally
    PNG.Free;
  end;
end;

//------------------------------------------------------------------------------

function SaveBmpToMetaFile(Bmp : TBitmap ; Output : TFileName ; SaveToEMF : boolean) : boolean;
var
  Meta : TMetaFile;
  Img : TMetaFileCanvas;

begin
  Result := False;
  if not Assigned(Bmp) then Exit;

  Meta := TMetaFile.Create;
  try
    Meta.Height := Bmp.Height;
    Meta.Width := Bmp.Width;
    Meta.Enhanced := SaveToEMF;

    Img := TMetaFileCanvas.Create(Meta, 0);

    Img.Draw(0, 0, Bmp);
    Img.Free;
    Meta.SaveToFile(Output);
    Result := FileExists(Output);

  finally
    Meta.Free;
  end;
end;

//------------------------------------------------------------------------------

end.
