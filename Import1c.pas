unit Import1c;

interface

uses
  db_datamodule, System.Classes;

const
  INI_IMPORT1C: string = 'import1c.ini';
  INI_IMPORT1C_DIVISION: string = 'IMPORT1C_DIVISION';
  INI_IMPORT1C_EMPLOYEE: string = 'IMPORT1C_EMPLOYEE';

type

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
    employee: string;
    employee_date: string;
    division: string;
    division_date: string;
    procedure Update;
  end;

var
  conf: TConfigini;
  Import1CInfo: TImport1CInfo;

function GetDivisionFileName: string;
function GetEmployeeFileName: string;
procedure GetHeaderDivision(var list: TStringList);
procedure GetHeaderEmployee(var list: TStringList);

implementation

uses
  System.SysUtils, IOUtils, System.Types, Vcl.Dialogs;

function GetLastFile(path, filename: string): string;
var
  SDA: TStringDynArray;
  name: string;
  lastdate, current: integer;
begin
  result := '';
  try
    SDA := TDirectory.GetFiles(path, filename);
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

function GetDivisionFileName: string;
begin
  result := '';
  conf := DBDataModule.LoadConfig;
  if FileExists(conf.Import1CFileDivision) then
    result := conf.Import1CFileDivision
  else
  begin
    result := GetLastFile(conf.Import1CDirectory, conf.Import1CFileDivision);
  end;
end;

function GetEmployeeFileName: string;
begin
  result := '';
  conf := DBDataModule.LoadConfig;
  if FileExists(conf.Import1CFileEmployee) then
    result := conf.Import1CFileEmployee
  else
  begin
    result := GetLastFile(conf.Import1CDirectory, conf.Import1CFileEmployee);
  end;

end;

procedure GetHeaderDivision(var list: TStringList);
var
  f: TStringList;
begin
  list.Delimiter := ';';
  f := TStringList.Create;
  try
    f.LoadFromFile(GetDivisionFileName);
    if f.Count <> 0 then
      list.DelimitedText := f[0];
  except
    on E: Exception do
      MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
  f.Free;
end;

procedure GetHeaderEmployee(var list: TStringList);
var
  f: TStringList;
begin
  list.Delimiter := ';';
  f := TStringList.Create;
  try
    f.LoadFromFile(GetEmployeeFileName);
    if f.Count <> 0 then
      list.DelimitedText := f[0];
  except
    on E: Exception do
      MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
  f.Free;
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
begin
  employee := GetEmployeeFileName;
  division := GetDivisionFileName;
  if employee <> '' then
    employee_date := Formatdatetime('dd.mm.yyyy',
      FileDateToDateTime(FileAge(employee)))
  else
    employee_date := '';
  if division <> '' then
    division_date := Formatdatetime('dd.mm.yyyy',
      FileDateToDateTime(FileAge(division)))
  else
    division_date := '';
end;

end.
