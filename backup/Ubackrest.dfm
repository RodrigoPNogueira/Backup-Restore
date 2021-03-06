object Form1: TForm1
  Left = 193
  Top = 120
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Backup/Restore'
  ClientHeight = 536
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rdgBak_Rest: TRadioGroup
    Left = 8
    Top = 8
    Width = 281
    Height = 41
    Caption = ' Backup ou Restore '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Backup'
      'Restore')
    TabOrder = 0
    OnClick = rdgBak_RestClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 55
    Width = 281
    Height = 362
    Caption = ' Backup '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 158
      Height = 13
      Caption = 'Escolha o arquivo a ser gravado:'
    end
    object SpeedButton1: TSpeedButton
      Left = 248
      Top = 31
      Width = 23
      Height = 23
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 8
      Top = 104
      Width = 51
      Height = 13
      Caption = 'Salvar em:'
    end
    object Label4: TLabel
      Left = 8
      Top = 266
      Width = 86
      Height = 16
      Caption = 'Nome do arquivo:'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 8
      Top = 62
      Width = 43
      Height = 13
      Caption = 'Unidade:'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 242
      Height = 21
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 8
      Top = 120
      Width = 263
      Height = 137
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 8
      Top = 282
      Width = 263
      Height = 21
      TabOrder = 2
    end
    object DriveComboBox1: TDriveComboBox
      Left = 8
      Top = 78
      Width = 263
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 3
    end
    object btnGravar: TBitBtn
      Left = 11
      Top = 315
      Width = 127
      Height = 35
      Caption = 'Gravar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 4
      OnClick = btnGravarClick
    end
    object btnFechar1: TBitBtn
      Left = 144
      Top = 315
      Width = 127
      Height = 35
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnFechar1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 295
    Top = 55
    Width = 281
    Height = 362
    Caption = ' Restore '
    TabOrder = 2
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 171
      Height = 13
      Caption = 'Escolha o arquivo a ser restaurado:'
    end
    object SpeedButton2: TSpeedButton
      Left = 248
      Top = 31
      Width = 23
      Height = 23
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object Label7: TLabel
      Left = 8
      Top = 62
      Width = 191
      Height = 13
      Caption = 'Escolha o local e arquivo a ser gravado:'
    end
    object SpeedButton3: TSpeedButton
      Left = 248
      Top = 77
      Width = 23
      Height = 23
      Caption = '...'
      OnClick = SpeedButton3Click
    end
    object Edit2: TEdit
      Left = 8
      Top = 32
      Width = 242
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 8
      Top = 78
      Width = 242
      Height = 21
      TabOrder = 1
    end
    object btnRestaurar: TBitBtn
      Left = 8
      Top = 315
      Width = 127
      Height = 35
      Caption = 'Restaurar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnGravarClick
    end
    object btnFechar2: TBitBtn
      Left = 144
      Top = 315
      Width = 127
      Height = 35
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnFechar1Click
    end
  end
  object Memo1: TMemo
    Left = 16
    Top = 455
    Width = 281
    Height = 145
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 303
    Top = 488
    Width = 273
    Height = 30
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 4
  end
  object IBBackupService1: TIBBackupService
    TraceFlags = []
    ServerType = 'IBServer'
    BlockingFactor = 0
    Options = []
    PreAllocate = 0
    Left = 376
  end
  object OpenDialog2: TOpenDialog
    Left = 512
    Top = 4
  end
  object IBRestoreService1: TIBRestoreService
    TraceFlags = []
    ServerType = 'IBServer'
    PageBuffers = 0
    PreAllocate = 0
    ReadOnly = False
    RestoreType = rtDatabase
    Left = 328
  end
  object FDFBNBackup1: TFDFBNBackup
    DriverLink = FDPhysFBDriverLink1
    OnProgress = FDFBNBackup1Progress
    Left = 304
    Top = 416
  end
  object FDFBNRestore1: TFDFBNRestore
    DriverLink = FDPhysFBDriverLink1
    Left = 392
    Top = 424
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'E:\PROJETOS\backup\fbclient.dll'
    Left = 480
    Top = 424
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 576
    Top = 432
  end
  object FDConnection1: TFDConnection
    Left = 359
    Top = 255
  end
end
