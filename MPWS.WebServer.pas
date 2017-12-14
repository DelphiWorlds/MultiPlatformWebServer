unit MPWS.WebServer;

interface

uses
  System.SysUtils, System.Classes, IdHTTPWebBrokerBridge;

type
  TWebServer = class(TDataModule)
  private
    FServer: TIdHTTPWebBrokerBridge;
    function GetIsActive: Boolean;
    function GetPort: Integer;
    procedure SetPort(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Start;
    procedure Stop;
    property IsActive: Boolean read GetIsActive;
    property Port: Integer read GetPort write SetPort;
  end;

var
  WebServer: TWebServer;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TWebServer }

constructor TWebServer.Create(AOwner: TComponent);
begin
  inherited;
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

function TWebServer.GetIsActive: Boolean;
begin
  Result := FServer.Active;
end;

function TWebServer.GetPort: Integer;
begin
  Result := FServer.DefaultPort;
end;

procedure TWebServer.SetPort(const Value: Integer);
var
  LWasActive: Boolean;
begin
  if Value <> Port then
  begin
    LWasActive := FServer.Active;
    Stop;
    FServer.DefaultPort := Value;
    if LWasActive then
      Start;
  end;
end;

procedure TWebServer.Start;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.Active := True;
  end;
end;

procedure TWebServer.Stop;
begin
  FServer.Active := False;
end;

end.
