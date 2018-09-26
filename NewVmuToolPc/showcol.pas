unit showcol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, VmuToolPcListView, ExtCtrls, Buttons;

type
  TColView_Form = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    cbName: TCheckBox;
    Bevel1: TBevel;
    bOK: TBitBtn;
    bCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bOKClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure FillCaptions;
  public
    { Déclarations publiques }
    procedure LoadCols;
    procedure SaveCols;
  end;

var
  ColView_Form: TColView_Form;

implementation

uses
  Main;

{$R *.dfm}

//------------------------------------------------------------------------------

//---LoadCols---
//Cocher les colonnes qui existent.
procedure TColView_Form.FillCaptions;
var
  i   : integer;
  cb  : TCheckBox;

begin
  for i := Low(ColumnsLabels) to High(ColumnsLabels) do
  begin
    cb := FindComponent('CheckBox' + IntToStr(i)) as TCheckBox;
    if Assigned(cb) then
      cb.Caption := ColumnsLabels[i];
  end;
end;

procedure TColView_Form.LoadCols;
var
  cv : TColumnsView;

begin
  //Attention à l'ordre imposé dans le composant VmuToolPcListView.
  cv := Main_Form.flv.ColumnsView;

  CheckBox1.Checked := cv.ShowCheckSum;
  CheckBox2.Checked := cv.ShowDescription;
  CheckBox3.Checked := cv.ShowCopyright;
  CheckBox4.Checked := cv.ShowDate;
  CheckBox5.Checked := cv.ShowVmsResourceName;
  CheckBox6.Checked := cv.ShowVmFileName;
  CheckBox7.Checked := cv.ShowType;
  CheckBox8.Checked := cv.ShowCopy;
  CheckBox9.Checked := cv.ShowVmsSize;
  CheckBox10.Checked := cv.ShowVmDescription;
  CheckBox11.Checked := cv.ShowDcDescription;
  CheckBox12.Checked := cv.ShowApplicationName;
  CheckBox13.Checked := cv.ShowColorIconFrames;
  CheckBox14.Checked := cv.ShowColorIconSpeed;
  CheckBox15.Checked := cv.ShowEyecatchType;
  CheckBox16.Checked := cv.ShowCRC;
  CheckBox17.Checked := cv.ShowDataLength;
end;

//------------------------------------------------------------------------------

//---SaveCols---
//On enleve les colonnes décochées et celles qui sont cochées réapparaissent.
procedure TColView_Form.SaveCols;
var
  cv : TColumnsView;
  
begin
  cv := Main_Form.flv.ColumnsView;

  cv.ShowCheckSum := CheckBox1.Checked;
  cv.ShowDescription := CheckBox2.Checked;
  cv.ShowCopyright := CheckBox3.Checked;
  cv.ShowDate := CheckBox4.Checked;
  cv.ShowVmsResourceName := CheckBox5.Checked;
  cv.ShowVmFileName := CheckBox6.Checked;
  cv.ShowType := CheckBox7.Checked;
  cv.ShowCopy := CheckBox8.Checked;
  cv.ShowVmsSize := CheckBox9.Checked;
  cv.ShowVmDescription := CheckBox10.Checked;
  cv.ShowDcDescription := CheckBox11.Checked;
  cv.ShowApplicationName := CheckBox12.Checked;
  cv.ShowColorIconFrames := CheckBox13.Checked;
  cv.ShowColorIconSpeed := CheckBox14.Checked;
  cv.ShowEyecatchType := CheckBox15.Checked;
  cv.ShowCRC := CheckBox16.Checked;
  cv.ShowDataLength := CheckBox17.Checked;
end;

//------------------------------------------------------------------------------

procedure TColView_Form.FormShow(Sender: TObject);
begin
  FillCaptions;
  LoadCols;
end;

//------------------------------------------------------------------------------

procedure TColView_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_ESCAPE) then
  begin
    Key := #0;
    Close;
  end;
end;

//------------------------------------------------------------------------------

procedure TColView_Form.bOKClick(Sender: TObject);
begin
  SaveCols;
  Main_Form.UpdateListViewCaptions;
  Main_Form.FillView;
end;

//------------------------------------------------------------------------------

end.
