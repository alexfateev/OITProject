object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'fmMain'
  ClientHeight = 369
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 350
    Width = 762
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    object stConnect: TRzGlyphStatus
      Left = 0
      Top = 0
      Width = 25
      Height = 19
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      Caption = ''
      ImageIndex = 0
      DisabledIndex = 1
      Images = ImageList16
    end
  end
  object ActionList1: TActionList
    Left = 648
    Top = 192
    object acShowConnectionEdit: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      OnExecute = acShowConnectionEditExecute
    end
    object acExit: TAction
      Caption = #1042#1099#1093#1086#1076
      OnExecute = acExitExecute
    end
    object acSettingsShow: TAction
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      OnExecute = acSettingsShowExecute
    end
  end
  object ImageList16: TImageList
    ColorDepth = cd32Bit
    Left = 648
    Top = 136
    Bitmap = {
      494C0101020008001C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000024000000330000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000002300000033000000330000
      003300000033000000330000000A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6B6AC36F7172FF0000
      0033000000330000003300000033000000330000000000000000000000000000
      000000000000000000000000000000000000686969C068707AFFBB833EFFB782
      42FFB68343FFB88444FF0D09055C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009FA0A2FFCCCCCEFF6A72
      7CFFBB833EFFB78242FFB68343FFB88444FF0000003300000000000000000000
      0000000000000000000000000000000000009BA3ADFFB97D35FFF9C072FFF2BA
      6CFFEFB664FFE5B56CFFB78343FF000000330000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CA4AEFFB97D
      36FFF9C172FFF2BA6CFFEFB664FFE5B56CFFB78343FF00000033000000000000
      000000000000000000000000000000000000B98039FFF4C98FFFF6C077FFF2BB
      6FFFEBBF81FFB17C3EFFEFB35CFFBA8442FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B98039FFF4C9
      8FFFF6C077FFF2BB6FFFEBBF81FFB17C3EFFEFB35CFFB88443FF000000000000
      000000000000000000000000000000000000B6803DFFF8D19EFFF8C27CFFF2CB
      94FFAE793AFFF4BA6AFFA6814ADDBD823BFF0000003300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6803DFFF8D1
      9EFFF8C27CFFF2CB94FFAE793AFFF4BA6AFFA6814BDDB8823FFF000000330000
      003300000000000000000000000000000000B5803EFFFFDCAFFFFBD7A7FFAD77
      36FFF9C27AFFAF8E5EDFB77E3AFFC1C5CEFF6F7276FF00000033000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5803EFFFFDC
      AFFFFBD7A7FFAD7736FFF9C27AFFAD8D5CDEB57E3DFFB9C5D8FFB8813EFFB884
      43FF00000033000000000000000000000000B6813FFFFFEBC5FFAD7634FFFFCB
      88FFB6986EDFB6803DFF000000009EA4ABFFD0CECDFF6F7072FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6813FFFFFEB
      C5FFAD7634FFFFCB88FFB4966EDEB57E3EFF00000033B57E3BFFE9C591FFEDAF
      55FFB78444FF00000033000000000000000007050233B57E3DFFFFDA9FFFB7A0
      7EDDB67C36FF0000003300000000000000009FA0A2FFD4D4D6FF000000000000
      0033000000330000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B57E
      3DFFFFDA9FFFB7A07EDDB47C38FF00000033B57E3EFFB09063DEF1B765FFB27D
      3EFFE1AC5EFFB88444FF00000000000000000000000000000000B7823FFFB87E
      39FFBEC4CEFF6B7178FF0000003300000000000000000000000000000033B882
      3FFFB88444FF0000003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B78240FFB67E3BFFB8C4D5FFB57D39FFB29368DEF9C178FFAF793AFFE6B9
      74FFE6B56FFFB78342FF00000000000000000000000000000000000000000000
      00009DA4ABFFCFCECDFF6D6F70FF000000000000000000000033B57E3BFFB695
      63E2ECAF56FFB78444FF00000033000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B7803CFFEFCB9FFFFFCD8CFFAD7736FFEEC68BFFF0B7
      69FFECC081FFB78240FF00000000000000000000000000000000000000000000
      0000000000009FA0A2FFD4D4D5FF0000000000000033B57E3BFFB59566E1F1B7
      66FFB27D3FFFE1AC5EFFB88444FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B78240FFFFDCA2FFAE7634FFFAD4A3FFF6C078FFF4BB
      6FFFF7CD93FFBC833DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000033B57D39FFB8986CE1F9C178FFAF79
      3AFFE6B974FFE6B56FFFB78342FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B57E3DFFFFEAC3FFFFE1B8FFFFDDB0FFFFDB
      ABFFB97D34FF6A727CFF00000033000000000000000000000000000000000000
      0000000000000000000000000000B6803CFFBC9D72E2FFCD8DFFAD7736FFEEC6
      8BFFF0B769FFECC081FFB78240FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6813FFFB57E3DFFB57E3CFFB87E
      38FF9CA4ADFFCCCCCEFF6F7072FF000000000000000000000000000000000000
      0000000000000000000000000000B78240FFFFDCA3FFAD7634FFFAD4A3FFF6C0
      78FFF4BB6FFFF7CD93FFBB823DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009FA0A2FF646363B4000000000000000000000000000000000000
      000000000000000000000000000000000000B57E3DFFFFEAC3FFFFE1B8FFFFDD
      B0FFFFDBABFFB87C33FF68707AFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6813FFFB57E3DFFB57E
      3CFFB87E38FF9AA2ACFF5E5F60B0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 648
    Top = 240
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Action = acExit
      end
    end
    object N2: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N3: TMenuItem
        Action = acShowConnectionEdit
      end
      object N5: TMenuItem
        Action = acSettingsShow
      end
    end
  end
end
