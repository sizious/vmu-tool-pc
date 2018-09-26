program fontmap;

uses
  Forms,
  main in 'main.pas' {Main_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
