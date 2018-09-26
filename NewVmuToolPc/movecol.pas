unit movecol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, VmuToolPcListView;

type
  PColumnSaveStruct = ^TColumnSaveStruct;
  TColumnSaveStruct = packed record
    ID    : TColumnType;
    Width : integer;
  end;

  TColumnsSave = class
  private
    fLV : TVmuToolPcListView;
    fColList : TList;
    function Save(ColListViewIndex : integer) : boolean;
    function Restore(SavedListIndex : integer) : boolean;
  public
    constructor Create(ListView : TVmuToolPcListView);
    destructor Destroy; override;
    procedure SaveListView;
    procedure RestoreListView;
  end;

  TMoveCol_Form = class(TForm)
    bUp: TBitBtn;
    bDown: TBitBtn;
    bOK: TBitBtn;
    bCancel: TBitBtn;
    lbCols: TListBox;
    lbColsView: TListBox;
    Label1: TLabel;
    procedure bUpClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbColsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbColsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbColsClick(Sender: TObject);
  private
    { Déclarations privées }
    fColSave : TColumnsSave;
  public
    { Déclarations publiques }
    procedure LoadCols;
    procedure SaveCols;
  end;

var
  MoveCol_Form: TMoveCol_Form;

implementation

uses main;

{$R *.dfm}

//------------------------------------------------------------------------------

//---LoadCols---
//Charger la ListBox avec les colonnes du ListView.
procedure TMoveCol_Form.LoadCols;
var
  i : integer;

begin
  for i := 1 to Main_Form.flv.Columns.Count - 1 do
  begin
    lbCols.Items.Add(Main_Form.flv.Column[i].Caption);
    lbColsView.Items.Add(IntToStr(Main_Form.flv.Column[i].Tag));
  end;

end;

//------------------------------------------------------------------------------

//---SaveCols---
//Sauvegarder dans le tableau globale l'ordre des colonnes puis recharger
//le dossier courant.
procedure TMoveCol_Form.SaveCols;
var
  i   : integer;
  Col : TColumnType;

begin
  //Tout mettre à false. (ColView)
  Main_Form.flv.ResetCols;
  
  for i := 0 to lbColsView.Count - 1 do
  begin
    Col := Main_Form.flv.GetColumnType(StrToInt(lbColsView.Items[i]));
    //Affiche la colonne voulue. Prototype :
    Main_Form.flv.ChangeColState(Col, True);
  end;
end;

//------------------------------------------------------------------------------

procedure TMoveCol_Form.bUpClick(Sender: TObject);
var
  i, curr : integer;

begin
  curr := lbCols.ItemIndex;
  if curr = -1 then Exit;
  i := curr - 1;
  if i < 0 then Exit;

  lbCols.Items.Move(curr, i);
  lbColsView.Items.Move(curr, i);
  lbCols.ItemIndex := i;
  //lbColsView.ItemIndex := i;

  //Rafraichir les controles
  lbColsClick(Sender);
end;

//------------------------------------------------------------------------------

procedure TMoveCol_Form.bDownClick(Sender: TObject);
var
 i, curr : integer;

begin
  curr := lbCols.ItemIndex;
  if curr = -1 then Exit;
  i := curr + 1;
  if i >= lbCols.Items.Count then Exit;

  lbCols.Items.Move(curr, i);
  lbColsView.Items.Move(curr, i);
  lbCols.ItemIndex := i;
  //lbColsView.ItemIndex := i;

  //Rafraichir les controles
  lbColsClick(Sender);
end;

//------------------------------------------------------------------------------

procedure TMoveCol_Form.FormShow(Sender: TObject);
begin
  lbCols.Clear;
  lbColsView.Clear;
  LoadCols;
  fColSave.SaveListView;
end;
 
//------------------------------------------------------------------------------

procedure TMoveCol_Form.bOKClick(Sender: TObject);
begin
  SaveCols;
  fColSave.RestoreListView;
  Main_Form.UpdateListViewCaptions;
  Main_Form.FillView;
end;

//------------------------------------------------------------------------------

procedure TMoveCol_Form.FormCreate(Sender: TObject);
begin
  fColSave := TColumnsSave.Create(Main_Form.flv);
  lbCols.IntegralHeight:=true
end;
 
//------------------------------------------------------------------------------

procedure TMoveCol_Form.FormDestroy(Sender: TObject);
begin
  fColSave.Free;
end;

//==============================================================================

{ TColumnSave }

function TColumnsSave.Save(ColListViewIndex : integer) : boolean;
var
  CurrCol : PColumnSaveStruct;

begin
  Result := False;
  if (ColListViewIndex < 0) or (ColListViewIndex >= fLV.Columns.Count) then Exit;
  Result := True;

  //Création de la nouvelle structure puis ajout dans la liste
  New(CurrCol);

  //Ne pas oublier que le type de la colonne est mis dans le Tag de la colonne.
  //C'est un numéro, contenant une position dans l'énum TColumnType.
  CurrCol^.ID := fLV.GetColumnType(fLV.Column[ColListViewIndex].Tag);
  CurrCol^.Width := fLV.Column[ColListViewIndex].Width;
  fColList.Add(CurrCol);
end;
 
//------------------------------------------------------------------------------

constructor TColumnsSave.Create(ListView : TVmuToolPcListView);
begin
  fColList := TList.Create;
  fLV := ListView;
end;
  
//------------------------------------------------------------------------------

destructor TColumnsSave.Destroy;
var
  i : integer;

begin
  for i := 0 to fColList.Count - 1 do
    Dispose(fColList[i]);
    
  fColList.Free;
end;
  
//------------------------------------------------------------------------------

function TColumnsSave.Restore(SavedListIndex: integer): boolean;
var
  CurrCol : PColumnSaveStruct;
  Index : integer;

begin
  Result := False;
  if (SavedListIndex < 0) or (SavedListIndex >= fColList.Count) then Exit;

  //Récuperation de la colonne sauvé qui nous interresse
  CurrCol := fColList[SavedListIndex];

  //On va récuperer sa position actuelle dans la ListView.
  Index := fLV.GetColumnIndex(CurrCol^.ID);
  if Index = -1 then Exit; //elle n'est pas trouvée on se tire !

  //On remet sa taille initiale !
  fLV.Column[Index].Width := CurrCol^.Width;

  Result := True;
end;
  
//------------------------------------------------------------------------------

procedure TColumnsSave.RestoreListView;
var
  i : integer;

begin
  for i := 0 to fLV.Columns.Count - 1 do
    Restore(i);
end;
  
//------------------------------------------------------------------------------

procedure TColumnsSave.SaveListView;
var
  i : integer;

begin
  for i := 0 to fLV.Columns.Count - 1 do
    Save(i);
end;
   
//------------------------------------------------------------------------------

procedure TMoveCol_Form.lbColsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Pt : TPoint;
  Exists : boolean;
  NewInd,
  _selected  : integer;
  itemcpt, itemcpt2 : string;

begin
  if Sender = Source then
    with TListBox(Sender) do
    begin
      _selected := ItemIndex;
      if _selected = -1 then Exit;
      
      Pt.X := X;
      Pt.Y := Y;
      Exists := False;
      NewInd := ItemAtPos(Pt, Exists); //avoir l'élément de destination.
      //la variable exists ne sert à rien ici.
      if NewInd = -1 then Exit;
      itemcpt :=  Items[_selected];
      itemcpt2 := lbColsView.Items[_selected];
      
      //déterminer la direction
      if NewInd < _selected then
      begin
        Items.Insert(NewInd, itemcpt);
        Items.Delete(_selected + 1);

        lbColsView.Items.Insert(NewInd, itemcpt2);
        lbColsView.Items.Delete(_selected + 1);
      end else begin
        Items.Delete(_selected);
        lbColsView.Items.Delete(_selected);
        
        if NewInd >= Items.Count then
        begin
          NewInd := Items.Add(itemcpt); //on ajoute en dehors de la liste
          lbColsView.Items.Add(itemcpt2);
        end else begin
          Items.Insert(NewInd, itemcpt);
          lbColsView.Items.Insert(NewInd, itemcpt2);
        end;
      end;

      ItemIndex := NewInd; //selectionné l'élément fraichement déplacé.
    end;                   

  //Rafraichir les controles
  lbColsClick(Sender);
end;
   
//------------------------------------------------------------------------------

procedure TMoveCol_Form.lbColsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Sender = lbCols;
end;
   
//------------------------------------------------------------------------------

procedure TMoveCol_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_ESCAPE) then
  begin
    Key := #0;
    Close;
  end;
end;
   
//------------------------------------------------------------------------------

procedure TMoveCol_Form.lbColsClick(Sender: TObject);
begin
  //selection
  bUp.Enabled := (lbCols.ItemIndex > 0);
  bDown.Enabled := (lbCols.ItemIndex < lbCols.Count - 1);
end;

end.
