object Options_Form: TOptions_Form
  Left = 388
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 233
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 192
    Width = 297
    Height = 2
  end
  object lblInfos: TLabel
    Left = 8
    Top = 200
    Width = 136
    Height = 26
    AutoSize = False
    Caption = 'Pour modifier la config, aller dans u_config !!!'
    WordWrap = True
  end
  object pcOptions: TPageControl
    Left = 8
    Top = 8
    Width = 297
    Height = 177
    ActivePage = tsGeneral
    HotTrack = True
    TabOrder = 0
    OnChange = pcOptionsChange
    object tsGeneral: TTabSheet
      Caption = '&General'
      object GroupBox2: TGroupBox
        Left = 32
        Top = 96
        Width = 225
        Height = 41
        Caption = ' Shell integration : '
        TabOrder = 0
        object cbAssociate: TCheckBox
          Left = 8
          Top = 16
          Width = 209
          Height = 17
          Hint = 'Associate VMU TOOL PC with extensions VMI and VMS.'
          Caption = 'Associate with &Dreamcast save files'
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 32
        Top = 16
        Width = 225
        Height = 73
        Caption = ' Choose options : '
        TabOrder = 1
        object cbConfirmClose: TCheckBox
          Left = 8
          Top = 16
          Width = 209
          Height = 17
          Hint = 
            'Before exiting the application a message box shows you a confirm' +
            'ation.'
          Caption = '&Prompt before closing application'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbShowSplash: TCheckBox
          Left = 8
          Top = 32
          Width = 209
          Height = 17
          Hint = 'Show the VMU TOOL PC logo at startup.'
          Caption = '&Show splash screen'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbScanAtStart: TCheckBox
          Left = 8
          Top = 48
          Width = 209
          Height = 17
          Hint = 
            'Save the current position in the VMU TOOL PC view and rescan it ' +
            'at next startup.'
          Caption = '&Save the directory and rescan at start'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
    end
    object tsView: TTabSheet
      Caption = '&View'
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 32
        Top = 16
        Width = 225
        Height = 97
        Caption = ' Advanced view options : '
        TabOrder = 0
        object Bevel2: TBevel
          Left = 8
          Top = 52
          Width = 209
          Height = 2
        end
        object cbAutoSelect: TCheckBox
          Left = 8
          Top = 16
          Width = 209
          Height = 17
          Caption = '&Auto-select the first VMI file after scan'
          TabOrder = 0
        end
        object cbShowErrornousFiles: TCheckBox
          Left = 8
          Top = 56
          Width = 209
          Height = 17
          Hint = 'Show in the view errornous / invalid VMI files'
          Caption = 'S&how errornous VMI files'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbShowInvalidVms: TCheckBox
          Left = 8
          Top = 72
          Width = 209
          Height = 17
          Hint = 'Theses files are only a VMS... they don'#39't have any VMI.'
          Caption = 'Sho&w invalid VMS files'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbAutoScrollView: TCheckBox
          Left = 8
          Top = 32
          Width = 209
          Height = 17
          Caption = 'A&uto-scroll the view when adding a VMI'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
    end
    object tsTray: TTabSheet
      Caption = '&Tray'
      ImageIndex = 1
      object rgTrayIcon: TRadioGroup
        Left = 32
        Top = 24
        Width = 225
        Height = 81
        Caption = ' Choose option : '
        ItemIndex = 0
        Items.Strings = (
          '&Minimize application put in system tray'
          'Close application &put in system tray'
          '&Don'#39't use this option, thanks.')
        TabOrder = 0
      end
    end
    object tsDebug: TTabSheet
      Caption = '&Debug'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 16
        Top = 8
        Width = 257
        Height = 137
        Caption = ' Debug options : '
        TabOrder = 0
        object cbLogScanDirEvents: TCheckBox
          Left = 8
          Top = 16
          Width = 241
          Height = 17
          Caption = '&Log scan directories events'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbLogStateEvents: TCheckBox
          Left = 8
          Top = 64
          Width = 129
          Height = 17
          Caption = 'Log state ev&ents'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbLogStateEventsClick
        end
        object clrbState: TColorBox
          Left = 144
          Top = 61
          Width = 105
          Height = 22
          DefaultColorColor = clBlue
          Selected = clBlue
          ItemHeight = 16
          TabOrder = 2
        end
        object clrbSuccess: TColorBox
          Left = 144
          Top = 85
          Width = 105
          Height = 22
          DefaultColorColor = clGreen
          Selected = clGreen
          ItemHeight = 16
          TabOrder = 3
        end
        object cbLogSuccessEvents: TCheckBox
          Left = 8
          Top = 88
          Width = 129
          Height = 17
          Caption = 'Log success e&vents'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = cbLogSuccessEventsClick
        end
        object cbLogErrorEvents: TCheckBox
          Left = 8
          Top = 112
          Width = 129
          Height = 17
          Caption = 'Log errors event&s'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 5
        end
        object clrbError: TColorBox
          Left = 144
          Top = 109
          Width = 105
          Height = 22
          DefaultColorColor = clRed
          Selected = clRed
          ItemHeight = 16
          TabOrder = 6
        end
        object cbAutoScroll: TCheckBox
          Left = 8
          Top = 39
          Width = 241
          Height = 17
          Caption = '&Auto scroll log'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 7
        end
      end
    end
    object tsHexEdit: TTabSheet
      Caption = '&Hex Edit'
      ImageIndex = 5
      object GroupBox5: TGroupBox
        Left = 16
        Top = 16
        Width = 257
        Height = 49
        Caption = ' Hex Editor executable : '
        TabOrder = 0
        object eHexEdit: TEdit
          Left = 8
          Top = 16
          Width = 209
          Height = 21
          TabOrder = 0
        end
        object bHexEdit: TBitBtn
          Left = 224
          Top = 16
          Width = 27
          Height = 21
          TabOrder = 1
          OnClick = bHexEditClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070
            70727272FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF707070727272FF00FFFF00FFFF00FF585858
            6565655858585858585858585858585858585858585858587467668D80A06182
            A8585858FF00FFFF00FFFF00FF58585865656558585858585858585858585858
            58585858585858586868688B8B8B8A8A8A585858FF00FFFF00FF2389BC1C82B5
            1A80B3177DB0157BAE1278AB0F75A80C72A50A70A33A789E8E81A0498DDC349C
            DE4D4F50FF00FFFF00FF8D8D8D8686868484848181817F7F7F7C7C7C79797976
            76767474747D7D7D8C8C8C9D9D9DA4A4A44F4F4FFF00FFFF00FF1E84B744AADD
            D5F8FF79D7FF6ED4FF6ED4FF6ED4FF6ED4FF7EC9ED9488A84B8CD851BBFF0A70
            A62B5164727272FF00FF888888AEAEAEF6F6F6D9D9D9D6D6D6D6D6D6D6D6D6D6
            D6D6CCCCCC9393939C9C9CC4C4C4757575535353727272FF00FF2389BC298FC2
            D9FCFFAFECFF96C8D8CACCC1C5C7B6ADB9B893A5B25D93D053BDFF74DAFF1379
            AC0F5E865D5D5DFF00FF8D8D8D939393F9F9F9EBEBEBC7C7C7C8C8C8C2C2C2B7
            B7B7A7A7A79F9F9FC5C5C5DADADA7D7D7D6161615D5D5DFF00FF278DC02D93C6
            86CFF3CCC7C9F4EEE5FFFFEAFFFFD9FFF5C3DCB59990C5DA7EE6FF85EBFF369C
            CF1A80AB515151FF00FF919191979797D2D2D2C8C8C8ECECECF9F9F9F4F4F4E7
            E7E7B1B1B1C5C5C5E2E2E2E6E6E6A0A0A0828282515151FF00FF298FC24BB1E4
            3B9FD1DAC8B2FFFFFCFFFFF9FFFFE0FFF4C0FFE9B7B0CECD91F7FF91F7FF56BC
            EF147AA734505E727272939393B5B5B5A3A3A3C3C3C3FEFEFEFDFDFDF6F6F6E6
            E6E6DCDCDCCACACAEEEEEEEEEEEEC0C0C07C7C7C5151517272722C92C56BD1FC
            2389BCE3D2B2FFFFE6FFFFE8FFFFD9FFEDB8FFEDBED9D2BB99FFFF99FFFF5FC5
            F846ACC8145D814D4D4D969696D3D3D38D8D8DCACACAF8F8F8F8F8F8F4F4F4DF
            DFDFE1E1E1CCCCCCF4F4F4F4F4F4C9C9C9A9A9A96060604D4D4D2E94C77AE0FF
            45ABD5DEC5A5FFFFD0FFF9C9FFF4C2FFE9C2FFF7D1E8CFC3FFFFFFFFFFFF80E6
            FF78DEE9056597595959989898DEDEDEACACACBEBEBEF1F1F1EBEBEBE6E6E6E0
            E0E0ECECECCECECEFFFFFFFFFFFFE2E2E2D6D6D66969695959593096C985EBFF
            6ED4F2828B94FCE8B6FFEDB6FFF0C0FFFFF7EBDCD1508FB42389BC1F85B81B81
            B41A80B3046A9DFF00FF9A9A9AE6E6E6D2D2D28D8D8DDBDBDBDEDEDEE3E3E3FD
            FDFDDADADA9393938D8D8D8989898585858484846E6E6EFF00FF3298CB91F7FF
            8EF4FF90EAF4B9BFB8EBCDADE6CCA9DDC5B8E8D9D9FFFFFFFFFFFFFFFFFF157B
            AE707070FF00FFFF00FF9C9C9CEEEEEEECECECE3E3E3BCBCBCC7C7C7C4C4C4C4
            C4C4DBDBDBFFFFFFFFFFFFFFFFFF7F7F7F707070FF00FFFF00FF3399CCFFFFFF
            99FFFF99FFFF99FFFF99FFFFFFFFFF248ABD2187BA1E84B71C82B51A80B3177D
            B0FF00FFFF00FFFF00FF9D9D9DFFFFFFF4F4F4F4F4F4F4F4F4F4F4F4FFFFFF8E
            8E8E8B8B8B888888868686848484818181FF00FFFF00FFFF00FFFF00FF3399CC
            FFFFFFFFFFFFFFFFFFFFFFFF298FC2FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF9D9D9DFFFFFFFFFFFFFFFFFFFFFFFF939393FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            3399CC3298CB3096C92E94C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9D9C9C9C9A9A9A989898FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 2
        end
      end
      object GroupBox6: TGroupBox
        Left = 16
        Top = 72
        Width = 257
        Height = 49
        Caption = ' Parameters : '
        TabOrder = 1
        object eHexEditParams: TEdit
          Left = 8
          Top = 16
          Width = 241
          Height = 21
          TabOrder = 0
        end
      end
    end
  end
  object bCancel: TBitBtn
    Left = 232
    Top = 200
    Width = 75
    Height = 25
    Hint = 'Cancel changes and closes dialog.'
    Caption = '&Cancel'
    TabOrder = 1
    Kind = bkCancel
  end
  object bOK: TBitBtn
    Left = 152
    Top = 200
    Width = 75
    Height = 25
    Hint = 'Close this dialog and save changes.'
    Caption = '&OK'
    TabOrder = 2
    OnClick = bOKClick
    Kind = bkOK
  end
  object odHexEdit: TOpenDialog
    DefaultExt = 'exe'
    Filter = 'Applications (*.exe)|*.exe|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Choose your Hex Editor... :)'
    Left = 268
    Top = 144
  end
end
