unit service;

interface

const
  GLOBALCONFIG_FILENAME: string = 'config.dat';

type

  TGlobalConfig = record
    server: ShortString;
    port: word;
    username: ShortString;
    password: ShortString;
    database: ShortString;
    Import1CDirectory: ShortString;
    Import1CFileDivision: ShortString;
    Import1CFileEmployee: ShortString;
    Import1CCheckNewFileOnStart: boolean;
    Import1CDelimiter: ShortString;
    procedure default;
  end;

function GlobalConfigLoad: TGlobalConfig;
procedure GlobalConfigSave(config: TGlobalConfig);
function GetConfigFilename: string;

function StrToChar(s: string): Char;

implementation

uses
  System.Classes, System.SysUtils, Vcl.Forms, Vcl.Dialogs;

function StrToChar(s: string): Char;
begin
  if not s.IsEmpty then
    result := s[1]
  else
    result := #0;
end;

function GetConfigFilename: string;
begin
  result := ExtractFilePath(Application.ExeName) + GLOBALCONFIG_FILENAME;
end;

function GlobalConfigLoad: TGlobalConfig;
var
  f: TFileStream;
  ConfigINI: TGlobalConfig;
begin
  ConfigINI.default;
  f := nil;
  try
    f := TFileStream.Create(GetConfigFilename, fmOpenRead);
    f.ReadBuffer(ConfigINI, SizeOf(TGlobalConfig));
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
  f.Free;
  result := ConfigINI;
end;

procedure GlobalConfigSave(config: TGlobalConfig);
var
  f: TFileStream;
begin
  if FileExists(GetConfigFilename) then
    f := TFileStream.Create(GetConfigFilename, fmOpenWrite)
  else
    f := TFileStream.Create(GetConfigFilename, fmCreate);
  try
    f.WriteBuffer(config, SizeOf(TGlobalConfig));
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
  f.Free;
end;

{ TConfigINI }

procedure TGlobalConfig.default;
begin
  server := 'localhost';
  port := 3306;
  username := 'root';
  password := '';
  database := '';
  Import1CDirectory := '';
  Import1CFileDivision := 'Подразделения*.csv';
  Import1CFileEmployee := 'Сотрудники*.csv';
  Import1CCheckNewFileOnStart := false;
  Import1CDelimiter := ';';
end;

end.
