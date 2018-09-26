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

  Unit� RegShell
  ==============

  Description : Unit� permettant d'ajouter un �l�ment au menu contextuel de Windows (en cliquant droit).
                Permet d'ajouter son application � une extension donn�e. On peut sp�cifier le nom de
                l'application, la caption du menu contextuel, la commande � effectuer...
                Si l'extension n'est pas enregistr�e sur le syst�me, elle est automatiquement cr�ee.
                Permet �galement d'enlever le menu contextuel cr�� gr�ce � la fonction, et plus
                g�n�ralement tout menu contextuel de Windows.

  Proc�dures  : - AddContextMenuItem        : Cette fonction ajoute le menu contextuel � Windows.
                                              FileExtension : Extension du fichier cible (sans le point)
                                              ApplicationName : Nom de votre application,
                                              ContextMenuItemCaption : Caption du menu contextuel,
                                              Command : Commande � effectuer lors de la click du menu contextuel.

                - RemoveContextMenuItem     : Retire le menu contextuel associ� � une application et � une
                                              extension.
                                              FileExtension : Extension du fichier cible (sans le point)
                                              ApplicationName : Nom de votre application.

  Auteur      : [big_fury]SiZiOUS (pour les 2 fonctions principales).

  E-mail      : sizious@yahoo.fr

  URL         : http://www.sbibuilder.fr.st

  Remarques   : Un GRAND merci � DevelOpeR13 (http://www.dev-zone.com) pour l'exemple qui m'a mis
                sur la bonne voie.
                Librement inspir� de sa FAQ disponible � l'URL suivante :
                http://www.dev-zone.com/faq/bdr/fgbdr_index.php
                L'exemple traitant du sujet est disponible � l'URL suivante :
                http://www.phidels.com/php/index.php3?page=../php/pagetelechargementzip.php3&id=473

                Un grand merci � lui, �galement � tout le monde de Phidels.com.

  TO DO       : Il reste un �l�ment inconnu : Comment ajouter une ic�ne au menu contextuel, � l'image
                de WinZip, WinRAR, WinACE ou encore BitDefender. Je pensais qu'une clef DefaultIcon
                bien plac�e suffirai, je me suis tromp�. Impossible d'en sp�cifier une.

                Edit [18/07/05] : Il faut utiliser une DLL appell�e Shell Context Handler.
                Bien plus difficile � mettre en place, elle n'est pas utilisable avec cette unit�.
}

unit regshell;

interface

uses
  Windows, SysUtils, Registry;

function AddDefaultContextMenuItem(FileExtension, Command : string) : boolean;
function RemoveDefaultContextMenuItem(FileExtension : string) : boolean;
function DefaultContextMenuExists(FileExtension : string) : boolean;
//function AddContextMenuItem(FileExtension, ApplicationName, ContextMenuItemCaption, Command : string) : boolean;
//function RemoveContextMenuItem(FileExtension, ApplicationName : string) : boolean;
//function ContextMenuExists(FileExtension, ApplicationName : string) : boolean;

implementation

uses
  RegUtils, Main, Utils;

//------------------------------------------------------------------------------

function AddDefaultContextMenuItem(FileExtension, Command : string) : boolean;
var
  RG : TRegistry;
  ExtID : string;

begin
  Result := False;

  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := '';
    RG.RootKey := HKEY_CLASSES_ROOT;

    //***Recuperation de l'ID de l'extension.
    ExtID := GetExtensionID(RG, FileExtension, True);
    if ExtID = '' then Exit;

    if not RG.OpenKey(ExtID, True) then Exit; //cr�ation de la clef ExtID : "xxxfile"

    if not RG.OpenKey('Shell\Open\Command', True) then Exit; //cr�ation de la clef Shell\AppName

    RG.WriteString('', Command); //�criture de la commande

    Result := True;
  finally
    RG.Free;
  end;
end;

function RemoveDefaultContextMenuItem(FileExtension : string) : boolean;
var
  RG : TRegistry;
  ExtID : string;

begin
  Result := False;
  
  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := GetExtensionID(RG, FileExtension, False);
    if ExtID = '' then Exit;

    //on est au bon endroit on peut effacer la clef qui nous interresse
    Result := RG.DeleteKey(ExtID + '\Shell\Open');
  finally
    RG.Free;
  end;
end;

function DefaultContextMenuExists(FileExtension : string) : boolean;
var
  RG : TRegistry;
  ExtID, _target, _registered : string;

begin
  Result := False;
  
  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := GetExtensionID(RG, FileExtension, False);
    if ExtID = '' then Exit;

    Result := RG.OpenKey(ExtID + '\Shell\Open\Command', False);
    if not Result then Exit;

    // comparer si l'exe dans le dossier courant correspond exactement � ce qui est enregistr�
    _registered := LowerCase(StringReplace(RG.ReadString(''), '" "%1"', '', [rfReplaceAll]));
    _registered := StringReplace(_registered, '"', '', [rfReplaceAll]);

    _target := LowerCase(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + VMUPROP_EXE);

    Result := (_registered = _target);
  finally
    RG.Free;
  end;
end;

//---AddContextMenuItem---
{function AddContextMenuItem(FileExtension, ApplicationName, ContextMenuItemCaption, Command : string) : boolean;
var
  RG : TRegistry;
  ExtID : string;

begin
  Result := False;
  if FileExtension = '' then Exit;

  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := '';
    RG.RootKey := HKEY_CLASSES_ROOT;

    //***Recuperation de l'ID de l'extension.
    ExtID := GetExtensionID(RG, FileExtension, True);
    if ExtID = '' then Exit;

    if not RG.OpenKey(ExtID, True) then Exit; //cr�ation de la clef ExtID : "xxxfile"

    if not RG.OpenKey('Shell\' + ApplicationName, True) then Exit; //cr�ation de la clef Shell\AppName
    RG.WriteString('', ContextMenuItemCaption);   //�criture de la caption du menu
    if not RG.OpenKey('Command', True) then Exit; //cr�ation de la clef commande
    RG.WriteString('', Command); //�criture de la commande

    Result := True;
  finally
    RG.Free;
  end;
end;

//------------------------------------------------------------------------------

//---RemoveContextMenuItem---
function RemoveContextMenuItem(FileExtension, ApplicationName : string) : boolean;
var
  RG : TRegistry;
  ExtID : string;

begin
  Result := False;
  
  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := GetExtensionID(RG, FileExtension, False);
    if ExtID = '' then Exit;

    //on est au bon endroit on peut effacer la clef qui nous interresse
    Result := RG.DeleteKey(ExtID + '\Shell\' + ApplicationName);
  finally
    RG.Free;
  end;
end;

//------------------------------------------------------------------------------

//---ContextMenuExists---
function ContextMenuExists(FileExtension, ApplicationName : string) : boolean;
var
  RG : TRegistry;
  ExtID : string;
  
begin
  Result := False;
  
  FileExtension := GetRealExt(FileExtension);

  RG := TRegistry.Create;
  try
    ExtID := GetExtensionID(RG, FileExtension, False);
    if ExtID = '' then Exit;

    Result := RG.KeyExists(ExtID + '\Shell\' + ApplicationName);
  finally
    RG.Free;
  end;
end;
}
//------------------------------------------------------------------------------

end.
