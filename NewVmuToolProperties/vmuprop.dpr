program vmuprop;

uses
  Windows,
  SysUtils,
  Forms,
  main in 'main.pas' {Main_Form},
  utils in 'utils.pas',
  u_config in 'u_config.pas',
  u_vmu_analyze in 'u_vmu_analyze.pas';

var
  VmiFile,
  FileExt : string;

{$R *.res}

begin
  Application.Initialize;

  VmiFile := ParamStr(1);

  if ParamCount = 0 then
  begin
    MsgBox(Application.Handle, 'This application can''t be launched alone.',
      'Warning', MB_ICONWARNING);
    Halt(1);
  end;

  if not FileExists(GetEngineFileName) then
  begin
    MsgBox(Application.Handle, 'Error, engine not found !'
     + WrapStr + 'File : "' + GetEngineFileName + '".', 'Error', MB_ICONERROR);
    Halt(1);
  end;

  if not FileExists(VmiFile) then
  begin
    MsgBox(Application.Handle, 'Error, file not found !'
     + WrapStr + 'File : "' + VmiFile + '".', 'Error', MB_ICONERROR);
    Halt(1);
  end;

  FileExt := LowerCase(ExtractFileExt(VmiFile));
  if (FileExt <> VMS_EXT) and (FileExt <> VMI_EXT) and (FileExt <> DCI_EXT) then
  begin
    MsgBox(Application.Handle, 'File extension "' + FileExt
      + '" not recognized.', 'Error', MB_ICONERROR);
    Halt(1);
  end;

  Application.Title := 'VMU TOOL PC Shell Integration';
  Application.CreateForm(TMain_Form, Main_Form);
  Main_Form.fFileName := VmiFile;

  //Configurer l'application
  ConfigureApplication;

  if FileExists(VmiFile) then
    Main_Form.AnalyzeFile(VmiFile);

  Application.Run;
end.
