unit db_datamodule;

interface

uses
  System.SysUtils, System.Classes, UniProvider, MySQLUniProvider, Data.DB,
  DBAccess, Uni, INIFiles, Vcl.Dialogs, Vcl.Forms, Winapi.Windows;

const
  SECRET_KEY: string = 'SeCrEtKeY';

  CAPTION_MAINFORM: string = 'OIT Project';
  CAPTION_CONNECTIONEDIT: string = '��������� �����������';
  CAPTION_SETTINGSFORM: string = '���������';

type
  TConfigINI = record
    server: ShortString;
    port: word;
    username: ShortString;
    password: ShortString;
    database: ShortString;
    Import1CDirectory: ShortString;
    Import1CFileDivision: ShortString;
    Import1CFileEmployee: ShortString;
    Import1CCheckNewFileOnStart: boolean;
    procedure default;
  end;

  TDBDataModule = class(TDataModule)
    DBConnection: TUniConnection;
    MysqlDriver: TMySQLUniProvider;
    procedure DBConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function LoadConfig: TConfigINI;
    procedure SaveConfig(config: TConfigINI);
    function GetConfigFilename: string;
    procedure ShowError(text, caption: string);
  end;

var
  DBDataModule: TDBDataModule;

implementation

uses
  Vcl.Controls, form_connection_edit;

{$R *.dfm}

procedure TDBDataModule.DataModuleCreate(Sender: TObject);
var
  form: TfmConnectionEdit;
begin
  try
    DBConnection.Connect;
  except
    on E: Exception do
      if Application.MessageBox
        ('�� ������� ������� ���� �������� ��� ��������� ��������. ������� ���� �������� �����������?',
        PWidechar(E.ClassName), MB_ICONERROR + MB_YESNO) = mrYes then
      begin
        form := TfmConnectionEdit.Create(nil);
        if form.ShowModal = mrOk then
          try
            DBConnection.Connect;
          except
            Application.Terminate;
          end
        else
          Application.Terminate;
      end;
  end;
end;

procedure TDBDataModule.DBConnectionBeforeConnect(Sender: TObject);
var
  config: TConfigINI;
begin
  config := LoadConfig;
  with DBConnection do
  begin
    server := config.server;
    port := config.port;
    username := config.username;
    password := config.password;
    database := config.database;
  end;
end;

function TDBDataModule.GetConfigFilename: string;
begin
  result := ExtractFilePath(Application.ExeName) + '\config.dat';
end;

function TDBDataModule.LoadConfig: TConfigINI;
var
  f: TFileStream;
  ConfigINI: TConfigINI;
begin
  ConfigINI.default;
  f := nil;
  try
    f := TFileStream.Create(GetConfigFilename, fmOpenRead);
    f.ReadBuffer(ConfigINI, SizeOf(TConfigINI));
  except
    on E: Exception do
      // ShowError(e.Message,e.ClassName);
  end;
  f.Free;
  result := ConfigINI;
end;

procedure TDBDataModule.SaveConfig(config: TConfigINI);
var
  f: TFileStream;
begin
  if FileExists(GetConfigFilename) then
    f := TFileStream.Create(GetConfigFilename, fmOpenWrite)
  else
    f := TFileStream.Create(GetConfigFilename, fmCreate);
  try
    f.WriteBuffer(config, SizeOf(TConfigINI));
  except
    on E: Exception do
      ShowError(E.Message, E.ClassName);
  end;
  f.Free;
end;

procedure TDBDataModule.ShowError(text, caption: string);
begin
  Application.MessageBox(PWidechar(text), PWidechar(caption), MB_ICONERROR);
end;

{ TConfigINI }

procedure TConfigINI.default;
begin
  server := 'localhost';
  port := 3306;
  username := 'root';
  password := '';
  database := '';
  Import1CDirectory := '';
  Import1CFileDivision := '';
  Import1CFileEmployee := '';
  Import1CCheckNewFileOnStart := false;
end;

end.
