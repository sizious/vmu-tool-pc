unit main;

interface

uses
 SysUtils, VmiStruct;

function CreateVmiFile(VmsSourceFile, VmiDestFile, Description, Copyright,
  DcFileName : PChar ; SaveType : TVmiType ; CopyAllowed : Boolean) : Boolean;
  stdcall; export;
  
procedure GenerateDefaultVmiFileName(VmsSourceFile : PChar ;
  var OutputFileName : PChar); stdcall; export;

implementation

//------------------------------------------------------------------------------

procedure GenerateDefaultVmiFileName(VmsSourceFile : PChar ;
  var OutputFileName : PChar); stdcall; export;
var
  VMI : TVmiBuilder;
  _vms_sourcefile, _generated_name : string;

begin
  _vms_sourcefile := PChar(VmsSourceFile);
  
  VMI := TVMIBuilder.Create(_vms_sourcefile);
  try
    _generated_name := VMI.GenerateDefaultVmiFileName;
    OutputFileName := PChar(_generated_name);
  finally
    VMI.Free;
  end;
end;

//------------------------------------------------------------------------------

function CreateVmiFile(VmsSourceFile, VmiDestFile, Description, Copyright,
  DcFileName : PChar ; SaveType : TVmiType ; CopyAllowed : Boolean) : Boolean;
  stdcall; export;
var
  VMI : TVmiBuilder;
  _vms_sourcefile, _vmi_destfile, _description, _copyright, _dc_filename : string;

begin
  _vms_sourcefile := PChar(VmsSourceFile);
  _description := PChar(Description);
  _copyright := PChar(Copyright);
  _dc_filename := PChar(DcFileName);
  _vmi_destfile := PChar(VmiDestFile);

  VMI := TVMIBuilder.Create(_vms_sourcefile);
  try
    with VMI.Fields do
    begin
      Description := _description;
      Copyright := _copyright;
      DcFileName := _dc_filename;
      FileType := SaveType;
      CopyProtection := not CopyAllowed; //c'est l'inverse !
    end;

    VMI.SaveToFile(_vmi_destfile);
    Result := FileExists(_vmi_destfile);
  finally
    VMI.Free;
  end;
end;

//------------------------------------------------------------------------------

end.
