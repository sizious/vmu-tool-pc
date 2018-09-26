program buildvmi_console;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  vmistruct in '..\vmistruct.pas',
  utils in '..\utils.pas';

var
  vmibuilder : TVmiBuilder;

begin
  vmibuilder := TVmiBuilder.Create('00000001.VMS');
  vmibuilder.Fields.Description := 'VMU Tool - Backup';
  vmibuilder.Fields.Copyright := 'http://blueswirl.shorturl.com';
  vmibuilder.Fields.DcFileName := 'V_TENNIS2___';
  vmibuilder.Fields.FileType := vtData;
  vmibuilder.Fields.CopyProtection := False;

  vmibuilder.SaveToFile;
  vmibuilder.Free;
end.
