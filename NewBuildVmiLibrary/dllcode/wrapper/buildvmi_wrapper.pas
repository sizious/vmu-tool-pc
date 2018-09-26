unit buildvmi_wrapper;

interface

type
   TVmiType = (vtData, vtGame);
   
function CreateVmiFile(VmsSourceFile, VmiDestFile, Description, Copyright,
  DcFileName : PChar ; SaveType : TVmiType ; CopyAllowed : Boolean) : Boolean;
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
