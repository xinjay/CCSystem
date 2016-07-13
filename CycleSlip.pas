unit CycleSlip;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls ,StrUtils, ExtCtrls, TeEngine, Series, TeeProcs, Chart,
  ComCtrls, Menus ,Math, observation ,about,ShellAPI;
type
 Tmydata=record       //�Զ������ͣ����ڼ�¼����۲�����
       row:Integer ;  // row���ڴ洢�۲�ֵ������
       PS1:Double ;   //PS1���ڴ洢R1α��۲�ֵ
       CP1:Double ;   //CP1���ڴ洢L1��λ�۲�ֵ
       PS2:Double ;   //PS2���ڴ洢R2α��۲�ֵ
       CP2:Double ;   //CP2���ڴ洢L2��λ�۲�ֵ
       end;
  Tcycleslips=record  //�Զ������ͣ����ڴ洢̽���������
       epoch:Integer; //������������Ԫ
       row:Integer;   //��¼��Rinex�ļ�������
       GFcycle:Double;//GF�������
       MWcycle:Double;//MW�������
       L1cycle:Double;//L1����������
       L2cycle:Double;//L2����������
       end;
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Chart3: TChart;
    Chart4: TChart;
    GroupBox1: TGroupBox;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    Chart1: TChart;
    Chart2: TChart;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox3: TCheckBox;
    Edit5: TEdit;
    Edit6: TEdit;
    CheckBox4: TCheckBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    ScrollBox1: TScrollBox;
    Label6: TLabel;
    ListBox1: TListBox;
    ScrollBox2: TScrollBox;
    Label7: TLabel;
    Button9: TButton;
    ListBox2: TListBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    PopupMenu2: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    SaveDialog2: TSaveDialog;
    Panel2: TPanel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button6: TButton;
    GroupBox4: TGroupBox;
    Button4: TButton;
    Button8: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    ProgressBar1: TProgressBar;
    Label9: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Chart1DblClick(Sender: TObject);
    procedure Chart2DblClick(Sender: TObject);
    procedure Chart3DblClick(Sender: TObject);
    procedure Chart4DblClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label8MouseLeave(Sender: TObject);
    procedure Label12MouseEnter(Sender: TObject);
    procedure Label12MouseLeave(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    {�Զ��庯��}
    function GetObPlace(n:integer;dir:string): Integer; //���ڻ�ȡ�۲�ֵ��������˳��
    function  CreateNew():string;                       //���ڴ����µ��޸��ļ�·��

    {�Զ������}
    procedure ReadData(GPSNo:string);                   //���ڶ�ȡ����д������
    procedure DrawChart(i:Integer);                     //���ڻ�������
    procedure GetArray(a:integer);                      //���ڻ�ȡ��Ϲ۲ⷽ�̼������
    procedure GetDtolArray(tar:integer);                //������ȡָ���ȵļ�������У����ڼ���̽���޲�
    procedure Repair(indextar:Integer);                 //���������޸�����
    procedure Drawback(tar:integer);                    //������������ģ��������Ұֵ
    procedure GetForm2Array(i:integer);                 //���ڻ�ȡ��Form2��ʵ�Ĺ۲�ֵ����
    procedure Calculatetol(tar:integer;var GFm:Double;var MWm:Double);   //���ڼ���̽���޲�
    procedure CalculateCycle(i:Integer;var Dn1:Double ;var Dn2:Double ); //���ڼ���L1,L2�����
    procedure FixedToInteger(var Dn1:Double ;var Dn2:double;Dn3:Double);
    procedure Label12Click(Sender: TObject); //���ڹ̶�L1,L2������

  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  Form2: TForm2 ;
  mydata:array of Tmydata ;
  row,No,epoch,R1p,L1p,R2p,L2p:integer;
  director:string ;
  abv,GF,MW,LC_PC,D1,D2,D3: array of Double ;
  myseries2 : TLineSeries;
  D1tol,D2tol:array of Double;
  cyclerec:Tcycleslips ;
  GFm,MWm:Double ;
implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);  //��ȡRinex�ļ���̽Ѱ�۲�ֵ���ͣ���Ч����
var
  f                           :TextFile;
  str,p                  :string;
  C1,P1,R1,L1,R2,L2:integer;
begin
   if  Opendialog1.Execute then
   begin
     director:=Opendialog1.FileName;
     AssignFile(f, director);
     Reset(f);
     str:='';
     Form1.Caption:='CCSystem:'+ExtractFileName(director);
     ComboBox1.Items.Clear;
     ComboBox1.Text:='��ѡ������';
     while (str<>'END OF HEADER')  do
      begin
        Readln(f,p);
        str:=Trim(RightStr(p,20));
     if str='# / TYPES OF OBSERV' then
         begin
        No:=StrToInt(LeftStr(p,6));
         C1:=Pos('C1',p);
         P1:=Pos('P1',p);
          if  ((C1*P1<>0) or ((C1=0) and (P1<>0))) then
          R1:=P1
           else  if (C1<>0) and (P1=0) then
          R1:=C1
          else ShowMessage('ȱ��L1�ϵ�α��۲����ݣ�');
          L1:=Pos('L1',p);
             if L1=0  then   ShowMessage('ȱ��L1�ϵ��ز���λ�۲����ݣ�');
          R2:=Pos('P2',p);
             if R2=0 then    ShowMessage('ȱ��L2�ϵ�α��۲����ݣ�');
          L2:=Pos('L2',p);
             if L2=0 then     ShowMessage('ȱ��L2�ϵ��ز���λ�۲����ݣ�');
           // R1p L1p R2p L2p
           if R1*L1*R2*L2<>0 then
            begin
              R1p:=GetObPlace(StrToInt(FloatToStr((R1-11)/6)),'1')+1;
              L1p:=GetObPlace(StrToInt(FloatToStr((L1-11)/6)),'1')+1;
              R2p:=GetObPlace(StrToInt(FloatToStr((R2-11)/6)),'1')+1;
              L2p:=GetObPlace(StrToInt(FloatToStr((L2-11)/6)),'1')+1;
            end;
          end;
    if str= '# OF SATELLITES' then
     begin
         Readln(f,p);
         Readln(f,p);
          while (str<>'END OF HEADER')  do
            begin
              if  trim((copy(p,7,6)))<>'0' then
              begin
                str:= trim(copy(p,0,6));
                ComboBox1.AddItem(str,nil);
              end;
              Readln(f,p);
              str:=Trim(RightStr(p,20));
            end;
     end;
        end;
    closefile(f);
 end;
 end;
function TForm1.GetObPlace(n:integer;dir:string): Integer;   //��ȡÿ��۲������ݼ�¼��Ԫ��λ��
begin
  case n of
      0:result:=0;
      1:result:=16;
      2:result:=32;
      3:result:=48;
      4:result:=64;
      5:result:=100;                                        //����100,˵�������͵ļ�¼����һ��
      6:result:=116;
      7:result:=132;
      8:result:=148;
      9:result:=164;
      end;
       end;
procedure TForm1.Button2Click(Sender: TObject);            //ѡ����Ҫ���������
var
  d,str,objector :string;
  f :TextFile;
begin
  if  Application.MessageBox('�������̽���޸���¼��������Ӽ�¼��','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
    begin
    if director<>'' then begin
     d:=director;
     AssignFile(f,d);
     Reset(f);
     str:='';
     objector:=ComboBox1.Items[combobox1.itemindex];
     ReadData(objector);
  end;
  ListBox1.Clear ;
  ListBox2.Clear ;
  GroupBox1.Enabled:=True ;
  GroupBox2.Enabled:=True ;
  GroupBox4.Enabled:=True ;
  Button2.Enabled :=True ;
  Button6.Enabled :=True ;
  Button4.Enabled :=True ;
  Button8.Enabled :=True;
  ListBox1.Enabled :=True ;
  ListBox2.Enabled :=True ;
 end;
  end;

procedure Tform1.ReadData(GPSNo:string);            //��ָ�����ǵĹ۲����ݶ���������
var
   f :TextFile;
   d,p,str,temp : string;
   i,j,n,m,r,k1,k2,endof,recl,fd:Integer;
   begin
     d:=OpenDialog1.FileName ;
     AssignFile(f,d);
      Reset(f);
      i:=0;r:=0;
      str:='';temp:='choose satellite';
      n:=0;fd:=0;recl:=-1;
        Readln(f,p); r:=r+1;
        str:=Trim(RightStr(p,20));
        while str<>'END OF HEADER' do
        begin
          Readln(f,p); r:=r+1;
          str:=Trim(RightStr(p,20));
        end;
        Readln(f,p); r:=r+1;
        while not Eof(f)  do
        begin
         j:=strtoint(trim(Copy(p,30,3)));
         if j>12 then begin
         for  k1:=0 to 11 do
         begin
          temp:=Copy(p,33+3*k1,3) ;
           if temp=GPSNo then
           begin
             i:=i+1;
             n:=k1+1;
             Readln(f,p); r:=r+1;
             fd:=1;
             Break;
           end;
         end;
        if fd=0 then
         begin
          Readln(f,p); r:=r+1;
          for k2:=12 to j-1 do
           begin
           temp:=Copy(p,33+3*(k2-12),3) ;
           if temp=GPSNo then
            begin
             i:=i+1;
             n:=k2+1;                          //���Ǽ�¼����λ��
             Break;
            end;
           end;
          end;
        end
       else if j<=12 then
        for  k1:=0 to j-1 do
         begin
          temp:=Copy(p,33+3*k1,3) ;
           if temp=GPSNo then
           begin
             i:=i+1;
             n:=k1+1;                           //���Ǽ�¼����λ��
             Break;
           end;
         end;
       if No<6 then
         begin
          endof:=j; recl:=n-1;
         end else
         begin
          endof:=2*j;recl:=2*(n-1);
         end;
        for m:=0 to endof  do
           begin
             Readln(f,p); r:=r+1;
             if m=recl then
              begin
               SetLength(mydata,i);
                mydata[i-1].row:=r;
                mydata[i-1].PS1:=StrToFloat(Trim(Copy(p,R1p,16)));
                mydata[i-1].CP1:=StrToFloat(Trim(Copy(p,L1p,16)));
                mydata[i-1].PS2:=StrToFloat(Trim(Copy(p,R2p,16)));
                mydata[i-1].CP2:=StrToFloat(Trim(Copy(p,L2p,16)));  
              end;
           end;
      end;
      closefile(f);
   end;
procedure TForm1.Button4Click(Sender: TObject);       //����DrawChart��������
begin
     DrawChart(1);
     DrawChart(2);
     DrawChart(3);
     DrawChart(4);
     Button9.Enabled :=True ;
     Button5.Enabled :=True ;
end;
 procedure TForm1.DrawChart(i:Integer);                //��������
  begin
                  myseries2:=TLineSeries.Create( myseries2);
     case i of
         1:begin
                  chart1.AddSeries(myseries2);
                  GetArray(1);
                  myseries2.AddArray(GF);
                  myseries2.Title:='����'+ComboBox1.Items[combobox1.itemindex];
                   end;
         2:begin
                  chart2.AddSeries(myseries2);
                  GetArray(2);
                  myseries2.AddArray(D1);
                  myseries2.Title:='����'+ComboBox1.Items[combobox1.itemindex];
                   end;
         3:begin
                  chart3.AddSeries(myseries2);
                  GetArray(3);
                  myseries2.AddArray(MW);
                  myseries2.Title:='����'+ComboBox1.Items[combobox1.itemindex];
                    end;
         4:begin
                  chart4.AddSeries(myseries2);
                  GetArray(4);
                  myseries2.AddArray(D2);
                  myseries2.Title:='����'+ComboBox1.Items[combobox1.itemindex];
                    end;
    end;
   end;
procedure TForm1.GetArray(a:integer);     //��ȡ��Ϲ۲ⷽ�̼������
   var
    i, j:Integer;
   begin
        SetLength(GF,Length(mydata));
        SetLength(MW,Length(mydata));
        SetLength(LC_PC,Length(mydata));
        for i:=Low(mydata) to High(mydata) do
            begin
              GF[i]:=mydata[i].CP1-((77*mydata[i].CP2) /60);
              MW[i]:=((1575.42-1227.60)/(299792458*(1575.42+1227.60)))*(1575420000*mydata[i].PS1+1227600000*mydata[i].PS2)-(mydata[i].CP1 -mydata[i].CP2);
              LC_PC[i]:= 0.6222059*(0.19*mydata[i].CP1-mydata[i].PS1)-0.3777941*(0.244*mydata[i].CP2-mydata[i].PS2 ) ;
            end;
           SetLength(D1,Length(GF)-1);
           SetLength(D2,Length(GF)-1);
           SetLength(D3,Length(GF)-1);
        for j:=Low(GF) to  High(GF)-1    do
        begin
            D1[j]:=GF[j+1]-GF[j];
            D2[j]:=MW[j+1]-MW[j];
            D3[j]:=LC_PC[j+1]-LC_PC[j];
        end;
     end;
procedure TForm1.Button6Click(Sender: TObject);       //��������2������������ԭʼ�۲�����
var
   series:TLineSeries ;
   i:Integer;
begin
 Form2 :=TForm2.Create(Application);
 for i:=1 to 4 do begin
   series:=TLineSeries.Create(series);
     case i of
           1:begin
             form2.Chart1.AddSeries (series);
             GetForm2Array(1);
             series.AddArray(abv);
             series.Title:='����'+ComboBox1.Items[combobox1.itemindex];
             end;
           2:begin
             form2.Chart2.AddSeries (series);
             GetForm2Array(2);
             series.AddArray(abv);
             series.Title:='����'+ComboBox1.Items[combobox1.itemindex];
             end;
           3:begin
             form2.Chart3.AddSeries (series);
             GetForm2Array(3);
             series.AddArray(abv);
             series.Title:='����'+ComboBox1.Items[combobox1.itemindex];
             end;
           4:begin
             form2.Chart4.AddSeries (series);
             GetForm2Array(4);
             series.AddArray(abv);
             series.Title:='����'+ComboBox1.Items[combobox1.itemindex];
             end;
    end;
  end;
Form2.ShowModal ;
end;
procedure TForm1.GetForm2Array(i:integer);           //��ȡҪ�ڴ���2�ϻ��ƵĹ۲�ֵ����
var
   j:integer;
begin
  SetLength(abv,Length(mydata));
    for  j:=Low(mydata) to High(mydata)  do
      case i of
           1:abv[j]:=mydata[j].PS1;
           2:abv[j]:=mydata[j].CP1;
           3:abv[j]:=mydata[j].PS2;
           4:abv[j]:=mydata[j].CP2;
      end;
end;

procedure TForm1.Button5Click(Sender: TObject);                //���ģ��������Ұֵ
var
   i,j,pl1,pl2,k1,k2:Integer;
   cycle1,cycle2:Double;
   temp1,temp2:string;
begin
   if RadioButton3.Checked then begin
    if CheckBox1.checked and (Edit1.Text<>'') and (Edit2.Text<>'') then
    begin
       if StrToInt(Edit1.Text)<Length(mydata) then  begin
          pl1:=StrToInt(Edit1.Text);    cycle1:=-StrToFloat(Edit2.Text);
          for i:=pl1 to High(mydata)  do
           begin
            mydata[i].CP1:=mydata[i].CP1+cycle1;
           end;
          k1:=4-Length(Edit1.Text);temp1:=Edit1.Text +stringofchar(' ',k1);
          k2:=8-Length(Edit2.Text);temp2:=Edit2.Text +stringofchar(' ',k2);
          ListBox1.AddItem(formatdatetime('hh:mm:ss',time)+' ���� '+'L1 '+temp1+' '+temp2,nil);
       end else if StrToInt(Edit1.Text)>=Length(mydata) then ShowMessage('L1������Ԫ��Χ��');
    end;
    if CheckBox2.checked and (Edit3.Text<>'') and (Edit4.Text<>'') then
    begin
       if StrToInt(Edit3.Text)<Length(mydata) then
        begin
         pl2:=StrToInt(Edit3.Text);  cycle2:=-strtofloat(Edit4.Text);
         for j:=pl2 to High(mydata)  do
          begin
           mydata[j].CP2:=mydata[j].CP2+cycle2;
          end;
         k1:=4-Length(Edit3.Text);temp1:=Edit3.Text +stringofchar(' ',k1);
         k2:=8-Length(Edit4.Text);temp2:=Edit4.Text +stringofchar(' ',k2);
         ListBox1.AddItem(formatdatetime('hh:mm:ss',time)+' ���� '+'L2 '+temp1+' '+temp2,nil);
        end else if StrToInt(Edit3.Text)>=Length(mydata) then ShowMessage('L2������Ԫ��Χ��');
    end;
      Button9.Enabled:=False;
   end;
   if RadioButton4.Checked then begin
    if CheckBox1.checked and (Edit1.Text<>'') and (Edit2.Text<>'') then
     begin
      if StrToInt(Edit1.Text)<Length(mydata) then  begin
       pl1:=StrToInt(Edit1.Text);    cycle1:=-StrToFloat(Edit2.Text);
       mydata[pl1].CP1:=mydata[pl1].CP1+cycle1;
       k1:=4-Length(Edit1.Text);temp1:=Edit1.Text +stringofchar(' ',k1);
       k2:=8-Length(Edit2.Text);temp2:=Edit2.Text +stringofchar(' ',k2);
       ListBox1.AddItem(formatdatetime('hh:mm:ss',time)+' Ұֵ '+'L1 '+temp1+' '+temp2,nil);
      end else if StrToInt(Edit1.Text)>=Length(mydata) then ShowMessage('L1������Ԫ��Χ��');
    end;
    if CheckBox2.checked and (Edit3.Text<>'') and (Edit4.Text<>'') then
     begin
      if StrToInt(Edit3.Text)<Length(mydata) then  begin
       pl2:=StrToInt(Edit3.Text);  cycle2:=-strtofloat(Edit4.Text);
       mydata[pl2].CP2:=mydata[pl2].CP2+cycle2;
       k1:=4-Length(Edit3.Text);temp1:=Edit3.Text +stringofchar(' ',k1);
       k2:=8-Length(Edit4.Text);temp2:=Edit4.Text +stringofchar(' ',k2);
       ListBox1.AddItem(formatdatetime('hh:mm:ss',time)+' Ұֵ '+'L2 '+temp1+' '+temp2,nil);
      end else if StrToInt(Edit3.Text)>=Length(mydata) then ShowMessage('L2������Ԫ��Χ��');
    end;
    Button9.Enabled:=False;
  end;
end;
procedure TForm1.Button8Click(Sender: TObject);                //���Chart��
begin
Chart1.SeriesList.Clear;Chart1.FreeAllSeries;Chart1.Refresh;
Chart2.SeriesList.Clear;Chart2.FreeAllSeries;Chart2.Refresh;
Chart3.SeriesList.Clear;Chart3.FreeAllSeries;Chart3.Refresh;
Chart4.SeriesList.Clear;Chart4.FreeAllSeries;Chart4.Refresh;
end;
procedure TForm1.Chart1DblClick(Sender: TObject);              //����Chart1��GF�۲����ߣ���ͼ
begin
      if  SaveDialog1.Execute then
       Chart1.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm1.Chart2DblClick(Sender: TObject);              //����Chart2��D������ߣ���ͼ
begin
      if  SaveDialog1.Execute then
       Chart2.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm1.Chart3DblClick(Sender: TObject);              //����Chart3��MW�۲����ߣ���ͼ
begin
      if  SaveDialog1.Execute then
       Chart3.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm1.Chart4DblClick(Sender: TObject);              //����Chart4��D2������ߣ���ͼ
begin
      if  SaveDialog1.Execute then
       Chart4.SaveToBitmapFile(SaveDialog1.FileName) ;
end;
procedure TForm1.Button9Click(Sender: TObject);                //��GF-MW����̽��������Ұֵ
 var
    j,k1,m1,k2,m2,n1,n2,n3:Integer;
    temp1,temp2,epochstr:string;
    cyc1f,cyc2f:Double;
  begin
   k1:=0;m1:=0;k2:=0;m2:=0;
   ProgressBar1.min:= 0;
   progressBar1.Max:= Length(D1)-1;
   ProgressBar1.Position:= 0;
   ProgressBar1.Visible :=True ;
   for j:= 1 to high(D1) do
    begin
       GetDtolArray(j) ;
       Calculatetol(j,GFm,MWm);
       edit5.Text:=FloatToStr(RoundTo(GFm,-5));
       Edit6.Text:=FloatToStr(RoundTo(MWm,-5));
       ProgressBar1.Position:= ProgressBar1.Position + 1;
       if  (Abs(D1[j])>GFm)  then                             //�����в
         begin
         if (Abs((D1[j+1]-D1[j-1]))<=GFm )  and (Abs((D1[j+2]-D1[j-1]))<=GFm ) and (k1=0)  then
             begin
              k1:=2;
             end ;
       if (Abs((D1[j+1]-D1[j-1]))>GFm ) and (Abs((D1[j+2]-D1[j-1]))<=GFm ) and (m1=0) then
             begin
              n3:=4-length(IntToStr(j+1));
              epochstr:=inttostr(j+1)+stringofchar(' ',n3);
              temp1:='GF���Ұֵ '+FloatToStr(RoundTo(D1[j],-4));
              ListBox2.AddItem(formatdatetime('hh:mm:ss',time)+' Ұֵ '+ epochstr+' N '+temp1+' ',nil);
              m1:=2;
             end;
                 end;
       if  (Abs(D2[j]{-D2[j-1]})>=MWm)  then                //������λ��խ��α�෨
         begin
         if (Abs((D2[j+1]-D2[j-1]))<=MWm )  and (Abs((D2[j+2]-D2[j-1]))<=MWm ) and (k2=0) then
             begin
              k2:=2;
              end ;
         if(Abs((D2[j+1]-D2[j-1]))>MWm ) and (Abs((D2[j+2]-D2[j-1]))<=MWm ) and (m2=0) then
             begin
              n3:=4-length(IntToStr(j+1));
              epochstr:=inttostr(j+1)+stringofchar(' ',n3);
              temp1:='MW���Ұֵ '+FloatToStr(RoundTo(D2[j],-4));
              ListBox2.AddItem(formatdatetime('hh:mm:ss',time)+' Ұֵ '+ epochstr+' N '+temp1+' ',nil);
              m2:=2;
             end;
         end;
       if ((k1=2) and (k2=2)) or ((k1=2) and (k2=0)) or ((k1=0) and (k2=2)) then
         begin
          cyclerec.epoch :=j;
          cyclerec.GFcycle := D1[j];
          cyclerec.MWcycle := D2[j];
          CalculateCycle(j,cyclerec.L1cycle,cyclerec.L2cycle);
         if (Abs(cyclerec.L1cycle)<1) and (Abs(cyclerec.L2cycle)<1) then
          begin
            cyc1f:=RoundTo(cyclerec.L1cycle,-4);  cyc2f:=RoundTo(cyclerec.L2cycle,-4);
            n1:=4-length(IntToStr(j+1));
            epochstr:=inttostr(j+1)+stringofchar(' ',n1);
            n2:=8-Length(FloatToStr(cyc1f));temp1:=FloatToStr(cyc1f) +stringofchar(' ',n2);
            n3:=8-Length(FloatToStr(cyc2f));temp2:=FloatToStr(cyc2f) +stringofchar(' ',n3);
            ListBox2.AddItem(formatdatetime('hh:mm:ss',time)+' ���� '+ epochstr+' N '+temp1+' '+temp2+' '+'UnRepair',nil);
          end else
          begin
           n1:=4-length(IntToStr(j+1));
           epochstr:=inttostr(j+1)+stringofchar(' ',n1);
           n2:=8-Length(FloatToStr(cyclerec.L1cycle));temp1:=FloatToStr(cyclerec.L1cycle) +stringofchar(' ',n2);
           n3:=8-Length(FloatToStr(cyclerec.L2cycle));temp2:=FloatToStr(cyclerec.L2cycle) +stringofchar(' ',n3);
           ListBox2.AddItem(formatdatetime('hh:mm:ss',time)+' ���� '+ epochstr+' Y '+temp1+' '+temp2+' '+'UnRepair',nil);
          end;
           Edit9.Text:=FloatToStr(D1[j] );Edit10.Text :=FloatToStr(D2[j] );
       end;
      if k1<>0 then k1:=k1-1;
      if m1<>0 then m1:=m1-1;
      if k2<>0 then k2:=k2-1;
      if m2<>0 then m2:=m2-1;
    end;
    ProgressBar1.Visible :=False  ;
    ShowMessage('������ϣ�');
  end;
procedure TForm1.GetDtolArray(tar:integer);               //��ȡ������̽���޲�ļ��������
var
  i,j:Integer;
begin
    for i:=0 to tar do
     begin
      SetLength (D2tol,i+1);
      for j:=0 to i do
       begin
        d2tol[i]:=D2[i];
       end;
    end;
end;
procedure TForm1.Calculatetol(tar:integer;var  GFm:Double  ;var  MWm:Double  );    //����̽���޲�
 begin
     if  RadioButton2.Checked then
      begin
        if CheckBox3.Checked then
         begin
         GFm:=strtofloat(Edit5.Text);
         end else
        begin
        GFm:=0.07;
        end;
       if CheckBox4.Checked then
        begin
        MWm:=strtofloat(Edit6.Text);
        end else
        begin
        MWm:=3*PopnStdDev(D2tol);
        end;
     end else
     if  RadioButton1.Checked then
      begin
       GFm:=0.07;
       MWm:=3*PopnStdDev(D2tol) ;
      end;
 end;
 procedure TForm1.CalculateCycle(i:Integer;var Dn1:Double ;var Dn2:double);  //����L1��L2�ϵ�����
 var
    Dn3:Double ;
 begin
    Dn1:= (60*D1[i]+77*D2[i])/17;
    Dn2:=60*(D2[i]+D1[i])/17;
    Dn3:=D3[i];
  if (Abs(Dn1)<1) and (Abs(Dn2)<1) then
  else FixedToInteger(Dn1,Dn2,Dn3);
 end;
 procedure TForm1.FixedToInteger(var Dn1:Double ;var Dn2:double ;Dn3:Double );//��L1��L2�ϵ������̶�Ϊ����
  var
     i,j,k1,k2:Integer;
     leastn1,leastn2:Integer;
     LC_PC1:Double  ;
 begin
   k1:=Round(Dn1);k2:=Round(Dn2);
   leastn1:=k1;leastn2:=k2;
   {lC_PC1:=Abs(Dn3-(299.792458/(1575.42*1575.42-1227.6*1227.6))*(1575.42*Dn1-1227.60*Dn2));    //LC_PC���
   for i:=-1 to 1 do
    for j:=-1 to 1 do
     begin
        if (Abs ( ( 77*( k1+i)/66)-(k2+i) )>GFm)  and (Abs( k1-  k2   )>MWm)  then
          if    Abs(Dn3-(299.792458/(1575.42*1575.42-1227.6*1227.6))*(1575.42*( k1+i)-1227.60*(k2+j )))<=LC_PC1 then
            begin
             leastn1:=  k1+i;
             leastn2 :=k2+j;
             LC_PC1:=  Abs(Dn3-(299.792458/(1575.42*1575.42-1227.6*1227.6))*(1575.42*( k1+i)-1227.60*(k2+j )));
            end;
        if ((k1+i)<leastn1) and (k2+j<leastn2) then
           begin
           leastn1:=k1+i;  leastn2:=k2+j ;
           end;
     end;      }
    Dn1:=leastn1;Dn2:=leastn2 ;
 end;
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);      //ֻ�����������ֺ�ɾ����, �ҵ�һλ����Ϊ��
begin
  if (not (key in ['0'..'9', #8]) or (LeftStr(Edit1.text + key, 1)= '0'))  then
  begin
    key:= #0;
  end;
end;
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);      //ֻ�����������֡�С���㡢�����Լ�ɾ����
begin
  if (not (key in ['0'..'9', #8,'.','-']) )  then
  begin
    key:= #0;
  end;
end;
procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);      //ֻ�����������ֺ�ɾ����, �ҵ�һλ����Ϊ��
begin
  if (not (key in ['0'..'9', #8]) or (LeftStr(Edit3.text + key, 1)= '0'))  then
  begin
    key:= #0;
  end;
end;
procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);     //ֻ�����������֡�С���㡢�����Լ�ɾ����
begin
  if (not (key in ['0'..'9', #8,'.','-']) )  then
  begin
    key:= #0;
  end;
end;
procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);      //ֻ�����������ֺ�С�����Լ�ɾ����
begin
  if (not (key in ['0'..'9', #8,'.']) )  then
  begin
    key:= #0;
  end;
end;
procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: Char);      //ֻ�����������ֺ�С�����Լ�ɾ����
begin
  if (not (key in ['0'..'9', #8,'.']))  then
  begin
    key:= #0;
  end;
end;
procedure TForm1.RadioButton1Click(Sender: TObject);                 //ѡ��̽���޲�ΪĬ��
begin
CheckBox3.Checked :=False ;
CheckBox3.Enabled :=False;
CheckBox4.Checked :=False ;
CheckBox4.Enabled :=False;
Edit5.Text :='';
Edit5.Enabled :=False;
Edit6.Text :='';
Edit6.Enabled :=False ;
end;
procedure TForm1.RadioButton2Click(Sender: TObject);                 //ѡ��̽���޲�Ϊ�û��Զ���
begin
CheckBox3.Enabled :=True ;
CheckBox4.Enabled :=True;
Edit5.Enabled :=True;
Edit6.Enabled :=True ;
end;
procedure TForm1.N1Click(Sender: TObject);                           //�޸���ѡ�������
var
  temp1,temp3,temp6:string;
  epoch,i:Integer;
  cyc1,cyc2:Double ;
 begin
 if ListBox2.ItemIndex>-1 then
  begin
   temp1:=Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],10,4));
   temp3:=Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],20,1));
   temp6:=Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],40,9));
   if (temp1='����') and (temp3='Y') then
   begin
   epoch:=StrToInt(Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],15,4)));
   cyc1:=StrToFloat(Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],22,8)));
   cyc2:=StrToFloat(Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],31,8)));
   if temp6='UnRepair' then begin
   if Application.MessageBox('ȷ��Ҫ�޸���','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
     begin
      for i:=epoch  to High(mydata)  do
       begin
       mydata[i].CP1:=mydata[i].CP1+cyc1;
       mydata[i].CP2:=mydata[i].CP2+cyc2;
        end;
      Button9.Enabled :=False;
      ShowMessage('�޸��ɹ���');
      N7.Enabled:=True ;
      ListBox2.Items[ListBox2.ItemIndex]:=Copy( ListBox2.Items[ListBox2.ItemIndex],1,39)+' Repaired';
     end;
      end else if  temp6='Repaired' then ShowMessage('�Ѿ��޸��������ٴ��޸���');
   end else if (temp1='����') and (temp3='N') then
   begin
    epoch:=StrToInt(Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],15,4)));
    cyc1:=StrToFloat(Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],22,8)));
    cyc2:=StrToFloat(Trim(Copy(ListBox2.Items[ListBox2.ItemIndex],31,8)));
      if temp6='UnRepair' then begin
      if Application.MessageBox('����δ�̶���ȷ��Ҫ�޸���','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
      begin
       for i:=epoch  to High(mydata)  do
        begin
         mydata[i].CP1:=mydata[i].CP1+cyc1;
         mydata[i].CP2:=mydata[i].CP2+cyc2;
        end;
        Button9.Enabled :=False;
        ShowMessage('�޸��ɹ���');
        N7.Enabled:=True ;
        ListBox2.Items[ListBox2.ItemIndex]:=Copy( ListBox2.Items[ListBox2.ItemIndex],1,39)+' Repaired';
      end;
       end   else if  temp6='Repaired' then ShowMessage('�Ѿ��޸��������ٴ��޸���');
   end;
  end;
 end;
procedure TForm1.N2Click(Sender: TObject);                               //���������޸�������������
var
  i:Integer;
begin
if  ListBox2.ItemIndex>-1 then
begin
   if  Application.MessageBox('ȷ��Ҫ�޸����У�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
    begin
     for i:=0 to ListBox2.Items.count-1 do
        begin
        Repair(i);
        end;
        Button9.Enabled :=False;
        ShowMessage('�޸����!');
        N7.Enabled:=True ;
       end else  ShowMessage('�޸�ʧ��!');
  end;
end;
procedure TForm1.Repair(indextar:Integer);                              //�Զ���������޸���������
var
  temp1,temp3,temp6:string;
  epoch,i:Integer;
  cyc1,cyc2:Double ;
begin
   temp1:=Trim(Copy(ListBox2.Items[indextar],10,4));
   temp3:=Trim(Copy(ListBox2.Items[indextar],20,1));
   temp6:=Trim(Copy(ListBox2.Items[indextar],40,9));
  if (temp1='����') and (temp3='Y') and (temp6='UnRepair') then
  begin
   epoch:=StrToInt(Trim(Copy(ListBox2.Items[indextar],15,4)));
   cyc1:=StrToFloat(Trim(Copy(ListBox2.Items[indextar],22,8)));
   cyc2:=StrToFloat(Trim(Copy(ListBox2.Items[indextar],31,8)));
      for i:=epoch  to High(mydata)  do
       begin
       mydata[i].CP1:=mydata[i].CP1+cyc1;
       mydata[i].CP2:=mydata[i].CP2+cyc2;
        end;
      ListBox2.Items[indextar]:=Copy( ListBox2.Items[indextar],1,39)+' Repaired';
  end else if (temp1='����') and (temp3='N')and  (temp6='UnRepair') then
    begin
      epoch:=StrToInt(Trim(Copy(ListBox2.Items[indextar],15,4)));
      cyc1:=StrToFloat(Trim(Copy(ListBox2.Items[indextar],22,8)));
      cyc2:=StrToFloat(Trim(Copy(ListBox2.Items[indextar],31,8)));
      for i:=epoch  to High(mydata)  do
       begin
       mydata[i].CP1:=mydata[i].CP1+cyc1;
       mydata[i].CP2:=mydata[i].CP2+cyc2;
        end;
      ListBox2.Items[indextar]:=Copy( ListBox2.Items[indextar],1,39)+' Repaired';
    end;
end;
procedure TForm1.N9Click(Sender: TObject);                             //���ģ������/Ұֵ����
begin
  if ListBox1.ItemIndex >-1 then
     if  Application.MessageBox('ȷ��Ҫ����������ݣ�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
          ListBox1.Clear ;
end;
procedure TForm1.N12Click(Sender: TObject);                            //���̽������
begin
 if ListBox2.ItemIndex >-1 then
     if  Application.MessageBox('ȷ��Ҫ����������ݣ�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
          ListBox2.Clear ;
end;
procedure TForm1.N5Click(Sender: TObject);                             //����̽���޸���¼
begin
  if ListBox2.ItemIndex>-1 then
   begin
if SaveDialog2.Execute and (ListBox2.ItemIndex>-1) then
  begin
   ListBox2.Items.SaveToFile(SaveDialog2.FileName);
   ShowMessage('����ɹ���');
  end;
  end
  else ShowMessage('�޼�¼�ɱ��棡');
end;
procedure TForm1.N14Click(Sender: TObject);                            //ɾ��ѡ����ģ������/Ұֵ��¼
begin
    if ListBox1.ItemIndex >-1 then
     if  Application.MessageBox('ȷ��Ҫɾ�����ݣ�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
       ListBox1.DeleteSelected ;
end;
procedure TForm1.N13Click(Sender: TObject);                            //ɾ��ѡ����̽���¼
begin
   if ListBox2.ItemIndex >-1 then
     if  Application.MessageBox('ȷ��Ҫɾ�����ݣ�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
       ListBox2.DeleteSelected ;
end;
procedure TForm1.N8Click(Sender: TObject);                              //����ѡ����ģ������/Ұֵ��¼
var
    temp:string ;
    i:Integer ;
    pl1,pl2:integer;
    cycle1,cycle2:Double;
begin
  if ListBox1.ItemIndex>-1 then begin
     temp:=ListBox1.Items[ListBox1.ItemIndex];
   if Application.MessageBox('ȷ��Ҫ�������ݣ�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
    begin
     if Trim(Copy(temp,10,4))='����' then
      if Copy(temp,15,2)='L1' then
       begin
        pl1 :=StrToInt( trim(Copy(temp,18,4)));
        cycle1 :=StrToFloat( trim(Copy(temp,23,8)));
        for i:=pl1 to High(mydata)  do
         begin
          mydata[i].CP1:=mydata[i].CP1+cycle1;
         end;
      end
     else if  Copy(temp,15,2)='L2' then
     begin
       pl2 :=StrToInt( trim(Copy(temp,18,4)));
       cycle2 :=StrToFloat( trim(Copy(temp,23,8)));
       for i:=pl2 to High(mydata)  do
        begin
         mydata[i].CP2:=mydata[i].CP2+cycle2;
        end;
     end ;
    if Trim(Copy(temp,10,4))='Ұֵ' then
      if Copy(temp,15,2)='L1' then
       begin
        pl1 :=StrToInt( trim(Copy(temp,18,4)));
        cycle1 :=StrToFloat( trim(Copy(temp,23,8)));
        mydata[pl1].CP1:=mydata[pl1].CP1+cycle1;
      end
     else if  Copy(temp,15,2)='L2' then
      begin
       pl2 :=StrToInt( trim(Copy(temp,18,4)));
       cycle2 :=StrToFloat( trim(Copy(temp,23,8)));
       mydata[pl2].CP2:=mydata[pl2].CP2+cycle2;
      end;
      ListBox1.DeleteSelected ;
      Button9.Enabled :=False;
     end ;
      end;
end;
procedure TForm1.N10Click(Sender: TObject);                           //��������ģ������/Ұֵ��¼
var
    i:Integer ;
begin
if  ListBox1.ItemIndex>-1 then
 begin
   if  Application.MessageBox('ȷ��Ҫ�������У�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
     begin
      for i:=0 to ListBox1.Items.count-1 do
        begin
        Drawback(i);
        end;
        ListBox1.Clear;
        Button9.Enabled :=False;
        ShowMessage('�������!');
        end else  ShowMessage('����ʧ��!');
  end;
end;
procedure TForm1.Drawback(tar:integer);             //����ģ������/Ұֵ��¼����
 var
    temp:string ;
    i,rb:Integer ;
    pl1,pl2:integer;
    cycle1,cycle2:Double;
begin
    temp:=ListBox1.Items[tar];
     if Trim(Copy(temp,10,4))='����' then
      if Copy(temp,15,2)='L1' then
       begin
        pl1 :=StrToInt( trim(Copy(temp,18,4)));
        cycle1 :=StrToFloat( trim(Copy(temp,23,8)));
        for i:=pl1 to High(mydata)  do
         begin
          mydata[i].CP1:=mydata[i].CP1+cycle1;
         end;
       end
      else if  Copy(temp,15,2)='L2' then
      begin
       pl2 :=StrToInt( trim(Copy(temp,18,4)));
       cycle2 :=StrToFloat( trim(Copy(temp,23,8)));
       for i:=pl2 to High(mydata)  do
         begin
         mydata[i].CP2:=mydata[i].CP2+cycle2;
         end;
      end ;
    if Trim(Copy(temp,10,4))='Ұֵ' then
      if Copy(temp,15,2)='L1' then
       begin
        pl1 :=StrToInt( trim(Copy(temp,18,4)));
        cycle1 :=StrToFloat( trim(Copy(temp,23,8)));
        mydata[pl1].CP1:=mydata[pl1].CP1+cycle1;
       end
     else if  Copy(temp,15,2)='L2' then
     begin
       pl2 :=StrToInt( trim(Copy(temp,18,4)));
       cycle2 :=StrToFloat( trim(Copy(temp,23,8)));
       mydata[pl2].CP2:=mydata[pl2].CP2+cycle2;
     end;
end;
procedure TForm1.N7Click(Sender: TObject);          //�����޸��������
var
  i,j,r,lg1,lg2,lg3,lg4:Integer;
  row1:array of Integer;
  temp2,temp3,p,ys1,ys2:string;
  val1,val2:Double ;
  f1,f:TextFile;
  oldpath,newpath:string;
begin
if  Application.MessageBox('ȷ��Ҫ�����޸����ݣ�','��ʾ��Ϣ',MB_YESNO + MB_ICONQUESTION)=MrYES then
 begin
  r:=0; j:=0;
  SetLength(row1,Length(mydata));
  for i:=0 to High(mydata)  do
   begin
    row1[i]:=mydata[i].row ;
   end;
   oldpath := ExtractFilePath(director);
   newpath := oldpath+'(�޸���)'+ ExtractFileName(director);
   AssignFile(f,director );Reset(f);
   AssignFile(f1,newpath );Rewrite(f1);
  while not eof(f) do
  begin
   Readln(f,p);r:=r+1;
   if  j in [Low(mydata)..High(mydata)] then
     begin
      if  r=mydata[j].row then
       begin
        ys1:=Trim(Copy(p,L1p,16));ys2:=Trim(Copy(p,L2p,16));
        lg1:=Length(ys1);lg2:=Length(ys2);
        val1:=mydata[j].CP1; val2:=mydata[j].CP2;
        lg3:=Length(FloatToStr(val1));lg4:=Length(FloatToStr(val2));
        if lg3>lg1 then  temp2:=RightStr(FloatToStr(val1),lg1) else
        if lg3<=lg1 then temp2:=stringofchar(' ',lg1-lg3)+FloatToStr(val1);
        if lg4>lg2 then  temp3:=RightStr(FloatToStr(val2),lg2) else
        if lg4<=lg2 then temp3:=stringofchar(' ',lg2-lg4)+FloatToStr(val2);
        p:= StringReplace(p,ys1,temp2,[] ) ;
        p:= StringReplace(p,ys2,temp3,[] ) ;  
         j:=j+1;
       end;
     end;
    Writeln(f1,p);
  end;
  CloseFile(f1);
  CloseFile(f);
  ShowMessage('�ѱ�����'+ newpath);
 end else  ShowMessage('����ʧ�ܣ�');
end;
function  TForm1.CreateNew():string;                  //�����޸���������ļ�
var
   oldpath,newpath:string ;
begin
 oldpath := ExtractFilePath(director);
 newpath := oldpath+'(�޸���)'+ ExtractFileName(director);
 if Not FileExists(newpath) then
  CopyFile(PChar(director)  ,PChar(newpath),false );
 Result :=newpath ;
 end;
procedure TForm1.Label8MouseEnter(Sender: TObject);  // ����Ч��
 begin
     label8.Font.Color :=clBlue;
     Panel2.BevelInner :=BvRaised;
     Panel2.BevelOuter :=BvLowered;
 end;
procedure TForm1.Label8MouseLeave(Sender: TObject); // ����Ч��
 begin
    label8.Font.Color :=clBlack;
    Panel2.BevelInner :=BvNone;
    Panel2.BevelOuter :=BvRaised;
 end;
procedure TForm1.Label12MouseEnter(Sender: TObject);  // ����Ч��
 begin
     label12.Font.Color :=clBlue;
     Panel2.BevelInner :=BvRaised;
     Panel2.BevelOuter :=BvLowered;
 end;
procedure TForm1.Label12MouseLeave(Sender: TObject); // ����Ч��
 begin
    label12.Font.Color :=clBlack;
    Panel2.BevelInner :=BvNone;
    Panel2.BevelOuter :=BvRaised;
 end;
procedure TForm1.Label12Click(Sender: TObject);      //���ð����ĵ�
var
   path:string;
begin
path:=ExtractFilePath(Application.ExeName)+'CCSystemʹ��˵��.CHM';
ShellExecute(0,'open',pchar(path),nil,nil,sw_show);
end;
procedure TForm1.Label8Click(Sender: TObject);     //�������ڴ���
 begin
   form3:=TForm3.Create(form3);
   Form3.ShowModal;
 end;
procedure TForm1.ComboBox1Click(Sender: TObject); //�����б���¼�����������ؼ��Ŀ�����
 begin
  Button8.Click ;
  Button6.Enabled :=False  ;
  Button4.Enabled :=False;
  Button8.Enabled :=False;
  Button9.Enabled :=False;
  Button5.Enabled :=False;
  ListBox1.Enabled :=False ;
  ListBox2.Enabled :=False ;
  N7.Enabled:=False  ;
  Button2.Enabled :=True   ;
 end;
end.
