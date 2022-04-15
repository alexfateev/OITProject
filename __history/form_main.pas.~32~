unit form_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Menus,
  RzStatus;

type
  TfmMain = class(TForm)
    RzStatusBar1: TRzStatusBar;
    ActionList1: TActionList;
    ImageList16: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    acShowConnectionEdit: TAction;
    N3: TMenuItem;
    acExit: TAction;
    N4: TMenuItem;
    stConnect: TRzGlyphStatus;
    acSettingsShow: TAction;
    N5: TMenuItem;
    procedure acShowConnectionEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure UpdateConnectionStatus;
    procedure acSettingsShowExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses db_datamodule, form_connection_edit, form_settings;

procedure TfmMain.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.acSettingsShowExecute(Sender: TObject);
var
  form: TfmSettings;
begin
  form := TfmSettings.Create(fmMain);
  form.ShowModal;
  form.Free;
end;

procedure TfmMain.acShowConnectionEditExecute(Sender: TObject);
var
  form: TfmConnectionEdit;
begin
  form := TfmConnectionEdit.Create(fmMain);
  form.ShowModal;
  form.Free;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Caption := CAPTION_MAINFORM;
  UpdateConnectionStatus;

end;

procedure TfmMain.UpdateConnectionStatus;
begin
  stConnect.Enabled := DBDataModule.DBConnection.Connected;
  with DBDataModule.DBConnection do
  begin
    if stConnect.Enabled then
      stConnect.Hint := 'Соединение установлено: ' + Server + ':' +
        Port.ToString + '/' + Database
    else
      stConnect.Hint := 'Соединение не установлено.';
  end;
end;

end.
