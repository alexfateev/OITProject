object fmImport1CMatchingFileds: TfmImport1CMatchingFileds
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1087#1086#1083#1077#1081
  ClientHeight = 595
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 558
    Width = 688
    Height = 37
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 404
    ExplicitWidth = 345
    object btnSave: TButton
      AlignWithMargins = True
      Left = 528
      Top = 5
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 144
      ExplicitTop = 8
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 608
      Top = 5
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 248
      ExplicitTop = 8
    end
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 558
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Panel3
        Row = 0
      end
      item
        Column = 1
        Control = Panel4
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 1
    ExplicitLeft = 80
    ExplicitTop = 112
    ExplicitWidth = 553
    ExplicitHeight = 257
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 344
      Height = 558
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 275
      ExplicitHeight = 255
      object RzLabel1: TRzLabel
        AlignWithMargins = True
        Left = 14
        Top = 399
        Width = 327
        Height = 156
        Margins.Left = 14
        Margins.Top = 0
        Align = alBottom
        AutoSize = False
        Caption = 
          #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1087#1086#1083#1103':'#13'  id - '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1080#1076#1077#1085#1090#1080 +
          #1092#1080#1082#1072#1090#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#13'  pid - '#1089#1089#1099#1083#1082#1072' '#1085#1072'  '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077 +
          #1085#1080#1077#13'  name - '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      end
      object vlDivision: TValueListEditor
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 338
        Height = 393
        Align = alClient
        TabOrder = 0
        TitleCaptions.Strings = (
          #1047#1085#1072#1095#1077#1085#1080#1077
          #1047#1072#1075#1086#1083#1086#1074#1082#1080' '#1080#1079' CSV')
        OnGetPickList = vlDivisionGetPickList
        ExplicitHeight = 406
        ColWidths = (
          150
          182)
      end
    end
    object Panel4: TPanel
      Left = 344
      Top = 0
      Width = 344
      Height = 558
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 276
      ExplicitTop = 1
      ExplicitWidth = 276
      ExplicitHeight = 255
      object RzLabel2: TRzLabel
        AlignWithMargins = True
        Left = 14
        Top = 399
        Width = 327
        Height = 156
        Margins.Left = 14
        Margins.Top = 0
        Align = alBottom
        AutoSize = False
        Caption = 
          #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1087#1086#1083#1103':'#13'  id - '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1080#1076#1077#1085#1090#1080 +
          #1092#1080#1082#1072#1090#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#13'  lastname -'#13'  firstname - '#13'  middlename - '#13' ' +
          ' position_name - '#13'  division_id -'#13#1053#1077#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1087#1086#1083#1103':'#13'  gender ' +
          '- '#1087#1086#1083#13'  date_of_birth - '#1076#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103#13'  status - '#1089#1090#1072#1090#1091#1089' ('#1084#1086#1078#1077#1090' '#1091 +
          #1082#1072#1079#1074#1072#1090#1100' '#1085#1072' '#1090#1086' '#1095#1090#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082' '#13#1085#1072#1093#1086#1076#1080#1090#1089#1103' '#1074' '#1086#1087#1091#1089#1082#1077'/'#1087#1086' '#1091#1093#1086#1076#1091' '#1079#1072' '#1088#1077#1073#1077 +
          #1085#1082#1086#1084' '#1080' '#1087#1088#1086#1095#1077#1077')'
        ExplicitTop = 412
        ExplicitWidth = 280
      end
      object vlEmployee: TValueListEditor
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 341
        Height = 393
        Margins.Left = 0
        Align = alClient
        TabOrder = 0
        OnGetPickList = vlEmployeeGetPickList
        ExplicitWidth = 342
        ExplicitHeight = 406
        ColWidths = (
          150
          185)
      end
    end
  end
end
