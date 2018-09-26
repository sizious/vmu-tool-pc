unit regutils;

interface

uses
  Windows, Registry;
  
function GetExtensionID(var RG : TRegistry ; Extension : string ; Create : boolean) : string;
function GetRealExt(var Extension : string) : string;
function GetExtID(Extension : string) : string;

implementation

uses
  main;
  
//------------------------------------------------------------------------------

// Extension ID pour cette appli (permettra la restauration des extensions ...).
function GetExtID(Extension : string) : string;
begin
  Result := APP_NAME + '.' + GetRealExt(Extension) + 'file';
end;

//------------------------------------------------------------------------------

function GetRealExt(var Extension : string) : string;
begin
  if Extension[1] = '.' then
    Result := Copy(Extension, 2, Length(Extension) - 1)
  else Result := Extension;
end;

//------------------------------------------------------------------------------

function GetExtensionID(var RG : TRegistry ; Extension : string ; Create : boolean) : string;
begin
  Result := '';
  if not Assigned(RG) then Exit;

  Extension := GetRealExt(Extension);
  
  RG.RootKey := HKEY_CLASSES_ROOT;    

  //Ouverture de la clef ".xxx", création s'il n'existe pas
  if not RG.OpenKey('.' + Extension, Create) then Exit;
                   
  Result := RG.ReadString(''); //lire la valeur par défaut, qui contient l'ID de l'extension
  if Result = '' then //il est vide donc l'extension n'existe pas
  begin
    Result := GetExtID(Extension); //création de l'ExtID
    RG.WriteString('', Result);   //ecriture dans le registre
  end;
  RG.CloseKey; //on retourne à la clef précédente (HKEY_CLASSES_ROOT)
end;

//------------------------------------------------------------------------------

end.
