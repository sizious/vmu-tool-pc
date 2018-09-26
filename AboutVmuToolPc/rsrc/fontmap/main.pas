unit main;

interface

uses
  Windows, SysUtils, Messages, Graphics, Forms, Variants, Classes, XPMan,
  Controls, Dialogs, StdCtrls, ImgList, ComCtrls;

type
  TMain_Form = class(TForm)
    eFontWidth: TEdit;
    XPManifest1: TXPManifest;
    eFontHeight: TEdit;
    eFile: TEdit;
    lv: TListView;
    il: TImageList;
    Button1: TButton;
    od: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    CharsCount : Word;
    Font : array of TBitmap;
    procedure LoadFont;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Main_Form: TMain_Form;

implementation

procedure TMain_Form.LoadFont;
var
  X, Y : Word;
  i : Word;
  _font_src : TBitmap;

begin
  _font_src := TBitmap.Create;
  try
    _font_src.LoadFromFile(eFile.Text);

    //initialisation du tableau de Bitmap
    CharsCount := (_font_src.Width div StrToInt(eFontWidth.Text)) * (_font_src.Height div StrToInt(eFontHeight.Text));
    SetLength(Font, CharsCount);

    for i := 0 to CharsCount - 1 do
    begin
      Font[i] := TBitmap.Create;
      Font[i].Width := StrToInt(eFontWidth.Text);
      Font[i].Height := StrToInt(eFontHeight.Text);
    end;

    //découpage
    X := 0;
    Y := 0;
    
    repeat
      i := (X div StrToInt(eFontWidth.Text))
        + ((Y div StrToInt(eFontHeight.Text)) * (_font_src.Width div StrToInt(eFontWidth.Text)));

      //extraction de la police
      Font[i].Canvas.CopyRect(Rect(0, 0, StrToInt(eFontWidth.Text), StrToInt(eFontHeight.Text)),
        _font_src.Canvas, Rect(X, Y, StrToInt(eFontWidth.Text) + X, StrToInt(eFontHeight.Text) + Y));

      //décalages 
      Inc(X, StrToInt(eFontWidth.Text));

      if (X >= _font_src.Width) then
      begin
        Inc(Y, StrToInt(eFontHeight.Text));
        X := 0;
      end;

      //font[i].SaveToFile(inttostr(i) + '.bmp');
      
    until (Y >= _font_src.Height);

  finally
    _font_src.Free;
  end;
end;


{$R *.dfm}

procedure TMain_Form.Button1Click(Sender: TObject);
begin
  with od do
    if Execute then eFile.Text := Filename;
end;

procedure TMain_Form.Button2Click(Sender: TObject);
var
  i : Integer;

begin
  LoadFont;

  il.Width := StrToInt(eFontWidth.Text);
  il.Height := StrToInt(eFontHeight.Text);
  
  for i := 0 to CharsCount - 1 do
  begin
    il.Add(Font[i], nil);
    
    with lv.Items.Add do
    begin
      Caption := IntToStr(i);
      ImageIndex := i;
    end;

  end;
end;

end.
