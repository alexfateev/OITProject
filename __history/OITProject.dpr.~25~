program OITProject;

uses
  Vcl.Forms,
  form_main in 'form_main.pas' {fmMain} ,
  db_datamodule in 'db_datamodule.pas' {DBDataModule: TDataModule} ,
  form_connection_edit in 'form_connection_edit.pas' {fmConnectionEdit} ,
  form_settings in 'form_settings.pas' {fmSettings} ,
  Import1c in 'Import1c.pas',
  form_Import1C_MatchingFileds
    in 'form_Import1C_MatchingFileds.pas' {fmImport1CMatchingFileds};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'OIT Project';
  Application.CreateForm(TDBDataModule, DBDataModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;

end.
