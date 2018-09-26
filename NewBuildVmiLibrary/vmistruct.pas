{
    :: V M U  T O O L  P C ::

    v1.0 by [big_fury]SiZiOUS

    11/11/06 : v1.1 - Correction : Calcul du Checksum
                    - Correction : Plus d'espaces rajout�s apr�s le nom du VM ("VM Filename")

    Module de cr�ation de fichier VMI.
}
unit vmistruct;

interface

uses
  SysUtils, Classes, DateUtils;

const
  VMI_EXT : string = '.vmi';
    
type
  TVmsFileNotFound = class(Exception);
  TInvalidFile = class(Exception);

  TVmiType = (vtData, vtGame);

  TVmiStruct = packed record
    Checksum : array[0..3] of Char; // d'apr�s le code de Speud
    Description : array[0..31] of Char;
    Copyright : array[0..31] of Char;
    CreationYear : Word;
    CreationMonth :	Byte;  //1-12
    CreationDay :	Byte; 	 //1-31
    CreationHour : Byte; 	//0-23
    CreationMinute : Byte; //0-59
    CreationSecond : Byte; //0-59
    CreationWeekday :	Byte; //0=sunday-6=saturday
    VmiVersion : Word; 	// (set to 0)
    FileNumber : Word;  //	 (set to 1)
    VmsResourceName	: array[0..7] of Char; 	// (without the .VMS)
    DcFilename : array[0..11] of Char; 	 // (on the VMS)
    //VmiFileType : Byte; //	GAME (1=game, 0=data)
    //CopyProtection : Byte; //(1=copy protected, 0=copy ok)
    VmiTestInfo : Word;  //j'ai mal compris, VmiFileType + CopyProtection
    Crap : Word; 	//? (set to 0)
    FileSize : Integer;  //	File size in bytes
  end;

  TVmiFields = class(TPersistent)
  private
    fVmsSize : Integer;
    fCopyright: string;
    fDescription: string;
    fDcFileName: string;
    fFileType: TVmiType;
    fCopyProtection: Boolean;
    fVmsFileName: string;
  public
    function GetVmsFileSize : Integer;
    function GetVmsFileName : string;
  published
    property Description : string read fDescription write fDescription;
    property Copyright : string read fCopyright write fCopyright;
    property DcFileName : string read fDcFileName write fDcFileName;
    property FileType : TVmiType read fFileType write fFileType;
    property CopyProtection : Boolean read fCopyProtection write fCopyProtection;
  end;

  TVmiBuilder = class
  private
    fFields : TVmiFields;
    fVmsFile: string;
  protected
    procedure StrToRaw(const input: string; var output: array of Char ; complete_array_with : Char = ' ');
    function GenerateCheckSum : string; // renvoie une chaine cod�e
    procedure FillVmsSize; 
  public
    constructor Create(const VmsFile : String);
    destructor Destroy; override;
    function GenerateDefaultVmiFileName : string;
    procedure SaveToFile(const ToFileName : String = '');
  published
    property Fields : TVmiFields read fFields write fFields;
    property VmsFile : string read fVmsFile;
  end;

implementation

uses
  Utils;

{ TVmiBuilder }

//------------------------------------------------------------------------------

constructor TVmiBuilder.Create(const VmsFile : String);
var
  _name : string;

begin
  fFields := TVmiFields.Create;

  if not FileExists(VmsFile) then
    raise TVmsFileNotFound.Create('Error when loading "' + VmsFile + '".');

  //Garder le chemin et le nom du fichier VMS.
  fVmsFile := VmsFile;

  //R�cuperer la taille du fichier VMS pass� en param�tre.
  FillVmsSize;

  { Ici on va g�n�rer le VmsFileName (sur 8 chars), en fonction du fichier VMS
    pass� en param�tre. Il sera inscrit dans le VMI cr��, afin de pointer sur la
    ressource VMS. }
  _name := Left('.', ExtractFileName(VmsFile));
  Fields.fVmsFileName := UpperCase(_name); //4 c'est l'extension + le "."
end;

//------------------------------------------------------------------------------

destructor TVmiBuilder.Destroy;
begin
  fFields.Free;
  inherited;
end;

//------------------------------------------------------------------------------

{
    The checksum is formed by anding the first four bytes of the
    ".VMS resource name" field (offset $50) with the numbers $53, $45,
    $47, $41 ("SEGA") respectively.
}
function TVmiBuilder.GenerateCheckSum: string;
const
  KeyCode : array[0..3] of Byte = ($53, $45, $47, $41);

var
  Datas : array[0..3] of Byte;
  i : Integer;

begin
  Result := '';

  for i := Low(Datas) to High(Datas) do
  begin
    Datas[i] := Ord(Fields.GetVmsFileName[i + 1]);
    Result := Result + Chr(Datas[i] and KeyCode[i]);
  end;
end;

//------------------------------------------------------------------------------

//Inscrire la taille du fichier VMS dans le champ pr�vu � cet effet.
procedure TVmiBuilder.FillVmsSize;
var
  F : File;
  
begin
  AssignFile(F, Self.VmsFile);
  Reset(F, 1);
  Fields.fVmsSize := FileSize(F);
  CloseFile(F);
end;

//------------------------------------------------------------------------------

{ Cr�er le fichier VMI. Si il n'y a pas de param�tre, le fichier VMI se nommera
  de la m�me fa�on que le fichier VMS pass� au constructeur. }
procedure TVmiBuilder.SaveToFile(const ToFileName : String = '');
var
  outp : TVmiStruct;
  F : File;
  _output_file : string;
  _curr_date : TDateTime;
  _vmi_extra_infos : Word;

begin
  _curr_date := Now;

  //Ecriture de la date et de l'heure de cr�ation.
  outp.CreationYear := YearOf(_curr_date);
  outp.CreationMonth := MonthOf(_curr_date);
  outp.CreationDay := DayOf(_curr_date);
  outp.CreationHour := HourOf(_curr_date);
  outp.CreationMinute := MinuteOf(_curr_date);
  outp.CreationSecond := SecondOf(_curr_date);
  outp.CreationWeekday := DayOfTheWeek(_curr_date);

  outp.VmiVersion := 0; //non utilis�.
  outp.FileNumber := 1; //non utilis�.

  //nom du fichier VMS.
  StrToRaw(Fields.GetVmsFileName, outp.VmsResourceName);

  //nom de la sauvegarde sur le syst�me de fichier de la Dreamcast.
  StrToRaw(Fields.DcFileName, outp.DcFilename, #0);

  //Ecrire les autres informations.
  //outp.VmiFileType := Word(fFields.fFileType);
  //outp.CopyProtection := Word(fFields.fCopyProtection);
  _vmi_extra_infos := 0; //contient la donn� � �crire.
  { Signification :
    - Data + Copy Allowed = 0
    - Data + Copy Protection = 1
    - Game + Copy Allowed = 2
    - Game + Copy Protection = 3}
  if (Fields.FileType = vtGame) then
    _vmi_extra_infos := Word(Fields.FileType) + 1;
  outp.VmiTestInfo := _vmi_extra_infos + Word(fFields.fCopyProtection);

  outp.Crap := 0; //champ non utilis�.
  outp.FileSize := Fields.GetVmsFileSize;

  //Ecriture du checksum.
  StrToRaw(GenerateCheckSum, outp.Checksum);

  StrToRaw(Fields.Description, outp.Description);
  StrToRaw(Fields.Copyright, outp.Copyright);
  
  if ToFileName = '' then
    _output_file := GenerateDefaultVmiFileName //generer le nom du VMI � partir du VMS.
  else _output_file := ToFileName; //prendre le nom pass� en param�tre.

  if _output_file = '' then
    raise TInvalidFile.Create('Error when generating output filename.');

  //Ecriture des infos dans le fichier VMI.
  AssignFile(F, _output_file);
  ReWrite(F, 1);
  BlockWrite(F, outp, SizeOf(outp));
  CloseFile(F);
end;

//------------------------------------------------------------------------------

procedure TVmiBuilder.StrToRaw(const input: string; var output: array of Char ; complete_array_with : Char = ' ');
var
  i, len, lw, hh : Integer;
  str : string;

begin
  { ***ATTENTION : Lors de la d�termination de la borne inf�rieure de output, elle
    devient en base 0 (???) alors que dans la stucture c'est en base 1. J'ai un doute
    sur l'utilit� de la fonction Low() du coup... }
  str := input;

  lw := Low(output);
  hh := High(output);
  len := Length(str); //calcul de la longueur de la chaine
  if len > hh then len := hh + 1; //c'est la taille maxi du tableau. (+1 car on commence � 0).

  //Ecriture de la chaine dans le tableau
  if str <> '' then  //si la chaine est vide on y va pas !
    for i := lw to len do
      output[i] := str[i + 1]; //le +1 : les strings commencent � 1

  //compl�t�e par des espaces
  for i := len to hh do
    output[i] := complete_array_with;
end;

//------------------------------------------------------------------------------

{ TVmiFields }

function TVmiFields.GetVmsFileName: string;
begin
  Result := fVmsFileName;
end;

//------------------------------------------------------------------------------

function TVmiFields.GetVmsFileSize: Integer;
begin
  Result := fVmsSize;
end;

//------------------------------------------------------------------------------

function TVmiBuilder.GenerateDefaultVmiFileName : string;
var
  NewExt : string; //pas obligatoire.
  
begin
  { D�terminer le nom du fichier VMI qui va �tre cr��.
    S'il n'y a pas de param�tres, on va prendre la m�me location que le fichier VMS
    qui a servi � lancer la cr�ation de ce processus. }
  NewExt := ApplyCase(VMI_EXT, ExtractFileExt(VmsFile)); //pas obligatoire, c'est pour garder la m�me casse.
  Result := ChangeFileExt(VmsFile, NewExt)
end;

end.
