{
  Unit u_rcolors

  Permet d'ajouter des lignes dans un RichEdit avec un mot clef et une valeur.
  Exemple : "SALUT : CA VA" ou "SALUT :" en rouge et "CA VA" en couleur normale.
}

unit u_rcolors;

interface

uses
  Windows, SysUtils, ComCtrls, Graphics;

procedure AddReportInfo(KeyWord, Value : string);
//function InsertRichData(RE : TRichEdit ; Key, Value : string ; AttrFont : TFont) : boolean;

implementation

uses
  Main;
  
const
  FONT_KEY_ATTR : record
                    FontName  : TFontName;
                    Color     : TColor;
                    Style     : TFontStyles;
                    Size      : Integer;
                  end =
                        (
                          FontName  : 'Tahoma';
                          Color     : clRed;
                          Style     : [fsBold];
                          Size      : 8;
                        );

//------------------------------------------------------------------------------

function SearchWordStart(RE : TRichEdit ; KeyWord : string ; StartPos : integer = 0) : integer;
var
  FoundAt : LongInt;
  ToEnd : Integer;
  
begin
  Result := -1;
  
  with RE do
  begin
    HideSelection := True;

    { ToEnd indique la longueur entre StartPos et la fin du texte du contrôle
    éditeur de texte enrichi }

    ToEnd := Length(Text) - StartPos;

    FoundAt := FindText(KeyWord, StartPos, ToEnd, [stMatchCase]);
    if FoundAt <> -1 then
    begin
      SelStart := FoundAt;
      SelLength := Length(KeyWord);
      Result := SelStart;
    end;
  end;
end;

//------------------------------------------------------------------------------

function InsertRichData(RE : TRichEdit ; Key, Value : string ; AttrFont : TFont) : boolean;
var
  _old_ind : integer;
  OK : boolean;

begin
  Result := False;
  if not Assigned(AttrFont) then Exit;

  _old_ind := re.GetTextLen;
  RE.Lines.Add(Key + ' : ' + Value);

  OK := (SearchWordStart(re, Key + ' : ', _old_ind) <> -1);
  if not OK then Exit;

  RE.SelAttributes.Assign(AttrFont);
  Result := True;
end;

//==============================================================================

procedure AddReportInfo(KeyWord, Value : string);
var
  _font : TFont;

begin
  _font := TFont.Create;
  try
    _font.Color := FONT_KEY_ATTR.Color;
    _font.Name := FONT_KEY_ATTR.FontName;
    _font.Style := FONT_KEY_ATTR.Style;
    _font.Size := FONT_KEY_ATTR.Size;
    InsertRichData(Main_Form.reReport, KeyWord, Value, _font);
  finally
    _font.Free;
  end;
end;

//------------------------------------------------------------------------------

end.
