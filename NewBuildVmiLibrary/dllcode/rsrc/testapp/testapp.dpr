program testapp;

uses
  Forms,
  main in 'main.pas' {BuildVmi_Form},
  buildvmi_wrapper in '..\..\wrapper\buildvmi_wrapper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBuildVmi_Form, BuildVmi_Form);
  Application.Run;
end.
