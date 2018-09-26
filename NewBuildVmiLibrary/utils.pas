unit utils;

interface

uses
  SysUtils;

function ApplyCase(StrToGenerate, StrModel : string) : string;
function Left(SubStr : string ; S : string): string;

implementation

//Savoir si un caractère passé en paramètre est en minuscule.
function IsLowCase(c : Char) : Boolean;
var
  _ord_c : Byte;

begin
  _ord_c := Ord(c);

  Result := (_ord_c > Ord('a')) and (_ord_c < Ord('z'));
end;

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

function Left(SubStr : string ; S : string): string;
begin
  result:=copy(s, 1, pos(substr, s)-1);
end;

end.