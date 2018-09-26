unit utils;

interface

uses
  Windows, SysUtils, Forms;

const
  WrapStr : string = #13 + #10;

function MsgBox(Handle : THandle ; Msg, Caption : string ;
  Flags : integer = 0) : integer;
function GetRealPath(Path : string) : string;
function GetEngineFileName : string;
//function ApplyCase(StrToGenerate, StrModel : string) : string;
function GetVmiFileOnDisk(FromVms : string) : TFileName;
function GetTempDir : string;

implementation

uses
  u_vmu_analyze;
  
const
  VMUTOOL_PC  : string = 'vmutool_pc.exe';


//------------------------------------------------------------------------------

//---GetTempDir---
function GetTempDir : string;
var
  Dossier: array[0..MAX_PATH] of Char;

begin
  Result := '';
  if GetTempPath(SizeOf(Dossier), Dossier)<>0 then Result := StrPas(Dossier);
end;

//------------------------------------------------------------------------------

function GetEngineFileName : string;
begin
  Result := GetRealPath(ExtractFilePath(Application.ExeName)) + VMUTOOL_PC;
end;

//------------------------------------------------------------------------------

function MsgBox(Handle : THandle ; Msg, Caption : string ; Flags : integer = 0) : integer;
begin
  Result := MessageBoxA(Handle, PChar(Msg), PChar(Caption), Flags);
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

// permet d'avoir la case exacte du fichier VMI correspondant au VMS passé en paramètre.
function GetVmiFileOnDisk(FromVms : string) : TFileName;
var
  sr : TSearchRec;
  
begin
  // Result := FileSearch(ExtractFileName(ChangeFileExt(FromVms, VMI_EXT)), ExtractFilePath(FromVms));
  FindFirst(ChangeFileExt(FromVms, VMI_EXT), faAnyFile, sr);
  Result := sr.Name;
  //messageboxa(0, pchar(result), '', 0);

  if Result = '' then Result := ChangeFileExt(FromVms, VMI_EXT);

  FindClose(sr);
end;

//------------------------------------------------------------------------------

//Savoir si un caractère passé en paramètre est en minuscule.
{function IsLowCase(c : Char) : Boolean;
var
  _ord_c : Byte;

begin
  _ord_c := Ord(c);

  Result := (_ord_c > Ord('a')) and (_ord_c < Ord('z'));
end;

//------------------------------------------------------------------------------

{	Fonction qui permet de changer la case d'une chaine source en fonction d'un modèle.
	Exemple : ApplyCase('hello', 'SaLuT') renvoit HeLlo. }
{function ApplyCase(StrToGenerate, StrModel : string) : string;
var
  i : Integer;
  
begin
  Result := '';
  
  for i := 1 to Length(StrModel) do
    if IsLowCase(StrModel[i]) then
      Result := Result + LowerCase(StrToGenerate[i])
    else Result := Result + UpperCase(StrToGenerate[i]);
end; }

//------------------------------------------------------------------------------

end.
