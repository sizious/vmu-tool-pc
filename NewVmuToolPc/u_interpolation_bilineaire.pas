//Module permettant d'effectuer un Redimensionnement par Interpolation BiLinéaire
//l'Image résultante est bien meilleur qu'avec un redimensionnement brute (problème d'Aliasing)
//Créé par MORLET Alexandre en Mai 2002
//Basé sur le Code Source en C de Christophe Boyanique et Emmanuel Pinard
//L'Interpolation BiLinéaire consiste à utiliser les 4 points les
//plus proches des cordonnées calculées dans l'image source en les pondérant par des
//cooefficients inversement proportionnels à la distance et dont la somme vaut 1

unit u_interpolation_bilineaire;

interface

uses Windows, Graphics, Math, ExtCtrls, SysUtils;

function ReSizeBmpFile(FileName : string ; const Width, Height : integer) : boolean;
function ReSizeBmpPict(BMP : TBitmap; const Largeur, Hauteur : integer) : boolean;

implementation

//------------------------------------------------------------------------------

//---REDIMENSIONNEMENT_PAR_INTERPOLATION_BILINEAIRE---
function ReSizeBmpPict(BMP : TBitmap; const Largeur, Hauteur : integer) : boolean;
type
TRGBArray = array[0..0] of TRGBTriple;
PRGBArray = ^TRGBArray;
var
X, Y : integer; //coordonnées image source
I, J : integer; //coordonnées image destination
Diff : array[0..3] of double; //distance pour l'interpolation bilinéaire
DX, DY : array[0..3] of double; // Coordonnees image source (points voisins, reelles)
IX, IY : array[0..3] of integer;     // Coordonnees image source (points voisins, entieres)
XR, YR : double; // Coordonnees image source (reelles)
R, G, B : array[0..3] of integer;
TabScanlineBMP, TabScanlineBMPF : array of PRGBArray;
V : double;
BMPF : TBitmap;
begin
Result := False;
if (not Assigned(BMP)) or BMP.Empty then Exit;
Result := True;

BMP.pixelFormat := pf24bit;

BMPF := TBitmap.Create;

try
     With BMPF do
        begin
        Width := Largeur;
        Height := Hauteur;
        pixelFormat := pf24bit;
        end;

     setLength(TabScanlineBMP, BMP.Height);
     setLength(TabScanlineBMPF, BMPF.Height);

     for X := 0 to BMP.Height - 1 do
         TabScanlineBMP[X] := BMP.Scanline[X];

     for X := 0 to BMPF.Height - 1 do
         TabScanlineBMPF[X] := BMPF.Scanline[X];

     for J := 0 to BMPF.Height - 1 do
         begin
         for I := 0 to BMPF.Width - 1 do
         begin
         X := Trunc( -0.5 + I * BMP.Width / BMPF.Width );
         Y := Trunc( -0.5 + J * BMP.Height / BMPF.Height );

         X := Min(X, BMP.Width - 1);
         Y := Min(Y, BMP.Height - 1);
         X := Max(X, 0);
         Y := Max(Y, 0);

         XR := -0.5 + I * BMP.Width / BMPF.Width;
         YR := -0.5 + J * BMP.Height / BMPF.Height;

         XR := Min(XR, BMP.Width - 1);
         YR := Min(YR, BMP.Height - 1);
         XR := Max(XR, 0);
         YR := Max(YR, 0);

         if (X = XR) and (Y = YR) then
                begin
                TabScanlineBMPF[J,I].RGBTRed := TabScanlineBMP[Y,X].RGBTRed;
                TabScanlineBMPF[J,I].RGBTGreen := TabScanlineBMP[Y,X].RGBTGreen;
                TabScanlineBMPF[J,I].RGBTBlue := TabScanlineBMP[Y,X].RGBTBlue;
                end
             else
            begin
            DX[0] := XR - Floor(XR);
            DY[0] := YR - Floor(YR);
                IX[0] := Trunc(Floor(XR));
                IY[0] := Trunc(Floor(YR));

            DX[1] := 1.0 - DX[0];
            DY[1] := DY[0];
                IX[1] := IX[0] + 1;
                IY[1] := IY[0];

            DX[2] := DX[0];
            DY[2] := 1.0 - DY[0];
                IX[2] := IX[0];
                IY[2] := IY[0] + 1;

            DX[3] := DX[1];
            DY[3] := DY[2];
                IX[3] := IX[1];
                IY[3] := IY[2];

            if (DX[0] = 0) then
         begin
         Diff[0] := 1.0 / Sqrt( DX[0]*DX[0] + DY[0]*DY[0] );
         Diff[2] := 1.0 / Sqrt( DX[2]*DX[2] + DY[2]*DY[2] );
         V := Diff[0] + Diff[2];

         R[0] := TabScanlineBMP[IY[0],IX[0]].RGBTRed;
         G[0] := TabScanlineBMP[IY[0],IX[0]].RGBTGreen;
         B[0] := TabScanlineBMP[IY[0],IX[0]].RGBTBlue;

         R[2] := TabScanlineBMP[IY[2],IX[2]].RGBTRed;
         G[2] := TabScanlineBMP[IY[2],IX[2]].RGBTGreen;
         B[2] := TabScanlineBMP[IY[2],IX[2]].RGBTBlue;

         TabScanlineBMPF[J,I].RGBTRed := Trunc((R[0] * Diff[0] + R[2] * Diff[2]) / V);
         TabScanlineBMPF[J,I].RGBTGreen := Trunc((G[0] * Diff[0] + G[2] * Diff[2]) / V);
         TabScanlineBMPF[J,I].RGBTBlue := Trunc((B[0] * Diff[0] + B[2] * Diff[2]) / V);
         end
                else if (DY[0] = 0) then
                        begin
                Diff[0] := 1.0 / Sqrt (DX[0]*DX[0] + DY[0]*DY[0]);
                Diff[1] := 1.0 / Sqrt (DX[1]*DX[1] + DY[1]*DY[1]);
                V := Diff[0] + Diff[1];

                R[0] := TabScanlineBMP[IY[0], IX[0]].RGBTRed;
                G[0] := TabScanlineBMP[IY[0], IX[0]].RGBTGreen;
                B[0] := TabScanlineBMP[IY[0], IX[0]].RGBTBlue;

                        R[1] := TabScanlineBMP[IY[1], IX[1]].RGBTRed;
                G[1] := TabScanlineBMP[IY[1], IX[1]].RGBTGreen;
                B[1] := TabScanlineBMP[IY[1], IX[1]].RGBTBlue;

                TabScanlineBMPF[J,I].RGBTRed := Trunc((R[0] * Diff[0] + R[1] * Diff[1]) / V);
                TabScanlineBMPF[J,I].RGBTGreen := Trunc((G[0] * Diff[0] + G[1] * Diff[1]) / V);
                TabScanlineBMPF[J,I].RGBTBlue := Trunc((B[0] * Diff[0] + B[1] * Diff[1]) / V);
                        end
                else
                begin
                Diff[0] := 1.0 / Sqrt( DX[0]*DX[0] + DY[0]*DY[0]);
                Diff[1] := 1.0 / Sqrt( DX[1]*DX[1] + DY[1]*DY[1]);
                Diff[2] := 1.0 / Sqrt( DX[2]*DX[2] + DY[2]*DY[2]);
                Diff[3] := 1.0 / Sqrt( DX[3]*DX[3] + DY[3]*DY[3]);
                V := Diff[0] + Diff[1] + Diff[2] + Diff[3];

                R[0] := TabScanlineBMP[IY[0], IX[0]].RGBTRed;
                G[0] := TabScanlineBMP[IY[0], IX[0]].RGBTGreen;
                B[0] := TabScanlineBMP[IY[0], IX[0]].RGBTBlue;

                R[1] := TabScanlineBMP[IY[1], IX[1]].RGBTRed;
                G[1] := TabScanlineBMP[IY[1], IX[1]].RGBTGreen;
                B[1] := TabScanlineBMP[IY[1], IX[1]].RGBTBlue;

                R[2] := TabScanlineBMP[IY[2], IX[2]].RGBTRed;
                G[2] := TabScanlineBMP[IY[2], IX[2]].RGBTGreen;
                B[2] := TabScanlineBMP[IY[2], IX[2]].RGBTBlue;

                R[3] := TabScanlineBMP[IY[3], IX[3]].RGBTRed;
                G[3] := TabScanlineBMP[IY[3], IX[3]].RGBTGreen;
                B[3] := TabScanlineBMP[IY[3], IX[3]].RGBTBlue;

                TabScanlineBMPF[J,I].RGBTRed :=
                Trunc((R[0] * Diff[0] + R[1] * Diff[1] + R[2] * Diff[2] + R[3] * Diff[3]) / V);

                TabScanlineBMPF[J,I].RGBTGreen :=
                Trunc((G[0] * Diff[0] + G[1] * Diff[1] + G[2] * Diff[2] + G[3] * Diff[3]) / V);

                TabScanlineBMPF[J,I].RGBTBlue :=
                Trunc((B[0] * Diff[0] + B[1] * Diff[1] + B[2] * Diff[2] + B[3] * Diff[3]) / V);
                end;
                end;
             end;
         end;
BMP.Assign(BMPF);

finally BMPF.Free;
TabScanlineBMP := nil ;
TabScanlineBMPF := nil;
end;

end;

//------------------------------------------------------------------------------

//---ReSizeBMP---
function ReSizeBmpFile(FileName : string ; const Width, Height : integer) : boolean;
var
  Img : TImage;

begin
  Result := False;
  if FileExists(FileName) = False then Exit;

  Img := TImage.Create(nil);
  try
    Img.Picture.Bitmap.LoadFromFile(FileName);
    ReSizeBmpPict(Img.Picture.Bitmap, Width, Height);
    Img.Picture.Bitmap.SaveToFile(FileName);
    Result := True;
  finally
    Img.Free;
  end;
end;

//------------------------------------------------------------------------------

end.    



