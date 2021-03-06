unit Ubackrest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons, ExtCtrls, IBServices, FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.ADSWrapper, FireDAC.Stan.Async,
  FireDAC.Phys.ADS, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBWrapper,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.UI.Intf,
  Vcl.ComCtrls, FireDAC.Comp.UI, Vcl.Mask, JvExMask, JvToolEdit,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Pool,
  Data.DB, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    rdgBak_Rest: TRadioGroup;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DirectoryListBox1: TDirectoryListBox;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Label4: TLabel;
    DriveComboBox1: TDriveComboBox;
    Label5: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    IBBackupService1: TIBBackupService;
    OpenDialog2: TOpenDialog;
    Label7: TLabel;
    Edit4: TEdit;
    SpeedButton3: TSpeedButton;
    IBRestoreService1: TIBRestoreService;
    btnGravar: TBitBtn;
    btnRestaurar: TBitBtn;
    FDFBNBackup1: TFDFBNBackup;
    FDFBNRestore1: TFDFBNRestore;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ProgressBar1: TProgressBar;
    btnFechar1: TBitBtn;
    btnFechar2: TBitBtn;
    FDConnection1: TFDConnection;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rdgBak_RestClick(Sender: TObject);
    procedure btnFechar1Click(Sender: TObject);
    procedure FDFBNBackup1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute then
     edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.FDFBNBackup1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
Memo1.Lines.Add(AMessage);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName);
      edit3.Text :='backup'+formatdatetime('ddmmyy', date)+'.bak';
end;

procedure TForm1.btnFechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
   if(edit1.Text = '') then
   begin
       Application.MessageBox('Aten??o, arquivo para efetuar backup n?o informado','Aten??o.:',MB_APPLMODAL + MB_OK + MB_ICONWARNING);
       Exit;
   end;
   if (edit3.Text = '') then
   begin
       Application.MessageBox('Aten??o, nome do arquivo n?o foi informado','Aten??o.:',MB_APPLMODAL + MB_OK + MB_ICONWARNING);
       Exit;
   end;

   try
     Screen.Cursor := crHourGlass;
     with FDFBNBackup1 do
     begin
        DriverLink := FDPhysFBDriverLink1;
        UserName   := 'sysdba';
        Password   := 'masterkey';
        Host       := 'localhost';
        Protocol   := ipLocal;
        Database   := edit1.Text;
        BackupFile := DirectoryListBox1.Directory+'\'+edit3.Text;
        Level      := 0; // full backup
        Backup;

//         while not eof do
//            Memo1.Lines.Add(GetNextLine);
      end;
    finally
         showMessage('backup efetuado com sucesso');
         Screen.Cursor := crDefault;
    end;
    Application.ProcessMessages;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog2.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog2.Execute then
     edit2.Text := OpenDialog2.FileName;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  OpenDialog2.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog2.Execute then
     edit4.Text := OpenDialog2.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   if edit2.Text = '' then
   begin
       Application.MessageBox('Aten??o, arquivo a ser restaurado n?o informado','Aten??o.:',MB_APPLMODAL + MB_OK + MB_ICONWARNING);
       Exit;
   end;
   if edit4.Text = '' then
   begin
       Application.MessageBox('Aten??o, local n?o foi informado','Aten??o.:',MB_APPLMODAL + MB_OK + MB_ICONWARNING);
       Exit;
   end;

   try
        Screen.Cursor := crHourGlass;
        if Application.MessageBox('Tem certeza?','Confirmar', mb_applmodal+mb_iconquestion+mb_yesno) = mryes then
        begin
          with IBRestoreService1 do
          begin
             ServerName := 'Local Server';
             LoginPrompt := false;
             Params.Add('user_name=SYSDBA');
             Params.add('password=masterkey');
           Active := true;
           Verbose := true;
           DatabaseName.add(edit4.Text);
           BackupFile.Add(edit2.Text);
           Options := [];
           PageSize := 2048;
           ServiceStart;
           while not eof do
              Memo1.Lines.Add(GetNextLine);
          end;
        end;

   finally
        Screen.Cursor := crDefault;
   end;
   Application.ProcessMessages;
end;

procedure TForm1.rdgBak_RestClick(Sender: TObject);
begin
    case rdgBak_Rest.ItemIndex of
       0:
         begin
              GroupBox1.Visible := true;
              GroupBox2.Visible := false;
         end;
       1:
         begin
              GroupBox1.Visible := false;
              GroupBox2.Visible := true;
         end;
    end;
end;

end.
