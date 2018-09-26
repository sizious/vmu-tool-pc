unit VmuToolPcListView;

interface

uses
  Windows, SysUtils, Classes, Controls, ComCtrls;

const
  //La colonne 0 est la colonne Name, impossible à retirer.
  ColumnsLabels : array[1..17] of string = ('Check sum', 'Description', 'Copyright', 'Date',
                  'VMS resource name', 'VM filename', 'Type', 'Copy',
                  'VMS size', 'VM description', 'DC description',
                  'Application name', 'Color icon frames', 'Color icon speed',
                  'Eyecatch type', 'CRC', 'Data length');
                  
type
  //Un énum commence à 0, il faut donc faire + 1 pour faire correspondre avec les
  //captions ci-dessus.
  //EDIT : On peut le faire démarrer à 1 !!! Génial.
  TColumnType = (ctCheckSum = 1, ctDescription, ctCopyright, ctDate, ctVmsResourceName,
                 ctVmFileName, ctType, ctCopy, ctVmsSize, ctVmDescription,
                 ctDcDescription, ctApplicationName, ctColorIconFrames,
                 ctColorIconSpeed, ctEyecatchType, ctCRC, ctDataLength);

  TVmuToolPcListView = class;
  
  TColumnsView = class(TPersistent)
  private
    fSelf : TVmuToolPcListView;
    fShowApplicationName: boolean;
    fShowEyecatchType: boolean;
    fShowCheckSum: boolean;
    fShowDataLength: boolean;
    fShowVmsResourceName: boolean;
    fShowDate: boolean;
    fShowVmFileName: boolean;
    fShowCopy: boolean;
    fShowVmsSize: boolean;
    fShowDcDescription: boolean;
    fShowCRC: boolean;
    fShowVmDescription: boolean;
    fShowColorIconSpeed: boolean;
    fShowType: boolean;
    fShowColorIconFrames: boolean;
    fShowCopyright: boolean;
    fShowDescription: boolean;
    procedure SetShowApplicationName(const Value: boolean);
    procedure SetShowCheckSum(const Value: boolean);
    procedure SetShowColorIconFrames(const Value: boolean);
    procedure SetShowColorIconSpeed(const Value: boolean);
    procedure SetShowCopy(const Value: boolean);
    procedure SetShowCRC(const Value: boolean);
    procedure SetShowDataLength(const Value: boolean);
    procedure SetShowDate(const Value: boolean);
    procedure SetShowDcDescription(const Value: boolean);
    procedure SetShowEyecatchType(const Value: boolean);
    procedure SetShowType(const Value: boolean);
    procedure SetShowVmDescription(const Value: boolean);
    procedure SetShowVmFileName(const Value: boolean);
    procedure SetShowVmsResourceName(const Value: boolean);
    procedure SetShowVmsSize(const Value: boolean);

    procedure ApplyColumnsConfig(Value: boolean ; ColumnType : TColumnType);
    procedure SetShowCopyright(const Value: boolean);
    procedure SetShowDescription(const Value: boolean);
  public
    constructor Create(AOwner : TVmuToolPcListView);
  published
    property ShowCheckSum : boolean read fShowCheckSum write SetShowCheckSum;
    property ShowDescription : boolean read fShowDescription write SetShowDescription;
    property ShowCopyright : boolean read fShowCopyright write SetShowCopyright;
    property ShowDate : boolean read fShowDate write SetShowDate;
    property ShowVmsResourceName : boolean read fShowVmsResourceName write SetShowVmsResourceName;
    property ShowVmFileName : boolean read fShowVmFileName write SetShowVmFileName;
    property ShowType : boolean read fShowType write SetShowType;
    property ShowCopy : boolean read fShowCopy write SetShowCopy;
    property ShowVmsSize : boolean read fShowVmsSize write SetShowVmsSize;
    property ShowVmDescription : boolean read fShowVmDescription write SetShowVmDescription;
    property ShowDcDescription : boolean read fShowDcDescription write SetShowDcDescription;
    property ShowApplicationName : boolean read fShowApplicationName write SetShowApplicationName;
    property ShowColorIconFrames : boolean read fShowColorIconFrames write SetShowColorIconFrames;
    property ShowColorIconSpeed : boolean read fShowColorIconSpeed write SetShowColorIconSpeed;
    property ShowEyecatchType : boolean read fShowEyecatchType write SetShowEyecatchType;
    property ShowCRC : boolean read fShowCRC write SetShowCRC;
    property ShowDataLength : boolean read fShowDataLength write SetShowDataLength;
  end;

  TVmuToolPcListView = class(TListView)
  private
    fColumnsView: TColumnsView;
    procedure SetColumnsView(const Value: TColumnsView);
    { Déclarations privées }
  protected
    { Déclarations protégées }
  public
    { Déclarations publiques }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetColumnIndex(ColumnType : TColumnType) : integer;
    function GetColumnType(ID : integer) : TColumnType;
    procedure ChangeColState(ColumnType : TColumnType ; State : boolean);
    procedure ResetCols;
  published
    { Déclarations publiées }
    property ColumnsView : TColumnsView read fColumnsView write SetColumnsView;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('VMU TOOL PC', [TVmuToolPcListView]);
end;

{ TVmuToolPcListView }

procedure TVmuToolPcListView.ChangeColState(ColumnType: TColumnType;
  State: boolean);
var
  Col : TColumnsView;

begin
  Col := Self.fColumnsView;

  case ColumnType of
    ctCheckSum        : Col.ShowCheckSum := State;
    ctDescription     : Col.ShowDescription := State;
    ctCopyright       : Col.ShowCopyright := State;
    ctDate            : Col.ShowDate := State;
    ctVmsResourceName : Col.ShowVmsResourceName := State;
    ctVmFileName      : Col.ShowVmFileName := State;
    ctType            : Col.ShowType := State;
    ctCopy            : Col.ShowCopy := State;
    ctVmsSize         : Col.ShowVmsSize := State;
    ctVmDescription   : Col.ShowVmDescription := State;
    ctDcDescription   : Col.ShowDcDescription := State;
    ctApplicationName : Col.ShowApplicationName := State;
    ctColorIconFrames : Col.ShowColorIconFrames := State;
    ctColorIconSpeed  : Col.ShowColorIconSpeed := State;
    ctEyecatchType    : Col.ShowEyecatchType := State;
    ctCRC             : Col.ShowCRC := State;
    ctDataLength      : Col.ShowDataLength := State;
  end;
end;

constructor TVmuToolPcListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fColumnsView := TColumnsView.Create(Self);

  ViewStyle := vsReport;
  ColumnClick := False;
  RowSelect := True;
  GridLines := True;
  ReadOnly := True;
end;

destructor TVmuToolPcListView.Destroy;
begin
  fColumnsView.Free;

  inherited Destroy;
end;

function TVmuToolPcListView.GetColumnIndex(
  ColumnType: TColumnType): integer;
var
  i, Ind : integer;
  
begin
  Result := -1;

  Ind := Integer(ColumnType);

  for i := 1 to Columns.Count - 1 do
    if (Ind = Columns[i].Tag) then
    begin
      Result := i;
      Break;
    end;
end;

function TVmuToolPcListView.GetColumnType(ID: integer): TColumnType;
begin
  Result := TColumnType(ID);
end;

procedure TVmuToolPcListView.ResetCols;
begin
  ChangeColState(ctCheckSum, False);
  ChangeColState(ctDescription, False);
  ChangeColState(ctCopyright, False);
  ChangeColState(ctDate, False);
  ChangeColState(ctVmsResourceName, False);
  ChangeColState(ctVmFileName, False);
  ChangeColState(ctType, False);
  ChangeColState(ctCopy, False);
  ChangeColState(ctVmsSize, False);
  ChangeColState(ctVmDescription, False);
  ChangeColState(ctDcDescription, False);
  ChangeColState(ctApplicationName, False);
  ChangeColState(ctColorIconFrames, False);
  ChangeColState(ctColorIconSpeed, False);
  ChangeColState(ctEyecatchType, False);
  ChangeColState(ctCRC, False);
  ChangeColState(ctDataLength, False);
end;

procedure TVmuToolPcListView.SetColumnsView(const Value: TColumnsView);
begin
  if Assigned(Value) then fColumnsView.Assign(Value);
end;

//==============================================================================

{ TColumnsView }

//------------------------------------------------------------------------------

procedure TColumnsView.ApplyColumnsConfig(Value: boolean ; ColumnType : TColumnType);
var
  Col : TListColumn;
  Ind : integer;

begin
  if fSelf.ComponentState = [csDesigning] then
  begin
    MessageBoxA(0, 'Please don''t use this property in DesignTime.', 'Warning',
      MB_ICONWARNING + MB_SYSTEMMODAL);
    Exit;
  end;
  
  if Value then
    begin
      //On vérifie si la colonne n'est pas déjà là...
      if fSelf.GetColumnIndex(ColumnType) <> -1 then Exit;
      
      //Ajouter la colonne.
      Col := fSelf.Columns.Add;

      //On rajoute + 1 car l'énum commence à 0, et notre tableau
      //ColumnsLabels à 1. EDIT : l'énum commence à 1 !
      Ind := Integer(ColumnType);
      Col.Caption := ColumnsLabels[Ind];
      Col.Tag := Ind;
    end
  else
    begin
      Ind := fSelf.GetColumnIndex(ColumnType);
      if Ind <> -1 then fSelf.Columns[Ind].Free;
  end;
end;

//------------------------------------------------------------------------------

constructor TColumnsView.Create(AOwner: TVmuToolPcListView);
begin
  fSelf := AOwner;
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowApplicationName(const Value: boolean);
begin
  fShowApplicationName := Value;
  ApplyColumnsConfig(fShowApplicationName, ctApplicationName);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowCheckSum(const Value: boolean);
begin
  fShowCheckSum := Value;
  ApplyColumnsConfig(fShowCheckSum, ctCheckSum);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowColorIconFrames(const Value: boolean);
begin
  fShowColorIconFrames := Value;
  ApplyColumnsConfig(fShowColorIconFrames, ctColorIconFrames);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowColorIconSpeed(const Value: boolean);
begin
  fShowColorIconSpeed := Value;
  ApplyColumnsConfig(fShowColorIconSpeed, ctColorIconSpeed);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowCopy(const Value: boolean);
begin
  fShowCopy := Value;
  ApplyColumnsConfig(fShowCopy, ctCopy);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowCopyright(const Value: boolean);
begin
  fShowCopyright := Value;
  ApplyColumnsConfig(fShowCopyright, ctCopyright);
end;

procedure TColumnsView.SetShowCRC(const Value: boolean);
begin
  fShowCRC := Value;
  ApplyColumnsConfig(fShowCRC, ctCRC);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowDataLength(const Value: boolean);
begin
  fShowDataLength := Value;
  ApplyColumnsConfig(fShowDataLength, ctDataLength);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowDate(const Value: boolean);
begin
  fShowDate := Value;
  ApplyColumnsConfig(fShowDate, ctDate);
end;
       
//------------------------------------------------------------------------------

procedure TColumnsView.SetShowDcDescription(const Value: boolean);
begin
  fShowDcDescription := Value;
  ApplyColumnsConfig(fShowDcDescription, ctDcDescription);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowDescription(const Value: boolean);
begin
  fShowDescription := Value;
  ApplyColumnsConfig(fShowDescription, ctDescription);
end;

procedure TColumnsView.SetShowEyecatchType(const Value: boolean);
begin
  fShowEyecatchType := Value;
  ApplyColumnsConfig(fShowEyecatchType, ctEyecatchType);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowType(const Value: boolean);
begin
  fShowType := Value;
  ApplyColumnsConfig(fShowType, ctType);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowVmDescription(const Value: boolean);
begin
  fShowVmDescription := Value;
  ApplyColumnsConfig(fShowVmDescription, ctVmDescription);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowVmFileName(const Value: boolean);
begin
  fShowVmFileName := Value;
  ApplyColumnsConfig(fShowVmFileName, ctVmFileName);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowVmsResourceName(const Value: boolean);
begin
  fShowVmsResourceName := Value;
  ApplyColumnsConfig(fShowVmsResourceName, ctVmsResourceName);
end;

//------------------------------------------------------------------------------

procedure TColumnsView.SetShowVmsSize(const Value: boolean);
begin
  fShowVmsSize := Value;
  ApplyColumnsConfig(fShowVmsSize, ctVmsSize);
end;

//==============================================================================

end.
