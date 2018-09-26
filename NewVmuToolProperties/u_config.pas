unit u_config;

interface

uses
  Windows, SysUtils, IniFiles, VmuToolPc;

procedure ConfigureApplication;

implementation

uses
  main, utils;

//------------------------------------------------------------------------------

function GetIniFile : string;
begin
  Result := GetRealPath(ExtractFilePath(ParamStr(0))) + 'config.ini';
end;

//------------------------------------------------------------------------------

procedure LoadConfig;
var
  Ini : TIniFile;

begin
  Ini := TIniFile.Create(GetIniFile);
  try
    Main_Form.fCheckSumFormat := TCheckSumFormat(Ini.ReadInteger('Config', 'CheckSumFormat', 0));
    Main_Form.fVmsSizeFormat := TVmsSizeFormat(Ini.ReadInteger('Config', 'VmsSizeFormat', 0));
  finally
    Ini.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure LoadDefault;
begin
  Main_Form.fCheckSumFormat := csDecimal;
  Main_Form.fVmsSizeFormat := vsBytes;
end;

//------------------------------------------------------------------------------

procedure ConfigureApplication;
begin
  //Pas besoin de dessin je crois...
  if not FileExists(GetIniFile) then
    LoadDefault //config par défaut
  else LoadConfig; //charger la config de VMU TOOL PC (ce qui nous interresse)

  case Main_Form.fVmsSizeFormat of
    vsBytes   : Main_Form.VmsSize_Label.Caption := Main_Form.VmsSize_Label.Caption
      + ' (bytes) :';
    vsBlocks  : Main_Form.VmsSize_Label.Caption := Main_Form.VmsSize_Label.Caption
      + ' (blocks) :';
  end;
end;

//------------------------------------------------------------------------------

end.
