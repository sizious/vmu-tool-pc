object Main_Form: TMain_Form
  Left = 272
  Top = 279
  BorderStyle = bsDialog
  Caption = 'OldSkool Chars Map Viewer - v1.0 - by SiZ!'
  ClientHeight = 337
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 51
    Width = 35
    Height = 13
    Caption = 'Width :'
  end
  object Label2: TLabel
    Left = 13
    Top = 84
    Width = 38
    Height = 13
    Caption = 'Height :'
  end
  object eFontWidth: TEdit
    Left = 56
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 0
    Text = '32'
  end
  object eFontHeight: TEdit
    Left = 56
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 1
    Text = '25'
  end
  object eFile: TEdit
    Left = 8
    Top = 16
    Width = 433
    Height = 21
    TabOrder = 2
  end
  object lv: TListView
    Left = 8
    Top = 112
    Width = 513
    Height = 217
    Columns = <>
    LargeImages = il
    SmallImages = il
    StateImages = il
    TabOrder = 3
  end
  object Button1: TButton
    Left = 448
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Browse ...'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 448
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Go !'
    TabOrder = 5
    OnClick = Button2Click
  end
  object XPManifest1: TXPManifest
    Left = 240
    Top = 72
  end
  object il: TImageList
    Left = 208
    Top = 72
  end
  object od: TOpenDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap (*.bmp;*.dib)|*.bmp;*.dib|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Select your Bitmap font'
    Left = 272
    Top = 72
  end
end
