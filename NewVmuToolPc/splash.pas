unit
  Splash;

(*******************************************************************************

     Exemple d'�cran "Splash" avec affichage progressif "Fading"
        par Jean-Fran�ois Desrochers Ytoff57@hotmail.com

     Explications:
        Dans les sources de votre projet, vous verrez que des lignes ont �t� ajout�es.
        La fonction DoFade permet de r�aliser le fondu. Le param�tre duree varie entre 1
        et 100. Toute valeur au dessus de 100 ne fera aucune diff�rence. Une valeur de 0
        emp�chera l'�cran fondu d'�tre affich� et une valeur de 1 fera afficher l'image
        sans fondu. Pour les autres valeurs (de 2 � 100), plus la valeur sera �lev�e, plus
        le fondu sera lent.

        Sp�cifiez votre image dans la propri�t� Picture de Splashimg. Pour charger
        dynamiquement, chargez la dans le OnCreate. Vous pouvez redimentionner la
        fiche pour afficher l'image, mais cela n'est pas n�cessaire car c'est ajust�
        automatiquement.

        Modifiez la proc�dure afterfade � votre guise. C'est dans cette proc�dure que
        vous pourrez charger tout le n�cessaire avant de fermer l'�cran splash.

        Il ne vous est pas n�cessaire de modifier les autre propri�t�s.

Envoyez-moi un courriel si vous faites des changements � ces sources Merci!

MAJ : 28/08/05 � 00h21 par SiZiOUS :
      Ajout de la fonction BmpToForm trouv�e sur Internet (Auteur inconnu d�sol�)
      permettant de faire une fen�tre non rectangulaire.
      Cette fonction REQUIRE un BITMAP comme image.

*******************************************************************************)

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Jpeg;

type
  TPercent = 0..100;

  TSplashFrm = class(TForm)
    Splashimg: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WMEraseBkgnd(var msg: TWMErasebkgnd); message WM_ERASEBKGND;
  private
    procedure Afterfade;
    procedure BmpToForm(BMP: TImage; CouleurTransparente: TColor);
    { Private declarations }
  public
    { Public declarations }
    procedure DoFade(Duree: integer); //ATTENTION: N'appelez cette proc�dure qu'une fois!!!!!
    procedure Wait(Duree: integer);
  end;

var
  Splashfrm: TSplashfrm;
  scrbmp: TBitmap;
  mixbmp: TBitmap;

procedure DrawTransparent(dstBitmap, srcBitmap: TBitmap; Transparency: TPercent);
procedure GetScreenBitmap(r: TRect; var bitmap: TBitmap);

implementation

//------------------------------------------------------------------------------

procedure TSplashFrm.BmpToForm(BMP : TImage; CouleurTransparente : TColor);
var
    i, j, debutY : Integer;
    rgn, rgn1 : HRGN;

begin
rgn := CreateRectRgn(0, 0, 0, 0);
for i := 0 to bmp.Width-1 do
  begin
    j := 0;
    while j < bmp.Height-1 do
      begin
       if bmp.Canvas.Pixels[i, j] <> CouleurTransparente then
        begin
         debutY := j;
         while (bmp.Canvas.Pixels[i, j] <> CouleurTransparente)
                and (j < bmp.Height) do
          inc(j);
         rgn1 := CreateRectRgn(i, debutY, i+1, j);
         CombineRgn(rgn, rgn, rgn1, RGN_OR);
         DeleteObject(rgn1);
        end;
      inc(j);
      end;
  end;

  SetWindowRgn(Handle, rgn, true);  ///BUG
end;

//------------------------------------------------------------------------------

procedure DrawTransparent(dstBitmap, srcBitmap: TBitmap; Transparency: TPercent);
const
  MaxPixelCount = 32768;
type
  PRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array[0..MaxPixelCount] of TRGBTriple;
var
  dstRow, srcRow: PRGBTripleArray;
  x, y: Integer;
begin
  dstBitmap.PixelFormat := pf24bit;
  srcBitmap.PixelFormat := pf24bit;
  for y := 0 to srcBitmap.Height-1 do
  begin
    srcRow := srcBitmap.ScanLine[y];
    dstRow := dstBitmap.ScanLine[y];
    for x := 0 to srcBitmap.Width-1 do
    begin
      dstRow[x].rgbtRed := ((100-Transparency) * dstRow[X].rgbtRed) div 100 +
                            (Transparency * srcRow[X].rgbtRed) div 100;
      dstRow[x].rgbtGreen := ((100-Transparency) * dstRow[X].rgbtGreen) div 100 +
                            (Transparency * srcRow[X].rgbtGreen) div 100;
      dstRow[x].rgbtBlue := ((100-Transparency) * dstRow[X].rgbtBlue) div 100 +
                            (Transparency * srcRow[X].rgbtBlue) div 100;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure GetScreenBitmap(r: TRect; var bitmap: TBitmap);
var DC: HDC;
begin
  Bitmap.Width := r.Right;
  Bitmap.Height := r.Bottom;
  DC := GetDC(0);
  try
    with Bitmap do
      BitBlt(Canvas.Handle, 0, 0,
             Width, Height, DC, r.Left, r.Top, SrcCopy);
  finally
    ReleaseDC(0, DC);
  end;
end;

{$R *.dfm}

//------------------------------------------------------------------------------

{$R rsrc\splash.RES}

procedure TSplashfrm.FormCreate(Sender: TObject);
begin
  Splashimg.Visible := False;

  Splashimg.Picture.Bitmap.Handle := LoadBitmap(hInstance, 'SPLASH');

  //Cr�er la form non rectangulaire
  BmpToForm(Splashimg, Splashimg.Canvas.Pixels[1, 1]);
end;

//------------------------------------------------------------------------------

procedure TSplashfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ScrBmp.Free;
  MixBmp.Free;
end;

//------------------------------------------------------------------------------

procedure TSplashfrm.FormShow(Sender: TObject);
begin
     with self do begin
          Splashimg.Width := Splashimg.Picture.Width;
          Splashimg.Height := Splashimg.Picture.Height;
          Width := Splashimg.Width;
          Height := Splashimg.Height;
          Left := round((Screen.Width)  / 2 - (Width  / 2));
          Top  := round((Screen.Height) / 2 - (Height / 2));
          self.FormStyle := fsStayOnTop;
     end;
end;

//------------------------------------------------------------------------------

procedure TSplashfrm.WMEraseBkgnd(var msg: TWMErasebkgnd);
begin
     msg.Result := integer(false);
end;

//------------------------------------------------------------------------------

procedure TSplashfrm.DoFade(Duree: integer);
var
   trans, delay: TPercent;
   i: integer;
begin
     scrbmp := TBitmap.Create;
     mixbmp := TBitmap.Create;
     mixbmp.Assign(Splashimg.Picture.Bitmap);
     getscreenbitmap(rect(Left, Top, Width, Height), scrbmp);
     try
       delay := 0;
       for i := 1 to duree do begin
           trans := (i * 100) div duree;
           if trans <> delay then begin
              Splashimg.Picture.Assign(mixbmp);
              drawtransparent(Splashimg.Picture.Bitmap, scrbmp, (100-trans));
              if not SplashImg.Visible then
                 Splashimg.Visible := true;
           end;
           delay := trans;
           application.ProcessMessages;
       end;
     finally
        mixbmp.Free;
        scrbmp.Free;
        Afterfade;
     end;
end;

//------------------------------------------------------------------------------

procedure TSplashfrm.Afterfade;
begin
  //Mettez ici les items � charger apr�s le fondu de la fiche
  wait(200);
end;

//------------------------------------------------------------------------------

procedure TSplashfrm.Wait(Duree: integer);
var
   i: integer;
begin
     //Cette proc�dure remplace le Sleep. Elle permet aux messages Windows de passer
     //durant l'attente. La dur�e est en millisecondes.
     for i := 1 to duree do begin
         application.ProcessMessages;
         sleep(1);
     end;
end;

//------------------------------------------------------------------------------

end.
 