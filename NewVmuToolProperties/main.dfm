object Main_Form: TMain_Form
  Left = 426
  Top = 272
  BorderStyle = bsDialog
  Caption = 'Properties of '
  ClientHeight = 441
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Infos_Label: TLabel
    Left = 8
    Top = 408
    Width = 196
    Height = 26
    Caption = 
      'VMU TOOL PC Shell Integration v1.0. Created by [big_fury]SiZiOUS' +
      ' and Speud'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object bClose: TBitBtn
    Left = 232
    Top = 408
    Width = 129
    Height = 25
    Caption = '&Close'
    TabOrder = 0
    OnClick = bCloseClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF434EAE2E3AAA6B6D84FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF747DC0
      1339E2073EFF0840FF2039C073737BFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF7981D0578FFA336DFF0840FF1248FF1248FF333FA2FF
      00FFFF00FFFF00FF6D72A81A35CB404695FF00FFFF00FFFF00FFFF00FF80BCFE
      80BCFE2960FE194EFF1D53FF194EFF464C8F636584263CBF0938F40038FF0330
      F04D5289FF00FFFF00FFFF00FF8292D695D6FF70AAFD2960FE265CFE265CFE21
      47E71A42E51248FF1248FF073EFF0038FF0C30E067699EFF00FFFF00FFFF00FF
      789DE28AC9FF578FFA2960FE3168FF2960FE265CFE1F54FE1248FF1248FF0038
      FF1433D98485BDFF00FFFF00FFFF00FFFF00FF5981E33A72FE3A72FE3A72FE36
      6EFE2960FE2960FE1F54FE194EFF2F48CFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF3F53C44079FF4D85FE4079FF4079FF366EFE3168FF2455F6444D9EFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF4C61C1578FFA5B95FF578FFA578FFA40
      79FF4079FF366EFE295BF54D5289FF00FFFF00FFFF00FFFF00FFFF00FF3C63E4
      609DFF67A1FE659FFE659FFE5B95FF5088FE4079FF3A72FE3168FF2455F65959
      7CFF00FFFF00FFFF00FF848CD473B1FF7CB8FE70AAFD73B1FF6DA9FD5A8EF470
      AAFD659FFE3A72FE336DFF2960FE2644CD6B6B7BFF00FFFF00FFFF00FF789DE2
      95D6FF8AC9FF70AAFD607CD18A8BC16A94E473B1FF5088FE3168FF2960FE1F54
      FE3044B6818197FF00FFFF00FFFF00FF6B8CDB779FE48A8BC1FF00FFFF00FFFF
      00FF5F97FB578FFA366EFE2960FE265CFE1A42E57376B2FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7C89D74079FF336DFF265CFE2049
      EA7D81C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF4B5CD12147E7656ECAFF00FFFF00FFFF00FFFF00FF}
  end
  object pcMain: TPageControl
    Left = 8
    Top = 8
    Width = 353
    Height = 393
    ActivePage = TabSheet2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&General'
      object iColorIconView: TImage
        Left = 24
        Top = 8
        Width = 32
        Height = 32
      end
      object lFileName: TLabel
        Left = 72
        Top = 16
        Width = 49
        Height = 13
        Caption = 'FILENAME'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 48
        Width = 329
        Height = 2
      end
      object Location_Label: TLabel
        Left = 16
        Top = 56
        Width = 54
        Height = 13
        Caption = 'Location :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CreationDate_Label: TLabel
        Left = 16
        Top = 80
        Width = 83
        Height = 13
        Caption = 'Creation date :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VmiCopyright_Label: TLabel
        Left = 16
        Top = 136
        Width = 85
        Height = 13
        Caption = 'VMI copyright :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VmsResourceName_Label: TLabel
        Left = 16
        Top = 160
        Width = 118
        Height = 13
        Caption = 'VMS resource name :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 8
        Top = 184
        Width = 329
        Height = 2
      end
      object VmFileName_Label: TLabel
        Left = 16
        Top = 192
        Width = 75
        Height = 13
        Caption = 'VM filename :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Type_Label: TLabel
        Left = 16
        Top = 264
        Width = 34
        Height = 13
        Caption = 'Type :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VmsSize_Label: TLabel
        Left = 16
        Top = 320
        Width = 49
        Height = 13
        Caption = 'VMS size'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DataLength_Label: TLabel
        Left = 16
        Top = 344
        Width = 117
        Height = 13
        Caption = 'Data length (bytes) :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DcDescription_Label: TLabel
        Left = 16
        Top = 216
        Width = 87
        Height = 13
        Caption = 'DC description :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VmDescription_Label: TLabel
        Left = 16
        Top = 288
        Width = 89
        Height = 13
        Caption = 'VM description :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 16
        Top = 312
        Width = 329
        Height = 2
      end
      object Bevel6: TBevel
        Left = 8
        Top = 104
        Width = 329
        Height = 2
      end
      object lLocation: TLabel
        Left = 75
        Top = 56
        Width = 262
        Height = 13
        AutoSize = False
        Caption = 'LOCATION'
      end
      object lCreationDate: TLabel
        Left = 107
        Top = 80
        Width = 26
        Height = 13
        Caption = 'DATE'
      end
      object lVmiCopyright: TLabel
        Left = 107
        Top = 136
        Width = 58
        Height = 13
        Caption = 'COPYRIGHT'
      end
      object lVmsResourceName: TLabel
        Left = 139
        Top = 160
        Width = 54
        Height = 13
        Caption = 'RESOURCE'
      end
      object lVmFilename: TLabel
        Left = 99
        Top = 192
        Width = 66
        Height = 13
        Caption = 'VM FILENAME'
      end
      object lDcDescription: TLabel
        Left = 107
        Top = 216
        Width = 85
        Height = 13
        Caption = 'DC DESCRIPTION'
      end
      object lVmDescription: TLabel
        Left = 115
        Top = 288
        Width = 85
        Height = 13
        Caption = 'VM DESCRIPTION'
      end
      object lVmsSize: TLabel
        Left = 131
        Top = 320
        Width = 45
        Height = 13
        Caption = 'VMS SIZE'
      end
      object lDataLength: TLabel
        Left = 139
        Top = 344
        Width = 68
        Height = 13
        Caption = 'DATA LENGTH'
      end
      object Copy_Label: TLabel
        Left = 16
        Top = 239
        Width = 34
        Height = 13
        Caption = 'Copy :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lType: TLabel
        Left = 59
        Top = 264
        Width = 24
        Height = 13
        Caption = 'TYPE'
      end
      object VmiDescrition_Label: TLabel
        Left = 16
        Top = 112
        Width = 94
        Height = 13
        Caption = 'VMI description :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lVmiDescription: TLabel
        Left = 115
        Top = 112
        Width = 68
        Height = 13
        Caption = 'DESCRIPTION'
      end
      object cbCopy: TCheckBox
        Left = 56
        Top = 238
        Width = 16
        Height = 17
        Alignment = taLeftJustify
        Enabled = False
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Advanced'
      ImageIndex = 1
      object ColorIconFrames_Label: TLabel
        Left = 88
        Top = 56
        Width = 104
        Height = 13
        Caption = 'Color icon frames :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorIconSpeed_Label: TLabel
        Left = 88
        Top = 8
        Width = 98
        Height = 13
        Caption = 'Color icon speed :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EyeCatchType_Label: TLabel
        Left = 88
        Top = 32
        Width = 86
        Height = 13
        Caption = 'Eyecatch type :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Crc_Label: TLabel
        Left = 8
        Top = 136
        Width = 28
        Height = 13
        Caption = 'CRC :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object iEyeCatch: TImage
        Left = 10
        Top = 10
        Width = 72
        Height = 56
      end
      object ApplicationName_Label: TLabel
        Left = 8
        Top = 88
        Width = 104
        Height = 13
        Caption = 'Application name :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VmiCheckSum_Label: TLabel
        Left = 8
        Top = 112
        Width = 91
        Height = 13
        Caption = 'VMI checksum : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 8
        Top = 80
        Width = 329
        Height = 2
      end
      object Bevel4: TBevel
        Left = 8
        Top = 160
        Width = 329
        Height = 2
      end
      object lApplicationName: TLabel
        Left = 123
        Top = 88
        Width = 98
        Height = 13
        Caption = 'APPLICATION NAME'
      end
      object lVmiCheckSum: TLabel
        Left = 107
        Top = 112
        Width = 75
        Height = 13
        Caption = 'VMI CHECKSUM'
      end
      object lCRC: TLabel
        Left = 43
        Top = 136
        Width = 21
        Height = 13
        Caption = 'CRC'
      end
      object lColorIconSpeed: TLabel
        Left = 195
        Top = 8
        Width = 98
        Height = 13
        Caption = 'COLOR ICON SPEED'
      end
      object lEyeCatchType: TLabel
        Left = 179
        Top = 32
        Width = 79
        Height = 13
        Caption = 'EYECATCH TYPE'
      end
      object lColorIconFrames: TLabel
        Left = 203
        Top = 56
        Width = 101
        Height = 13
        Caption = 'COLOR ICON FRAME'
      end
      object Label1: TLabel
        Left = 24
        Top = 195
        Width = 132
        Height = 13
        Caption = 'Warning : This can be slow.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 168
        Width = 112
        Height = 13
        Caption = 'Open VMU TOOL PC :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bVmuToolPc: TBitBtn
        Left = 168
        Top = 188
        Width = 169
        Height = 25
        Caption = '&Run in current directory ...'
        TabOrder = 0
        OnClick = bVmuToolPcClick
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
      object bRunVmuToolPcStandard: TBitBtn
        Left = 168
        Top = 224
        Width = 169
        Height = 25
        Caption = '&Normal run ...'
        TabOrder = 1
        OnClick = bRunVmuToolPcStandardClick
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF246E80005166FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B
          6B6B4E4E4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF3B8EA1005166005166FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A
          8A8A4E4E4E4E4E4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00516600516600516605A3BE07ADC7005166FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E4E4E4E4E4E4E
          4E4E999999A2A2A24E4E4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00516621B5CE0CD2F000DDFB01D1F103AFCB005166FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E4E4EACACACC5
          C5C5CDCDCDC3C3C3A4A4A44E4E4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0084A5005166008FAE30E4FC0BDEFB20D6EF06B2CD0051
          66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F4E4E4E88
          8888D7D7D7CFCFCFC9C9C9A7A7A74E4E4EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00637B00637B2BA5BB32D7EE30E4FC22BBD20051660051660051
          66005166FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5F9E9E9ECB
          CBCBD7D7D7B1B1B14E4E4E4E4E4E4E4E4E4E4E4EFF00FFFF00FFFF00FFFF00FF
          00637B00637B009CBE00ABD52CDFF94AEFFF4AEFFF4AEFFF2AD9F1005166FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5F959595A4A4A4D3D3D3E1
          E1E1E1E1E1E1E1E1CCCCCC4E4E4EFF00FFFF00FFFF00FFFF00FFFF00FF00637B
          008FAE03AFCB00B2D701B5DD16CDED56EBFD6BF7FF46C0CF00516600ABD50051
          66FF00FFFF00FFFF00FFFF00FF5F5F5F888888A4A4A4A9A9A9ADADADC2C2C2E0
          E0E0EAEAEAB7B7B74E4E4EA4A4A44E4E4EFF00FFFF00FFFF00FFFF00FFFF00FF
          00637B01B5DD01B5DD00BDE200BDE248E7FD8EFAFF8EFAFF58E2F4005166FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5FADADADADADADB3B3B3B3B3B3DC
          DCDCEFEFEFEFEFEFD8D8D84E4E4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          00637B008FAE00BDE200BDE200BDE21DCDED00DDFBC5FDFFA5FAFF62EEF90051
          66FF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F888888B3B3B3B3B3B3B3B3B3C3
          C3C3CDCDCDF7F7F7F2F2F2E1E1E14E4E4EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00637B00BDE200BDE201B5DD01B5DD00ABD501B5DD05CEF02CE3FC68FF
          FF005166FF00FFFF00FFFF00FFFF00FFFF00FF5F5F5FB3B3B3B3B3B3ADADADAD
          ADADA4A4A4ADADADC2C2C2D6D6D6EEEEEE4E4E4EFF00FFFF00FFFF00FFFF00FF
          FF00FF00637B00BDE201B5DD00ABD500ABD500ABD500ABD500A3D001B5DD0BBE
          E51DBFD9005166FF00FFFF00FFFF00FFFF00FF5F5F5FB3B3B3ADADADA4A4A4A4
          A4A4A4A4A4A4A4A49E9E9EADADADB6B6B6B4B4B44E4E4EFF00FFFF00FFFF00FF
          FF00FF00637B00637B0087A800ABD500ABD500ABD500A3D000A3D0009ECF008D
          B3005166FF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5F828282A4A4A4A4
          A4A4A4A4A49E9E9E9E9E9E9B9B9B8888884E4E4EFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00637B00637B0087A800A3D000A3D0009ECF0084A50051
          66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5F5F5F5F82
          82829E9E9E9E9E9E9B9B9B7F7F7F4E4E4EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00637B00637B0084A50084A5005166FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5F
          5F5F5F5F5F7F7F7F7F7F7F4E4E4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00637B00586DFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF5F5F5F545454FF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
      end
    end
  end
  object XPManifest: TXPManifest
    Left = 320
    Top = 352
  end
  object tColorIcon: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tColorIconTimer
    Left = 288
    Top = 352
  end
  object iIconFrames: TImageList
    Height = 32
    Width = 32
    Left = 256
    Top = 352
  end
end
