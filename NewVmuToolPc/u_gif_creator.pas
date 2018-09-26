{
  Unit : u_gif_creator

  Permet la création de gif animées et pas animées d'ailleurs...
}

unit u_gif_creator;

interface

uses
  Windows, SysUtils, Graphics, GIFImage, FTGifAnimate;

function MakeAnimatedGif(BitMapArray : array of TBitmap ; Transparent : boolean
  ; MilliSecPerFrame : Word ; OutputFileName : string) : boolean;
function SaveBmpToGif(Bitmap : TBitmap ; GifFile : TFileName) : boolean;

implementation

//------------------------------------------------------------------------------

function MakeAnimatedGif(BitMapArray : array of TBitmap ; Transparent : boolean
  ; MilliSecPerFrame : Word ; OutputFileName : string) : boolean;
var
  FrameIndex: Integer;
  Picture: TPicture;

begin
  try
    GifAnimateBegin;

    //Step through each frame in in-memory list
    for FrameIndex := Low(BitMapArray) to High(BitMapArray) do
    begin
      // add frame to animated gif
      if Assigned(BitMapArray[FrameIndex]) then
        GifAnimateAddImage(BitMapArray[FrameIndex], Transparent, MilliSecPerFrame);
    end;

    { We are using a TPicture but we could have used a TGIFImage instead.
      By not using TGIFImage directly we do not have to add GIFImage to the uses clause.
      By using TPicture we only need to add GifAnimate to the uses clause. }
    Picture := GifAnimateEndPicture;
    Picture.SaveToFile(OutputFileName);  // save gif
    Result := FileExists(OutputFileName);

    //ImageMovieFrame.Picture.Assign(Picture);  // display gif

    Picture.Free;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------

function SaveBmpToGif(Bitmap : TBitmap ; GifFile : TFileName) : boolean;
var
  GIF	 : TGIFImage;

begin
  Result := False;
  if not Assigned(Bitmap) then Exit;

  //try
    //Bitmap := TBitmap.Create;
    //try
      // Load the bitmap that will be converted
      //Bitmap.LoadFromFile(ExtractFIlePath(Application.ExeName)+'test.bmp');
      // Display the bitmap
      //ImageBMP.Picture.Assign(Bitmap);
      // Clear previous GIF view
      //ImageGIF.Picture.Assign(nil);

      GIF := TGIFImage.Create;
      try
        //GIF.OnProgress := OnProgress;
        // Convert the bitmap to a GIF
        GIF.Assign(Bitmap);
        // Save the GIF
        GIF.SaveToFile(GifFile);
        Result := FileExists(GifFile);
        // Display the GIF
        //ImageGIF.Picture.Assign(GIF);
      finally
        GIF.Free;
      end;
    //finally
    //  Bitmap.Free;
    //end;
  //except
  //  Result := False;
  //end;
end;

//------------------------------------------------------------------------------

end.
