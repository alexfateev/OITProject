unit form_Import1C_MatchingFileds;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ValEdit,
  Vcl.ExtCtrls, INIFiles, RzLabel;

type
  TfmImport1CMatchingFileds = class(TForm)
    Panel1: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    GridPanel1: TGridPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    vlDivision: TValueListEditor;
    RzLabel1: TRzLabel;
    vlEmployee: TValueListEditor;
    RzLabel2: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure vlDivisionGetPickList(Sender: TObject; const KeyName: string;
      Values: TStrings);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vlEmployeeGetPickList(Sender: TObject; const KeyName: string;
      Values: TStrings);
  private
    { Private declarations }
    INI: TIniFile;
    procedure Save;
  public
    { Public declarations }
  end;

var
  fmImport1CMatchingFileds: TfmImport1CMatchingFileds;

implementation

{$R *.dfm}

uses Import1c;

procedure TfmImport1CMatchingFileds.btnSaveClick(Sender: TObject);
begin
  Save;
  ModalResult := mrOk;
end;

procedure TfmImport1CMatchingFileds.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmImport1CMatchingFileds.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  INI.Free;
end;

procedure TfmImport1CMatchingFileds.FormCreate(Sender: TObject);
begin
  try
    INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + INI_IMPORT1C);
    vlDivision.InsertRow('id', INI.ReadString(INI_IMPORT1C_DIVISION, 'id',
      ''), true);
    vlDivision.InsertRow('pid', INI.ReadString(INI_IMPORT1C_DIVISION, 'pid',
      ''), true);
    vlDivision.InsertRow('name', INI.ReadString(INI_IMPORT1C_DIVISION, 'name',
      ''), true);

    vlEmployee.InsertRow('id', INI.ReadString(INI_IMPORT1C_EMPLOYEE, 'id',
      ''), true);
    vlEmployee.InsertRow('lastname', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'lastname', ''), true);
    vlEmployee.InsertRow('firstname', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'firstname', ''), true);
    vlEmployee.InsertRow('middlename', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'middlename', ''), true);
    vlEmployee.InsertRow('position_name', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'position_name', ''), true);
    vlEmployee.InsertRow('division_id', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'division_id', ''), true);
    vlEmployee.InsertRow('gender', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'gender', ''), true);
    vlEmployee.InsertRow('date_of_birth', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'date_of_birth', ''), true);
    vlEmployee.InsertRow('status', INI.ReadString(INI_IMPORT1C_EMPLOYEE,
      'status', ''), true);
  except
    on E: Exception do
      MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfmImport1CMatchingFileds.Save;
var
  i: integer;
begin
  try
    INI.EraseSection(INI_IMPORT1C_DIVISION);
    for i := 1 to vlDivision.RowCount - 1 do
      INI.WriteString(INI_IMPORT1C_DIVISION, vlDivision.Cells[0, i],
        vlDivision.Cells[1, i]);
    INI.EraseSection(INI_IMPORT1C_EMPLOYEE);
    for i := 1 to vlEmployee.RowCount - 1 do
      INI.WriteString(INI_IMPORT1C_EMPLOYEE, vlEmployee.Cells[0, i],
        vlEmployee.Cells[1, i]);
  except
    on E: Exception do
      MessageDlg(E.ClassName + ':' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfmImport1CMatchingFileds.vlDivisionGetPickList(Sender: TObject;
  const KeyName: string; Values: TStrings);
var
  f: TStringList;
  s: string;
begin
  // f := TStringList.Create;
  // GetHeaderDivision(f);
  // for s in f do
  // Values.Add(s);
  // f.Free;
end;

procedure TfmImport1CMatchingFileds.vlEmployeeGetPickList(Sender: TObject;
  const KeyName: string; Values: TStrings);
var
  f: TStringList;
  s: string;
begin
  // f := TStringList.Create;
  // GetHeaderEmployee(f);
  // for s in f do
  // Values.Add(s);
  // f.Free;
end;

end.
