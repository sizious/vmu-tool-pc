unit u_shellext_wrapper;

interface

function RegisterExtensions : boolean; stdcall; external 'shellext.dll';
function UnregisterExtensions : boolean; stdcall; external 'shellext.dll';
function RegisterMenu(AppLocation : PChar) : boolean; stdcall; external 'shellext.dll';
function UnregisterMenu : boolean; stdcall; external 'shellext.dll';
function IsExtensionsRegistered : boolean; stdcall; external 'shellext.dll';
function IsMenuRegistered : boolean; stdcall; external 'shellext.dll';

implementation

end.