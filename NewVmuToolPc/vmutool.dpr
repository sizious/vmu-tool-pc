program vmutool;

uses
  Windows,
  SysUtils,
  Messages,
  Forms,
  main in 'main.pas' {Main_Form},
  showcol in 'showcol.pas' {ColView_Form},
  movecol in 'movecol.pas' {MoveCol_Form},
  options in 'options.pas' {Options_Form},
  u_interpolation_biLineaire in 'u_interpolation_bilineaire.pas',
  u_config in 'u_config.pas',
  utils in 'utils.pas',
  u_file_op_mgr in 'u_file_op_mgr.pas',
  Splash in 'splash.pas' {Splashfrm},
  u_rcolors in 'u_rcolors.pas',
  u_gif_creator in 'u_gif_creator.pas',
  debug_handler in 'debug_handler.pas' {DebugHandler_Form},
  u_shellext_wrapper in 'u_shellext_wrapper.pas',
  u_app_detect in 'u_app_detect.pas',
  buildvmi in 'buildvmi.pas' {BuildVmi_Form},
  buildvmi_wrapper in 'buildvmi_wrapper.pas',
  MiniFMOD in '..\AboutVmuToolPc\MiniFMOD.pas',
  oldskool in '..\AboutVmuToolPc\oldskool.pas' {OldSkoolAbout_Form},
  about in '..\AboutVmuToolPc\about.pas' {About_Form};

{$R *.res}

var
  vmuprop_hwnd : THandle;
  
//------------------------------------------------------------------------------

begin
  Application.Initialize;
  Application.Title := 'VMU TOOL PC';

  //Affichage de l'écran Splash
  if IsSplashEnabled then
  begin

    SplashFrm := TSplashFrm.Create(Application);
    try
      SplashFrm.Show;
      SplashFrm.DoFade(100);

      { Le mieux aurait été de charger ici. Mais comme le splash est désactivable,
        ca serait très con de créer la form pour se rendre compte que finalement,
        on va pas l'afficher... }
    finally
      SplashFrm.Free;
    end;

  end;

  Application.CreateForm(TMain_Form, Main_Form);
  // une erreur peut surgir n'importe quand donc on crée le Debug Handler ici
  Application.CreateForm(TDebugHandler_Form, DebugHandler_Form);
  //Application.CreateForm(TAbout_Form, About_Form);
  //Application.CreateForm(TOldSkoolAbout_Form, OldSkoolAbout_Form);
  //Application.CreateForm(TBuildVmi_Form, BuildVmi_Form);
  //Application.CreateForm(TSplashfrm, Splashfrm);
  //Application.CreateForm(TColView_Form, ColView_Form);
  //Application.CreateForm(TMoveCol_Form, MoveCol_Form);
  //Application.CreateForm(TOptions_Form, Options_Form);

  { Transmettre le dossier de démarrage (à scanner dès l'ouverture).
    Si le paramètre est vide, on va charger celui qui est dans le INI.
    il faut differencier les deux possibilités car celle qui scanne a partir du
    INI est une option. }
  Main_Form.fStartingDirectory := ExpandFileName(ParamStr(1));
  Main_Form.fFromCmdLine := ParamStr(1) <> '';

  // fermer si spécifié une fenêtre de VMUPROP (paramêtre 4)
  if (LowerCase(ParamStr(2)) = '-extern') then
  begin
    vmuprop_hwnd := FindWindow(nil, PChar(ParamStr(3)));
    if vmuprop_hwnd <> 0 then SendMessage(vmuprop_hwnd, WM_CLOSE, 0, 0);
   // messageboxa(0, pchar(paramstr(3)), '', 0);
  end;

  //Charger la config
  ConfigureApplication;

  Application.Run;

  //Il faut vérifier qu'il n'y a pas une autre instance avant d'effacer le dossier...
  if not IsOtherInstanceRunning then ClearTempDirectory;
end.
