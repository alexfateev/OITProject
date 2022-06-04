unit form_handbook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfmHandbook = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    ListView1: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHandbook: TfmHandbook;

implementation

{$R *.dfm}

end.
