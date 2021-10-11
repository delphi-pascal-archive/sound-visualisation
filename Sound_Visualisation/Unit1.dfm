object Form1: TForm1
  Left = 246
  Top = 112
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sound Visualisation'
  ClientHeight = 518
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 500
    Height = 500
  end
  object ListBox1: TListBox
    Left = 512
    Top = 8
    Width = 121
    Height = 49
    ItemHeight = 13
    Items.Strings = (
      #1060#1080#1075#1091#1088#1099
      #1051#1086#1084#1072#1085#1072#1103' '#1083#1080#1085#1080#1103
      #1051#1080#1085#1080#1080)
    TabOrder = 0
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 96
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer1Timer
    Left = 104
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 328
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 352
    Top = 272
  end
end
