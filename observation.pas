unit observation;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, ComCtrls ,DbChart, Series,
  StdCtrls, Buttons  ;
type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Chart1: TChart;
    Chart2: TChart;
    Chart4: TChart;
    Chart3: TChart;
    SaveDialog1: TSaveDialog;
    procedure Chart1DblClick(Sender: TObject);
    procedure Chart2DblClick(Sender: TObject);
    procedure Chart3DblClick(Sender: TObject);
    procedure Chart4DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
  b:array of Double;
implementation
uses CycleSlip ;
{$R *.dfm}
procedure TForm2.Chart1DblClick(Sender: TObject);
begin
  if  SaveDialog1.Execute then
       Chart1.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm2.Chart2DblClick(Sender: TObject);
begin
 if  SaveDialog1.Execute then
       Chart2.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm2.Chart3DblClick(Sender: TObject);
begin
 if  SaveDialog1.Execute then
       Chart3.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm2.Chart4DblClick(Sender: TObject);
begin
 if  SaveDialog1.Execute then
       Chart4.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
end.
