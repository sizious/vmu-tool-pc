//{$DEFINE ABOUT_ALONE}
unit oldskool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls {$IFNDEF ABOUT_ALONE}, Main {$ENDIF}; //main est pour exporter les infos de
    //versions qui sont ci-dessous.

{$IFDEF ABOUT_ALONE}
const
  PRG_VERSION : string = '1.0';
  PRG_DATE    : string = '16 may 2006';
{$ENDIF}

type
  TOldSkoolAbout_Form = class(TForm)
    pCloseOut: TPanel;
    pClose: TPanel;
    bClose: TButton;
    ScriptIdleTimer: TTimer;
    IntroTimer: TTimer;
    OutroTimer: TTimer;
    closeTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure pCloseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pCloseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IntroTimerTimer(Sender: TObject);
    procedure ScriptIdleTimerTimer(Sender: TObject);
    procedure OutroTimerTimer(Sender: TObject);
    procedure closeTimerTimer(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    // --- Bitmap Font ---
    CharsCount : Word;
    Font : array of TBitmap;

    // --- Star Field ---
    StarsTimer : TTimer;

    // --- Bitmap Font ---
    procedure CreateFont;
    procedure CreateBitmapLabel(const str: TCaption ; DestImage : TBitmap);
    procedure StrToIndex(S: string; var CharsIndexArray: array of Word);
    procedure FinalizeFont;

    // --- Star Field ---
    procedure NouvelleEtoile(Index: Integer);
    procedure ShowStars;
    procedure InitStars;
    procedure AnimateStarsFieldTimer(Sender: TObject);
    procedure FinalizeStarsField;
//    procedure RefreshAllTimer(Sender : TObject);
    procedure InitScript;
    procedure FinalizeScript;
    procedure NewSequence(const str : TCaption ; const str2 : TCaption = '' ;
      const str3 : TCaption = '' ; const str4 : TCaption = '');
//    procedure AnimateIntro(Sender: TObject);
//    procedure AnimateOutroTimer(Sender: TObject);
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  OldSkoolAbout_Form: TOldSkoolAbout_Form;

procedure ShowOldSkoolAbout;

implementation

{$R *.dfm}

uses
  MiniFMOD;

// ====[ Main ]=================================================================

procedure ShowOldSkoolAbout;
begin
  OldSkoolAbout_Form := TOldSkoolAbout_Form.Create(Application);
  try
    OldSkoolAbout_Form.ShowModal;
  finally
    OldSkoolAbout_Form.Free;
  end;
end;

// ====[ Bitmap Font ]==========================================================

const
  FONT_CHAR_WIDTH     : Word = 32;
  FONT_CHAR_HEIGHT    : Word = 25;
  
  ALPHA_START_INDEX   : Word = 33; // A .. Z
  NUMERIC_START_INDEX : Word = 16; // 0 .. 9

  EXCL                : Word = 1; // !
  ARROW_LEFT          : Word = 8; // <
  ARROW_RIGHT         : Word = 9; // >
  SPACE               : Word = 0; // espace
  APOSTROP            : Word = 7; // '
  MINUS               : Word = 13; // -
  TWO_DOT             : Word = 26; // :
  DOT                 : Word = 14; // .
  COMMA               : Word = 12; // ,

{$R rsrc.RES}

procedure TOldSkoolAbout_Form.CreateFont;
var
  X, Y : Word;
  i : Word;
  _font_src : TBitmap;

begin
  _font_src := TBitmap.Create;
  try

    _font_src.Handle := LoadBitmap(hInstance, PChar('FONT')); //chargement

    //initialisation du tableau de Bitmap
    CharsCount := (_font_src.Width div FONT_CHAR_WIDTH) * (_font_src.Height div FONT_CHAR_HEIGHT);
    SetLength(Font, CharsCount);

    for i := 0 to CharsCount - 1 do
    begin
      Font[i] := TBitmap.Create;
      Font[i].Width := FONT_CHAR_WIDTH;
      Font[i].Height := FONT_CHAR_HEIGHT;
    end;

    //découpage
    X := 0;
    Y := 0;
    
    repeat
      i := (X div FONT_CHAR_WIDTH) + ((Y div FONT_CHAR_HEIGHT) * (_font_src.Width div FONT_CHAR_WIDTH));

      //extraction de la police
      Font[i].Canvas.CopyRect(Rect(0, 0, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT),
        _font_src.Canvas, Rect(X, Y, FONT_CHAR_WIDTH + X, FONT_CHAR_HEIGHT + Y));

      //décalages 
      Inc(X, FONT_CHAR_WIDTH);

      if (X >= _font_src.Width) then
      begin
        Inc(Y, FONT_CHAR_HEIGHT);
        X := 0;
      end;

    until (Y >= _font_src.Height);

  finally
    _font_src.Free;
  end;
end;

// Permet de créer un tableau d'entier contenant les indexs de chaque lettre de
// la chaine passée en paramètre. Ex : SALUT va renvoyer un truc du style (33,25,...).
procedure TOldSkoolAbout_Form.StrToIndex(S : string ; var CharsIndexArray : array of Word);
var
  i : Integer;
  
begin
  S := UpperCase(S);

  for i := 1 to Length(S) do // un string commence à 1
  begin
    CharsIndexArray[i - 1] := 0; //rien trouvé

    //De A à Z
    if (S[i] >= 'A') and (S[i] <= 'Z') then
      CharsIndexArray[i - 1] := (Ord(S[i]) - Ord('A')) + ALPHA_START_INDEX;

    //De 0 à 9
    if (S[i] >= '0') and (S[i] <= '9') then
      CharsIndexArray[i - 1] := (Ord(S[i]) - Ord('0')) + NUMERIC_START_INDEX;

    //Les autres caractères... 
    case S[i] of
       '!'  : CharsIndexArray[i - 1] := EXCL;
       '<'  : CharsIndexArray[i - 1] := ARROW_LEFT;
       '>'  : CharsIndexArray[i - 1] := ARROW_RIGHT;
       ' '  : CharsIndexArray[i - 1] := SPACE;
       '''' : CharsIndexArray[i - 1] := APOSTROP;
       '-'  : CharsIndexArray[i - 1] := MINUS;
       ':'  : CharsIndexArray[i - 1] := TWO_DOT;
       '.'  : CharsIndexArray[i - 1] := DOT;
       ','  : CharsIndexArray[i - 1] := COMMA;
    end;

  end;
end;

// Créer un nouveau label
procedure TOldSkoolAbout_Form.CreateBitmapLabel(const str : TCaption ; DestImage : TBitmap);
var
  Indexes : array of Word;
  i : integer;
  _char : TBitmap;

  _dest_r : TRect;
  
begin
  //initialisation
  DestImage.Width := Length(str) * FONT_CHAR_WIDTH;
  DestImage.Height := FONT_CHAR_HEIGHT;

  SetLength(Indexes, Length(str)); //on peut pas redimentionner un tableau en parametre
  
  StrToIndex(str, Indexes);

  for i := Low(Indexes) to High(Indexes) do
  begin
    _char := Font[Indexes[i]];

    _dest_r := Rect(i * FONT_CHAR_WIDTH, 0, (i * FONT_CHAR_WIDTH) + FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT);
    DestImage.Canvas.CopyRect(_dest_r, _char.Canvas, Rect(0, 0, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT));
  end;
  
end;

// Liberer les ressources occupées par le bitmap font
procedure TOldSkoolAbout_Form.FinalizeFont;
var
  i : Word;
  
begin
  for i := 0 to CharsCount - 1 do
    Font[i].Free;
end;

// ====[ StarField 3D ]==========================================================

const
     MAX_ETOILE = 100;  {Nombre d'étoiles maximum}

{Type TStarField3D, contenant 5 propriétées pour chaques étoiles de notre
 Starfield}
type
    TStarField3D = Record
        PosX,
        PosY,
        PosZ,
        NouveauX,
        NouveauY,
        EtoileX,
        EtoileY :Integer;
        Couleur : TColor;
    end;
    TMaxEtoile = 1..MAX_ETOILE;
    TTabStarField3D = Array[TMaxEtoile] of TStarField3D;  {100 étoiles à gérer}

var
  StarField : TTabStarField3D;{Notre objet StarFied et ses méthodes, propriétées}
  Vitesse :Integer;          {Vitesse de défilement des étoiles}

procedure TOldSkoolAbout_Form.InitStars;

{Objectif : Créer nos 100 étoiles à l'aide d'une LOOP qui touchera aux
            propriétées de chaque étoiles.}

Var
   {Variable contrôle}
    I :Integer;

begin
    {Initialiser le générateur de nombre aléatoire}
      Randomize;

    {Créer toutes les étoiles à l'aide d'une LOOP et de la procédure
     NouvelleEtoile.}
      For I := Low(StarField) To High(StarField) Do
          NouvelleEtoile(I);

    {Ajuster la vitesse (Par défaut)}
     Vitesse := 4;

     StarsTimer := TTimer.Create(Self);
     StarsTimer.Interval := 30;
     StarsTimer.OnTimer := AnimateStarsFieldTimer;

     {Démarrer le Champ d'étoiles}
     StarsTimer.Enabled := True;
end;

procedure TOldSkoolAbout_Form.FinalizeStarsField;
begin
  StarsTimer.Free;
end;

procedure TOldSkoolAbout_Form.AnimateStarsFieldTimer(Sender : TObject);
begin
  Canvas.Brush.Color := clBlack;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  ShowStars;
end;

procedure TOldSkoolAbout_Form.NouvelleEtoile( Index :Integer );

{Objectif :Cette fonction servira à créer un étoile selon son index.
           Donc chaque fois qu'une étoile auras fait son chemin à travers
           l'écran et sera rendu à l'extrémité, nous devrons lui attribuer
           une nouvelle place dans l'écran.}

Begin
  {Une nouvelle position aléatoire pour les X}
    StarField[Index].PosX := Random(Width);
    Dec( StarField[Index].PosX, (Width Div 2) );

  {Une nouvelle position aléatoire pour les Y}
    StarField[Index].PosY := Random(Height);
    Dec( StarField[Index].PosY, (Height Div 2) );

  {Remettre les valeurs des coordonnées [EtoileX, EtoileY] à 0}
    StarField[Index].EtoileX := 0;
    StarField[Index].EtoileY := 0;

  {Remettre la position des Z dans le centre [Milieu] de l'écran}
    StarField[Index].PosZ := 256;

    StarField[Index].Couleur := RGB(Random(255), Random(255), Random(255));
End;

procedure TOldSkoolAbout_Form.ShowStars;
{Ici nous afficherons les étoiles et les feront animées à l'aide de cette
 formule
        PointX = ((PointX * 256) / PositionZ) + (EcranX / 2)
        PointY = ((PointY * 256) / PositoinZ) + (EcranY / 2)
      ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
}
Var
 {Variable contrôle pour la LOOP FOR}
    I :Integer;

{Dimmension de L'écran}
    _Width, _Height :Word;

Begin

{Initialiser les dimensions de l'écran}
    _Width := Width;
    _Height := Height;

 {Animation des pixels...}
    For I := Low(StarField) To High(StarField) Do
    Begin
         {Si Z est dépassé l'écran alors créer une nouvelle étoile}
            If StarField[I].PosZ <= 0 Then NouvelleEtoile(I);

            {Calculer la nouvelle position des étoiles}
               StarField[I].EtoileX := ( (StarField[I].PosX Shl 8) Div StarField[I].PosZ) + _Width Div 2;
               StarField[I].EtoileY := ( (StarField[I].PosY Shl 8) Div StarField[I].PosZ) + _Height Div 2;

            {Décrémenter la valeur de Z [Profondeur]}
               Dec( StarField[I].PosZ , Vitesse );

            {Revérifier encore si la profondeur est déjà à 0 avant le calcul des points
             en retard qui servent à produire un ligne.}
            If StarField[I].PosZ <= 0 Then  NouvelleEtoile(I);

             {Maintenant que la profondeur est décrémenter, la position des points d'effaçement
              sera calculés en retard sur le Z des premières pour former une ligne blanche de la longueur du Z}
               StarField[I].NouveauX := ( (StarField[I].PosX Shl 8) Div StarField[I].PosZ) + _Width Div 2;
               StarField[I].NouveauY := ( (StarField[I].PosY Shl 8) Div StarField[I].PosZ) + _Height Div 2;

           {Vérifier si la ligne à dépasser l'écran, si oui alors créer une nouvelle
           'étoiles sinon, afficher la ligne qui avancera toujours vers vous avec le
           'profondeur qui se décrémente de 4 à chaque passage de la LOOP.
           'Donc :
           '      Si la ligne (X, Y) est plus grande que l'écran alors créer une nouvelle étoile
           '      Par contre si par malchance la position du (X, Y) choisi aléatoirement à travers l'écran
           '      pas acceptable pour la formule (Erreur : division par 0) alors on se doit de recréer une
           '       nouvelle étoile
           }
            If (StarField[I].NouveauX > _Width) Or (StarField[I].NouveauY > _Height) Or
               (StarField[I].NouveauX <= 0) Or (StarField[I].NouveauY <= 0) Then
               NouvelleEtoile(I)

            Else
            Begin
                 //Canvas.Pen.Color := RGB(255 + (I * -2), 255 + (I * -2), 255 + (I * -2));
                 Canvas.Pen.Color := StarField[I].Couleur;
                 Canvas.MoveTo(StarField[I].EtoileX, StarField[I].EtoileY);
                 Canvas.LineTo(StarField[I].NouveauX, StarField[I].NouveauY);
            End;
    End;
End;

// --- [ Script animation ] ----------------------------------------------------

const
  OFFSET_INSIDE_LABEL : Integer = 10; // ecart entre les labels
  
var
  LabelX, LabelY : Integer;
  LabelTop : Integer;
  _final_label_left, _final_label_top : Integer;

  _bmp_label_buf : TBitmap;

  BitmapLabel_1, BitmapLabel_2, BitmapLabel_3, BitmapLabel_4 : TBitmap;
  
  TimeStamp : Word; //timer;
  _new_caption_1, _new_caption_2, _new_caption_3, _new_caption_4  : string;

procedure TOldSkoolAbout_Form.InitScript;
begin
  TimeStamp := 0; // le temps ou se produira les evenements (les labels affichés)

  LabelTop := 0;
  BitmapLabel_1 := TBitmap.Create; // ligne 1
  BitmapLabel_2 := TBitmap.Create; // ligne 2 (optionnel)
  BitmapLabel_3 := TBitmap.Create; // ligne 3 (optionnel)
  BitmapLabel_4 := TBitmap.Create; // ligne 4 (optionnel)

  _bmp_label_buf := TBitmap.Create; // bitmap affiché
end;

procedure TOldSkoolAbout_Form.NewSequence(const str : TCaption ; const str2 : TCaption = ''
  ; const str3 : TCaption = '' ; const str4 : TCaption = '');
begin
  _new_caption_1 := str;
  _new_caption_2 := str2;
  _new_caption_3 := str3;
  _new_caption_4 := str4;

  ScriptIdleTimer.Enabled := False;
  OutroTimer.Enabled := True;
end;

procedure TOldSkoolAbout_Form.IntroTimerTimer(Sender: TObject);
begin
  Inc(LabelTop, 6);

  // dessiner le label à la position calculée
  Canvas.CopyRect(
    Rect(
      _final_label_left,
      LabelTop,
      _bmp_label_buf.Width + _final_label_left,
      _bmp_label_buf.Height + LabelTop
    ),
    _bmp_label_buf.Canvas,
    Rect(0, 0, _bmp_label_buf.Width, _bmp_label_buf.Height)
  );
  
  // anim intro label finie (le label est au centre de l'écran)
  if (labelTop >= _final_label_top) then
  begin
    labelTop := _final_label_top;
    IntroTimer.Enabled := False;
    ScriptIdleTimer.Enabled := True;
  end;
end;

procedure TOldSkoolAbout_Form.ScriptIdleTimerTimer(Sender: TObject);
begin
  if not Assigned(_bmp_label_buf) then Exit;
  Inc(TimeStamp);

  LabelX := _final_label_left + (Trunc(Cos(Random(2))) * 2);
  LabelY := LabelTop + (Trunc(Cos(Random(2))) * 2);
  
  Canvas.CopyRect(
    Rect(
      LabelX,
      LabelY,
      _bmp_label_buf.Width + LabelX,
      _bmp_label_buf.Height + LabelY
    ),
    _bmp_label_buf.Canvas,
    Rect(0, 0, _bmp_label_buf.Width, _bmp_label_buf.Height)
  );

  // taille d'une ligne : 20 chars
  case TimeStamp of
    1     : NewSequence('sizious and speud');
    150   : NewSequence('presents:');
    250   : NewSequence('vmu tool pc');
    350   : NewSequence('version ' + PRG_VERSION, PRG_DATE);
    450   : NewSequence('The new vmu manager', 'for your Dreamcast');
    550   : NewSequence('enjoy it !');
    650   : NewSequence('credits:');
    750   : NewSequence('code', ' ', 'engine : speud  ', 'gui    : sizious');
    850   : NewSequence('gfx', ' ', 'draw  : sevlila ', 'color : djizeuss');
    950   : NewSequence('mod', ' ', 'skuter', 'strike force');
    1050   : NewSequence('greetings:');
    1150  : NewSequence('all people around', 'the scene ...', ' ', '<in no order>');
    1300  : NewSequence('erwan oggy poche', 'patbier pgfr jmd',
              'ManJimaru la-cible', 'Semicolo mixman');
    1550  : NewSequence('edd hieronymus sekk', 'Codex Venom Kurdy',
              'sevlila djizeuss', 'redrum Hachiman');
    1850  : NewSequence('Rom1 radigo groseb', 'kupra mainge',
              'Ron yngwie KorteX', 'josemci LTK666');
    2150  : NewSequence('timofonic Belavi', 'Chui D4rkbit Fox68k',
              'BlackAura sneak78', 'Wraggster Fackue');
    2400  : NewSequence('curt-grymala BR', 'Metafox max-scharl',
              'rmedtx warmtoe a128', 'DCDayDreamer atani');
    2650  : NewSequence('mekanaizer quzar', 'phantom ptr.exe',
              'Ender scherzo GPF', 'Christuserloeser');
    2900  : NewSequence('Darksaviour69', 'OneThirty8 c99koder',
              'Marcus burnerO', 'DCGrendel kRYPT dan');
    3250  : NewSequence('Everyone making', 'scene possible ...');
    3350  : NewSequence(' ');
    3500  : NewSequence('For Dreamcast Scene', ' ', '2006');
    3750  : NewSequence('still united and', 'alive !', ' ', 'Thanks for all !');
    3950  : NewSequence(' ');
    4250  : TimeStamp := 0;  // retour au début
  end;


end;

procedure TOldSkoolAbout_Form.OutroTimerTimer(Sender: TObject);
var
  offset : Integer;
  
begin
  Inc(LabelTop, 6);

  Canvas.CopyRect(
    Rect(
      _final_label_left,
      LabelTop,
      _bmp_label_buf.Width + _final_label_left,
      _bmp_label_buf.Height + LabelTop
    ),
    _bmp_label_buf.Canvas,
    Rect(0, 0, _bmp_label_buf.Width, _bmp_label_buf.Height)
  );

  // animation de sortie terminée, création des nouveaux labels
  if LabelTop >= ClientHeight then
  begin
    // création des label 1, 2
    CreateBitmapLabel(_new_caption_1, BitmapLabel_1);
    CreateBitmapLabel(_new_caption_2, BitmapLabel_2);
    CreateBitmapLabel(_new_caption_3, BitmapLabel_3);
    CreateBitmapLabel(_new_caption_4, BitmapLabel_4);

    // on remplit tout le label qui va être affiché de noir
    _bmp_label_buf.Canvas.Brush.Color := clBlack;
    _bmp_label_buf.Canvas.FillRect(Rect(0, 0, _bmp_label_buf.Width, _bmp_label_buf.Height));

    // on dimentionne le label à afficher avec la largeur la plus grande
    _bmp_label_buf.Width := ClientWidth; 

    _bmp_label_buf.Height := BitmapLabel_1.Height;

    // si la caption 2 est différente de null on prend 2 fois la taille en
    // hauteur sinon 1 seule fois
    if _new_caption_2 <> '' then
      _bmp_label_buf.Height := _bmp_label_buf.Height + BitmapLabel_2.Height + OFFSET_INSIDE_LABEL;
      
    // pareil pour caption 3
    if _new_caption_3 <> '' then
      _bmp_label_buf.Height := _bmp_label_buf.Height + BitmapLabel_3.Height + OFFSET_INSIDE_LABEL;

    // pareil pour caption 4
    if _new_caption_4 <> '' then
      _bmp_label_buf.Height := _bmp_label_buf.Height + BitmapLabel_4.Height + OFFSET_INSIDE_LABEL;

    // décalage par rapport à la gauche (centrer le label au milieu du bitmap)
    offset := _bmp_label_buf.Width div 2 - BitmapLabel_1.Width div 2;
    
    // on dessine le label 1
    _bmp_label_buf.Canvas.CopyRect(
      Rect(offset, 0, BitmapLabel_1.Width + offset, BitmapLabel_1.Height),
      BitmapLabel_1.Canvas,
      Rect(0, 0, BitmapLabel_1.Width, BitmapLabel_1.Height)
    );

    // on décale le label 2 et on le dessine dans le bitmap qui va être affiché
    offset := _bmp_label_buf.Width div 2 - BitmapLabel_2.Width div 2;
    if _new_caption_2 <> '' then
      _bmp_label_buf.Canvas.CopyRect(
        Rect(offset, BitmapLabel_1.Height + OFFSET_INSIDE_LABEL, BitmapLabel_2.Width + offset,
          BitmapLabel_2.Height + BitmapLabel_1.Height + OFFSET_INSIDE_LABEL),
        BitmapLabel_2.Canvas,
        Rect(0, 0, BitmapLabel_2.Width, BitmapLabel_2.Height)
      );  

    // on décale le label 3 et on le dessine dans le bitmap qui va être affiché
    offset := _bmp_label_buf.Width div 2 - BitmapLabel_3.Width div 2;
    if _new_caption_3 <> '' then
      _bmp_label_buf.Canvas.CopyRect(
        Rect(offset, BitmapLabel_1.Height + BitmapLabel_2.Height + OFFSET_INSIDE_LABEL * 2,
          BitmapLabel_3.Width + offset,
          BitmapLabel_3.Height + BitmapLabel_2.Height + BitmapLabel_1.Height + OFFSET_INSIDE_LABEL * 2),
        BitmapLabel_3.Canvas,
        Rect(0, 0, BitmapLabel_3.Width, BitmapLabel_3.Height)
      );

    // on décale le label 4 et on le dessine dans le bitmap qui va être affiché
    offset := _bmp_label_buf.Width div 2 - BitmapLabel_4.Width div 2;
    if _new_caption_4 <> '' then
      _bmp_label_buf.Canvas.CopyRect(
        Rect(offset, BitmapLabel_1.Height + BitmapLabel_2.Height + BitmapLabel_3.Height + OFFSET_INSIDE_LABEL * 3,
          BitmapLabel_4.Width + offset,
          BitmapLabel_4.Height + BitmapLabel_3.Height + BitmapLabel_2.Height + BitmapLabel_1.Height + OFFSET_INSIDE_LABEL * 3),
        BitmapLabel_4.Canvas,
        Rect(0, 0, BitmapLabel_4.Width, BitmapLabel_4.Height)
      );
      
    LabelTop := - _bmp_label_buf.Height;

    // coordonnées finales
    _final_label_top := ClientHeight div 2 - _bmp_label_buf.Height div 2;
    _final_label_left := ClientWidth div 2 - _bmp_label_buf.Width div 2;

    OutroTimer.Enabled := False;
    IntroTimer.Enabled := True;
  end;
end;

procedure TOldSkoolAbout_Form.FinalizeScript;
begin
  _bmp_label_buf.Free;
  BitmapLabel_1.Free;
  BitmapLabel_2.Free;
  BitmapLabel_3.Free;
  BitmapLabel_4.Free;
end;

// --- [ Code Généré ] ---------------------------------------------------------

procedure TOldSkoolAbout_Form.FormCreate(Sender: TObject);
begin
  bClose.Height := 0;
  bClose.Width := 0;

  DoubleBuffered := True;
  pClose.ParentBackground := False;
  pCloseOut.ParentBackground := False;
  
  Caption := 'About ' + Application.Title;
end;

procedure TOldSkoolAbout_Form.pCloseMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  //if pClose.Color >= clMaroon then pClose.Tag := 0;
  //pClose.Color := clMaroon;
  closeTimer.Tag := 1;
  closeTimer.Enabled := True;
end;

procedure TOldSkoolAbout_Form.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //pClose.Color := clBlack;
  closeTimer.Tag := 0;
  closeTimer.Enabled := True;
end;

procedure TOldSkoolAbout_Form.pCloseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (X <= 0) or (X > pClose.Width) or (Y <= 0) or (Y > pClose.Height) then Exit;
  
  bClose.Click;
end;

procedure TOldSkoolAbout_Form.closeTimerTimer(Sender: TObject);
begin
  if (closeTimer.Tag = 1) and (GetRValue(ColorToRGB(pClose.Color)) >= 130) then
  begin
    closeTimer.Enabled := False;
    Exit;
  end;

  if (closeTimer.Tag = 0) and (GetRValue(ColorToRGB(pClose.Color)) > 0) then
  begin
    pClose.Tag := pClose.Tag - 5;
    pClose.Color := RGB(pClose.Tag, 0, 0);
    Exit;
  end;

  pClose.Tag := pClose.Tag + 5;

  pClose.Color := RGB(pClose.Tag, 0, 0);
end;


procedure TOldSkoolAbout_Form.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TOldSkoolAbout_Form.FormShow(Sender: TObject);
begin
  CreateFont;
  InitStars;
  InitScript;

  XMLoadFromRes('MOD', 'MUSIC');
  XMPlay;
  IntroTimer.Enabled := True;

  pClose.Color := clBlack;
  pClose.Refresh;
end;

procedure TOldSkoolAbout_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IntroTimer.Enabled := False;
  OutroTimer.Enabled := False;
  ScriptIdleTimer.Enabled := False;
  closeTimer.Enabled := False;
  
  FinalizeFont;
  FinalizeStarsField;
  FinalizeScript;
  
  XMFree;
end;

end.
