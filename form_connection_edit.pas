unit form_connection_edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Uni;

type
  TfmConnectionEdit = class(TForm)
    Label1: TLabel;
    edServer: TEdit;
    edPort: TEdit;
    edUsername: TEdit;
    edPassword: TEdit;
    edDatabase: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnTest: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConnectionEdit: TfmConnectionEdit;

implementation

{$R *.dfm}

uses db_datamodule;

procedure TfmConnectionEdit.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmConnectionEdit.btnSaveClick(Sender: TObject);
var
  config: TConfigINI;
begin
  config.server := edServer.Text;
  config.port := StrToInt(edPort.Text);
  config.username := edUsername.Text;
  config.password := edPassword.Text;
  config.database := edDatabase.Text;
  DBDataModule.SaveConfig(config);
  ModalResult := mrOk;
end;

procedure TfmConnectionEdit.btnTestClick(Sender: TObject);
var
  con: tuniconnection;
begin
  con := tuniconnection.Create(nil);
  with con do
  begin
    ProviderName := 'MYSQL';
    server := edServer.Text;
    port := StrToInt(edPort.Text);
    username := edUsername.Text;
    password := edPassword.Text;
    database := edDatabase.Text;
    try
      con.Connect;
      ShowMessage('Соединение установлено');
      con.Disconnect;
    except
      on E: Exception do
        DBDataModule.ShowError(E.Message, E.ClassName);
    end;
  end;
  con.Free;
end;

procedure TfmConnectionEdit.FormCreate(Sender: TObject);
var
  config: TConfigINI;
begin
  Caption := CAPTION_CONNECTIONEDIT;
  config := DBDataModule.LoadConfig;
  edServer.Text := config.server;
  edPort.Text := config.port.ToString;
  edUsername.Text := config.username;
  edPassword.Text := config.password;
  edDatabase.Text := config.database;
end;

end.
