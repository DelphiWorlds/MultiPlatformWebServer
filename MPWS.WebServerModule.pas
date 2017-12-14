unit MPWS.WebServerModule;

interface

uses
  System.SysUtils, System.Classes,
  Web.HTTPApp;

type
  TWebServerModule = class(TWebModule)
    procedure WebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  end;

var
  WebModuleClass: TComponentClass = TWebServerModule;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  // IdHTTPWebBrokerBridge needs to be in the uses clause so that WebRequestHandler is set first
  Web.WebReq, IdHTTPWebBrokerBridge;

{$R *.dfm}

procedure TWebServerModule.WebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +
    '</html>';
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;

end.
