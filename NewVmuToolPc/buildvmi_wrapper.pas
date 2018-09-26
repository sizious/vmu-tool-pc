unit buildvmi_wrapper;

interface

uses
  VmuToolPc;
  
//Défini dans VmuToolPc.
//type
//   TVmiType = (vtData, vtGame);
   
function CreateVmiFile(VmsSourceFile, VmiDestFile, Description, Copyright,
  DcFileName : PChar ; FileType : TVmiType ; CopyProtection : Boolean) : Boolean;
  stdcall; external 'buildvmi.dll';

function GenerateDefaultVmiFileName(VmsSourceFile : string) : string; overload;

implementation

procedure GenerateDefaultVmiFileName(VmsSourceFile : PChar ;
  var OutputFileName : PChar); stdcall; external 'buildvmi.dll'; overload;

function GenerateDefaultVmiFileName(VmsSourceFile : string) : string; overload;
var
  DefaultName : PChar;
  
begin
  GenerateDefaultVmiFileName(PChar(VmsSourceFile), DefaultName);
  Result := DefaultName;
end;

end.
