unit u_vmu_analyze;

interface

uses
  Windows, SysUtils, VmuToolPc, Forms;

const
  VMS_EXT    : string = '.vms';
  VMI_EXT    : string = '.vmi';
  DCI_EXT    : string = '.dci';

var
  Errornous : boolean;
  ErrorMsg  : string;

function GetInfos(VmiFile : TFileName ; var VmiStruct : TSaveFile) : boolean;

implementation

uses
  main, u_config, utils;

//------------------------------------------------------------------------------

function GetInfos(VmiFile : TFileName ; var VmiStruct : TSaveFile) : boolean;
var
  VmuToolPc : TVmuToolPc;
//  _vmi_ext_runned_by_vms : string;
  
begin
  Result := False;
  
  VmuToolPc := TVmuToolPc.Create(Application);
  try
    VmuToolPc.Executable := GetEngineFileName;
    VmuToolPc.OnStatus :=  Main_Form.VmuToolPcStatus;

    if LowerCase(ExtractFileExt(VmiFile)) = VMS_EXT then
      //VmiFile := ChangeFileExt(VmiFile, _vmi_ext_runned_by_vms); // appliquer la même case
      VmiFile := GetVmiFileOnDisk(VmiFile); //VmiFile passé en parametre est un VMS !!!

    if not FileExists(VmiFile) then
    begin
      MsgBox(Main_Form.Handle, 'Unable to read associated VMI ' + VmiFile
        + '. (VMI not found).', 'Error', MB_ICONERROR);
      //Halt(1);
      Exit;
    end;   

    Result := VmuToolPc.GetVmiInfos(VmiFile, VmiStruct);

    if Errornous then
    begin
      MsgBox(Main_Form.Handle, ErrorMsg, 'Error', MB_ICONERROR);
      //Halt(1);
      Exit;
    end;

  finally
    //msgbox(0, booltostr(errornous), 'ok', 0);
    VmuToolPc.Free;
    //if errornous then msgbox(0, 'exiting', 'error', 0);
    if Errornous then Halt(1);
  end;
end;

//------------------------------------------------------------------------------

end.
