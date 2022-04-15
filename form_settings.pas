unit form_settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzTabs, Vcl.StdCtrls, Vcl.ExtCtrls,
  db_datamodule, FileCtrl, service, Import1c, PConst;

type
  TfmSettings = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    GroupBox1: TGroupBox;
    edImport1CDirectory: TEdit;
    Label1: TLabel;
    btnOpenImport1CDirectory: TButton;
    edImport1CFileDivision: TEdit;
    Label2: TLabel;
    Button2: TButton;
    edImport1CFileEmployee: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    cbImport1CCheckOnStart: TCheckBox;
    Panel1: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    btnImport1CMatchingFields: TButton;
    OpenDialog: TOpenDialog;
    btnOk: TButton;
    btnImport1CInfo: TButton;
    edImport1cDelimiter: TEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LoadParam;
    procedure btnSaveClick(Sender: TObject);
    procedure SaveParam;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOpenImport1CDirectoryClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnImport1CMatchingFieldsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnImport1CInfoClick(Sender: TObject);
  private
    { Private declarations }
    conf: TGlobalConfig;
  public
    { Public declarations }
  end;

var
  fmSettings: TfmSettings;

implementation

{$R *.dfm}

uses form_Import1C_MatchingFileds, form_main;

procedure TfmSettings.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmSettings.btnOpenImport1CDirectoryClick(Sender: TObject);
var
  s: string;
begin
  if SelectDirectory('����� �����', '', s, [sdShowEdit, sdShowShares, sdNewUI])
  then
    edImport1CDirectory.Text := s;
end;

procedure TfmSettings.btnSaveClick(Sender: TObject);
begin
  SaveParam;
end;

procedure TfmSettings.btnImport1CInfoClick(Sender: TObject);
var
  Import1c: TImport1C;
begin
  Import1c := TImport1C.Create;
  Import1c.ShowInfo;
  Import1c.Details;
  Import1c.Free;

end;

procedure TfmSettings.btnImport1CMatchingFieldsClick(Sender: TObject);
var
  form: TfmImport1CMatchingFileds;
begin
  form := TfmImport1CMatchingFileds.Create(fmMain);
  form.ShowModal;
  form.Free;
end;

procedure TfmSettings.Button2Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    edImport1CFileDivision.Text := OpenDialog.FileName;
end;

procedure TfmSettings.Button3Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    edImport1CFileEmployee.Text := OpenDialog.FileName;
end;

procedure TfmSettings.btnOkClick(Sender: TObject);
begin
  SaveParam;
  ModalResult := mrOk;
end;

procedure TfmSettings.FormCreate(Sender: TObject);
begin
  Caption := CAPTION_SETTINGSFORM;
  LoadParam;
end;

procedure TfmSettings.LoadParam;
begin
  conf := GlobalConfigLoad;
  edImport1CDirectory.Text := conf.Import1CDirectory;
  edImport1CFileDivision.Text := conf.Import1CFileDivision;
  edImport1CFileEmployee.Text := conf.Import1CFileEmployee;
  cbImport1CCheckOnStart.Checked := conf.Import1CCheckNewFileOnStart;
  edImport1cDelimiter.Text := conf.Import1CDelimiter;
end;

procedure TfmSettings.SaveParam;
begin
  conf.Import1CDirectory := Trim(edImport1CDirectory.Text);
  conf.Import1CFileDivision := Trim(edImport1CFileDivision.Text);
  conf.Import1CFileEmployee := Trim(edImport1CFileEmployee.Text);
  conf.Import1CCheckNewFileOnStart := cbImport1CCheckOnStart.Checked;
  conf.Import1CDelimiter := edImport1cDelimiter.Text;
  GlobalConfigSave(conf);
end;

end.
