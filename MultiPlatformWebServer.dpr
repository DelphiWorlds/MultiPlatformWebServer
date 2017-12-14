program MultiPlatformWebServer;

uses
  System.StartUpCopy,
  FMX.Forms,
  MPWS.WebServerModule in 'MPWS.WebServerModule.pas' {WebServerModule: TWebModule},
  MPWS.WebServer in 'MPWS.WebServer.pas' {WebServer: TDataModule},
  MPWS.MainForm in 'MPWS.MainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
