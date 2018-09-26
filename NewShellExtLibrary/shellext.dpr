library shellext;

uses
  SysUtils,
  Classes,
  regext in 'regext.pas',
  regshell in 'regshell.pas',
  main in 'main.pas',
  regutils in 'regutils.pas',
  utils in 'utils.pas';

{$R *.res}
{$R icons.RES}

exports
  RegisterExtensions,
  UnregisterExtensions,
  RegisterMenu,
  UnregisterMenu,
  IsExtensionsRegistered,
  IsMenuRegistered;

begin
 
end.
