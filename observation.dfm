object Form2: TForm2
  Left = 212
  Top = 174
  Width = 769
  Height = 353
  AutoSize = True
  Caption = #35266#27979#20540#24773#20917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 753
    Height = 314
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'R1'#20266#36317#35266#27979#20540
      object Chart1: TChart
        Left = 1
        Top = 2
        Width = 745
        Height = 286
        AnimatedZoom = True
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Frame.Visible = True
        Title.Text.Strings = (
          'R1'#20266#36317#35266#27979#20540)
        BottomAxis.Title.Caption = #21382#20803
        LeftAxis.Title.Caption = 'R1/m'
        Legend.LegendStyle = lsSeries
        View3D = False
        TabOrder = 0
        OnDblClick = Chart1DblClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'LI'#36733#27874#30456#20301#35266#27979#20540
      ImageIndex = 1
      object Chart2: TChart
        Left = 1
        Top = 2
        Width = 745
        Height = 286
        AnimatedZoom = True
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Frame.Visible = True
        Title.Text.Strings = (
          'L1'#36733#27874#30456#20301#35266#27979#20540)
        BottomAxis.Title.Caption = #21382#20803
        LeftAxis.Title.Caption = #966'1/'#21608
        Legend.LegendStyle = lsSeries
        View3D = False
        TabOrder = 0
        OnDblClick = Chart2DblClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'R2'#20266#36317#35266#27979#20540
      ImageIndex = 2
      object Chart3: TChart
        Left = 1
        Top = 2
        Width = 745
        Height = 286
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Frame.Visible = True
        Title.Text.Strings = (
          'R2'#20266#36317#35266#27979#20540)
        BottomAxis.Title.Caption = #21382#20803
        LeftAxis.Title.Caption = 'R2/m'
        Legend.LegendStyle = lsSeries
        View3D = False
        TabOrder = 0
        OnDblClick = Chart3DblClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'L2'#36733#27874#30456#20301#35266#27979#20540
      ImageIndex = 3
      object Chart4: TChart
        Left = 1
        Top = 2
        Width = 745
        Height = 286
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Frame.Visible = True
        Title.Text.Strings = (
          'L2'#36733#27874#30456#20301#35266#27979#20540)
        BottomAxis.Title.Caption = #21382#20803
        LeftAxis.Title.Caption = #966'2/'#21608
        Legend.LegendStyle = lsSeries
        View3D = False
        TabOrder = 0
        OnDblClick = Chart4DblClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.bmp'
    Filter = #35266#27979#26354#32447'*.bmp|*.bmp'
    Left = 406
    Top = 65533
  end
end
