object OldSkoolAbout_Form: TOldSkoolAbout_Form
  Left = 248
  Top = 180
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 446
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pCloseOut: TPanel
    Left = 515
    Top = 411
    Width = 107
    Height = 27
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object pClose: TPanel
      Left = 1
      Top = 1
      Width = 105
      Height = 25
      BevelOuter = bvNone
      BevelWidth = 2
      Caption = '&Close'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnMouseMove = pCloseMouseMove
      OnMouseUp = pCloseMouseUp
    end
  end
  object bClose: TButton
    Left = 520
    Top = 384
    Width = 100
    Height = 25
    Caption = '&C (raccourci)'
    TabOrder = 1
    OnClick = bCloseClick
  end
  object ScriptIdleTimer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = ScriptIdleTimerTimer
    Left = 8
    Top = 8
  end
  object IntroTimer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = IntroTimerTimer
    Left = 40
    Top = 8
  end
  object OutroTimer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = OutroTimerTimer
    Left = 72
    Top = 8
  end
  object closeTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = closeTimerTimer
    Left = 592
    Top = 352
  end
end
