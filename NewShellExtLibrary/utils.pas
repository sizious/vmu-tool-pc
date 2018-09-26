unit utils;

interface

uses
  Windows, SysUtils;
  
function GetIconIndex(Index : integer) : string;
function Sto_GetModuleName: String;

implementation

//------------------------------------------------------------------------------

function Sto_GetModuleName: String;
var
  szFileName: array[0..MAX_PATH] of Char;

begin
  GetModuleFileName(hInstance, szFileName, MAX_PATH);
  Result := szFileName;
end;

//------------------------------------------------------------------------------

function GetIconIndex(Index : integer) : string;
begin
  Result := Sto_GetModuleName + ',' + IntToStr(Index);
end;

//------------------------------------------------------------------------------

end.
