unit Import1c;

interface

uses
  System.SysUtils, IOUtils, System.Types, Vcl.Dialogs, System.Classes,
  System.Generics.Collections, INIFiles, Vcl.Forms;

const
  INI_IMPORT1C: string = 'import1c.ini';
  INI_IMPORT1C_DIVISION: string = 'IMPORT1C_DIVISION';
  INI_IMPORT1C_EMPLOYEE: string = 'IMPORT1C_EMPLOYEE';

type
  TImport1C = class
  private
    fEmployeeFilename: string;
    fDivisionFilename: string;
    procedure GetFileNames;
  public
    property EmployeeFilename: string read fEmployeeFilename;
    property DivisionFilename: string read fDivisionFilename;

    function ItIsAllReady: boolean;
  end;

  TDivisionImport1C = class
  private
    fid: string;
    fpid: string;
    fname: string;
  public
    property id: string read fid;
    property pid: string read fpid;
    property name: string read fname;
    constructor Create(id, pid, name: string);
  end;

  TEmployeeImport1C = class
  private
    fid: string;
    flastname: string;
    ffirstname: string;
    fmiddlename: string;
    fdivison_id: string;
    fposition_name: string;
    fcode: string;
    fgender: boolean;
    fbirtdate: TDate;
    fstatus: string;
  public

  end;

  TImport1CInfo = record
    employee_filename: string;
    employee_file: TStringList;
    employee_date: string;
    employee_header: TStringList;

    division: string;
    division_date: string;
    division_header: TStringList;

    procedure Update;
  end;

function GetFileName(filename, path: string): string;

function Import1C_GetIniFile: TIniFile;
function GetHeaderFile(filename: TStringList): TStringList;
function GetHashDivision: TDictionary<string, TDivisionImport1C>;
function GetHashMapFromINI(section: string): TDictionary<string, string>;

implementation

uses db_datamodule;

var
  conf: TGlobalConfig;
  Import1CInfo: TImport1CInfo;

function GetFile(filename: string): TStringList;
var
  f: TStringList;
begin
  f := TStringList.Create;
  try
    f.LoadFromFile(filename);
  except

  end;
  result := f;
end;

function GetLastFile(path, pattern: string): string;
var
  SDA: TStringDynArray;
  name: string;
  lastdate, current: integer;
begin
  result := '';
  try
    SDA := TDirectory.GetFiles(path, pattern);
    lastdate := 0;
    for name in SDA do
    begin
      current := FileAge(name);
      if current > lastdate then
      begin
        result := name;
        lastdate := current;
      end;
    end;
  except
    on E: Exception do
      MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
end;

function GetFileName(filename, path: string): string;
begin
  result := '';
  if FileExists(filename) then
    result := filename
  else
  begin
    result := GetLastFile(path, filename);
  end;
end;

function GetHeaderFile(filename: TStringList): TStringList;
var
  f: TStringList;
begin
  f := TStringList.Create;
  filename.Delimiter := ';';
  if filename.Count <> 0 then
    f.DelimitedText := filename[0];
  result := f;
end;

function Import1C_GetIniFile: TIniFile;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + INI_IMPORT1C);
  result := ini;
end;

function GetHashMapFromINI(section: string): TDictionary<string, string>;
var
  map: TDictionary<string, string>;
  f: TStringList;
  ini: TIniFile;
  s: string;
begin
  map := TDictionary<string, string>.Create;
  f := TStringList.Create;
  ini := Import1C_GetIniFile;
  ini.ReadSection(section, f);
  for s in f do
    map.Add(s, ini.ReadString(section, s, ''));
  f.Free;
  ini.Free;
  result := map;
  map.Values
end;

function GetHashDivision: TDictionary<string, TDivisionImport1C>;
var
  map: TDictionary<string, TDivisionImport1C>;
begin
  map := TDictionary<string, TDivisionImport1C>.Create;

  result := map;
end;

{ TDivisionImport1C }

constructor TDivisionImport1C.Create(id, pid, name: string);
begin
  fid := id;
  fpid := pid;
  fname := name;
end;

{ TImport1CInfo }

procedure TImport1CInfo.Update;
var
  conf: TGlobalConfig;
begin
  conf := DBDataModule.LoadConfig;

  employee_filename := GetFileName(conf.Import1CFileEmployee,
    conf.Import1CDirectory);
  employee_file := GetFile(employee_filename);
  employee_header := GetHeaderFile(employee_file);
  division := GetFileName(conf.Import1CFileDivision, conf.Import1CDirectory);
  if employee_filename <> '' then
    employee_date := Formatdatetime('dd.mm.yyyy',
      FileDateToDateTime(FileAge(employee_filename)))
  else
    employee_date := '';
  if division <> '' then
    division_date := Formatdatetime('dd.mm.yyyy',
      FileDateToDateTime(FileAge(division)))
  else
    division_date := '';
end;

{ TImport1C }

procedure TImport1C.GetFileNames;
begin
  // fEmployeeFilename := ;
end;

function TImport1C.ItIsAllReady: boolean;
begin
  result := false;
end;

end.
