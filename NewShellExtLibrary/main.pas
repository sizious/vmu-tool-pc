unit main;

interface

uses
  Windows, SysUtils, RegExt, RegShell, Registry;

const
  VMS_EXT   : string = 'VMS';
  VMI_EXT   : string = 'VMI';
  DCI_EXT   : string = 'DCI';
  VMS_DESC  : string = 'Visual Memory System File';
  VMI_DESC  : string = 'Visual Memory Information File';
  DCI_DESC  : string = 'Dreamcast Nexus Save File';
  VMS_ICON  : integer = 0;
  VMI_ICON  : integer = 1;
  DCI_ICON  : integer = 2;

  VMUPROP_EXE : string = 'vmuprop.exe';
  
  APP_NAME  : string = 'VMU_TOOL_PC';

{  VMS_MENU  : string = 'open';
  VMI_MENU  : string = 'open';
  DCI_MENU  : string = 'open';
}

function RegisterExtensions : boolean; stdcall; export;
function UnregisterExtensions : boolean; stdcall; export;
function RegisterMenu(AppLocation : PChar) : boolean; stdcall; export;
function UnregisterMenu : boolean; stdcall; export;
function IsExtensionsRegistered : boolean; stdcall; export;
function IsMenuRegistered : boolean; stdcall; export;

implementation

uses
  RegUtils, Utils, ShlObj;

//------------------------------------------------------------------------------

function RegisterExtensions : boolean; stdcall; export;
begin
  Result := CreateExtension(VMS_EXT, VMS_DESC, GetIconIndex(VMS_ICON));
  Result := Result and CreateExtension(VMI_EXT, VMI_DESC, GetIconIndex(VMI_ICON));
  Result := Result and CreateExtension(DCI_EXT, DCI_DESC, GetIconIndex(DCI_ICON));

  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

//------------------------------------------------------------------------------

function UnregisterExtensions : boolean; stdcall; export;
begin
  Result := DeleteExtension(VMS_EXT);
  Result := Result and DeleteExtension(VMI_EXT);
  Result := Result and DeleteExtension(DCI_EXT);

  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

//------------------------------------------------------------------------------

function IsMenuRegistered : boolean; stdcall; export;
begin
  {Result := ContextMenuExists(VMS_EXT, APP_NAME)
    and ContextMenuExists(VMI_EXT, APP_NAME)
    and ContextMenuExists(DCI_EXT, APP_NAME);}

  Result := DefaultContextMenuExists(VMS_EXT)
    and DefaultContextMenuExists(VMI_EXT)
    and DefaultContextMenuExists(DCI_EXT);
end;

//------------------------------------------------------------------------------

function IsExtensionsRegistered : boolean; stdcall; export;
begin
  Result := IsAlreadySet(VMS_EXT, VMS_ICON) and IsAlreadySet(VMI_EXT, VMI_ICON)
    and IsAlreadySet(DCI_EXT, DCI_ICON);
end;

//------------------------------------------------------------------------------

function RegisterMenu(AppLocation : PChar) : boolean; stdcall; export;
begin
  { Result := AddContextMenuItem(VMS_EXT, APP_NAME, VMS_MENU, AppLocation + ' "%1"');
  Result := Result and AddContextMenuItem(VMI_EXT, APP_NAME, VMI_MENU, AppLocation + ' "%1"');
  Result := Result and AddContextMenuItem(DCI_EXT, APP_NAME, DCI_MENU, AppLocation + ' "%1"'); }
  
  Result := AddDefaultContextMenuItem(VMS_EXT, '"' + AppLocation + '" "%1"');
  Result := Result and AddDefaultContextMenuItem(VMI_EXT, '"' + AppLocation + '" "%1"');
  Result := Result and AddDefaultContextMenuItem(DCI_EXT, '"' + AppLocation + '" "%1"');
end;

//------------------------------------------------------------------------------

function UnregisterMenu : boolean; stdcall; export;
begin
  {Result := RemoveContextMenuItem(VMS_EXT, APP_NAME);
  Result := Result and RemoveContextMenuItem(VMI_EXT, APP_NAME);
  Result := Result and RemoveContextMenuItem(DCI_EXT, APP_NAME);}

  Result := RemoveDefaultContextMenuItem(VMS_EXT);
  Result := Result and RemoveDefaultContextMenuItem(VMI_EXT);
  Result := Result and RemoveDefaultContextMenuItem(DCI_EXT);
end;

//------------------------------------------------------------------------------

end.
