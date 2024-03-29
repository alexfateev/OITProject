unit Import1c;

interface

uses
  IOUtils, System.Types, Vcl.Dialogs, System.Classes,
  System.Generics.Collections, INIFiles, Vcl.Forms, db_datamodule, service;

const
  INI_IMPORT1C: string = 'import1c.ini';
  INI_IMPORT1C_DIVISION: string = 'IMPORT1C_DIVISION';
  INI_IMPORT1C_EMPLOYEE: string = 'IMPORT1C_EMPLOYEE';

type
  TImport1C = class
  private
    fconfig: TGlobalConfig;
    fEmployeeFilename: string;
    fEmployeeFile: TStringList;
    fEmployeeHead: TStringList;
    fEmployeeFileDate: TDateTime;
    fDivisionFilename: string;
    fDivisionFile: TStringList;
    fDivisionHead: TStringList;
    fDivisionFileDate: TDateTime;
    fDetail: string;
    function GetFileName(filename: string; path: string = ''): string;
    function GetLastFile(path, pattern: string): string;
    function LoadFile(filename: string): TStringList;
    function GetHeaderFromFile(f: TStringList): TStringList;
    function GetFileAge(filename: string): TDateTime;
  public
    property EmployeeFilename: string read fEmployeeFilename;
    property DivisionFilename: string read fDivisionFilename;

    procedure Prepare;
    function IsAllReady: boolean;
    procedure Details;
    constructor Create; overload;
    destructor Destroy; overload;
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

implementation

uses
  System.SysUtils;

{ TDivisionImport1C }

constructor TDivisionImport1C.Create(id, pid, name: string);
begin
  fid := id;
  fpid := pid;
  fname := name;
end;

{ TImport1C }

constructor TImport1C.Create;
begin
  inherited Create;
  Prepare;
end;

destructor TImport1C.Destroy;
begin
  fEmployeeFile.Free;
  fEmployeeHead.Free;
  inherited;
end;

procedure TImport1C.Details;
begin
  if fDetail <> '' then
    MessageDlg(fDetail,mtError,[mbOK],0);
end;

function TImport1C.GetFileAge(filename: string): TDateTime;
begin
  try
    result := Tfile.GetCreationTime(filename);
  except
    on E: Exception do
      begin
        fDetail := fDetail + '�� ������� �������� ���� �������� �����:'+E.Message+#13#10;
        result := 0
      end;
  end;
end;

function TImport1C.GetFileName(filename: string; path: string): string;
begin
  if FileExists(filename) then
    result := filename
  else
    result := GetLastFile(path, filename);
end;

function TImport1C.GetHeaderFromFile(f: TStringList): TStringList;
var
  r: TStringList;
begin
  r := TStringList.Create;
  try
    r.Delimiter := StrToChar(fconfig.Import1CDelimiter);
    if f.Count <> 0 then
      r.DelimitedText := f[0];
  except
    on E:Exception do
      fDetail := fDetail + '�� ������� ��������� ��������� �����: '+e.Message+#13#10;
  end;
  result := r;
end;

function TImport1C.GetLastFile(path, pattern: string): string;
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
      fDetail := fDetail + '�� ������� ����� ����: '+e.Message+#13#10;
    // MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
  if Result = '' then
    fDetail := fDetail + '�� ������� ����� ����.'+#13#10;
end;

function TImport1C.IsAllReady: boolean;
var
  value: boolean;
  text: string;
begin
  text := '';
  value := false;
  if fEmployeeFilename.IsEmpty then
    text := text + '���� ����������� �� ������.'+#13#10;
  if fEmployeeFile = nil then
    text := text + '���� ����';

  result := value;
end;

function TImport1C.LoadFile(filename: string): TStringList;
var
  f: TStringList;
begin
  f := TStringList.Create;
  try
    f.LoadFromFile(filename);
  except
    on E: Exception do
      fDetail := fDetail + '�� ������� ���������� ����: '+E.Message+#13#10;
    // MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
  result := f;
end;

procedure TImport1C.Prepare;
begin
  fconfig := GlobalConfigLoad;
  fDetail := '';

  fEmployeeFilename := GetFileName(fconfig.Import1CFileEmployee,
    fconfig.Import1CDirectory);
  fEmployeeFile := LoadFile(fEmployeeFilename);
  fEmployeeHead := GetHeaderFromFile(fEmployeeFile);
  fEmployeeFileDate := GetFileAge(fEmployeeFilename);

  fDivisionFilename := GetFileName(fconfig.Import1CFileDivision,
    fconfig.Import1CDirectory);
  fDivisionFile := LoadFile(fDivisionFilename);
  fDivisionHead := GetHeaderFromFile(fDivisionFile);
  fDivisionFileDate := GetFileAge(fDivisionFilename);
end;

end.
