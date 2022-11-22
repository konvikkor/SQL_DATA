program MSSQL_GET;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fGACT};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Get And Clear Table [GACT]';
  Application.CreateForm(TfGACT, fGACT);
  Application.Run;

end.
