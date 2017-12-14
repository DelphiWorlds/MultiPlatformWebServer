unit MPWS.MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation,
  MPWS.WebServer;

type
  TMainForm = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    PortLabel: TLabel;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
  private
    FServer: TWebServer;
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  Application.OnIdle := ApplicationIdle;
  FServer := TWebServer.Create(Self);
end;

procedure TMainForm.ApplicationIdle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.IsActive;
  ButtonStop.Enabled := FServer.IsActive;
  EditPort.Enabled := not FServer.IsActive;
end;

procedure TMainForm.ButtonStartClick(Sender: TObject);
begin
  FServer.Port := StrToInt(EditPort.Text);
  FServer.Start;
end;

procedure TMainForm.ButtonStopClick(Sender: TObject);
begin
  FServer.Stop;
end;

end.
