program AboutBox;

uses
  Forms,
  oldskool in 'oldskool.pas' {About_Form},
  MiniFMOD in 'MiniFMOD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOldSkoolAbout_Form, OldSkoolAbout_Form);
  Application.Run;
end.
