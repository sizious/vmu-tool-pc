{
   [big_fury]
   888888888     8888   888888888888   8888       888888888      8888      8888     888888888   
 8888888888888   8888   888888888888   8888     8888888888888    8888      8888   8888888888888
 8888     8888                88888            8888       8888   8888      8888   8888     8888 
 888888888       8888       888888     8888   8888         8888  8888      8888   888888888     
   8888888888    8888      88888       8888   8888         8888  8888      8888     88888888888 
        888888   8888    88888         8888   8888         8888  8888      8888           888888
 8888      8888  8888   88888          8888    8888       8888   8888      8888   8888      8888
 8888888888888   8888  88888888888888  8888     8888888888888     888888888888    8888888888888 
   8888888888    8888  88888888888888  8888       888888888        8888888888       8888888888  

  Unit� RegExt
  ============

  Description : Unit� permettant d'enregistrer des types de fichiers, et de les effacer.
                Brid� pour les EXE, DLL, BAT et les COM.
                On peut specifier une ic�ne associ� au type de fichier ainsi qu'une
                description. Par contre on ne peut pas sp�cifier d'application par d�faut...
                ... pas la peine.

  Proc�dures  : - CreateExtension           : Cette fonction cr�e une nouvelle extension. On peut sp�cifier
                                              une description et une icone.

                - DeleteExtension           : Permet d'effacer une extension enregistr� du systeme.
                                              ATTENTION, DANGER !
                                              NE FONCTIONNE PAS POUR LES EXE, DLL, BAT et COM.

  Auteur      : [big_fury]SiZiOUS (pour les 2 fonctions principales).

  E-mail      : sizious@yahoo.fr

  URL         : http://www.sbibuilder.fr.st

  Remarques   : Un GRAND merci � DevelOpeR13 (http://www.dev-zone.com) pour les
                3 fonctions utilis�es ici, c'est � dire SetCreateKey,
                SetWriteString et GetDeleteKey.

                Un grand merci � lui, �galement � tout le monde de Phidels.com.
}

unit regext;

interface

uses
  Windows, SysUtils, Registry;

function CreateExtension(FileExtension, FileDescription, IconFileName : string) : boolean;
function DeleteExtension(FileExtension : string) : boolean;
function IsAlreadySet(FileExtension : string ; FileIconIndex : Integer) : boolean;

implementation

uses RegUtils, utils, main;

//------------------------------------------------------------------------------

//---IsAlreadySet---
function IsAlreadySet(FileExtension : string ; FileIconIndex : Integer) : boolean;
var
  RG : TRegistry;
  ExtID, DefaultIcon : string;
  NumExtID : Integer;
  DllImageName : string;
  
begin
  Result := False;

  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := '';
    RG.RootKey := HKEY_CLASSES_ROOT;

    //***Recuperation de l'ID de l'extension.
    //La clef '.XXX' n'existe pas.
    // Result := RG.KeyExists('.' + FileExtension);

    // @update : on sait que �a existe, mais il faut voir en plus si �a correspond � notre appli.
    ExtID := GetExtensionID(RG, FileExtension, False);
    if ExtID = '' then Exit;

    if not RG.OpenKey(ExtID, False) then Exit;
    if not RG.OpenKey('DefaultIcon', False) then Exit;
    DefaultIcon := RG.ReadString('');
    if DefaultIcon = '' then Exit;

    DllImageName := LowerCase(sto_GetModuleName);
    DefaultIcon := LowerCase(DefaultIcon);
    
    // messagebox(0, pchar(DefaultIcon), '', 0);

    // MessageBoxA(0, PChar(DefaultIcon), '', 0);
    Result := Pos(DllImageName, DefaultIcon) <> 0;
    if not Result then Exit;

    // messagebox(0, pchar(DllImageName + ' // ' + DefaultIcon), '', 0);
    // si c'est le m�me module (Pos <> 0) alors �a renvoie True : on a d�j� enregistr� l'extension.

    // on contr�le si c'est vraiment la bonne ic�ne
    ExtID := StringReplace(DefaultIcon, DllImageName + ',', '', [rfReplaceAll, rfIgnoreCase]);
    // messagebox(0, pchar(ExtID), '', 0);
    
    try
      NumExtID := StrToInt(ExtID); //c'est pas un INT (contient l'index de l'ic�ne associ�e)
    except
      Exit;
    end;

    Result := (NumExtID = FileIconIndex); // Si c'est la m�me icone c'est gagn� !
  finally
    RG.Free;
  end;
end;

//------------------------------------------------------------------------------

//---CreateExtension---
function CreateExtension(FileExtension, FileDescription, IconFileName : string) : boolean;
var
  RG : TRegistry;
  ExtID, BackupExtID : string;

begin
  Result := False;
  if FileExtension = '' then Exit;
  
  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    // ExtID := '';
    RG.RootKey := HKEY_CLASSES_ROOT;

    //***Recuperation de l'ID de l'extension.
    //ExtID := GetExtensionID(RG, FileExtension, True);
    //if ExtID = '' then Exit;
    // CA MODIFIE LES EXTENSIONS ASSOCIEES A L'ANCIEN FICHIER !!!
    // EX : SI .DCI POINTE SUR WINRAR CA MODIFIE WINRAR !!!

    ExtID := GetExtID(FileExtension);

    // ecrire la valeur du pointeur dans l'extension.
    if not RG.OpenKey('.' + FileExtension, True) then Exit;
    BackupExtID := RG.ReadString(''); // permettra la restauration plus tard.
    if BackupExtID = ExtID then BackupExtID := ''; // on se sauvegarde pas nous m�me...

    RG.WriteString('', ExtID); // ecrire la valeur de VMU TOOL PC
    RG.CloseKey;

    if not RG.OpenKey(ExtID, True) then Exit;
    RG.WriteString('', FileDescription);
    RG.WriteString('Backup', BackupExtID); // garder l'ancienne valeur qui pointait dans le ".DCI" par ex.

    if not RG.OpenKey('DefaultIcon', True) then Exit;
    RG.WriteString('', IconFileName);
    Result := True;
  finally
    RG.Free;
  end;
end;

//------------------------------------------------------------------------------

//---DeleteExtension---
function DeleteExtension(FileExtension : string) : boolean;
const
  DenyExt : array[0..11] of string = (  'EXE', 'DLL', 'COM', 'BAT', 'CMD', 'SCR',
                                        'PIF', 'LNK', 'VXD', 'SYS', 'OCX', '386');
var
  RG : TRegistry;
  ExtID, BackupExtID : string;
  i : integer;

begin
  Result := False;
  if FileExtension = '' then Exit;

  FileExtension := GetRealExt(FileExtension);

  //Extension non autoris�s (system)
  for i := 0 to High(DenyExt) do
    if UpperCase(DenyExt[i]) = UpperCase(FileExtension) then Exit;

  BackupExtID := '';
  
  RG := TRegistry.Create;
  try
    ExtID := '';
    RG.RootKey := HKEY_CLASSES_ROOT;

    //***Recuperation de l'ID de l'extension (de VMU TOOL PC)
    ExtID := GetExtensionID(RG, FileExtension, True);
    if ExtID = '' then Exit;

    if RG.OpenKey(ExtID, False) then
    begin
      BackupExtID := RG.ReadString('Backup'); // r�cup�rer l'ancienne clef qui �tait associ�e
      RG.CloseKey;
    end;

    RG.DeleteKey(ExtID); // effacer celle de VMU TOOL PC

    if (BackupExtID = '') or (Pos(APP_NAME, BackupExtID) <> 0) then  // si c'est vide ou qu'il y'a la chaine "VMU_TOOL_PC"...
      RG.DeleteKey('.' + FileExtension) // on avait rien sauvegard� : on peut virer la clef
    else begin
      if not RG.OpenKey('.' + FileExtension, False) then Exit; //on va r�ecrire l'ancienne valeur
      RG.WriteString('', BackupExtID);
      RG.CloseKey;
    end;

    Result := True;
  finally
    RG.Free;
  end; 
end;

//------------------------------------------------------------------------------

end.
