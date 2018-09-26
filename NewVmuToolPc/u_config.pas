unit u_config;

interface

uses
  Windows, SysUtils, IniFiles, Forms, VmuToolPcListView, ComCtrls, VmuToolPc,
  PiconeBarreTache, Graphics;

procedure ConfigureApplication;
procedure QuitApplication;
function IsSplashEnabled : boolean;

implementation

uses
  Main, Utils, Options;

//------------------------------------------------------------------------------

//Permet d'extraire un à un les éléments d'une chaine séparés par un séparateur
function ExtractStr(SubStr : string ; S : string ; Index : integer) : string;
var
  i : integer;
begin
  S:=S+substr;
  for i:=1 to Index do
    S:=copy(s, pos(substr, s)+length(substr), length(s)-pos(substr, s)+length(substr));
  result:=copy(s, 1, pos(substr, s)-1);
end;

//------------------------------------------------------------------------------

procedure SetDefColumns;
var
  flv : TColumnsView;

begin
  flv := Main_Form.flv.ColumnsView;

  flv.ShowVmsResourceName := True;
  flv.ShowVmDescription := True;
  flv.ShowDcDescription := True;
  flv.ShowVmFileName := True;
  flv.ShowVmsSize := True;
  flv.ShowType := True;
  flv.ShowCopy := True;
  flv.ShowDate := True;
  Main_Form.UpdateListViewCaptions;
end;

//------------------------------------------------------------------------------

function GetIniFile : string;
begin
  Result := GetRealPath(ExtractFilePath(ParamStr(0))) + 'config.ini';
end;

//------------------------------------------------------------------------------

procedure LoadConfig;
var
  flv : TVmuToolPcListView;
  Ini : TIniFile;
  i, max, _size, _id : integer;
  _col_size, _col_visible : string;

  _vtp_opt : TOptions;
  _picone  : TPiconeBarreTache;

begin
  flv := Main_Form.flv;

  Ini := TIniFile.Create(GetIniFile);
  try
    //Restaurer les colonnes dans l'ordre et avec la taille que l'utilisateur
    //a spécifié à la fin du programme :)
    max := Ini.ReadInteger('ColView', 'Count', 0);
    _col_size := Ini.ReadString('ColView', 'Sizes', '');
    _col_visible := Ini.ReadString('ColView', 'Visibles', '');
    for i := 0 to max - 1 do
    begin
      _id := StrToInt(ExtractStr(',', _col_visible, i));
      _size := StrToInt(ExtractStr(',', _col_size, i));
      if _id <> 0 then
        flv.ChangeColState(TColumnType(_id), True);
      flv.Column[flv.Columns.Count - 1].Width := _size;
    end;
    
    //Lecture des options
    Main_Form.fCheckSumFormat := TCheckSumFormat(Ini.ReadInteger('Config', 'CheckSumFormat', 0));
    case Main_Form.fCheckSumFormat of
      csDecimal : Main_Form.Checksum1.Click;
      csHexa    : Main_Form.Checksum2.Click;
    end;
    Main_Form.fVmsSizeFormat := TVmsSizeFormat(Ini.ReadInteger('Config', 'VmsSizeFormat', 0));
    case Main_Form.fVmsSizeFormat of
      vsBlocks  : Main_Form.VMSSize1.Click;
      vsBytes   : Main_Form.VMSSize2.Click;
    end;
    Main_Form.fIconSizeFormat := TIconSizeFormat(Ini.ReadInteger('Config', 'IconSizeFormat', 0));
    case Main_Form.fIconSizeFormat of
      is24x24 : Main_Form.Icon1.Click;
      is32x32 : Main_Form.Icon2.Click;
      is16x16 : Main_Form.Icon3.Click;
    end;
    //le 3 c'est vsReport
    flv.ViewStyle := TViewStyle(Ini.ReadInteger('Config', 'ViewStyle', 3));
    case flv.ViewStyle of
      vsIcon      : Main_Form.Style4.Click;
      vsSmallIcon : Main_Form.Style3.Click;
      vsList      : Main_Form.Style2.Click;
      vsReport    : Main_Form.Style1.Click;
    end;

    //--- Boite de dialogue Options ---
    _vtp_opt := Main_Form.VmuToolPc.Options;
    _picone := Main_Form.PiconeBarreTache;

    //General
    Main_Form.fShowErrornousVmi := Ini.ReadBool('Options', 'ShowErrornousFiles', True);
    Main_Form.fAutoSelectFirst := Ini.ReadBool('Options', 'AutoSelect', True);
    _vtp_opt.ScanInvalidVms := Ini.ReadBool('Options', 'ScanInvalidVms', True);
    Main_Form.fConfirmClose := Ini.ReadBool('Options', 'ConfirmClose', True);
    Main_Form.fUseSplash := Ini.ReadBool('Options', 'ShowSplash', True);
    Main_Form.fAutoScrollView := Ini.ReadBool('Options', 'AutoScrollView', True);
    Main_Form.fScanAtStart := Ini.ReadBool('Options', 'ScanAtStart', True);

    //Tray Icon
    _picone.ReduireSiFin := Ini.ReadBool('Options', 'HideClose', False);
    _picone.CacherSiMinimize := Ini.ReadBool('Options', 'HideMinimize', True);
    _picone.PetiteIconeVisible := not Ini.ReadBool('Options', 'DisableTrayIcon', False);

    //Debug Log
    _vtp_opt.LogSuccessMsg := Ini.ReadBool('Options', 'LogSuccessMsg', True);
    _vtp_opt.LogStateMsg := Ini.ReadBool('Options', 'LogStateMsg', True);
    _vtp_opt.LogScanDirMsg := Ini.ReadBool('Options', 'LogScanDirMsg', True);
    Main_Form.fAutoScrollLog := Ini.ReadBool('Options', 'AutoScrollLog', True);

    Main_Form.fStateClr := StringToColor(Ini.ReadString('Options', 'StateClr', 'clBlue'));
    Main_Form.fSuccessClr := StringToColor(Ini.ReadString('Options', 'SuccessClr', 'clGreen'));
    Main_Form.fErrorClr := StringToColor(Ini.ReadString('Options', 'ErrorClr', 'clRed'));

    //Engine
    //Main_Form.fEngineType := TEngineType(Ini.ReadInteger('Options', 'EngineType', 0));
    //Main_Form.fExternalExecutable := Ini.ReadString('Options', 'ExternalExecutable', '');
    //Main_Form.SetVmuToolPcEngine; //appliquer la config pour l'engine

    //HexEdit
    Main_Form.fHexEdit.FileName := Ini.ReadString('HexEdit', 'FileName', '');
    Main_Form.fHexEdit.Parameters := Ini.ReadString('HexEdit', 'Parameters', '');

    //Charger la taille et la position de la fenêtre. La valeur par défaut est
    //mise dans l'IDE, à la conception (c'est simplement la même qu'avant quoi..)
    Main_Form.Width := Ini.ReadInteger('Display', 'FormWidth', Main_Form.Width);
    Main_Form.Height := Ini.ReadInteger('Display', 'FormHeight', Main_Form.Height);

    //Main_Form.Position := poDesigned;  //CA DETRUIT LA TRAY ICON !!!!!!!!!! :@
    Main_Form.Top := Ini.ReadInteger('Display', 'FormTop', Main_Form.Top);
    Main_Form.Left := Ini.ReadInteger('Display', 'FormLeft', Main_Form.Left);

    { Charger le dossier de démarrage.
      SI ET SEULEMENT SI le dossier de démarrage est vide.
      Ce paramètre sert aussi pour l'ouverture d'un dossier par paramètre de
      commande. }
    if Main_Form.fStartingDirectory = '' then
      Main_Form.fStartingDirectory := Ini.ReadString('Config', 'StartingDirectory', '');
  finally
    Ini.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure SaveConfig;
var
  flv : TVmuToolPcListView;
  Ini : TIniFile;
  i : integer;
  colview,
  colsize : string;

  _vtp_opt : TOptions;
  _picone  : TPiconeBarreTache;
  
begin
  flv := Main_Form.flv;

  Ini := TIniFile.Create(GetIniFile);
  try
    //Ecriture des colonnes et de leur taille.
    colview := '';
    colsize := '';
    for i := 0 to flv.Columns.Count - 1 do
    begin
      colview := colview + IntToStr(flv.Column[i].Tag) + ',';
      colsize := colsize + IntToStr(flv.Column[i].Width) + ',';
    end;
    colview := Copy(colview, 1, Length(colview) - 1);
    colsize := Copy(colsize, 1, Length(colsize) - 1);
    Ini.WriteString('ColView', 'Visibles', colview);
    Ini.WriteString('ColView', 'Sizes', colsize);
    Ini.WriteInteger('ColView', 'Count', flv.Columns.Count);
    
    //Ecriture des options
    Ini.WriteInteger('Config', 'CheckSumFormat', Integer(Main_Form.fCheckSumFormat));
    Ini.WriteInteger('Config', 'VmsSizeFormat', Integer(Main_Form.fVmsSizeFormat));
    Ini.WriteInteger('Config', 'IconSizeFormat', Integer(Main_Form.fIconSizeFormat));
    Ini.WriteInteger('Config', 'ViewStyle', Integer(flv.ViewStyle));

    //Boite de dialogue Options
    { Ini.WriteBool('Options', 'ShowErrornousFiles', Options_Form.cbShowErrornousFiles.Checked);
    Ini.WriteBool('Options', 'Associate', Options_Form.cbAssociate.Checked);
    Ini.WriteInteger('Options', 'TrayIcon', Options_Form.rgTrayIcon.ItemIndex);
    Ini.WriteBool('Options', 'AutoSelect', Options_Form.cbAutoSelect.Checked); }

    //--- Boite de dialogue Options ---
    _vtp_opt := Main_Form.VmuToolPc.Options;
    _picone := Main_Form.PiconeBarreTache;

    //General
    Ini.WriteBool('Options', 'ShowErrornousFiles', Main_Form.fShowErrornousVmi);
    Ini.WriteBool('Options', 'AutoSelect', Main_Form.fAutoSelectFirst);
    Ini.WriteBool('Options', 'ScanInvalidVms', _vtp_opt.ScanInvalidVms);
    Ini.WriteBool('Options', 'ConfirmClose', Main_Form.fConfirmClose);
    Ini.WriteBool('Options', 'ShowSplash', Main_Form.fUseSplash);
    Ini.WriteBool('Options', 'AutoScrollView', Main_Form.fAutoScrollView);
    Ini.WriteBool('Options', 'ScanAtStart', Main_Form.fScanAtStart);

    //Tray Icon
    Ini.WriteBool('Options', 'HideClose', _picone.ReduireSiFin);
    Ini.WriteBool('Options', 'HideMinimize', _picone.CacherSiMinimize);
    Ini.WriteBool('Options', 'DisableTrayIcon', (not _picone.PetiteIconeVisible));

    //Debug Log
    Ini.WriteBool('Options', 'LogSuccessMsg', _vtp_opt.LogSuccessMsg);
    Ini.WriteBool('Options', 'LogStateMsg', _vtp_opt.LogStateMsg);
    Ini.WriteBool('Options', 'LogScanDirMsg', _vtp_opt.LogScanDirMsg);
    Ini.WriteBool('Options', 'AutoScrollLog', Main_Form.fAutoScrollLog);

    Ini.WriteString('Options', 'StateClr', ColorToString(Main_Form.fStateClr));
    Ini.WriteString('Options', 'SuccessClr', ColorToString(Main_Form.fSuccessClr));
    Ini.WriteString('Options', 'ErrorClr', ColorToString(Main_Form.fErrorClr));

    //Engine
    //Ini.WriteInteger('Options', 'EngineType', Integer(Main_Form.fEngineType));
    //Ini.WriteString('Options', 'ExternalExecutable', Main_Form.fExternalExecutable);

    //HexEdit
    Ini.WriteString('HexEdit', 'FileName', Main_Form.fHexEdit.FileName);
    Ini.WriteString('HexEdit', 'Parameters', Main_Form.fHexEdit.Parameters);

    //Sauver la taille et la position de la fenêtre
    Ini.WriteInteger('Display', 'FormWidth', Main_Form.Width);
    Ini.WriteInteger('Display', 'FormHeight', Main_Form.Height);
    Ini.WriteInteger('Display', 'FormTop', Main_Form.Top);
    Ini.WriteInteger('Display', 'FormLeft', Main_Form.Left);

    //Ecriture du dernier dossier pris en compte.
    Ini.WriteString('Config', 'StartingDirectory', Main_Form.vecbx.Path);
  finally
    Ini.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure ConfigureApplication;
begin
  if not FileExists(GetIniFile) then
  begin
    SetDefColumns;
    Exit;
  end;

  LoadConfig;
end;

//------------------------------------------------------------------------------

procedure QuitApplication;
begin
  SaveConfig;
  Application.Terminate;
end;

//------------------------------------------------------------------------------

function IsSplashEnabled : boolean;
var
  Ini : TIniFile;

begin
  Ini := TIniFile.Create(GetIniFile);
  try
    Result := Ini.ReadBool('Options', 'ShowSplash', True);
  finally
    Ini.Free;
  end;
end;

//------------------------------------------------------------------------------

end.
