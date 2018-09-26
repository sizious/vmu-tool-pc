object Main_Form: TMain_Form
  Left = 269
  Top = 178
  Width = 650
  Height = 498
  Caption = 'VMU TOOL PC - v1.0 - by [big_fury]SiZiOUS and Speud'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmApp
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image3: TImage
    Left = 0
    Top = 29
    Width = 2
    Height = 234
    Align = alLeft
  end
  object Image4: TImage
    Left = 640
    Top = 29
    Width = 2
    Height = 234
    Align = alRight
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 263
    Width = 642
    Height = 3
    Cursor = crSizeNS
    Align = alBottom
    AutoSnap = False
    ResizeStyle = rsUpdate
  end
  object Splitter2: TSplitter
    Left = 155
    Top = 29
    Height = 234
    Cursor = crSizeWE
    AutoSnap = False
    ResizeStyle = rsUpdate
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 425
    Width = 642
    Height = 19
    Panels = <
      item
        Text = 'Status : '
        Width = 50
      end
      item
        Text = 'Idle...'
        Width = 70
      end
      item
        Text = 'Files count :'
        Width = 70
      end
      item
        Text = '0'
        Width = 40
      end
      item
        Text = 'Directory :'
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object flv: TVmuToolPcListView
    Left = 158
    Top = 29
    Width = 482
    Height = 234
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 130
      end>
    ColumnClick = False
    GridLines = True
    LargeImages = ilFilesIcons
    ReadOnly = True
    RowSelect = True
    PopupMenu = pmVmiList
    SmallImages = ilFilesIcons
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = flvSelectItem
    ColumnsView.ShowCheckSum = False
    ColumnsView.ShowDescription = False
    ColumnsView.ShowCopyright = False
    ColumnsView.ShowDate = False
    ColumnsView.ShowVmsResourceName = False
    ColumnsView.ShowVmFileName = False
    ColumnsView.ShowType = False
    ColumnsView.ShowCopy = False
    ColumnsView.ShowVmsSize = False
    ColumnsView.ShowVmDescription = False
    ColumnsView.ShowDcDescription = False
    ColumnsView.ShowApplicationName = False
    ColumnsView.ShowColorIconFrames = False
    ColumnsView.ShowColorIconSpeed = False
    ColumnsView.ShowEyecatchType = False
    ColumnsView.ShowCRC = False
    ColumnsView.ShowDataLength = False
  end
  object pBottom: TPanel
    Left = 0
    Top = 266
    Width = 642
    Height = 159
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Image2: TImage
      Left = 0
      Top = 0
      Width = 2
      Height = 159
      Align = alLeft
    end
    object Image5: TImage
      Left = 640
      Top = 0
      Width = 2
      Height = 159
      Align = alRight
    end
    object pcMain: TPageControl
      Left = 2
      Top = 0
      Width = 638
      Height = 159
      ActivePage = tsVMInfos
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object tsVMInfos: TTabSheet
        Caption = 'D&etails'
        DesignSize = (
          630
          131)
        object pTabVmiInfos: TPanel
          Left = 0
          Top = 0
          Width = 625
          Height = 128
          Anchors = [akTop, akBottom]
          BevelOuter = bvNone
          TabOrder = 0
          object Label6: TLabel
            Left = 15
            Top = 11
            Width = 61
            Height = 13
            Caption = 'VM filename:'
          end
          object Label10: TLabel
            Left = 4
            Top = 35
            Width = 73
            Height = 13
            Caption = 'DC description:'
          end
          object Label4: TLabel
            Left = 47
            Top = 59
            Width = 30
            Height = 13
            Caption = 'Date :'
          end
          object Label9: TLabel
            Left = 5
            Top = 83
            Width = 73
            Height = 13
            Caption = 'VM description:'
          end
          object Label7: TLabel
            Left = 48
            Top = 107
            Width = 28
            Height = 13
            Caption = 'Type:'
          end
          object Label3: TLabel
            Left = 256
            Top = 12
            Width = 51
            Height = 13
            Caption = 'Copyright:'
          end
          object Label2: TLabel
            Left = 253
            Top = 36
            Width = 57
            Height = 13
            Caption = 'Description:'
          end
          object Label5: TLabel
            Left = 259
            Top = 60
            Width = 49
            Height = 13
            Caption = 'Resource:'
          end
          object Label11: TLabel
            Left = 257
            Top = 84
            Width = 52
            Height = 13
            Caption = 'App name:'
          end
          object Label1: TLabel
            Left = 257
            Top = 108
            Width = 52
            Height = 13
            Caption = 'Checksum:'
          end
          object Label8: TLabel
            Left = 141
            Top = 108
            Width = 23
            Height = 13
            Caption = 'Size:'
          end
          object lblSizeType: TLabel
            Left = 213
            Top = 108
            Width = 29
            Height = 13
            Caption = 'blocks'
          end
          object Label12: TLabel
            Left = 556
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Edition :'
          end
          object eVmFilename: TEdit
            Tag = 6
            Left = 80
            Top = 8
            Width = 161
            Height = 21
            Hint = 'Filename on the Dreamcast'
            MaxLength = 12
            TabOrder = 0
            OnChange = eVmFilenameChange
          end
          object eDCDescription: TEdit
            Tag = 3
            Left = 80
            Top = 32
            Width = 161
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 1
            OnChange = eVmFilenameChange
          end
          object eDate: TEdit
            Tag = 7
            Left = 80
            Top = 56
            Width = 161
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
          end
          object eVMDescription: TEdit
            Tag = 2
            Left = 80
            Top = 80
            Width = 161
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
            OnChange = eVmFilenameChange
          end
          object cbxType: TComboBox
            Tag = 5
            Left = 81
            Top = 104
            Width = 56
            Height = 19
            Style = csOwnerDrawFixed
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = 'DATA'
            OnChange = cbxTypeChange
            Items.Strings = (
              'DATA'
              'GAME')
          end
          object cbCopy: TCheckBox
            Tag = 11
            Left = 411
            Top = 106
            Width = 53
            Height = 17
            Hint = 'Change state of the copy protection'
            Alignment = taLeftJustify
            Caption = 'Copy :'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 5
            OnClick = cbCopyClick
          end
          object eDescription: TEdit
            Tag = 8
            Left = 312
            Top = 32
            Width = 153
            Height = 21
            Hint = 'VMI description'
            MaxLength = 32
            TabOrder = 6
            OnChange = eVmFilenameChange
          end
          object eCopyright: TEdit
            Tag = 10
            Left = 312
            Top = 8
            Width = 153
            Height = 21
            Hint = 'VMI copyright'
            MaxLength = 32
            TabOrder = 7
            OnChange = eVmFilenameChange
          end
          object Panel2: TPanel
            Left = 494
            Top = 12
            Width = 36
            Height = 36
            AutoSize = True
            BevelOuter = bvLowered
            BevelWidth = 2
            TabOrder = 8
            object iColorIconView: TImage
              Left = 2
              Top = 2
              Width = 32
              Height = 32
            end
          end
          object Panel4: TPanel
            Left = 474
            Top = 64
            Width = 76
            Height = 60
            AutoSize = True
            BevelOuter = bvLowered
            BevelWidth = 2
            TabOrder = 9
            object iEyeCatch: TImage
              Left = 2
              Top = 2
              Width = 72
              Height = 56
            end
          end
          object eResource: TEdit
            Tag = 1
            Left = 312
            Top = 56
            Width = 153
            Height = 21
            Hint = 'Specify the resource file for the save'
            MaxLength = 8
            TabOrder = 10
            OnChange = eVmFilenameChange
          end
          object eAppName: TEdit
            Left = 312
            Top = 80
            Width = 153
            Height = 21
            Hint = 'Dreamcast on-screen application name'
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 11
            OnChange = eVmFilenameChange
          end
          object eCheckSum: TEdit
            Tag = 9
            Left = 312
            Top = 104
            Width = 89
            Height = 21
            Hint = 'VMI checksum'
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 12
          end
          object eVmsSize: TEdit
            Tag = 4
            Left = 168
            Top = 104
            Width = 41
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 13
          end
          object bSaveInfos: TBitBtn
            Left = 556
            Top = 32
            Width = 65
            Height = 41
            Hint = 'Write change to the file'
            Caption = '&Save'
            Enabled = False
            TabOrder = 14
            OnClick = bSaveInfosClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              3B3336573E42443236564F50757474868686FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF35353542424235353550505074747486
              8686FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF828282
              52404467474C5F4448897B7C9F6E73B19294B6B1B0898584716E6D736D6DFF00
              FFFF00FFFF00FFFF00FFFF00FF8282824343434C4C4C4848487D7D7D75757596
              9696B1B1B18585856E6E6E6E6E6EFF00FFFF00FFFF00FFFF00FFFF00FF747173
              644B4F6E4B5067474C9183857B54599F8688D5D0D0CBC6C5C0BBBAAB83866B49
              4E242124252526FF00FFFF00FF7272724F4F4F5050504C4C4C8585855A5A5A89
              8989D1D1D1C6C6C6BBBBBB8888884E4E4E222222252525FF00FFFF00FF6B6667
              735358764F556E4B50948789533D41978B8CDBD8D8D2CFCFC9C5C48C6E71503B
              40302B2E222022FF00FFFF00FF6767675858585555555050508989894141418D
              8D8DD8D8D8CFCFCFC5C5C57272723F3F3F2C2C2C212121FF00FFFF00FF665C5F
              7F5A607D5459764F55A095966D6769ACA8A8E1DFDFD9D7D7D1CECE6855584133
              37372E32292527FF00FFFF00FF5E5E5E6060605A5A5A555555979797686868A8
              A8A8DFDFDFD7D7D7CECECE585858363636303030262626FF00FFFF00FF66565A
              8A5F6585585D7E555B7A5B60785D60836F728F80829A9091A29B9C40373A3D32
              353D3135332E30FF00FFFF00FF5959596666665E5E5E5B5B5B60606061616172
              72728282829191919C9C9C3939393434343434342F2F2FFF00FFFF00FF6B5559
              94646A8D5B61BCDADEC3FAFEB9F1F5ABDCE19CC8CD8DB2B77E9CA16F868B5B63
              674335393E383AFF00FFFF00FF5959596B6B6B626262D8D8D8F5F5F5ECECECD8
              D8D8C5C5C5AFAFAF9A9A9A858585636363383838393939FF00FFFF00FF7B5F64
              9D676D98666CD1FBFECBF9FDC6FBFEC0FAFFBAF9FFB4F9FFADF8FFA6F8FF9FF7
              FE534D514B4647FF00FFFF00FF6464646F6F6F6D6D6DF7F7F7F5F5F5F6F6F6F5
              F5F5F4F4F4F3F3F3F2F2F2F1F1F1EFEFEF4F4F4F474747FF00FFFF00FF927176
              A56970A5777DD9FBFECAE7E8C5E4E6C1E4E6BDE4E6B8E4E6B3E3E6AEE3E6AAF2
              F6584B505A5657FF00FFFF00FF7676767272727E7E7EF8F8F8E4E4E4E1E1E1E1
              E1E1E0E0E0E0E0E0DFDFDFDEDEDEEBEBEB4E4E4E575757FF00FFFF00FFA98087
              AE6D73B3888DE0FAFCD7F4F6D4F7F9D1F9FCCDFAFEC7FBFFC1FAFFBBFAFFB3F7
              FC5942466B6868FF00FFFF00FF8787877676768E8E8EF8F8F8F1F1F1F4F4F4F6
              F6F6F6F6F6F6F6F6F5F5F5F5F5F5F1F1F1464646686868FF00FFFF00FFB7888F
              B67178C1989DE6FAFCDAEDEED4EAEBCFE7E9CAE5E6C6E4E6C2E4E6BEE4E6B6E6
              EA5F43487C797AFF00FFFF00FF8F8F8F7B7B7B9E9E9EF8F8F8EBEBEBE8E8E8E5
              E5E5E2E2E2E1E1E1E1E1E1E0E0E0E2E2E24848487A7A7AFF00FFFF00FFBF8A91
              BE767DCEA8ACE7F4F5DDECEDDAECEDD6EBEDD3EBEDCFECEECBECEEC7EDF0B8DB
              DE68484DFF00FFFF00FFFF00FF929292808080ADADADF3F3F3EBEBEBEAEAEAE9
              E9E9E9E9E9E9E9E9E9E9E9EAEAEAD8D8D84D4D4DFF00FFFF00FFFF00FFC68D94
              8F5C62D2B3B7F1FAFBEBF7F8E8F7F8E4F6F8E0F6F7DBF5F6D7F4F6D2F5F7B7CC
              D064464BFF00FFFF00FFFF00FF959595636363B8B8B8F9F9F9F6F6F6F6F6F6F5
              F5F5F4F4F4F2F2F2F1F1F1F2F2F2CBCBCB4B4B4BFF00FFFF00FFFF00FFCD8F97
              A3676EE3C4C7F8FEFFF5FEFFF2FEFFEFFDFFECFDFFE9FDFFE6FDFFE2FCFFC2C2
              C6584345FF00FFFF00FFFF00FF989898707070C8C8C8FEFEFEFDFDFDFDFDFDFC
              FCFCFCFCFCFBFBFBFBFBFBFAFAFAC3C3C3464646FF00FFFF00FFFF00FF917E80
              9380839B98989D9D9D9D9D9D9D9D9D9E9E9EA1A1A1A1A1A1A1A1A1A1A1A1A1A1
              A1FF00FFFF00FFFF00FFFF00FF8181818383839898989D9D9D9D9D9D9D9D9D9E
              9E9EA1A1A1A1A1A1A1A1A1A1A1A1A1A1A1FF00FFFF00FFFF00FF}
            NumGlyphs = 2
          end
          object bAbort: TBitBtn
            Left = 557
            Top = 80
            Width = 65
            Height = 41
            Hint = 'Abort all changes'
            Caption = '&Abort'
            Enabled = False
            TabOrder = 15
            OnClick = bAbortClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF5F61725F61726568826568825F6172FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF65656565
              65656F6F6F6F6F6F656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF6568824553B91F35DB0E24CC0A1EB74652B064698B6A6A6A5F61
              72FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F70707064646453
              53534949496C6C6C7272726A6A6A656565FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF656882122BEB142EF5142EF5142EF5142EF5132DF00E24CC4A56AA6568
              82656882FF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F61616166666666666666
              66666666666464645353536D6D6D6F6F6F6F6F6FFF00FFFF00FFFF00FFFF00FF
              142EF5142EF5142EF5223BF50F26D60F26D60E25D1142EF5142EF50F26D64F5A
              A76D6D6DFF00FFFF00FFFF00FFFF00FF66666666666666666670707058585858
              58585656566666666666665858586F6F6F6D6D6DFF00FFFF00FFFF00FFFF00FF
              142EF5142EF5142EF5FF00FFFF00FFFF00FFFF00FF223AF5142EF5142EF50D22
              C65F6172656882FF00FFFF00FFFF00FF666666666666666666FF00FFFF00FFFF
              00FFFF00FF6F6F6F6666666666665050506565656F6F6FFF00FFFF00FF142EF5
              142EF50F26D6FF00FFFF00FFFF00FFFF00FF223AF5132DF0142EF5142EF5122B
              EB5760A55F6172FF00FFFF00FF666666666666585858FF00FFFF00FFFF00FFFF
              00FF6F6F6F646464666666666666616161737373656565FF00FFFF00FF233BF6
              142EF50F26D6FF00FFFF00FFFF00FF223AF5132DF0233BF6FF00FF0F26D6142E
              F54553B9656882FF00FFFF00FF707070666666585858FF00FFFF00FFFF00FF6F
              6F6F646464707070FF00FF5858586666667070706F6F6FFF00FFFF00FF142EF5
              142EF50F26D6FF00FFFF00FF223AF5142EF5233BF6FF00FFFF00FF0F26D6142E
              F55561BF656882FF00FFFF00FF666666666666585858FF00FFFF00FF6F6F6F66
              6666707070FF00FFFF00FF5858586666667B7B7B6F6F6FFF00FFFF00FF142EF5
              142EF50E25D1FF00FF223AF5142EF5233BF6FF00FFFF00FFFF00FF0F26D6142E
              F55763BCFF00FFFF00FFFF00FF666666666666565656FF00FF6F6F6F66666670
              7070FF00FFFF00FFFF00FF5858586666667C7C7CFF00FFFF00FFFF00FF142EF5
              142EF5142EF5223AF5132DF0233BF6FF00FFFF00FFFF00FFFF00FF142EF5132D
              F0656882FF00FFFF00FFFF00FF6666666666666666666F6F6F646464707070FF
              00FFFF00FFFF00FFFF00FF6666666464646F6F6FFF00FFFF00FFFF00FFFF00FF
              142EF5142EF5142EF5132DF0FF00FFFF00FFFF00FFFF00FF233BF6142EF5142E
              F5FF00FFFF00FFFF00FFFF00FFFF00FF666666666666666666646464FF00FFFF
              00FFFF00FFFF00FF707070666666666666FF00FFFF00FFFF00FFFF00FFFF00FF
              142EF5142EF5142EF50F26D60F26D60C21C10F26D6142EF5142EF5142EF5FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF6666666666666666665858585858584E
              4E4E585858666666666666666666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF142EF5142EF5142EF5142EF5142EF5142EF5142EF5142EF5FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66666666666666666666666666
              6666666666666666666666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF142EF5142EF5142EF5142EF5FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66666666666666
              6666666666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
          end
        end
      end
      object tsReport: TTabSheet
        Caption = '&Report'
        ImageIndex = 3
        object reReport: TRichEdit
          Left = 0
          Top = 0
          Width = 630
          Height = 131
          Align = alClient
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
          OnEnter = reReportEnter
        end
      end
      object tsDebug: TTabSheet
        Caption = '&Debug'
        ImageIndex = 4
        object reDebug: TRichEdit
          Left = 0
          Top = 0
          Width = 630
          Height = 131
          Align = alClient
          PopupMenu = pmDebug
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
          OnChange = reDebugChange
          OnEnter = reDebugEnter
        end
      end
    end
  end
  object dtv: TVirtualExplorerTreeview
    Left = 2
    Top = 29
    Width = 153
    Height = 234
    Active = True
    Align = alLeft
    ButtonFillMode = fmShaded
    CheckImageKind = ckXP
    ColumnDetails = cdUser
    DefaultNodeHeight = 17
    DragHeight = 250
    DragWidth = 150
    ExplorerComboBox = vecbx
    FileSizeFormat = fsfExplorer
    FileSort = fsFileType
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Shell Dlg 2'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    HintMode = hmHint
    ParentColor = False
    RootFolder = rfDesktop
    TabOrder = 3
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages, toGhostedIfUnfocused]
    TreeOptions.SelectionOptions = [toLevelSelectConstraint]
    TreeOptions.VETShellOptions = [toContextMenus]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toBrowseExecuteZipFolder, toChangeNotifierThread, toRemoveContextMenuShortCut]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages, toMarkCutAndCopy]
    OnClick = dtvClick
    OnKeyUp = dtvKeyUp
    Columns = <>
  end
  object pComboTreeSelect: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 642
      Height = 2
      Align = alTop
    end
    object Image6: TImage
      Left = 0
      Top = 27
      Width = 642
      Height = 2
      Align = alBottom
    end
    object Image7: TImage
      Left = 0
      Top = 2
      Width = 2
      Height = 25
      Align = alLeft
    end
    object Image8: TImage
      Left = 585
      Top = 2
      Width = 2
      Height = 25
      Align = alRight
    end
    object vecbx: TVirtualExplorerCombobox
      Left = 2
      Top = 2
      Width = 583
      Height = 25
      Active = True
      Align = alClient
      TabOrder = 0
      Path = 'vecbx'
      TextType = ecbtFullPath
      VirtualExplorerTree = dtv
      OnPathChange = vecbxPathChange
    end
    object pComboButtons: TPanel
      Left = 587
      Top = 2
      Width = 55
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object bCancelScan: TBitBtn
        Left = 29
        Top = 1
        Width = 23
        Height = 23
        Enabled = False
        TabOrder = 0
        OnClick = miCancelScanClick
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF5F61725F61726568826568825F6172FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF65656565
          65656F6F6F6F6F6F656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF6568824553B91F35DB0E24CC0A1EB74652B064698B6A6A6A5F61
          72FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F70707064646453
          53534949496C6C6C7272726A6A6A656565FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF656882122BEB142EF5142EF5142EF5142EF5132DF00E24CC4A56AA6568
          82656882FF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F61616166666666666666
          66666666666464645353536D6D6D6F6F6F6F6F6FFF00FFFF00FFFF00FFFF00FF
          142EF5142EF5142EF5223BF50F26D60F26D60E25D1142EF5142EF50F26D64F5A
          A76D6D6DFF00FFFF00FFFF00FFFF00FF66666666666666666670707058585858
          58585656566666666666665858586F6F6F6D6D6DFF00FFFF00FFFF00FFFF00FF
          142EF5142EF5142EF5FF00FFFF00FFFF00FFFF00FF223AF5142EF5142EF50D22
          C65F6172656882FF00FFFF00FFFF00FF666666666666666666FF00FFFF00FFFF
          00FFFF00FF6F6F6F6666666666665050506565656F6F6FFF00FFFF00FF142EF5
          142EF50F26D6FF00FFFF00FFFF00FFFF00FF223AF5132DF0142EF5142EF5122B
          EB5760A55F6172FF00FFFF00FF666666666666585858FF00FFFF00FFFF00FFFF
          00FF6F6F6F646464666666666666616161737373656565FF00FFFF00FF233BF6
          142EF50F26D6FF00FFFF00FFFF00FF223AF5132DF0233BF6FF00FF0F26D6142E
          F54553B9656882FF00FFFF00FF707070666666585858FF00FFFF00FFFF00FF6F
          6F6F646464707070FF00FF5858586666667070706F6F6FFF00FFFF00FF142EF5
          142EF50F26D6FF00FFFF00FF223AF5142EF5233BF6FF00FFFF00FF0F26D6142E
          F55561BF656882FF00FFFF00FF666666666666585858FF00FFFF00FF6F6F6F66
          6666707070FF00FFFF00FF5858586666667B7B7B6F6F6FFF00FFFF00FF142EF5
          142EF50E25D1FF00FF223AF5142EF5233BF6FF00FFFF00FFFF00FF0F26D6142E
          F55763BCFF00FFFF00FFFF00FF666666666666565656FF00FF6F6F6F66666670
          7070FF00FFFF00FFFF00FF5858586666667C7C7CFF00FFFF00FFFF00FF142EF5
          142EF5142EF5223AF5132DF0233BF6FF00FFFF00FFFF00FFFF00FF142EF5132D
          F0656882FF00FFFF00FFFF00FF6666666666666666666F6F6F646464707070FF
          00FFFF00FFFF00FFFF00FF6666666464646F6F6FFF00FFFF00FFFF00FFFF00FF
          142EF5142EF5142EF5132DF0FF00FFFF00FFFF00FFFF00FF233BF6142EF5142E
          F5FF00FFFF00FFFF00FFFF00FFFF00FF666666666666666666646464FF00FFFF
          00FFFF00FFFF00FF707070666666666666FF00FFFF00FFFF00FFFF00FFFF00FF
          142EF5142EF5142EF50F26D60F26D60C21C10F26D6142EF5142EF5142EF5FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF6666666666666666665858585858584E
          4E4E585858666666666666666666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF142EF5142EF5142EF5142EF5142EF5142EF5142EF5142EF5FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66666666666666666666666666
          6666666666666666666666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF142EF5142EF5142EF5142EF5FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66666666666666
          6666666666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
      end
      object bRefresh: TBitBtn
        Left = 3
        Top = 1
        Width = 23
        Height = 23
        TabOrder = 1
        OnClick = miRefreshClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFA37875A37875A37875A37875A37875A3
          7875A37875A37875A37875A37875A37875A3787590615EFF00FFFF00FFFF00FF
          A67C76F2E2D3F2E2D3FFE8D1EFDFBBFFE3C5FFDEBDFFDDBAFFD8B2FFD6AEFFD2
          A5FFD2A3936460FF00FFFF00FFFF00FFAB8078F3E7DAF3E7DA019901AFD8A071
          C57041AA3081BB5EEFD4A6FFD6AEFFD2A3FFD2A3966763FF00FFFF00FFFF00FF
          B0837AF4E9DDF4E9DD01990101990101990101990101990141AA2FFFD8B2FFD4
          A9FFD4A99A6A65FF00FFFF00FFFF00FFB6897DF5EDE4F5EDE401990101990111
          9E0ECFD6A3FFE4C821A21AFFD8B2FFD7B0FFD7B09E6D67FF00FFFF00FFFF00FF
          BC8E7FF7EFE8F7EFE8019901019901019901019901FFE4C8EFDEBAFFD8B2FFD7
          B0FFD9B4A27069FF00FFFF00FFFF00FFC39581F8F3EFF8F3EFF8F3EFFFF4E8FF
          F4E8FFF4E8EFE3C4EFE3C4FFE4C8FFDEBDFFDDBBA5746BFF00FFFF00FFFF00FF
          CA9B84F9F5F2FBFBFBFFF4E8FFF4E8FFF4E8019901019901019901FFE8D1FFE3
          C5FFE1C2A8776DFF00FFFF00FFFF00FFD2A187F9F9F9FBFBFB119F10AFD8A0FF
          F4E8AFD8A0019901019901FFE8D1FFE4C8FFE3C6AC7A6FFF00FFFF00FFFF00FF
          D9A88AFBFBFBFFFFFF71C570019901019901019901019901019901FFE8D1FFE8
          D1FFE6CEAE7C72FF00FFFF00FFFF00FFDFAE8CFCFCFCFFFFFFFFFFFF71C57001
          9901019901AFD8A0019901FFE8D1FFC8C2FFB0B0B07E73FF00FFFF00FFFF00FF
          E5B38FFDFDFDFDFDFDFFFFFFFFFFFFFFFFFEFFFAF6FFF9F3FFF5EAF4DECEB280
          74B28074B28074FF00FFFF00FFFF00FFEAB891FEFEFEFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFEFFFAF6FFF9F3F5E1D2B28074EDA755D3A390FF00FFFF00FFFF00FF
          EFBC92FFFFFFFFFFFFFCFCFCFAFAFAF7F7F7F5F5F5F2F1F1F0EDEAE9DAD0B280
          74DAAA93F6CDD2FF00FFFF00FFFF00FFF2BF94DCA987DCA987DCA987DCA987DC
          A987DCA987DCA987DCA987DCA987B28074F7CDD2FF00FFFF00FF}
      end
    end
  end
  object mmApp: TMainMenu
    Images = ilMenuIcons
    OwnerDraw = True
    Left = 16
    Top = 176
    object File1: TMenuItem
      Caption = '&File'
      object Opencurrentfolder2: TMenuItem
        Caption = '&Open current folder...'
        ImageIndex = 18
        ShortCut = 16463
        OnClick = Opencurrentfolder1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object miCreateVmi2: TMenuItem
        Caption = '&Create associated VMI...'
        Enabled = False
        ImageIndex = 19
        OnClick = miCreateVmiClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miCopyTo2: TMenuItem
        Caption = 'C&opy to...'
        Enabled = False
        ImageIndex = 8
        ShortCut = 16451
        OnClick = miCopyToClick
      end
      object miMoveTo2: TMenuItem
        Caption = '&Move to...'
        Enabled = False
        ImageIndex = 10
        ShortCut = 16472
        OnClick = miMoveToClick
      end
      object miDelete2: TMenuItem
        Caption = '&Delete...'
        Enabled = False
        ImageIndex = 9
        OnClick = miDeleteClick
      end
      object miHexEdit2: TMenuItem
        Caption = '&View in Hex editor...'
        Enabled = False
        ImageIndex = 11
        ShortCut = 16453
        OnClick = miHexEditClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object miSaveReport2: TMenuItem
        Caption = '&Save details...'
        Enabled = False
        ImageIndex = 5
        ShortCut = 16467
        OnClick = miSaveReportClick
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object miPictures: TMenuItem
        Caption = '&Pictures'
        Enabled = False
        ImageIndex = 12
        object miVmiIcon: TMenuItem
          Caption = '&VMS icon'
          ImageIndex = 21
          object miAnimateIcon2: TMenuItem
            Caption = '&Animate icon'
            Checked = True
            OnClick = miAnimateIconClick
          end
          object N13: TMenuItem
            Caption = '-'
          end
          object miDisplayFrames2: TMenuItem
            Caption = 'Display &frames'
            ImageIndex = 17
            object miFrame2_1: TMenuItem
              Tag = 1
              Caption = 'Frame &1'
              OnClick = miFrame1Click
            end
            object miFrame2_2: TMenuItem
              Tag = 2
              Caption = 'Frame &2'
              OnClick = miFrame1Click
            end
            object miFrame2_3: TMenuItem
              Tag = 3
              Caption = 'Frame &3'
              OnClick = miFrame1Click
            end
          end
          object N14: TMenuItem
            Caption = '-'
          end
          object miSaveIcon2: TMenuItem
            Caption = '&Save to...'
            ImageIndex = 5
            OnClick = miSaveIconClick
          end
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object miSaveEyeCatchTo2: TMenuItem
          Caption = '&Save eye catch...'
          ImageIndex = 5
          OnClick = miSaveEyeCatchToClick
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = '&Exit'
        ImageIndex = 1
        ShortCut = 16465
        OnClick = miExitClick
      end
    end
    object View1: TMenuItem
      Caption = '&View'
      object Columns1: TMenuItem
        Caption = '&Columns view...'
        ImageIndex = 24
        ShortCut = 16460
        OnClick = Columns1Click
      end
      object Movecolumns1: TMenuItem
        Caption = '&Move columns...'
        ImageIndex = 23
        ShortCut = 16461
        OnClick = Movecolumns1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Details1: TMenuItem
        Caption = '&Style'
        ImageIndex = 22
        object Style1: TMenuItem
          Tag = 1
          Caption = '&Details'
          Checked = True
          OnClick = Style1Click
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object Style2: TMenuItem
          Tag = 2
          Caption = 'Icons list'
          OnClick = Style1Click
        end
        object Style3: TMenuItem
          Tag = 3
          Caption = 'Small icons'
          OnClick = Style1Click
        end
        object Style4: TMenuItem
          Tag = 4
          Caption = 'Large icons'
          OnClick = Style1Click
        end
      end
      object Iconsize1: TMenuItem
        Caption = '&Icon size'
        ImageIndex = 20
        object Icon1: TMenuItem
          Tag = 1
          Caption = '24x24'
          Checked = True
          OnClick = Icon1Click
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object Icon2: TMenuItem
          Tag = 2
          Caption = '32x32'
          OnClick = Icon1Click
        end
        object Icon3: TMenuItem
          Tag = 3
          Caption = '16x16'
          OnClick = Icon1Click
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object miClearDebug2: TMenuItem
        Caption = '&Clear debug log...'
        ImageIndex = 14
        OnClick = miClearDebugClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miCancelScan2: TMenuItem
        Caption = 'C&ancel scan'
        Enabled = False
        ImageIndex = 16
        ShortCut = 16474
        OnClick = miCancelScanClick
      end
      object miRefresh: TMenuItem
        Caption = '&Refresh'
        ImageIndex = 0
        ShortCut = 116
        OnClick = miRefreshClick
      end
    end
    object miConfig: TMenuItem
      Caption = '&Config'
      object Checksumformat1: TMenuItem
        Caption = 'Chec&ksum format'
        ImageIndex = 15
        object Checksum1: TMenuItem
          Tag = 1
          Caption = '&Decimal'
          Checked = True
          OnClick = Checksum1Click
        end
        object Checksum2: TMenuItem
          Tag = 2
          Caption = '&Hexa'
          OnClick = Checksum1Click
        end
      end
      object VMS_Size: TMenuItem
        Caption = '&VMS size format'
        ImageIndex = 13
        object VMSSize1: TMenuItem
          Tag = 1
          Caption = 'Bl&ocks'
          Checked = True
          OnClick = VMSSize1Click
        end
        object VMSSize2: TMenuItem
          Tag = 2
          Caption = '&Bytes'
          OnClick = VMSSize1Click
        end
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object miOptions: TMenuItem
        Caption = '&Options...'
        ImageIndex = 2
        ShortCut = 16463
        OnClick = miOptionsClick
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object Help2: TMenuItem
        Caption = 'Mai&n help...'
        ImageIndex = 4
        ShortCut = 112
        OnClick = Help2Click
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object Websites1: TMenuItem
        Caption = 'Websites'
        ImageIndex = 25
        object SiZiOUS1: TMenuItem
          Caption = '&SiZiOUS'
          OnClick = SiZiOUS1Click
        end
        object Speud1: TMenuItem
          Caption = 'S&peud'
          OnClick = Speud1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '&About...'
        ImageIndex = 3
        ShortCut = 123
        OnClick = About1Click
      end
    end
  end
  object XPManifest: TXPManifest
    Left = 80
    Top = 176
  end
  object tColorIcon: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tColorIconTimer
    Left = 488
    Top = 256
  end
  object pmVmuIcon: TPopupMenu
    Images = ilMenuIcons
    MenuAnimation = [maBottomToTop]
    OwnerDraw = True
    Left = 520
    Top = 288
    object miAnimateIcon: TMenuItem
      Caption = '&Animate icon'
      Enabled = False
      OnClick = miAnimateIconClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object miDisplayFrames: TMenuItem
      Caption = 'Display &frames'
      Enabled = False
      ImageIndex = 17
      object miFrame1: TMenuItem
        Tag = 1
        Caption = 'Frame &1'
        Checked = True
        OnClick = miFrame1Click
      end
      object miFrame2: TMenuItem
        Tag = 2
        Caption = 'Frame &2'
        OnClick = miFrame1Click
      end
      object miFrame3: TMenuItem
        Tag = 3
        Caption = 'Frame &3'
        OnClick = miFrame1Click
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miSaveIcon: TMenuItem
      Caption = '&Save to...'
      Enabled = False
      ImageIndex = 5
      OnClick = miSaveIconClick
    end
  end
  object ilFilesIcons: TImageList
    Height = 24
    Width = 24
    Left = 176
    Top = 48
  end
  object ilFrameAnim: TImageList
    Height = 32
    Width = 32
    Left = 520
    Top = 256
  end
  object ilMenuIcons: TImageList
    Left = 48
    Top = 176
    Bitmap = {
      494C01011A001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE9E9C00CAA29F00CA9CA000E8BCC10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007C979B009DBD
      C30091AFB5007A909300848F9100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4C9
      D000CA9A9200E8B18300F1E4D000EFE1CA00DFC5B100CDA29B00CE9D9F00DFB1
      B500E8BCC1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009AA6A70087ACB40098B9C000B3CC
      D100BAD0D500B3CCD100ADC7CD009BBCC20081A1A600768A8D008D9597000000
      0000000000000000000000000000000000000000000000000000F1C6CC00DBAE
      9D00EEC18F00ECB98800F3EADC00F1E4D000EFE1CA00B58F8B00AE7C7C00B784
      8400D1AE9700C5A08A00C1958F00E0B5BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008AA0A4009FBDC400A7C3C900C0D4
      D900C5D8DC00BED3D800B8CFD400B1CAD000ABC6CB00A4C1C7009DBCC3008AAF
      B6007694990076888B00000000000000000000000000F0C4CA00E0B9A000F2CD
      9B00F0C69400EEC18F00F4ECE000F3E9DB00F0E3CE00B58F8B009B696900A06E
      6E00D8BBA000E6CFA600E4CCA000C99A9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008FA4A800AEC8CD00B6CED300CCDD
      E100D0E0E300C9DBDF00C2D6DB00BCD2D700B5CDD200AFC9CE00A8C4CA00A2C0
      C6009CBBC20096B7BE008BB0B7000000000000000000D1AB9600F5DAA700F3D3
      A000F2CD9B00F0C69400F8F3EB00F4ECE000F2E9DA00B58F8B00996767009967
      6700D6BBA300E8D3AF00E6CFA600C99A9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095A8AB00BDD2D700C5D8DD00D5E4
      E700DBE8EB00D4E3E600CEDEE200C7DADE00C0D5D900BAD0D500B3CCD100ADC7
      CD00A6C2C900A0BEC50097B8BF000000000000000000D1AB9600F7E1AE00F5DA
      A700F3D2A000F2CD9B00F9F6F000F8F3EB00F4EBDF00B58F8B00996767009967
      6700D7BEA900EAD7B600E8D3AF00C99A9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009BADB000CCDDE100D4E3E600DEEA
      ED00E6F0F200E0EBED00D9E6E900D2E1E500CBDDE000C5D8DC00BED3D800B8CF
      D400B1CAD000ABC6CB00A1BFC5000000000000000000D1AB9600F8E6B400E6CA
      A10090A4BD009F9FAB00FFFEFE00F9F6F000F7F2E900D9C0AE00B58F8B00A97E
      7A00D9C0AE00ECDBBF00EAD6B500C99A9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBE8EA00E3EDF000ECF4
      F500F1F8F900EBF3F500E4EEF000DDE9EC00D7E5E800D0E0E300C9DBDF00C2D6
      DB00BCD2D700B5CDD200AAC5CB000000000000000000D1AB9600D5CAAE0054AF
      F7003A9FFF003792F30091BCEF00FFFEFE00F9F6F000F7F2E900F3EBDE00F2E7
      D700F0E2CD00EEDFC600ECDBBF00C99A9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8DCDF00DBEBE200A5D7
      AF00DAEADE00F5FAFB00EFF6F800E9F1F300E2ECEF00DBE8EB00D4E3E600CEDE
      E200C7DADE00C0D5D900A2C0C40000000000F7CFD600A5B7D00066CBFF005ABF
      FF004BB0FF003DA2FF003694F700B5D4F700FEFEFD00F8F5ED00F7F2E900F3EB
      DE00F2E7D700F0E2CD00D1B7B100D1A5AA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D9E9B0055C16B004EEB
      7A0047D46D00EAF3F100F0F6F800EFF5F700EDF4F600E6F0F200E0EBED00D9E6
      E900D2E1E500C7DADD0092A1A300000000004FB4FF004FB4FF005CC1FF0065CA
      FF005DC2FF004EB3FF003EA3FF003796F800B4D5F800FEFDFB00F8F5ED00F6F0
      E600F3EADD00C7BEC4009A87A500EAC3CD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007BA27F001EB7350031CA510041E0
      670042D76800D6E6DF00E3EDF000DAE7EA00D2E1E400CFDFE200D0E0E300CFDF
      E300B2C9CD00000000000000000000000000EDCDDA0064AFF7004DB2FF005ABF
      FF0065CAFF005EC3FF004FB4FF0041A6FF003697FB00B4D5F800FEFDFB00F8F5
      ED00B6BCD1006E76AC00E2C0CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005CAC6C001AC0310026CA420033D5
      550041E1690043D2660064C77D00C7D9DD00BBD1D600ACC6CC0096B7BE008DA1
      A4000000000000000000000000000000000000000000EDCDDA007AB3F2004CB1
      FF0059BEFF0065CAFF0061C6FF0052B7FF0042A7FF00379AFC00B4D6FB00B7CD
      EC005275BC00D8BCCF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000089B0900039BF52001ABF310026CA
      430034D6560042E1690040D3640091A09F0099ABAE0098A8AB00000000000000
      00000000000000000000000000000000000000000000000000000000000086B6
      F00049AEFF0056BBFF0063C8FF0062C7FF0053B8FF0045AAFF00379BFE00398A
      EB00D6C1D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000037A6430019BF
      300026C6410046D56A0051AE6500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000083B3F00048ADFF0055BAFF0062C7FF0064C9FF0051AFF9002F76DF003269
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004EB15F0025C9
      400019B32E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008FB6ED0074B6F500A7C6EC00DDCFDF00BA9CC70001019900305D
      E300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007EB0
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9B6CC007C689F009B82
      AC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F2BB
      A300BE8F7B009F847B00D3A59100AF8979000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006D9BBC000A9CF3003392B6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3A69A00FFED
      DF00FFEAD900F9CEB500FDE6D600FEEAD900EFC0A900A2807300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002393E0000BBFFF001CF7FE0029A5C90000000000000000000000
      00000000000000000000000000000000000000000000567E3F0038847500387C
      3300B06C5500B56C5600B56C5600B56C5600B56C5600B56C5600B56C5600B56C
      5600B56C5600B56C5600B36C570000000000F3A88A00E68C6B00E3795C0098A2
      62003EDA6D0084AE6500DB755A00D8785B00D7785B00D7795B00D7795B00D779
      5C00D8795C00C17C660000000000000000000000000000000000E8BEAA00FFEF
      E300FEECDD00F9D2BC00FFF0E300FFECDD00FFE8D600FEE2CC00E1AC92009B80
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000894F20011D2FF001AF4FF001BF6FE0022B7D9007C8E9A000000
      0000000000000000000000000000000000006BB878005DB68A002A9D7F002BCC
      4700DA7B5100E4785300E4785300E4785300E4785300E4785300E4785300E478
      5300E4795300E4795300E479530000000000D2CDC200E4D0BB00E7C8B7008FB7
      8A002ABE6F00769B5F00DB643E00D6674000D5674000D4664000D3653F00D364
      3D00D1623B00BF694A0000000000000000000000000000000000F8DBCB00F2EE
      E100FCDECB00F4E3D700FDF4E800FFEEE000FFEAD900FFE6D200FFE1CA00FDD7
      BB00DF9779009B87810000000000000000000000000000000000000000000000
      000000000000019AFC0015E2FF0018EDFF0019EFFF001AF2FF001BE2F7001CD3
      F0001CD6F1001DD8F1007992A30000000000A1685000A2471700A84F1F00B555
      2800C5522A00CC5B3400D0613A00D2633C00D2623C00CF5F3800C9583000C14E
      2600B8431A00AE370D00AA32080000000000329AF6003DA1F80042A4F8003599
      E8002C93E2004C8DCB00CE664500D6633A00D1623B00CE5D3600C7562E00BF4C
      2400B64017009D47290000000000000000000000000000000000EAE3DB0023BE
      3800C5CF9D00DBB9AB00E1926D00F1D3B700FFF3E200FFE9D800FFE4CE00FFDF
      C500FFDABC00FBC9A700BA796100000000000000000000000000000000000000
      00004D92C20002A6FF0016E4FF0016E6FF0017E9FF0018EBFF0018EEFF0019F0
      FF001AF2FF001BDCF4000000000000000000A3644D00AD421E004B95A700B95F
      4200D76C4700E4785300E97F5A00EC825D00EB815C00E77D5700E0744E00D668
      4200CB5A3300BD492100AF380F00000000002791F6002F98F900369BFA00419F
      FD0047A3FF0045A6FF00AA92A100FB845600EF825C00E87D5700E0744D00D668
      4100CB5B3300A4513300000000000000000000000000C8B0A500C4DCC20045CF
      5600F8E4D500CF856B00E5805B00ED9C7600E8A98200FAEDCE00FEF0DB00FFE4
      CF00FFDCC000FFD7B700BC877300000000000000000000000000000000005D91
      B20004A1F8000CC7FF0013DCFF0014DFFF0015E1FF0016E4FF0016E7FF0017E9
      FF0018ECFF0024B2D8000000000000000000A76852006E75820013DBFF0017E5
      FC00CC876F00F6916C00F8977200F9997500F9987400F8957000F48D6800EA80
      5B00DD704A00CE5E3700BD4A2100000000003397F60041A0F80047A2F9004DA5
      F90053A8FA0056ABFC0061ACF700BAA1AB00F9967200F9916B00F1896400E77C
      5700DC6E4800AD5A3E00000000000000000000000000E3C3B400A3DDAE009AD8
      8B00E9E2DC00E7A27C00E98B6600EBB29400E4886300C4865600D1E0AA00FEF3
      D100FEEED700F8C4A500000000000000000000000000000000003093C80003B0
      FC000CC8FF0010D2FF0011D5FF0012D7FF0013DAFF0013DDFF0014DFFF0015E2
      FF0016E5FF004D90AB000000000000000000A76E5C0045A5C1000BC3FF000ECA
      FD00D1927D00F9A17D00FAA78200FAAA8500FAA98400FAA58000F99E7900F894
      7000EE856000DE714B00CB5B3300000000003A9AF6004AA4F90051A7FA005CAC
      FA0068B3FB0071B7FB0071BAFE006BBAFF00A5B0CD00F7A07E00FB997400F68F
      6B00EC815C00B4644800000000000000000000000000F9DBCA00BCDDB400E2E3
      C100E7D1BF00E9C3A4005D7A9C0086A4B800D06A410077B0580044D364008ECC
      7B00FEEBD400C3937F0000000000000000000000000017ABE20001C4FE000BC3
      FF000DC7FF000ECAFF000FCDFF0010D0FF0010D2FF0011D5FF0012D8FF0013DB
      FF0014DEFF004F86A1000000000000000000AF715C00DB7552004AAAD000D99B
      8500F9A68100FAB08B00FBB79200FBBA9500FBBA9400FAB58F00FAAC8700F9A1
      7D00F8957100EB825D00D76A430000000000409DF60054A9FA0061AFFA0072B7
      FB007EBEFC0087C2FC008AC4FC0088C4FE007EC3FF00D2B2AE00FFA57B00FA9C
      7800F8926E00BC6D5100000000000000000000000000FBE8DD00E8D4B700FAEC
      E100E9BB9E007DA3C0003BA1F1002E93E0008E9C6B00398D6B006FBD750041BC
      4C00FCDECA000000000000000000000000000000000031AAD90003D0FB0007C5
      FF000BBFFF000CC2FF000CC5FF000DC8FF000ECBFF000FCEFF0010D0FF0011D3
      FF0011D6FF00279AC7000000000000000000B2756000EC825D00F6957100FAA5
      8000FAB28D00FBBE9800FBC7A100FCCBA500FCCAA400FBC49E00FBB99400F7AB
      8800C6808600DA806C00E27650000000000045A0F60061AFFA0073B9FB0083C1
      FC0090C7FD0098CBFD009CCDFD009BCDFE0094CCFF00D7BEB700FFB08700FAA5
      8100FC9D7900C1735800000000000000000000000000F4EBE600F1CFAF00EAE3
      DF00FAB18D002B678D00389AE2003F99DD0028323F002B6EB20054798000F3DC
      C100E6B49C000000000000000000000000000000000000000000000000001DB5
      E30003CFFD0007C0FF000ABDFF000BC0FF000CC3FF000DC6FF000DC9FF000ECB
      FF000FCEFF0014BBF1000000000000000000B4786300F5A68700FAD9C4008C94
      9B00EDB79600FCCBA400FCD6AF00FDDCB500FDDAB300FCD1AB00FAC49E00606A
      C3006FA8D7003A67C200B26266000000000049A1F7006EB6FB0081BFFC0091C7
      FD009DCEFD00A6D3FE00AAD5FE00A9D5FF00A7D2FC00EBC7B000FEBB9300FAAF
      8A00FDA58000C4785C00000000000000000000000000EBE9E700FBDAC000E8CB
      BE00FAA68100938B8E004078A000A18B83003539400030669C0096919700FEE8
      D700B39588000000000000000000000000000000000000000000000000000000
      000053A0C30002D9FE0007B7FF0009B8FF0009BBFF000ABEFF000BC1FF000CC4
      FF000DC5FD0010BFF7008298A70000000000B6796400A8829A00646AB700D9CD
      C300EBC0A200FCD4AD00FDE2BB00FEECC500FDE9C200FDDDB600DBB4A9007B9B
      D600809FA3007BB1B300714B8F000000000050A5F7007ABCFC008CC5FD009CCE
      FD00A9D4FE00B2D8FE00B6DBFF00B4DBFF00B5D8FB00F8D1AF00FFC49900FDB7
      9000FEAC8700C8806500000000000000000000000000E8E3E000FEE7D500E3AE
      9B00F99A7600F99E7A00FAA37E00FAA78200BB87700097736300F3B69700FDE6
      D700000000000000000000000000000000000000000000000000000000000000
      00000000000010C8F00006C2FF0006AFFF0007B2FF0008B5FE00299DD8007EA4
      BB0000000000000000000000000000000000B67A65009270960080A3DE00888C
      B500E2B59D00FCD7B100FDE8C100FEF7CF00FEF1CA00FDE1BA00F6CBA9006476
      D500AED6DA004875B200A8607B00000000004EA5F90083C1FC0095CAFD00A6D2
      FE00B3D9FE00BCDEFF00C1E0FF00C0E0FF00BADEFF00D5D9DC00F9CCAA00FEBD
      9700FFB28E00D88E71000000000000000000C9BBB100E9E0DB00FEE2CB00F2E7
      DE00E8DAD400E7C5B700E6AF9A00E9A08200F8A07C00FAA47F00FBC6AE00F2CC
      B700000000000000000000000000000000000000000000000000000000000000
      0000000000004CADD0000BDAFF0004A7FF0005AAFE003392CB00000000000000
      000000000000000000000000000000000000B47C6800EE876200D68F7A00F2A6
      8000F3B48E00F4C39C00F4D0A900F5D9B200F5D7AF00F4CBA400F3BD9600DA9D
      8D008F5E9700B56C7F00E479530000000000000000007DB9F4007EB8F20082BA
      F20085BCF20087BDF20088BDF20088BDF20087BDF20083BCF40087BBF000AAAB
      BD00D8967C00000000000000000000000000C6B8AE00F6F1EE00EAE3DF00F4E7
      DD00FDE7D700FDE5D400FDE4D400F8E0D000E9D7CB00E8CDC000F4DDD100C7A8
      9800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000016EDFB0003A7FE003190CC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8B1A600CBB5AB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007AA8BD0063A0BC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F6172005F61720065688200656882005F6172000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E50520090727400635356000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000070707000727272000000000000000000000000000000000000000000F6C0
      A400F1BDA000C2977E00A5918500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000656882004553B9001F35DB000E24CC000A1EB7004652B00064698B006A6A
      6A005F6172000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063565300A6918100D5C5AA00885F62006759
      5B00000000000000000000000000000000000000000058585800656565005858
      5800585858005858580058585800585858005858580058585800746766008D80
      A0006182A8005858580000000000000000000000000000000000ECB29700FEFD
      FD00FFFEFE00FEF9F700FCE6DA00FAD4BE00E9B49600B8887300A59188000000
      0000000000000000000000000000000000000000000000000000000000006568
      8200122BEB00142EF500142EF500142EF500142EF500132DF0000E24CC004A56
      AA00656882006568820000000000000000000000000000000000000000000000
      00000000000000000000635F5F008E746500FCD6B000FDEAC300E2D4B6009364
      67006D6263000000000000000000000000002389BC001C82B5001A80B300177D
      B000157BAE001278AB000F75A8000C72A5000A70A3003A789E008E81A000498D
      DC00349CDE004D4F500000000000000000000000000000000000F9E1D700FEF0
      EA00FCCCBC00FDE9E200FEFDFD00FEF3EF00FBBDA800FAB49C00FAAF9200FAAA
      8900DD997B000000000000000000000000000000000000000000142EF500142E
      F500142EF500223BF5000F26D6000F26D6000E25D100142EF500142EF5000F26
      D6004F5AA7006D6D6D0000000000000000000000000000000000000000000000
      000000000000000000004A434000D5947600FBC59F00FDDDB600FEEFC700E4D6
      B9009E696E00746B6C0000000000000000001E84B70044AADD00D5F8FF0079D7
      FF006ED4FF006ED4FF006ED4FF006ED4FF007EC9ED009488A8004B8CD80051BB
      FF000A70A6002B516400727272000000000000000000D6988100FEFBF900FFFB
      F800FEF3EE00FCD7CA00FBC4B000FAB49B00FAA98C00FAB39A00FBB8A100FBBB
      A500F9C5A7000000000000000000000000000000000000000000142EF500142E
      F500142EF50000000000000000000000000000000000223AF500142EF500142E
      F5000D22C6005F61720065688200000000000000000000000000000000000000
      000000000000000000004F464100684C4300F1AC8900FCCDA600F9DFB900BCA8
      9600A07A7B00906D710000000000000000002389BC00298FC200D9FCFF00AFEC
      FF0096C8D800CACCC100C5C7B600ADB9B80093A5B2005D93D00053BDFF0074DA
      FF001379AC000F5E86005D5D5D000000000000000000EFB19B00FFF8F300FCCA
      B700FCD4C500FEF1EB00FFFCFA00FCD1C100FAB29800FAA88B00FBB79F00FBD9
      C900B7A0930000000000000000000000000000000000142EF500142EF5000F26
      D60000000000000000000000000000000000223AF500132DF000142EF500142E
      F500122BEB005760A5005F617200000000000000000000000000000000000000
      0000000000000000000082625400835B4D004F3F3B00E2AA8A009D8070007662
      5F0000000000000000000000000000000000278DC0002D93C60086CFF300CCC7
      C900F4EEE500FFFFEA00FFFFD900FFF5C300DCB5990090C5DA007EE6FF0085EB
      FF00369CCF001A80AB00515151000000000000000000F4C9B900FFF4EB00FEF5
      EE00FDE6DB00FCCBB900FBC2AD00CA917E00F1AD9600FCD2C300FEEFE900F0BB
      9F000000000000000000000000000000000000000000233BF600142EF5000F26
      D600000000000000000000000000223AF500132DF000233BF600000000000F26
      D600142EF5004553B90065688200000000000000000000000000000000000000
      000000000000000000008A665600FAA47F00B1725B00483B390065544E000000
      000000000000000000000000000000000000298FC2004BB1E4003B9FD100DAC8
      B200FFFFFC00FFFFF900FFFFE000FFF4C000FFE9B700B0CECD0091F7FF0091F7
      FF0056BCEF00147AA70034505E0072727200BD998E00F8DBCF00FEE3D400FBC0
      A800FDD3C100FEEEE500FFF7F1007A97B40063B3F400519EE700BACFE600BB92
      7D000000000000000000000000000000000000000000142EF500142EF5000F26
      D6000000000000000000223AF500142EF500233BF60000000000000000000F26
      D600142EF5005561BF0065688200000000000000000000000000000000000000
      00000000000000000000966E5F00FBAC8600FA9E7A00B2705A005B504B000000
      0000000000000000000000000000000000002C92C5006BD1FC002389BC00E3D2
      B200FFFFE600FFFFE800FFFFD900FFEDB800FFEDBE00D9D2BB0099FFFF0099FF
      FF005FC5F80046ACC800145D81004D4D4D00C48B7900FCE4D800FFEADA00FEEC
      DE00FDDCCB00FCC5AE00FBBFA80081B7DE0007B9FB000CAFFC002E8FEE008C8B
      90000000000000000000000000000000000000000000142EF500142EF5000E25
      D10000000000223AF500142EF500233BF6000000000000000000000000000F26
      D600142EF5005763BC0000000000000000000000000000000000000000000000
      00000000000000000000B5857000FCB48F00FBA68100AD725C0067605D000000
      0000000000000000000000000000000000002E94C7007AE0FF0045ABD500DEC5
      A500FFFFD000FFF9C900FFF4C200FFE9C200FFF7D100E8CFC300FFFFFF00FFFF
      FF0080E6FF0078DEE900056597005959590000000000F9BB9C00FAB39200FAB3
      9600FCC9B200FEE3D200FFEFE2006CDDEE0010D8FF0000BCFF0012A8FB002D84
      D9000000000000000000000000000000000000000000142EF500142EF500142E
      F500223AF500132DF000233BF60000000000000000000000000000000000142E
      F500132DF0006568820000000000000000000000000000000000000000000000
      0000000000008F8482008B665D00E6AD8C00FBAE8900A5735E00726F6F000000
      0000000000000000000000000000000000003096C90085EBFF006ED4F200828B
      9400FCE8B600FFEDB600FFF0C000FFFFF700EBDCD100508FB4002389BC001F85
      B8001B81B4001A80B300046A9D000000000000000000D7D1CC00FDEDE300F4C2
      AF00EE8E6D00FCBEA300FBBA9F00E4B6A40033D7EA000CD0FF0001BDFF0018A0
      FA00347FC6000000000000000000000000000000000000000000142EF500142E
      F500142EF500132DF00000000000000000000000000000000000233BF600142E
      F500142EF5000000000000000000000000000000000000000000000000000000
      00000000000082676500946E6400574142009B7361008E665500000000000000
      0000000000000000000000000000000000003298CB0091F7FF008EF4FF0090EA
      F400B9BFB800EBCDAD00E6CCA900DDC5B800E8D9D900FFFFFF00FFFFFF00FFFF
      FF00157BAE007070700000000000000000000000000000000000E2D7D000FFF6
      EF00F3A58300FEDBC200FFE3CD00FEE5D100D2D7D00024E4F90008C9FF0006BA
      FA00659ECE006C75910000000000000000000000000000000000142EF500142E
      F500142EF5000F26D6000F26D6000C21C1000F26D600142EF500142EF500142E
      F500000000000000000000000000000000000000000000000000000000000000
      000000000000A87C7700FBCAA400E6A88800835C51004D3A3700000000000000
      0000000000000000000000000000000000003399CC00FFFFFF0099FFFF0099FF
      FF0099FFFF0099FFFF00FFFFFF00248ABD002187BA001E84B7001C82B5001A80
      B300177DB000000000000000000000000000000000000000000000000000F4EE
      E900FAB99600FED4B400FFDCC000FFDFC600FFE3CC00B6DBDD001DE3F9008EB9
      D300526AE1001A48FD004C57990000000000000000000000000000000000142E
      F500142EF500142EF500142EF500142EF500142EF500142EF500142EF5000000
      000000000000000000000000000000000000000000000000000000000000928A
      8B00AC828100EBD0B100FCD8B200FBC59F00D29479005B4B4A00000000000000
      000000000000000000000000000000000000000000003399CC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00298FC200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0A88A00F6C7B400FEE5D200FFE0C700FFDBBF00FFEAD900ABA4A0008B9A
      E9005B7CFF002651FF000B3AFA00000000000000000000000000000000000000
      000000000000142EF500142EF500142EF500142EF50000000000000000000000
      00000000000000000000000000000000000000000000000000008C808100A979
      7E00D5AD9F00EFDBBB00FDE5BD00EBC3A2008969640000000000000000000000
      00000000000000000000000000000000000000000000000000003399CC003298
      CB003096C9002E94C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CA7C6700E48D7400EFB5A300F6CFC000C4705600858C
      BD006A88FF004066FF005166C900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000091818400957F7C00897D7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BF938700B8988F000000
      00008991C0009399BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000070707000707070007070
      7000707070007070700070707000707070007070700070707000707070007070
      7000707070007070700070707000000000000000000000000000000000000000
      0000004152000041520000415200004152000041520000415200000000000000
      000000000000000000000000000000000000000000000000FF00000080000000
      80008080800000000000000000000000000000000000000000000000FF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009191910091919100919191009191
      9100919191009191910091919100919191009191910091919100919191009191
      9100919191009191910070707000000000000000000000415200004152000041
      5200006C82000092AC00009EB900009EB900009EB900009EB900004152004A27
      0F0000000000000000000000000000000000000000000000FF00000080000000
      800000008000808080000000000000000000000000000000FF00000080000000
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009797970080CC800080CC800082CF
      880084D4930086D99F0086D99F0088DEAB008BE3B9008CE5BF008DE7C30090EC
      D10099ECCF0091919100707070000000000000000000004152000098B200009E
      B900009EB900009EB900009EB900009EB900009EB900009EB900004152005A2F
      12004A270F004A270F000000000000000000000000000000FF00000080000000
      8000000080000000800080808000000000000000FF0000008000000080000000
      8000000080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A9B9B0020752200207522002277
      28002277280022772800237D2E0035894800469360005AB1810093F2DF0093F3
      E10095F7EB009191910070707000000000000000000000415200008EA700009E
      B900009EB900009EB900009EB9000099B3000091AA0000728700004152006B38
      15007C4118006B3815004A270F000000000000000000000000000000FF000000
      8000000080000000800000008000808080000000800000008000000080000000
      8000000080008080800000000000000000000000000000000000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F0000450000004500000043
      0000004300000046000000460000004C0000003B0000227F2C0092F0D90096F8
      ED0094F5E7009191910070707000000000005A2F120052514300007991000087
      9F0000637700004D5F00004D5F00004D5F00004A5C0000415200213533006B38
      15007C4118008C491B007B4018004A270F000000000000000000000000000000
      FF00000080000000800000008000000080000000800000008000000080000000
      8000808080000000000000000000000000000000000000000000000000000080
      0000000000000000000000000000000000000000000000000000008000000080
      000000800000000000000000000000000000A4A4A500004F0000004F0000003B
      0000003800000038000000380000107310000867080078C6780080CC80007ACA
      7A0074C774009191910070707000000000005A2F1200845F3F00004152000058
      6C000A95AD0021B9CC0042E8F5004BF4FF004BF4FF0045CFD700253431004A27
      0F006B3815008C491B008C491B004A270F000000000000000000000000000000
      00000000FF000000800000008000000080000000800000008000000080008080
      8000000000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000800000000000000000
      000000000000008000000000000000000000AAA9AA00207D2000207D20000049
      000000380000003E0000004F000044A1440064BE640066C2660095AB3C00D19C
      1800E5980C009191910070707000000000005A2F1200A46032002D3D38002EA4
      B3003FE4F5004BF4FF0047F0FF0044EDFF004DEBF60054A3A00030555600834F
      2D004A270F004A270F007C4118004A270F000000000000000000000000000000
      0000000000000000800000008000000080000000800000008000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000800000000000000000
      000000000000008000000000000000000000AFAFAF005AB35A005AB35A000055
      000000490000006300000C720C0090912800B4841200CA800800DF7A0000E37E
      0000E58000009191910070707000000000005A2F12006B381500A5673E00004D
      5F003FA7B2003CE6FF003CE6FF003CE6FF004ADEED00004D5F00AE805C00FCAB
      7900DC9262009D643E004A270F004A270F000000000000000000000000000000
      0000000000000000FF0000008000000080000000800000008000808080000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000000000000000000000000000000000000800000000000000000
      000000000000008000000000000000000000B4B4B50046B5460046B546000A74
      0A001678130010700D00785E0000C6600000C6600000C9630000CC660000CC66
      0000CC6600009191910070707000000000005A2F1200AA693E00E9996500C881
      5300004D5F003FA7B20029D6EF0029D6EF004AACB300565C4F00E89A6900FCAB
      7900FCAB7900FCAB7900AA6E45004A270F000000000000000000000000000000
      00000000FF000000800000008000000080000000800000008000808080000000
      0000000000000000000000000000000000000000000000000000008000000000
      0000000000000000000000000000000000000000000000800000000000000000
      000000000000008000000000000000000000B8B9B90044AF310044AF310068A9
      4100BFC97900AFBF6C00FAE09900ECBF7300D9994D00B34D0000B34D0000B34D
      0000B85200009191910070707000000000006B381500D7895400E9996500E999
      6500C57F5000004A5B003FA7B20033C1D400004D5F00C17C4F00F3A26F00F3A2
      6F00FCAB7900FCAB7900EA9D6E005B3012000000000000000000000000000000
      FF00000080000000800000008000808080000000800000008000000080008080
      8000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000000000000000000000000000800000000000000000
      000000000000008000000000000000000000BDBDBE00FFD27300FFD27300FFD2
      7300FFD27300FFD27300FFD27300FFD27300FFD27300FDD78200EFCF9600C68D
      6300A03A00009191910070707000000000007B401800C4794600E9996500E999
      6500E9996500C37D4D00004758003FA7B200565C4F00DA8F5F00F3A26F00F3A2
      6F00F3A26F00FCAB7900FCAB79006B38150000000000000000000000FF000000
      8000000080000000800080808000000000000000FF0000008000000080000000
      8000808080000000000000000000000000000000000000000000000000000000
      0000008000000000000000000000000000000000000000000000008000000080
      000000800000000000000000000000000000C1C1C200FDD07700FDD07700FFAD
      2600FFAD2600FEBC4900FEB73E00FFB23200FDD07700F8E9B900F8EDC400F8ED
      C400F9E6BB009191910070707000000000008C491B00A8613100E0915B00E999
      6500E9996500E9996500C37D4D0000415200CE845200E9996500E9996500F3A2
      6F00F3A26F00F1A16E00C67A49008C491B0000000000000000000000FF000000
      800000008000808080000000000000000000000000000000FF00000080000000
      8000000080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C4C4C600F4D5A300F4D5A300F6C9
      8300F6C98300F4D5A300F4D5A300F4D5A300F4D5A300F4D5A300F4D5A300F4D5
      A300F7D5A200919191007070700000000000000000008C491B00A8613100D285
      5100E0915B00E9996500E9996500BC784900E9996500E9996500E9996500E999
      6500E1925F00B36B3B008C491B00000000000000000000000000000000000000
      FF000000800000000000000000000000000000000000000000000000FF000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7C7C800F3CF9D00F3CF9D00F3CE
      9C00F3CE9C00F3CC9A00F3CC9A00F3CB9900F3CA9800F3C99700F3C99700F3C8
      9600F6CB990091919100707070000000000000000000000000008C491B008C49
      1B00B66D3B00CD814D00E0915B00E0915B00E0915B00E0915B00CD814D00B66D
      3B008C491B008C491B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2C3C300C2C3C300C0C0C100BEBD
      BF00BBBBBD00B9B8B900B6B6B600B3B3B400B0B1B100AEADAE00AAABAB00A8A7
      A900A4A5A6009191910000000000000000000000000000000000000000000000
      00008C491B008C491B008C491B008C491B008C491B008C491B008C491B008C49
      1B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0756E0074434200744342007443420074434200744342007443
      4200744342007443420074434200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0756E00FFF8E500F7EDD900F7EBD500F4E9D100F4E9D000F4E7
      CF00F6EAD000EEDDC400754443000000000000000000000000006E6E6E006E6E
      6E00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000097300200A338
      0100A03601009A32020000000000000000000000000097300200A03601009D35
      0100952E02000000000000000000000000000000000000000000000000007070
      7000707070007070700070707000707070007070700070707000707070007070
      7000707070007070700000000000000000000000000000000000000000000000
      000000000000A0756E00F7EDDC00F2D9BF00F2D7BB00F0D5BA00EFD4B500EED3
      B200EED9BF00E5D0BA00754443000000000000000000795FEA002900DF003F28
      A600656565000000000000000000000000000000000000000000000000000000
      00006250B2002E07D800000000000000000000000000000000009E3501000000
      000000000000932D0200952D020000000000952D020099300200000000000000
      0000972F02000000000000000000000000000000000000000000BC897700BE8B
      7900BE8B7900BA877600B7847500B17E7200AE7B7100AB786F00AB786F00A16E
      6B009E6B68007070700000000000000000000000000000000000000000000000
      000000000000A0756E00FAEFDE00FCC59100FCC59100FCC59100FCC59100FCC5
      9100FCC59100E3D1BC00754443000000000000000000795FEA002900DF00300A
      DB00534E6A006565650000000000000000000000000000000000000000004629
      C3002900DF005A46B600000000000000000000000000000000009E3501000000
      00000000000000000000952D020000000000952E020000000000000000000000
      0000962E020000000000000000000000000000000000857DA400C18E7A00DCBB
      A600E6C6B400E6C6B400E6C6B400E6C6B400E6C6B400DCBBA600DCBBA600DCBB
      A600A16E6B0070707000000000000000000000000000A0756E00744342007443
      420074434200A0756E00FCF4E700F6D9BA00F7D7B600F6D4B500F6D4B200F4D1
      AD00F0DCC200E6D3C00081524C00000000000000000000000000795FEA002900
      DF003D1CD2005F5F5F00000000000000000000000000000000003A18CD002E07
      D8005A46B60000000000000000000000000000000000000000009E350100912C
      02000000000000000000932D020000000000952E020000000000000000008A27
      0300962F0200000000000000000000000000000000005693DC00857DA400D2AD
      AC00FDE6D500FFE5CC00FFE3C700FFDFBF00FFDBB800FFD8B200FFD3A800FFD2
      A500A3706B0070707000000000000000000000000000A0756E00FFF8E500F7ED
      D900F7EBD500A0756E00FEF6EB00F8DABC00F8D9B800F8D8B700F7D5B600F7D4
      B200F3DEC700E7D7C50081524D00000000000000000000000000000000000000
      00002900DF005238C3006464640000000000000000003A18CD002E07D8005A46
      B60000000000000000000000000000000000000000000000000000000000A138
      01009C330200A13601009F330100000000009D3201009F350100962F0200952E
      020000000000000000000000000000000000000000003B87E3005693DC00857D
      A400DCC1B000FFE9D400FFE5CC00FFE1C400FFDFBF00FFDBB800FFD8B200FFD3
      A800A5726C0070707000000000000000000000000000A0756E00F7EDDC00F2D9
      BF00F2D7BB00A0756E00FEFAF200FCC59100FCC59100FCC59100FCC59100FCC5
      9100FCC59100EBDDCF008F5F5A00000000000000000000000000000000000000
      0000000000002900DF005137C30053505E003312C7002C06D7005A46B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099310100A02F0000882F0500692D1500882D06009F2E0000972F02000000
      0000000000000000000000000000000000000000000000000000EEC294003B87
      E300857DA400E6C6B400D0B0A200D5AC9800DCBBA600EED7AD00FFD6BA00FFD8
      B200AB786F0070707000000000000000000000000000A0756E00FAEFDE00FCC5
      9100FCC59100A0756E00FFFCFA00FCE3CC00FBE0C700FADEC600F8DEC400FCE2
      C600FCF0DE00E1D7CE008F5E5900000000000000000000000000000000000000
      000000000000795FEA002900DF002C06D7002B05D6006A628C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006848390098868700952E020000000000000000000000
      0000000000000000000000000000000000000000000000000000EEC29400B9BE
      C400B9BEC400C6A09200F1E4BE00FFFFD900F0DDD200DCBBA600EED7AD00FFD9
      B400AE7B710070707000000000000000000000000000A0756E00FCF4E700F6D9
      BA00F7D7B600A0756E00FFFFFF00FEFFFF00FBFBFB00FAF8F700FAFAF600E5D5
      D000C6B1AF00A79395009E675A00000000000000000000000000000000000000
      000000000000000000002F08D9002900DF00472BC4006A628C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B3F3500B19D9C00BDA3A1006E59510055433900000000000000
      0000000000000000000000000000000000000000000000000000EEC29400EFD9
      CD00DCBBA600F4E2B600FFFAC900FFFFEB00FFFFFA00EFD9CD00DCBBA600FFDF
      BF00B17E720070707000000000000000000000000000A0756E00FEF6EB00F8DA
      BC00F8D9B800A0756E00FFFFFF00FFFFFF00FFFEFE00FFFCF800FFFEFA00A075
      6E00A0756E00A0756E00A0756E00000000000000000000000000000000000000
      0000000000003A18CD002E07D8005A46B600360FE000593DD6006A628C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000088766E00E6D4D70077635900AC8F8C00997B77004B3B30000000
      0000000000000000000000000000000000000000000000000000EEC29400F0DD
      D200DCBBA600FFE5B300FFF5C400FFFFE700FFFFEB00FFFCCF00CDA69300FFE1
      C400B784750070707000000000000000000000000000A0756E00FEFAF200FCC5
      9100FCC59100A0756E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A075
      6E00E5A15400B6735D0000000000000000000000000000000000000000000000
      00003A18CD002900DF005A46B6000000000000000000431FE2004A28DD006A62
      8C00000000000000000000000000000000000000000000000000000000000000
      000055413500E2D9D800AD9D98004B372A00A0868000C6A4A500664F44000000
      0000000000000000000000000000000000000000000000000000EEC29400F0DD
      D200DCC1B000F1E4BE00FFF1BE00FFFAC900FFFED100F4E2B600D0B0A200FFE5
      CC00BA87760070707000000000000000000000000000A0756E00FFFCFA00FCE3
      CC00FBE0C700A0756E00A0756E00A0756E00A0756E00A0756E00A0756E00A075
      6E00AA6D68000000000000000000000000000000000000000000000000003917
      CC002900DF005A46B600000000000000000000000000000000005F40E700350E
      DF006A628C000000000000000000000000000000000000000000000000009175
      6F0090827900E7E5E2005D4A3D00000000005E4A3E00C0A09F0091756F009175
      6F00000000000000000000000000000000000000000000000000EEC29400F2E1
      DD00E2C9C300EFD9CD00F0DDD200FFE9B600F4E2B600D5AC9800F7D8C000FADC
      C200BC89770070707000000000000000000000000000A0756E00FFFFFF00FEFF
      FF00FBFBFB00FAF8F700FAFAF600E5D5D000C6B1AF00A79395009E675A000000
      00000000000000000000000000000000000000000000000000003917CC002900
      DF005A46B6000000000000000000000000000000000000000000000000005F40
      E7002900DF000000000000000000000000000000000000000000000000005642
      3600CCC5C10097898000000000000000000000000000826B6300B29592005642
      3600000000000000000000000000000000000000000000000000EEC29400FCE8
      D800FCFCFC00E2C9C300DCBBA600DCB29800DCB29800E2C9C300F7D8C000FF9E
      9E00BE8B790070707000000000000000000000000000A0756E00FFFFFF00FFFF
      FF00FFFEFE00FFFCF800FFFEFA00A0756E00A0756E00A0756E00A0756E000000
      00000000000000000000000000000000000000000000411DE0002900DF004629
      C300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B59
      4D00B0A59E00513E3100000000000000000000000000513E3100997F7A006D57
      4D00000000000000000000000000000000000000000000000000EEC29400FBEF
      E700FFFFFF00FFFFFF00FFFFFF00FFFEFD00FFFAF300FFF6ED009B6A69009B6A
      69009B6A690070707000000000000000000000000000A0756E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0756E00E5A15400B6735D00000000000000
      000000000000000000000000000000000000000000003610E1004D2CE1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C5B
      4E00705F530000000000000000000000000000000000000000006B5449006C56
      4B00000000000000000000000000000000000000000000000000EEC29400FFF2
      E500FFFFFE00FFFFFE00FFFEFD00FFFEFD00FFFCF900FFF8F2009B6A6900DAA7
      8600C6A0920000000000000000000000000000000000A0756E00A0756E00A075
      6E00A0756E00A0756E00A0756E00A0756E00AA6D680000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005441
      3300000000000000000000000000000000000000000000000000000000005541
      3500000000000000000000000000000000000000000000000000EEC29400F0BD
      9200E4BA9800DCB29800DCB29800D5AC9800CDA69300CDA693009B6A6900C79E
      9E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000600060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A49004D4A49004D4A
      49004D4A49004D4A49004D4A4900000000000000000000000000000000000000
      00000000000060006000600060008F00D0007F007F0000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7A7007373
      73007373730059595900595959004B4B4B004B4B4B003D3D3D00303030003030
      300030303000A7A7A70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000057545400D19494009A7979004D4A
      49009E707000DD8888004D4A4900000000000000000000000000000000006000
      6000600060008F00D000CF67CF00D0E7E000BFBFBF007F007F00000000000000
      00000000000000000000000000000000000000000000A7A7A70063360000CDCD
      CD00E6E6E600C1C1C100C1C1C100CDCDCD00F0F0F000EDEDED00E6E6E600A7A7
      A7003333330030303000A7A7A700000000008181810059595900595959005959
      5900595959005959590059595900595959005959590059595900595959005959
      590059595900595959004B4B4B00818181000000000000000000000000000000
      0000000000000000000000000000000000006D6B6D008D6C6C00EEA5A500FFAB
      AB00AF7878004D4A49004D4D4D00000000000000000060006000600060008F00
      D000CF67CF00D0E7E000D0E7E000D0E7E000BFBFBF00BFBFBF007F007F000000
      000000000000000000000000000000000000633600006336000063360000DADA
      DA00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600DADA
      DA00CB8C44006336000030303000303030004B4B4B00D9A77D00CB8C4400CB8C
      4400CB8C4400CB8C4400CB8C4400CB8C4400CB8C4400CB8C4400CB8C4400CB8C
      4400CB8C4400CB8C4400CB8C44004B4B4B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B7F7F00E29F
      9F00524945004D4D4D0000000000000000007F007F008F00D000CF67CF00D0E7
      E000D0E7E000BFBFBF00BFBFBF007F007F00909790008FA7AF00BFBFBF007F00
      7F000000000000000000000000000000000063360000CB8C440063360000D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00CB8C4400CB8C4400CB8C4400CB8C
      4400CB8C4400633600007F5B0000303030007F5B0000FFFFCC00D9A77D00D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A7
      7D00D9A77D00D9A77D00CB8C44004B4B4B00000000004D4D4D004D4D4D004D4D
      4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D007E717000DD9F
      9F003E3028004D4D4D004D4D4D004D4D4D007F007F0090979000D0E7E000BFBF
      BF008FA7AF007F007F007F007F0090009000000000008087800090979000BFBF
      BF007F007F0000000000000000000000000063360000D9A77D0063360000D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00CB8C4400CB8C4400CB8C
      4400CB8C440063360000CB8C4400303030007F5B0000FFFFCC00D9A77D00D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A7
      7D00D9A77D00D9A77D00CB8C44004B4B4B0068605C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0083787800DDA5
      A500564B4600FFFFFF00645C57004D4D4D007F007F0090979000BFBFBF007F00
      7F007F007F00CF00CF00CF00CF00CF00CF009000900000000000606760009097
      90008FA7AF007F007F00000000000000000063360000D9A77D0063360000D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00CB8C4400CB8C
      4400CB8C440063360000CB8C44003D3D3D007F5B0000FFFFCC00D9A77D00D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A7
      7D00D9A77D00D9A77D00CB8C44004B4B4B0068605C00FFFFFF00B0360200B036
      0200B0360200B0360200B0360200B0360200B0360200FFFFFF00867C7C00DDA9
      A90060565100FFFFFF00645C57004D4D4D007F007F007F007F007F007F00CF00
      CF00CF00CF009000900090009000CF00CF00CF00CF0090009000000000006067
      600090979000808780007F007F000000000063360000D9A77D0063360000AA3F
      2A00633600006336000063360000633600006336000063360000633600006336
      0000CB8C440063360000CB8C44004B4B4B007F5B0000FFFFCC00D9A77D00D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A7
      7D00D9A77D00D9A77D00CB8C44004B4B4B0068605C00FFFFFF00B0360200B036
      0200B0360200B0360200B0360200B0360200B0360200FFFFFF00867D7D00DDAE
      AE0060565100FFFFFF00645C57004D4D4D007F007F00FF97FF00CF00CF00CF00
      CF00CF00CF0000FFFF002FC8FF002F679000900090007F007F00900090000000
      000060676000909790007F007F000000000063360000D9A77D00633600009A9A
      9A00AAFFFF0099F8FF0099F8FF0099F8FF0099F8FF0099F8FF0099F8FF0099F8
      FF006336000063360000CB8C44004B4B4B007F5B0000FFFFCC00D9A77D00D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A7
      7D00D9A77D00D9A77D00CB8C44004B4B4B0068605C00FFFFFF00B0360200B036
      0200B0360200B0360200B0360200B0360200B0360200FFFFFF00877F7E00DDB2
      B20060565100FFFFFF00645C57004D4D4D00000000007F007F00FF97FF00CF00
      CF00CF00CF00CF00CF00CF00CF0000FFFF0000FFFF002FC8FF002F6790007F00
      7F0000000000606760007F007F000000000063360000D9A77D0063360000AAFF
      FF00CDCDCD00A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700C1C1
      C10099F8FF0063360000CB8C44004B4B4B007F5B0000F6CACA00D9A77D00D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A7
      7D00D9A77D00D9A77D00CB8C44004B4B4B0068605C00FFFFFF00B0360200B036
      0200B0360200B0360200B0360200B0360200B0360200FFFFFF0087807F00DDB6
      B60060565100FFFFFF00645B57004D4D4D0000000000000000007F007F00FF97
      FF00CF00CF00CF00CF00CF00CF00CF00CF00CF00CF002FC8FF0000FFFF006000
      60007F007F00000000007F007F000000000063360000D9A77D007F5B0000AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF0099F8FF007F5B0000CB8C44004B4B4B007F5B0000F6CACA00F6CACA00FFFF
      CC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFFCC00FFFF
      CC00FFFFCC00FFFFCC00D9A77D004B4B4B0068605C00FFFFFF00B0360200B036
      0200B0360200B0360200B0360200B0360200B0360200FFFFFF0087818100DDBB
      BB005F544F00FFFFFF00645B56004D4D4D000000000000000000000000007F00
      7F00FF97FF00CF00CF00CF00CF0000FFFF0000FFFF0000FFFF002F97CF006000
      60007F007F007F007F00000000000000000063360000D9A77D007F5B0000AAFF
      FF00CDCDCD00A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700C1C1
      C10099F8FF007F5B0000CB8C44004B4B4B007F5B0000A3760000A3760000A376
      0000A3760000A3760000A3760000A3760000A3760000A3760000A3760000A376
      0000A3760000A3760000A37600004B4B4B0068605C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF9F900FFFFFF0087818100DDC0
      C0005C514B00FFFFFF00615853004D4D4D000000000000000000000000000000
      00007F007F00FF97FF00CF00CF00CF00CF002F6790002F679000600060007F00
      7F007F007F0060006000000000000000000063360000D9A77D0098989800AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF0099F8FF0098989800CB8C4400595959007F5B0000AA9F0000F6CACA00A376
      00009DA900009DA90000AA9F00009DA900009DA900009DA90000A3760000F6CA
      CA00A3760000F6CACA00A37600004B4B4B0068605C0068605C0068605C006860
      5C0068605C0068605C0068605C0068605C00655C5800574D4700817D7D00DDC5
      C5004E423D006E615A0068605C004D4D4D000000000000000000000000000000
      0000000000007F007F00FF97FF00CF00CF00CF00CF00CF00CF00900090006000
      60000000000000000000000000000000000063360000D9A77D00A6A6A600F6CA
      CA00CDCDCD00CB8C4400CB8C4400A7A7A700A7A7A700A7A7A700A7A7A700C1C1
      C10099F8FF00A6A6A600D9A77D00666666007F5B0000AA9F0000AA9F0000AA9F
      0000AA9F0000AA9F0000AA9F0000AA9F0000AA9F0000AA9F0000AA9F0000AA9F
      0000AA9F0000AA9F0000AA9F00004B4B4B000000000000000000000000000000
      000000000000000000000000000000000000000000005F5A570090888800FFE7
      E7005A595800544B47006C5F5900000000000000000000000000000000000000
      000000000000000000007F007F00FF97FF00CF00CF0060006000000000000000
      000000000000000000000000000000000000A7A7A700633600007F5B0000F6CA
      CA00F6CACA00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF00AAFFFF007F5B000063360000A7A7A700A37600007F5B00007F5B00007F5B
      00007F5B00007F5B00007F5B00007F5B00007F5B00007F5B00007F5B00007F5B
      00007F5B00007F5B00004B4B4B00818181000000000000000000000000000000
      00000000000000000000000000000000000084898B00F9F1F100D1C7C7006B67
      6700DDC8C800FFE2E2004E4B4B00000000000000000000000000000000000000
      00000000000000000000000000007F007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7A7006336
      0000633600006336000063360000633600006336000063360000633600006336
      0000633600009A9A9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005B5D5D008086870080868700FFFF
      FF00808687008086870080868700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A8C0000397300003973000039730000397300000000000039
      7300003973000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000004060600000000000000000000000
      0000000000000000000000000000000000000000000000000000A3787500A378
      7500A3787500A3787500A3787500A3787500A3787500A3787500A3787500A378
      7500A3787500A378750090615E0000000000000000008097DF000F2FB0001037
      B0001037B0001037B0001037B0001037B0000F37BF000F30BF000030BF00002F
      BF000028BF000027B0007F8FCF00000000000000000000000000000000000000
      000000000000004A8C000084FF00008BFC00127EC90000468E0000397300007F
      F9000055BE000039730000000000000000000000000000000000000000000000
      000000000000808080004040400080C0A0004040400080808000000000000000
      0000000000000000000000000000000000000000000000000000A67C7600F2E2
      D300F2E2D300FFE8D100EFDFBB00FFE3C500FFDEBD00FFDDBA00FFD8B200FFD6
      AE00FFD2A500FFD2A3009364600000000000000000000F37D0001F40D0002048
      D0002F4FD0002F4FD0002F4FD000204FDF00204FDF001F48DF001047DF000F40
      DF000038DF000030D0000027B00000000000000000000000000000529C00004A
      8C0000000000004A8C0025A4FD0033AEFE0044B9FE00007FF9000070CE0033AE
      FE001289EB000074DA0000397300000000000000000000000000000000000000
      00000000000080A0A0004040400080A0A0004060400080808000000000000000
      0000000000000000000000000000000000000000000000000000AB807800F3E7
      DA00F3E7DA0001990100AFD8A00071C5700041AA300081BB5E00EFD4A600FFD6
      AE00FFD2A300FFD2A300966763000000000000000000103FDF002F4FDF003057
      DF004060E0007F90EF00DFE7F000FFFFFF00FFFFFF00DFE0F0006F90EF000F48
      E0000040E0000037DF000028BF00000000000000000000529C000079F300006E
      DD00004A8C001C80CD0093D7FF00B6E4FF0093D7FF0084D2FF0084D2FF0067C7
      FF0050BFFF00259FF00000397300000000000000000000000000000000000000
      0000000000000000000080808000002020008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000B0837A00F4E9
      DD00F4E9DD00019901000199010001990100019901000199010041AA2F00FFD8
      B200FFD4A900FFD4A9009A6A650000000000000000001F47DF003058DF003F60
      E0009FB0EF00FFFFFF00B0C7F0006F8FEF006F8FEF00B0C8F000FFFFFF0090AF
      F0000F47E000003FDF00002FBF000000000000529C000088EF00008BFC004EBA
      FE0067C8FF0039B6FF0093D7FF007DCFFF0067C8FF0067C8FF0050BFFF0050BF
      FF0050BFFF00003A8E00005AB500000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080A0A000000000000000
      0000000000000000000000000000000000000000000000000000B6897D00F5ED
      E400F5EDE4000199010001990100119E0E00CFD6A300FFE4C80021A21A00FFD8
      B200FFD7B000FFD7B0009E6D670000000000000000002F4FDF003F5FE000809F
      EF00FFFFFF007F97EF004067E0003F67E0003060E0002F58E0006F90EF00FFFF
      FF006088EF000F40DF000030BF000000000000529C00006DC60048BCFF00FFFF
      FF00B6E4FF0067C8FF00389CDA0000396B0000396B0000396B0000396B001F92
      DA0029B0FF0029B0FF0029B0FF00003973000000000000000000000000000000
      0000000000008080800000000000404040000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000BC8E7F00F7EF
      E800F7EFE80001990100019901000199010001990100FFE4C800EFDEBA00FFD8
      B200FFD7B000FFD9B400A270690000000000000000003057DF004067E000E0EF
      FF00B0C7F0004F68E0004068E000FFFFFF00FFFFFF002F58E0002057E000B0C7
      F000D0E0F0001047DF000F37BF00000000000000000000529C0000529C00B6E4
      FF007BCFFF002587C50000396B0000000000000000000000000000427B000039
      6B0029B0FF0029B0FF0029B0FF00003973000000000000000000000000000000
      000000000000808080004040400080C0A000408060004060600080A0A0000000
      0000000000000000000000000000000000000000000000000000C3958100F8F3
      EF00F8F3EF00F8F3EF00FFF4E800FFF4E800FFF4E800EFE3C400EFE3C400FFE4
      C800FFDEBD00FFDDBB00A5746B0000000000000000003F5FE0004F6FE000FFFF
      FF007F90EF004F68E0004067E000FFFFFF00FFFFFF002F57E0001F50E0006087
      EF00FFFFFF001F48DF001038BF00000000000000000000529C000070CE0081D1
      FF0058C2FF0000528C0000000000000000000000000000427B00004399000039
      6B0029B0FF0029B0FF00037BCE00003973000000000000000000000000000000
      00000000000080A0A0004060400080808000FFC0C000406060004060600080A0
      A000000000000000000000000000000000000000000000000000CA9B8400F9F5
      F200FBFBFB00FFF4E800FFF4E800FFF4E800019901000199010001990100FFE8
      D100FFE3C500FFE1C200A8776D0000000000000000004060E0005070E000FFFF
      FF007F90EF004F68E0004067E000FFFFFF00FFFFFF002F50E000204FE0006080
      EF00FFFFFF00204FDF001F3FBF000000000000529C00008EFF002AADFD0058C2
      FF004ABDFF00004E9400004A8C00004A8C0000427B000060B200004399000039
      6B0029B0FF00089CF60000337300000000000000000000000000000000000000
      0000000000000000000080A0A0004060600080A0A000FFC0C000406060004060
      4000000000000000000000000000000000000000000000000000D2A18700F9F9
      F900FBFBFB00119F1000AFD8A000FFF4E800AFD8A0000199010001990100FFE8
      D100FFE4C800FFE3C600AC7A6F0000000000000000004F68E0005F78E000EFEF
      FF00B0C0F0004F68E0004060E000FFFFFF00FFFFFF002F50DF00204FDF00AFBF
      F000DFE7F000204FDF001F3FBF000000000000529C0067C8FF0087D3FF004ABD
      FF0039B6FF0000529C00005DBC000084DE00008CF8000062C300004A8C001474
      B50008A3FF0008A3FF0008A3FF00003973000000000000000000000000000000
      000000000000000000000000000080A0A0004060600080A0A000FFC0C0004060
      4000404040000000000000000000000000000000000000000000D9A88A00FBFB
      FB00FFFFFF0071C570000199010001990100019901000199010001990100FFE8
      D100FFE8D100FFE6CE00AE7C720000000000000000004F6FE0006F80E00090A7
      EF00FFFFFF007F90EF004F67E0003F5FE0003058DF002F50DF006F87E000FFFF
      FF006F88EF002F4FDF001F40BF000000000000529C0058C2FF0054C0FF0029B0
      FF0029B0FF001F99E60000529C0000529C00004A8C00004A8C00147DC50008A3
      FF0008A3FF0008A3FF000181D300003973000000000000000000000000000000
      000080A0A00040606000000000000000000080A0A0004060600080C0A00080A0
      A000000000000000000000000000000000000000000000000000DFAE8C00FCFC
      FC00FFFFFF00FFFFFF0071C570000199010001990100AFD8A00001990100FFE8
      D100FFC8C200FFB0B000B07E730000000000000000005F77E000708FEF006F87
      E000A0B0EF00FFFFFF00AFB8F0006F87E0006080E000AFB8F000FFFFFF0090A7
      EF002F50DF002F50D0001F40BF00000000000000000000529C0000529C000052
      9C0029B0FF0029B0FF0029B0FF0029B0FF0029B0FF0008A3FF0008A3FF000798
      F100046EB90008A3FF0000397300000000000000000000000000000000000000
      000040404000808080008080800000000000000000004040400080A0A000FFFF
      C000000000000000000000000000000000000000000000000000E5B38F00FDFD
      FD00FDFDFD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00F4DE
      CE00B2807400B2807400B280740000000000000000006080E0008F9FEF007F97
      EF006F87E00090A7EF00EFEFFF00FFFFFF00FFFFFF00E0E8FF008098EF003F60
      E0003058DF002F50DF001F3FBF00000000000000000000000000000000000052
      9C0029B0FF0029B0FF0008A3FF0008A3FF0008A3FF0008A3FF0008A3FF00004A
      8C00003973000039730000000000000000000000000000000000000000000020
      200080A0A000FFC0C00040606000002020000020200040606000FFC0C00080C0
      C000002020000000000000000000000000000000000000000000EAB89100FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300F5E1
      D200B2807400EDA75500D3A390000000000000000000708FEF009FAFEF008F9F
      EF00708FEF006F87E0006080E000607FE0005F78E0005F77E0005070E0004F68
      E0003F60E0002F50D0001037B000000000000000000000000000000000000052
      9C0008A3FF0008A3FF0008A3FF0000529C000181D30008A3FF000DA8FF00004A
      8C000000000000000000000000000000000000000000000000000000000080A0
      800040404000FFFFC000FFFFC00080C0C00080C0A000FFC0C000FFFFC0000040
      200080A0A0000000000000000000000000000000000000000000EFBC9200FFFF
      FF00FFFFFF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0EDEA00E9DA
      D000B2807400DAAA9300F6CDD2000000000000000000AFBFF0007088EF00607F
      E0005077E000506FE0004F68E0004067E0004067E0004060E0003F5FDF003058
      DF002F50DF001F47D0008098DF00000000000000000000000000000000000000
      000000529C0000529C0000529C000000000000529C0000529C00004A8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800040404000FFC0C000FFFFFF00FFFFFF00FFFFC000404040008080
      8000000000000000000000000000000000000000000000000000F2BF9400DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA9
      8700B2807400F7CDD20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000808080000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF87F00000000C1FFE00700000000
      001FC00000000000000380000000000000018000000000000001800000000000
      0001800000000000800180000000000080010000000000008001000000000000
      0007000100000000000F800300000000003FE00700000000C1FFF00F00000000
      C7FFF80F00000000EFFFFF8F00000000FFFFFFFFFFFFFFFFFFFFE0FFF8FFFFFF
      FFFFC03FF87F80010003C00FF81F00010003C003F80100010003C001F0030001
      00038001E003000100038003C003000100038003800300010003800780030001
      00038007E003000100038007F00100010003800FF80F00010003000FF83F0001
      8007000FFC7FFFFFFFFFFF9FFCFFFFFFFFFFFFFFFFFFFFFFFC1FFF1FFFF3E1FF
      F007FE0F8003C01FE003FC070003C007C003FC0300018007C781FC0300018007
      8F01FC0F0001800F8E21FC1F0000000F8C61FC1F0000000F88E3FC1F0000800F
      81E3F81F00018007C3C7F83F0003C003C00FF83F0007E001E01FE03F81FFF001
      F87FC07FC3FFFC01FFFFF8FFFFFFFF93FFFFFFFFCFFFFFFF8001F03F87CFFFFF
      0001800F8387FFFF000180038103FFFF00018001C003EFFF00010000E007EFC7
      00010000F00FC7BB00010000F81FFBBB00010000F81FE7BB00010000F01FDFBB
      00010000E00FE3BB00010000C107F7C700010000C383FFFF00018001E7C3FFFF
      0001C003FFE3FFFF0003F00FFFFFFFFFF801FFFFFFFFFFFFF801CFFFC387E003
      F80187F3D937C003F80183E3DD7780038001C3C7CD6780038001F18FE10F8003
      8001F81FF01FC0038001F83FFC7FC0038001FC3FF83FC0038001F81FF81FC003
      8003F18FF01FC0038007E3C7E10FC003801FC7E7E38FC003801F8FFFE38FC003
      803F9FFFE7CFC007807FFFFFEFEFC00FFE7FFFFFFFFFFF81F83FC003FFFFFF01
      E01F80010000FF01800F00000000FFC300070000000080000003000000000000
      0001000000000000000000000000000000000000000000008001000000000000
      C001000000000000E000000000000000F001000000000000F80700000000FF81
      FC1F00000000FF01FE7FC003FFFFFF01FFFFFFFFF827FC7FC0018001F803F83F
      C0018001C801F83FC00180018001FC7FC00180010001FC3FC00180010000F83F
      C001800181C0F81FC00180018380F80FC00180010001FC0FC00180010000FE07
      C00180010000F307C00180018001F187C0018001E003E007C0018001E00FE007
      C0018001F11FF00FC003FFFFFFFFF81F00000000000000000000000000000000
      000000000000}
  end
  object VmuToolPc: TVmuToolPc
    OnStatus = VmuToolPcStatus
    OnStartScan = VmuToolPcStartScan
    OnEndScan = VmuToolPcEndScan
    OnEndFileScanned = VmuToolPcEndFileScanned
    OnNewInvalidVms = VmuToolPcEndFileScanned
    OnAborted = VmuToolPcAborted
    Left = 168
    Top = 160
  end
  object ilInvalidFileIcons: TImageList
    Height = 32
    Width = 32
    Left = 200
    Top = 160
    Bitmap = {
      494C010102000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFBFA00FAF0EE00F9EEEA00F9EEEA00FAEEEA00FAF1EE00FDFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFBFF00FAF0FF00F9EEFF00F9EEFF00FAEEFF00FAF1FF00FDFBFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBF7F600F1DBD600DAA3
      9A00D9948600CA624C00D56E4100CA5E4000D86D4700D4714F00DA928700DBA0
      9900F0D9D500FAF4F200FEFEFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBF7FF00F1DBFF00DAA3
      FF00D994FF00CA62FF00D56EFF00CA5EFF00D86DFF00D471FF00DA92FF00DBA0
      FF00F0D9FF00FAF4FF00FEFEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F0EE00D8A99E00D68C7600CC604300CA5E
      3A00DE895200D67A4C00D1653B00D76E4200D2693D00D1643900DC7B4A00D77A
      4D00D4715000D5836900DFA69B00F6EAE800FDFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F0FF00D8A9FF00D68CFF00CC60FF00CA5E
      FF00DE89FF00D67AFF00D165FF00D76EFF00D269FF00D164FF00DC7BFF00D77A
      FF00D471FF00D583FF00DFA6FF00F6EAFF00FDFCFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCAB9D00C2623900BE603300B7603300B659
      3100BB6A3800C7774200CE6A4000B64B2B00C3542F00D67D4900BF6E3800BF72
      3E00C4784500BE6A3800B9573300CE785E00FAF3F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCABFF00C262FF00BE60FF00B760FF00B659
      FF00BB6AFF00C777FF00CE6AFF00B64BFF00C354FF00D67DFF00BF6EFF00BF72
      FF00C478FF00BE6AFF00B957FF00CE78FF00FAF3FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4A79700BD572C00903E22008C4724009247
      2C008C4629007C3B2100863E200087371F008D3F23009A492700893E1F00873C
      21008B543C009051330093412700C56D4500F7ECE80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4A7FF00BD57FF00903EFF008C47FF009247
      FF008C46FF007C3BFF00863EFF008737FF008D3FFF009A49FF00893EFF00873C
      FF008B54FF009051FF009341FF00C56DFF00F7ECFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A39400B24B2B009A432800B5725F00C88B
      7B00995F4F007738280070311E00752E1C0092493500A65E4900793C2900642E
      1E00713B2800783D280078361F00A64D2F00E6C7BB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A3FF00B24BFF009A43FF00B572FF00C88B
      FF00995FFF007738FF007031FF00752EFF009249FF00A65EFF00793CFF00642E
      FF00713BFF00783DFF007836FF00A64DFF00E6C7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D99F9400AD492F00B2655100C2887700C991
      8100B57D6E00824E3E0067311F00732E1D009F584700BC7C6A00884D3D006A31
      1F00AE6F5C00A26A5700673321009F452E00EDCCBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D99FFF00AD49FF00B265FF00C288FF00C991
      FF00B57DFF00824EFF006731FF00732EFF009F58FF00BC7CFF00884DFF006A31
      FF00AE6FFF00A26AFF006733FF009F45FF00EDCCFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1A79800B9523600C27B6900BF877700BE89
      7700C88F8000A1706000642D1D00722D1C008336240093463400793322008838
      2400BB736100AC6F5E007B362500AC553500F1D8CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1A7FF00B952FF00C27BFF00BF87FF00BE89
      FF00C88FFF00A170FF00642DFF00722DFF008336FF009346FF007933FF008838
      FF00BB73FF00AC6FFF007B36FF00AC55FF00F1D8FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2A69700BB522F00C06B4F00C9928200C288
      7800A9746600955D4C00742E1D008437240084443200732F1D00894431008943
      32007D3522007F3623008F392400BE583600F2DACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2A6FF00BB52FF00C06BFF00C992FF00C288
      FF00A974FF00955DFF00742EFF008437FF008444FF00732FFF008944FF008943
      FF007D35FF007F36FF008F39FF00BE58FF00F2DAFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2AB9B00B5533000A2502D00A5645000AB6D
      5B00995F4D007F39270080301D00973B28008E46340076301D00974734008340
      2C007E2E1D0077311D007B372100B45B3700F1D9CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2ABFF00B553FF00A250FF00A564FF00AB6D
      FF00995FFF007F39FF008030FF00973BFF008E46FF007630FF009747FF008340
      FF007E2EFF007731FF007B37FF00B45BFF00F1D9FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6B29E0092472C0076382300813922008236
      22007B362000792F1D007A2E1C0091463400A56251007F3926009E5E4B008C4C
      39007A2F1E006F2F1C0069311E00AB5F3D00F2DBD00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6B2FF009247FF007638FF008139FF008236
      FF007B36FF00792FFF007A2EFF009146FF00A562FF007F39FF009E5EFF008C4C
      FF007A2FFF006F2FFF006931FF00AB5FFF00F2DBFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1AB9900A34B2E007F3F2800843E2A007E3A
      2700803727007933240078321F00803B2A00925342007A392900995D4C009559
      4700753325007531240079352400A7563700F1DACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1ABFF00A34BFF007F3FFF00843EFF007E3A
      FF008037FF007933FF007832FF00803BFF009253FF007A39FF00995DFF009559
      FF007533FF007531FF007935FF00A756FF00F1DAFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1A89600BB603800823F2800844430006C40
      2D00714834006F4734006D4634006C4734006B4633006A4633006A4633006B47
      34006F4533007E4030007B3B2500C86C4200F1DBD00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1A8FF00BB60FF00823FFF008444FF006C40
      FF007148FF006F47FF006D46FF006C47FF006B46FF006A46FF006A46FF006B47
      FF006F45FF007E40FF007B3BFF00C86CFF00F1DBFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5AA9800C1673E00813D270086452F006040
      2D006B4E36006A4E3700684C3600684C3600674C3600674C3700654C3600664E
      38006A4E3A007D4230007C3E2700D0784B00FAEEE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5AAFF00C167FF00813DFF008645FF006040
      FF006B4EFF006A4EFF00684CFF00684CFF00674CFF00674CFF00654CFF00664E
      FF006A4EFF007D42FF007C3EFF00D078FF00FAEEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5AA9900BF683F00843D26008F482A006242
      2F006C4F38006D503900694D3800684C3700684D3700684C3800674C3800674E
      390069503A007E4330007C3E2500CE774800FBF0EB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5AAFF00BF68FF00843DFF008F48FF006242
      FF006C4FFF006D50FF00694DFF00684CFF00684DFF00684CFF00674CFF00674E
      FF006950FF007E43FF007C3EFF00CE77FF00FBF0FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7AD9800C1653C00863F280091472A006440
      2C006D5038006D5139006B4E3900694D3700684F3600684F3800685038006850
      39006C503C007D433100783C2500C46A4100FAF0EB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7ADFF00C165FF00863FFF009147FF006440
      FF006D50FF006D51FF006B4EFF00694DFF00684FFF00684FFF006850FF006850
      FF006C50FF007D43FF00783CFF00C46AFF00FAF0FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9AC9B00BE613A0089422900904C2E006445
      2F006F533A006E523B006D503B006B4E390069503900694F3800695038006950
      39006B503B0084473400803D2700C4664000FAF0EB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9ACFF00BE61FF008942FF00904CFF006445
      FF006F53FF006E52FF006D50FF006B4EFF006950FF00694FFF006950FF006950
      FF006B50FF008447FF00803DFF00C466FF00FAF0FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4A69800C2643D008B442C008E4C30006446
      30006F523B006F533A006F513C006D503B006A5039006A5038006A5039006A50
      3B006E4F3A0089463400843E2700CC714700FAF1EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4A6FF00C264FF008B44FF008E4CFF006446
      FF006F52FF006F53FF006F51FF006D50FF006A50FF006A50FF006A50FF006A50
      FF006E4FFF008946FF00843EFF00CC71FF00FAF1FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4A89900BE6841008C462B008F502F006546
      300071543A0071543A006F533B006E533A006E523A006B513A006B513B006C50
      3B006F513A008749350082422800CC7D4B00FAF1EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4A8FF00BE68FF008C46FF008F50FF006546
      FF007154FF007154FF006F53FF006E53FF006E52FF006B51FF006B51FF006C50
      FF006F51FF008749FF008242FF00CC7DFF00FAF1FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6AC9C00C37048008F472C00955330006446
      31007154390071543A006F543A0070543B006F523A006E513C006D513C006E51
      3C0072523B008A4C390085442D00D17F4F00FAF1EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6ACFF00C370FF008F47FF009553FF006446
      FF007154FF007154FF006F54FF007054FF006F52FF006E51FF006D51FF006E51
      FF007252FF008A4CFF008544FF00D17FFF00FAF1FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6AE9D00C6704A00914A3100935534006441
      2C006F4F36006C4D36006B4E36006B4D36006A4D3600694B3500694B35006A4D
      36006D4D37008847330087442C00D27E4E00FAF1EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6AEFF00C670FF00914AFF009355FF006441
      FF006F4FFF006C4DFF006B4EFF006B4DFF006A4DFF00694BFF00694BFF006A4D
      FF006D4DFF008847FF008744FF00D27EFF00FAF1FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3AD9D00C3704500974F3500965038007D43
      2A00723B280067321E0067321D0067321D0068341F0067342000683520006B3A
      2500763B2300893F290085422A00D4774C00FBF1EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3ADFF00C370FF00974FFF009650FF007D43
      FF00723BFF006732FF006732FF006732FF006834FF006734FF006835FF006B3A
      FF00763BFF00893FFF008542FF00D477FF00FBF1FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4AF9B00BC663F009E50360096543B00915A
      4400AF847100A36B57009E6B55009D644F00B48169009D6E5300A7736100A06E
      5B0081442A0087412600833D2700BE694400FAF0EB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4AFFF00BC66FF009E50FF009654FF00915A
      FF00AF84FF00A36BFF009E6BFF009D64FF00B481FF009D6EFF00A773FF00A06E
      FF008144FF008741FF00833DFF00BE69FF00FAF0FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5B39D00CA7B47009A5237008C4E3700AB7A
      6400BF9D8B00BA8C7800A1685000AE785E00BE877100B27C6000A8674F00CB92
      7400955A3A006F382100833C2500BA714800FBF3ED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5B3FF00CA7BFF009A52FF008C4EFF00AB7A
      FF00BF9DFF00BA8CFF00A168FF00AE78FF00BE87FF00B27CFF00A867FF00CB92
      FF00955AFF006F38FF00833CFF00BA71FF00FBF3FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5B2A000D8895200C07242009D5536008C4C
      35008349320084462F00763E29007D3D26007D3F2A00793F2800753A24007A3D
      2500713B23007B3B22009C532F00CB7C4D00FCF3ED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5B2FF00D889FF00C072FF009D55FF008C4C
      FF008349FF008446FF00763EFF007D3DFF007D3FFF00793FFF00753AFF007A3D
      FF00713BFF007B3BFF009C53FF00CB7CFF00FCF3FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2B8A800CE6E3E00E1854700C56037009246
      2E008A442B0080412A007A3A28008D4D320080402B007C402B00743A24007135
      200072332100A6412800D6723A00CD644400FAEFEB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2B8FF00CE6EFF00E185FF00C560FF009246
      FF008A44FF008041FF007A3AFF008D4DFF008040FF007C40FF00743AFF007135
      FF007233FF00A641FF00D672FF00CD64FF00FAEFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8E7DA00DB8E6500E48A5600DA7E4B00A753
      33009E47300092412C007B382500A25C3C0082432B0089442E008A3C2800823B
      2600813E2800B54F3500DC724700D2735200FBF2ED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8E7FF00DB8EFF00E48AFF00DA7EFF00A753
      FF009E47FF009241FF007B38FF00A25CFF008243FF008944FF008A3CFF00823B
      FF00813EFF00B54FFF00DC72FF00D273FF00FBF2FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFAF600F5D6AF00F6D2A700F2CDA000B36E
      4B009A513700964932008B412900A3482D008E442C008946300083412E007E40
      2C007D422E00C3836100F5CCA200F3C89D00FDF8F30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFAFF00F5D6FF00F6D2FF00F2CDFF00B36E
      FF009A51FF009649FF008B41FF00A348FF008E44FF008946FF008341FF007E40
      FF007D42FF00C383FF00F5CCFF00F3C8FF00FDF8FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCF9F700E4BE9F00EBBFA400F3C5A000CE98
      7000C38D6800C48E6900C0855B00C5774D00C4825C00BF886200BD876300B67F
      5C00B4765500D38C6800E6B39400EABC9A00FDF9F50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCF9FF00E4BEFF00EBBFFF00F3C5FF00CE98
      FF00C38DFF00C48EFF00C085FF00C577FF00C482FF00BF88FF00BD87FF00B67F
      FF00B476FF00D38CFF00E6B3FF00EABCFF00FDF9FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFC00FAF4F100FBF3F000F7E8E000E5BC
      AE00EECAB100E4AE8F00EDB08300F0AB7B00F1C29600EBB18800E6AF8F00EDBE
      A600E8B8AB00F9EDE800FAF0ED00FBF4F200FEFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFF00FAF4FF00FBF3FF00F7E8FF00E5BC
      FF00EECAFF00E4AEFF00EDB0FF00F0ABFF00F1C2FF00EBB1FF00E6AFFF00EDBE
      FF00E8B8FF00F9EDFF00FAF0FF00FBF4FF00FEFDFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCF9F800FAF0EE00FBF2EE00FDF4F000FCF5F100FBF1ED00FBF1EF00FDFB
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCF9FF00FAF0FF00FBF2FF00FDF4FF00FCF5FF00FBF1FF00FBF1FF00FDFB
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFF01FFFFFF01FFF0000000000000000
      FF8001FFFF8001FF0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FE00007FFE00007F0000000000000000
      FE00007FFE00007F0000000000000000FFF00FFFFFF00FFF0000000000000000
      FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
      000000000000}
  end
  object pmEyeCatch: TPopupMenu
    Images = ilMenuIcons
    OwnerDraw = True
    Left = 521
    Top = 343
    object miSaveEyeCatchTo: TMenuItem
      Caption = '&Save to...'
      Enabled = False
      ImageIndex = 5
      OnClick = miSaveEyeCatchToClick
    end
  end
  object sdPict: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = 
      'Tous (*.gif;*.png;*.dds;*.tga;*.gif;*.pcx;*.ani;*.jpg;*.jpeg;*.b' +
      'mp;*.ico;*.emf;*.wmf)|*.gif;*.png;*.dds;*.tga;*.gif;*.pcx;*.ani;' +
      '*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf|GIF Image (*.gif)|*.gif|Por' +
      'table Network Graphics (*.png)|*.png|CompuServe GIF Image (*.gif' +
      ')|*.gif|PCX Image (*.pcx)|*.pcx|ANI Image (*.ani)|*.ani|Fichier ' +
      'image JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|Bitmaps (*.bmp)|*.bmp|Ic'#244 +
      'nes (*.ico)|*.ico|M'#233'tafichiers '#233'volu'#233's (*.emf)|*.emf|M'#233'tafichier' +
      's (*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save your picture... yeah ! :)'
    Left = 488
    Top = 312
  end
  object pmVmiList: TPopupMenu
    Images = ilMenuIcons
    OwnerDraw = True
    Left = 232
    Top = 160
    object Opencurrentfolder1: TMenuItem
      Caption = '&Open current folder...'
      ImageIndex = 18
      ShortCut = 16463
      OnClick = Opencurrentfolder1Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object miCreateVmi: TMenuItem
      Caption = '&Create associated VMI...'
      Enabled = False
      ImageIndex = 19
      OnClick = miCreateVmiClick
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object miCopyTo: TMenuItem
      Caption = 'C&opy to...'
      Enabled = False
      ImageIndex = 8
      ShortCut = 16451
      OnClick = miCopyToClick
    end
    object miMoveTo: TMenuItem
      Caption = '&Move to...'
      Enabled = False
      ImageIndex = 10
      ShortCut = 16472
      OnClick = miMoveToClick
    end
    object miDelete: TMenuItem
      Caption = '&Delete...'
      Enabled = False
      ImageIndex = 9
      OnClick = miDeleteClick
    end
    object miHexEdit: TMenuItem
      Caption = '&View in Hex editor...'
      Enabled = False
      ImageIndex = 11
      ShortCut = 16453
      OnClick = miHexEditClick
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object miSaveReport: TMenuItem
      Caption = '&Save details...'
      Enabled = False
      ImageIndex = 5
      ShortCut = 16467
      OnClick = miSaveReportClick
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object miCancelScan: TMenuItem
      Caption = 'C&ancel scan'
      Enabled = False
      ImageIndex = 16
      ShortCut = 16474
      OnClick = miCancelScanClick
    end
    object Refresh2: TMenuItem
      Caption = '&Refresh'
      ImageIndex = 0
      ShortCut = 116
      OnClick = miRefreshClick
    end
  end
  object PiconeBarreTache: TPiconeBarreTache
    MenuPop = pmTrayIcon
    ReduireSiFin = False
    CacherSiMinimize = True
    PetiteIconeVisible = True
    GrandeIconeVisible = True
    ApplicationCachee = False
    IntervalAnimation = 1000
    Animation = False
    NumIconeImageList = 0
    GrandeIconBlink = False
    IntervalGrandeIconeBlink = 1000
    OuvreSiClicGauche = False
    OuvreSiDblClick = True
    MenuSiClicDroit = True
    MenuSiClicGauche = False
    Left = 16
    Top = 208
  end
  object pmTrayIcon: TPopupMenu
    Images = ilMenuIcons
    OwnerDraw = True
    Left = 48
    Top = 208
    object Open1: TMenuItem
      Caption = '&Open'
      Default = True
      ImageIndex = 6
      OnClick = Open1Click
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object Quit1: TMenuItem
      Caption = '&Quit'
      ImageIndex = 1
      OnClick = miExitClick
    end
  end
  object pmReport: TPopupMenu
    Images = ilMenuIcons
    OwnerDraw = True
    Left = 125
    Top = 289
    object miCopyRichEdit: TMenuItem
      Caption = '&Copy'
      ImageIndex = 8
      ShortCut = 16451
      OnClick = miCopyRichEditClick
    end
    object Selectall1: TMenuItem
      Tag = 1
      Caption = '&Select all'
      ImageIndex = 7
      ShortCut = 16449
      OnClick = miCopyRichEditClick
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object Saveto1: TMenuItem
      Tag = 2
      Caption = '&Save to...'
      ImageIndex = 5
      ShortCut = 16467
      OnClick = miCopyRichEditClick
    end
  end
  object sdRichEdit: TSaveDialog
    DefaultExt = 'rtf'
    Filter = 
      'Rich Text Format (*.rtf)|*.rtf|Simple text (*.txt)|*.txt|All fil' +
      'es (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Yep, select your file... ;)'
    Left = 189
    Top = 289
  end
  object bfdFile: TJvBrowseForFolderDialog
    Left = 264
    Top = 160
  end
  object pmDebug: TPopupMenu
    Images = ilMenuIcons
    OwnerDraw = True
    Left = 157
    Top = 289
    object MenuItem1: TMenuItem
      Caption = '&Copy'
      ImageIndex = 8
      ShortCut = 16451
      OnClick = miCopyRichEditClick
    end
    object MenuItem2: TMenuItem
      Tag = 1
      Caption = '&Select all'
      ImageIndex = 7
      ShortCut = 16449
      OnClick = miCopyRichEditClick
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object miClearDebug: TMenuItem
      Caption = 'C&lear...'
      SubMenuImages = ilMenuIcons
      ImageIndex = 14
      OnClick = miClearDebugClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Tag = 2
      Caption = '&Save to...'
      ImageIndex = 5
      ShortCut = 16467
      OnClick = miCopyRichEditClick
    end
  end
  object aeMain: TApplicationEvents
    OnException = aeMainException
    Left = 296
    Top = 160
  end
  object XPMenu: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = ANSI_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    DrawMenuBar = False
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    UseDimColor = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = True
    XPContainers = []
    XPControls = [xcMainMenu, xcPopupMenu]
    Active = True
    Left = 80
    Top = 208
  end
end
