program CCSystem;

uses
  Forms,
  CycleSlip in 'CycleSlip.pas' {Form1},
  observation in 'observation.pas' {Form2},
  About in 'About.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
