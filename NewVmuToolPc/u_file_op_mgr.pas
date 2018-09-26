unit u_file_op_mgr;

interface

uses
  Windows, SysUtils, Classes, VmuToolPc, ShellApi;

procedure DoCopyFilesOperation(MoveFile : boolean = False);
procedure DoDeleteFilesOperation;

implementation

uses
  Main, Utils;
  
type
  TFileType = (ftVmsOnly, ftVmiOnly, ftBoth, ftDci);

//==[Partie Utilitaires]========================================================

//------------------------------------------------------------------------------

function CopyFileTo(SrcFile, DestFile : string ; FailIfExists : boolean = True) : boolean;
var
  src, dest : TFileStream;

begin
  Result := False;
  if not FileExists(SrcFile) then Exit;
  if FailIfExists and FileExists(DestFile) then Exit;

  src := TFileStream.Create(SrcFile, fmOpenRead);
  try
    dest := TFileStream.Create(DestFile, fmCreate);
    try
      Result := (dest.CopyFrom(src, 0)) > 0;
    finally
      dest.Free;
    end;
  finally
    src.Free;
  end;
end;

//------------------------------------------------------------------------------

function DeleteFileWithUndo(sFileName : string ): boolean;
var
  fos : TSHFileOpStruct;
begin
  Result := False;
  if not FileExists(sFileName) then Exit;
  
  FillChar( fos, SizeOf( fos ), 0 );
  with fos do
  begin
    wFunc  := FO_DELETE;
    pFrom  := PChar( sFileName );
    fFlags := FOF_ALLOWUNDO
              or FOF_NOCONFIRMATION
              or FOF_SILENT;
  end;
  Result := ( 0 = ShFileOperation( fos ) );

  //Ah bon, l'effacement par la corbeille bugge ? On va l'effacer normal alors !
  if not Result then
    Result := DeleteFile(sFileName);
end;
//------------------------------------------------------------------------------

function GetFileType(SrcVmi, SrcVms : string) : TFileType;
begin
  //Le fichier source est un unique fichier VMS.
  if LowerCase(ExtractFileExt(SrcVmi)) = '.vms' then
  begin
    Result := ftVmsOnly;
    Exit;
  end;

  if LowerCase(ExtractFileExt(SrcVmi)) = '.dci' then
  begin
    Result := ftDci;
    Exit;
  end;
  
  //A partir d'ici, le fichier SrcVmi est obligatoirement un VMI.
  if Main_Form.VmuToolPc.Files[Main_Form.fCurrentVmi].Errornous <> etNoError then
  begin
    Result := ftVmiOnly;
    Exit;
  end;

  //C'est un fichier VMI valide + un VMS.
  Result := ftBoth;  
end;

//------------------------------------------------------------------------------

function CheckFilesExists(FileType : TFileType ; SrcVmi, SrcVms : string) : boolean;
begin
  case FileType of
    ftBoth : Result := FileExists(SrcVmi) and FileExists(SrcVms);
    else Result := FileExists(SrcVmi); //Peut-être un VMI ou un VMS, dépend de FileType.
  end;
end;

//==[Partie Utilisation]========================================================

//------------------------------------------------------------------------------

procedure DoDeleteFilesOperation;
var
  SrcVmi, SrcVms, S : string;
  DelType : TFileType;
  _answer, _lv_index : integer;
  OK : boolean;
  
begin
  _lv_index := Main_Form.flv.ItemIndex;
  SrcVmi := Main_Form.VmuToolPc.Files[Main_Form.fCurrentVmi].FileName;
  SrcVms := ChangeFileExt(SrcVmi, ApplyCase('.vms', ExtractFileExt(SrcVmi)));
  DelType := GetFileType(SrcVmi, SrcVms);

  if not CheckFilesExists(DelType, SrcVmi, SrcVms) then
  begin
    case DelType of
      ftBoth    : S := 'VMI and/or VMS';
      ftVmsOnly : S := 'VMS';
      ftVmiOnly : S := 'VMI';
      ftDci     : S := 'DCI';
    end;

   MsgBox(Main_Form.Handle, 'Source(s) file(s) (' + S + ') have been deleted !',
      'Error', MB_ICONWARNING);
    Exit;
  end;

  if DelType = ftBoth then
    S := 'files "' + ExtractFileName(SrcVmi) + '" and "' + ExtractFileName(SrcVms) + '"'
  else S := 'the file "' + ExtractFileName(SrcVmi) + '"';

  _answer := MsgBox(Main_Form.Handle, 'Are you sure to delete ' + S + ' ?'
    + WrapStr + 'Please remember this operation can NOT be canceled !',
    'Warning', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2);
  if _answer = IDNO then Exit;

  OK := DeleteFileWithUndo(SrcVmi);
  if DelType = ftBoth then
    OK := OK and DeleteFileWithUndo(SrcVms);

  if OK then
  begin
    if (_lv_index > -1) and (_lv_index < Main_Form.flv.Items.Count) then
      Main_Form.flv.Items[_lv_index].Delete;
    Main_Form.sbMain.Panels[3].Text := IntToStr(StrToInt(Main_Form.sbMain.Panels[3].Text) - 1);
    MsgBox(Main_Form.Handle, 'File(s) deleted successfully.', 'Information',
      MB_ICONINFORMATION);
  end else
      MsgBox(Main_Form.Handle, 'Error when deleting the files !', 'Error', MB_ICONERROR);
end;

//------------------------------------------------------------------------------

procedure DoCopyFilesOperation(MoveFile : boolean = False);
var
  SrcVmi, SrcVms,
  DestVmi, DestVms, S, Path : string;
  CopyType : TFileType;
  _answer, _lv_index : integer;
  OK : boolean;

begin
  _lv_index := Main_Form.flv.ItemIndex;
  SrcVmi := Main_Form.VmuToolPc.Files[Main_Form.fCurrentVmi].FileName;
  SrcVms := ChangeFileExt(SrcVmi, ApplyCase('.vms', ExtractFileExt(SrcVmi)));
  CopyType := GetFileType(SrcVmi, SrcVms);

  if not CheckFilesExists(CopyType, SrcVmi, SrcVms) then
  begin
    case CopyType of
      ftBoth    : S := 'VMI and/or VMS';
      ftVmsOnly : S := 'VMS';
      ftVmiOnly : S := 'VMI';
      ftDci     : S := 'DCI';
    end;

   MsgBox(Main_Form.Handle, 'Source(s) file(s) (' + S + ') have been deleted !',
      'Error', MB_ICONWARNING);
    Exit;
  end;  

  if MoveFile then
    S := 'Move '
  else S := 'Copy ';

  with Main_Form.bfdFile do
  begin
    Title := 'Pick your folder... ;)';
    case CopyType of 
      ftBoth  : StatusText := S + 'files "' + ExtractFileName(SrcVmi) + '" and "'
                  + ExtractFileName(SrcVms) + '" to :';
      else StatusText := S + 'file "' + ExtractFileName(SrcVmi) + '" to :'; //VMS ou VMI (dépend de FileType)
    end;

    if Execute then
    begin
      Path := GetRealPath(Directory + '\');
      if UpperCase(Path) = UpperCase(ExtractFilePath(SrcVmi)) then
      begin
        MsgBox(Main_Form.Handle, 'Error the same directory was specified. Aborted.',
          'Warning', MB_ICONWARNING);
        Exit;
      end;

      DestVmi := Path + ExtractFileName(SrcVmi);
      DestVms := Path + ExtractFileName(SrcVms);

      //Vérifier si les fichiers de destination n'existent pas déjà.
      if FileExists(DestVmi) or FileExists(DestVms) then
      begin
        _answer := MsgBox(Main_Form.Handle, 'File(s) already exists in the'
          + ' selected directory.' + WrapStr + 'Delete them ' +
          'and continue ?', 'Confirm replacement', MB_ICONWARNING + MB_YESNO +
          MB_DEFBUTTON2);
        if _answer = IDNO then Exit;

        //Effacer les fichiers sources pour les remplacer
        OK := DeleteFileWithUndo(DestVmi);
        OK := OK and DeleteFileWithUndo(DestVms);
        if not OK then
        begin
          _answer := MsgBox(Main_Form.Handle, 'Error when deleting file(s). Continue ?',
            'Error', MB_ICONERROR + MB_YESNO);
          if _answer = IDNO then Exit;
        end;
      end;

      //OK := False;
      
      //Tout a été controlé, on peut donc faire notre copie (enfin !)
      //... ou même déplacer les fichiers.
      OK := CopyFileTo(SrcVmi, DestVmi, True);
      
      if OK and MoveFile then
      begin
        DeleteFileWithUndo(SrcVmi); //effacer le VMI OU le VMS.

        if (_lv_index > -1) and (_lv_index < Main_Form.flv.Items.Count) then
          Main_Form.flv.Items[_lv_index].Delete;

        Main_Form.sbMain.Panels[3].Text := IntToStr(StrToInt(Main_Form.sbMain.Panels[3].Text) - 1);
      end;

      if CopyType = ftBoth then
      begin
        OK := OK and CopyFileTo(SrcVms, DestVms, True);
        if OK and MoveFile then DeleteFileWithUndo(SrcVms); //effacer le VMS
      end;

      if MoveFile then
        S := 'Moving '
      else S := 'Copying ';

      if OK then
        MsgBox(Main_Form.Handle, S + 'operation successfully completed.',
          'Information', MB_ICONINFORMATION)
        else MsgBox(Main_Form.Handle, S + 'operation failed !' + WrapStr
          + 'Try to check your Recycle Bin, may be the function' + WrapStr
          + 'to delete the file with this method worked.', 'DAMN!!! Error !!! :@',
          MB_ICONERROR);
      
    end; //if Execute then...

  end;
end;

end.
