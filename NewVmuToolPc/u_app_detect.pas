unit u_app_detect;

interface

uses
  Windows, SysUtils, Psapi, TLHelp32, Forms;

function IsOtherInstanceRunning : boolean;

implementation

//------------------------------------------------------------------------------

// Columbo
// Inspiré de http://www.swissdelphicenter.ch/torry/showcode.php?id=616
function GetProcessInstancesLaunchedCount(AppExeName : string) : byte;
var
  ovi: TOSVersionInfo;
  PIDArray: array [0..1023] of DWORD;
  cb: DWORD;
  I: Integer;
  ProcCount: Integer;
  hMod: HMODULE;
  hProcess: THandle;
  ModuleName: array [0..300] of Char;
  ProcInfo: TProcessEntry32;
begin
    result:=0;
    ovi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
    GetVersionEx(ovi);
    case ovi.dwPlatformId of
    VER_PLATFORM_WIN32_NT:
    begin
          EnumProcesses(@PIDArray, SizeOf(PIDArray), cb);
          ProcCount := cb div SizeOf(DWORD);
          for I := 0 to ProcCount - 1 do
          begin
              hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, PIDArray[I]);
              if (hProcess <> 0) then
              begin
                    EnumProcessModules(hProcess, @hMod, SizeOf(hMod), cb);
                    GetModuleFilenameEx(hProcess, hMod, ModuleName, SizeOf(ModuleName));
                    if UpperCase(ModuleName)=UpperCase(AppExeName) then Inc(result);
                    CloseHandle(hProcess);
              end;
          end;
    end
    else
    begin
          hProcess := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
          if (hProcess <> THandle(-1)) then
          begin
              ProcInfo.dwSize := SizeOf(ProcInfo);
              if (Process32First(hProcess, ProcInfo)) then
              repeat
                    if UpperCase(ProcInfo.szExeFile)=UpperCase(AppExeName) then Inc(result);
              until not (Process32Next(hProcess, ProcInfo));
              CloseHandle(hProcess);
          end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function IsOtherInstanceRunning : boolean;
begin
  Result := GetProcessInstancesLaunchedCount(Application.ExeName) > 1;
end;

//------------------------------------------------------------------------------

end.
