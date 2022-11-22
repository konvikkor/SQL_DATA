unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, DBCtrls, ExtCtrls, dbcgrids,
  ComCtrls, XPMan, CheckLst, ToolWin, Clipbrd, dxmdaset, DBAccess, MSAccess,
  SdacVcl, MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DAScript, MSScript, dxDateRanges, dxScrollbarAnnotations;

Const
  Select = 'select %s from %s ';
  SelectW = 'select %s from %s Where %s ';
  Insert = 'insert into %s (%s) Values (%s);';
  Select_Top = 'top 1000';
  TableName = '[%s].[%s]';

type
  TfGACT = class(TForm)
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    GroupBox3: TGroupBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    bRunSQL: TButton;
    Button1: TButton;
    Button3: TButton;
    mSQL: TMemo;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    ComboBox1: TComboBox;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    bSaveToFile: TButton;
    bCreate: TButton;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    Splitter3: TSplitter;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    MSConnection1: TMSConnection;
    MSConnectDialog1: TMSConnectDialog;
    MSQuery1: TMSQuery;
    DataSource1: TDataSource;
    msTables: TMSQuery;
    cxGridTablesDBTableView1: TcxGridDBTableView;
    cxGridTablesLevel1: TcxGridLevel;
    cxGridTables: TcxGrid;
    dsTables: TDataSource;
    msTablesTableName: TWideStringField;
    msTablesRowCounts: TLargeintField;
    msTablesTableSchema: TWideStringField;
    cxGridTablesDBTableView1TableName: TcxGridDBColumn;
    cxGridTablesDBTableView1RowCounts: TcxGridDBColumn;
    cxGridTablesDBTableView1TableSchema: TcxGridDBColumn;
    cxGridFieldsDBTableView1: TcxGridDBTableView;
    cxGridFieldsLevel1: TcxGridLevel;
    cxGridFields: TcxGrid;
    msFields: TMSQuery;
    dsFields: TDataSource;
    msFieldsname: TStringField;
    msFieldstype: TStringField;
    msFieldsLength: TIntegerField;
    msFieldsident: TBooleanField;
    msFieldsnullable: TBooleanField;
    msFieldsrow: TIntegerField;
    msFieldssel: TBooleanField;
    cxGridFieldsDBTableView1name: TcxGridDBColumn;
    cxGridFieldsDBTableView1type: TcxGridDBColumn;
    cxGridFieldsDBTableView1Length: TcxGridDBColumn;
    cxGridFieldsDBTableView1ident: TcxGridDBColumn;
    cxGridFieldsDBTableView1nullable: TcxGridDBColumn;
    cxGridFieldsDBTableView1row: TcxGridDBColumn;
    cxGridFieldsDBTableView1sel: TcxGridDBColumn;
    MSScript1: TMSScript;
    procedure bRunSQLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bSaveToFileClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ADOConnection1AfterConnect(Sender: TObject);
    procedure ADOConnection1AfterDisconnect(Sender: TObject);
    procedure CheckListBox_FieldDblClick(Sender: TObject);
    procedure MSConnection1AfterConnect(Sender: TObject);
    procedure cxGridTablesDBTableView1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bCreateClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetInsertScript(MEM:TStream);
  public
    { Public declarations }
    procedure EnDisBootom(CP: TComponent; b: Boolean = True);
    function BlobToHex(Field: TField): string;
  end;

var
  fGACT: TfGACT;
  Work: Boolean;

implementation

{$R *.dfm}

procedure TfGACT.bRunSQLClick(Sender: TObject);
begin
  MSQuery1.Close;
  MSQuery1.SQL.Clear;
  MSQuery1.SQL := mSQL.Lines;
  // Format(Select,['*',ADOQuery2.FieldValues['name']]));
  MSQuery1.Open;
end;

function TfGACT.BlobToHex(Field: TField): string;
const
  B2HConvert: array[0..15] of Byte = ($30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $41, $42, $43, $44, $45, $46);
var
  I,j,count,BufOffset,TextOffset:Int64;
  Buffer:TArray<Byte>;
  Text:AnsiString;
begin
  Buffer:=Field.AsBytes;
  BufOffset:=0;//High(Buffer);
  SetLength(Text,(HIGH(Buffer)+1)*2);
  TextOffset:=0;//High(Text);
  try
   i:=0; J := 1;
   repeat
     Text[(TextOffset + J * 2)-1] := AnsiChar(B2HConvert[Buffer[BufOffset + I] shr 4]);
     //Text[TextOffset + J * 2 + 1] := AnsiChar(B2HConvert[Buffer[BufOffset + I] and $0F]);
     Text[(TextOffset + J * 2 + 1)-1] := AnsiChar(B2HConvert[Buffer[BufOffset + I] and $0F]);
     Inc(I);Inc(J);
   until (I > High(Buffer)+1)
  finally
    Result:=Text;
    SetLength(Text,0);
  end;
end;

procedure TfGACT.FormCreate(Sender: TObject);
begin
  { ADOConnection1.Close;
    ADOConnection1.ConnectionString:='FILE NAME='+ Application.GetNamePath +'Connect.udl';
    ADOConnection1.Open; }
  MSConnection1.Open;
  MSQuery1.Open;
  // DelThead.FreeOnTerminate:=True;
end;

procedure TfGACT.GetInsertScript(MEM: TStream);
var i, j, gg: Integer;
  list: TArray<String>;
  WriteSQL: Boolean;
  TMPString,HeadString: string;
  TMPHex:TBytes;//PAnsiChar;
  Buffer:TArray<Byte>;
  UTF8:TEncoding;

  function SelectFields: string;
  var i: Integer;
  begin Result := '';
    if High(list) < 0 then exit;
    for i := 0 to High(list) do begin
      if Result.Length > 0 then Result := Result + ',[' + list[i] + ']'
      else Result := Result + '[' + list[i] + ']';
    end;
  end;

begin gg:=0;
  if not Assigned(MEM) then exit;
  if not msFields.Active then exit;
  msFields.First;
  for i := 0 to msFields.RecordCount - 1 do begin
    if msFields.Fields.FieldByName('sel').AsBoolean then begin
      if High(list) < 0 then SetLength(list, 1)
      else SetLength(list, High(list) + 2);
      list[High(list)] := msFields.Fields.FieldByName('name').AsString;
    end;
    msFields.Next;
  end;
  msFields.First;
  if High(list) < 0 then exit;
  if not MSQuery1.Active then exit;
  HeadString := 'insert [' + msTables.FieldByName('TableSchema').AsString + '].['
    + msTables.FieldByName('TableName').AsString + '] (' + SelectFields +
    ') values ' + sLineBreak;
  //Memo1.Lines.Add(TMPString); TMPString
  //MEM.Write(@TMPString[1],ByteLength(TMPString));
  UTF8:=TEncoding.UTF8.Clone;
  Buffer:=UTF8.GetBytes(TMPString);
  MEM.Write(Buffer,High(Buffer)+1);
  (*MEM.Write(Buffer,ByteLength(TMPString));
  FreeAndNil(Buffer);*)
  //SetLength(Buffer,0);
  MSQuery1.First;
  while not MSQuery1.Eof do begin
    if gg <=0 then begin
      TMPString:='(';
      UTF8:=TEncoding.UTF8.Clone;
      Buffer:=UTF8.GetBytes(HeadString);
      MEM.Write(Buffer,High(Buffer)+1);
    end else TMPString := '(';
    Inc(gg);
    for i := 0 to MSQuery1.FieldCount - 1 do begin // dataField
      WriteSQL := False;
      for j := 0 to High(list) do begin // select field
        WriteSQL := MSQuery1.Fields.Fields[i].FieldName = list[j];
        if WriteSQL then Break;
      end;
      if not WriteSQL then begin
        MSQuery1.Next;
        Continue;
      end;
      if TMPString.Length > 1 then TMPString := TMPString + ',';
      if not MSQuery1.Fields.Fields[i].IsNull then begin
        case MSQuery1.Fields.Fields[i].DataType of
          // Строки
          ftString, ftFixedWideChar, ftFixedChar, ftWideString:
            TMPString := TMPString + 'N''' + MSQuery1.Fields.Fields[i]
              .AsString.Replace('''', '''''') + '''';
          // Числа
          ftSmallint, ftInteger, ftWord, ftBytes, ftLargeint, ftLongWord,
            ftShortint, ftByte, ftExtended, ftFloat, ftCurrency, ftSingle:
            TMPString := TMPString + MSQuery1.Fields.Fields[i].AsString;
          // прочие
          ftBoolean: begin
            if MSQuery1.Fields.Fields[i].AsBoolean then TMPString := TMPString + '1'
            else TMPString := TMPString + '0';
          end;
          ftGuid:
            TMPString := TMPString + '''' + MSQuery1.Fields.Fields[i]
              .AsString.Replace('''', '''''') + '''';
          // дата и время
          ftDate, ftTime, ftDateTime, ftTimeStamp:
            TMPString := TMPString + '''' + MSQuery1.Fields.Fields[i]
              .AsString.Replace('''', '''''') + '''';
          // бинарные
          ftVarBytes, ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftTypedBinary,
            ftWideMemo: begin
              //TMPHex:=AllocMem(High(MSQuery1.Fields.Fields[i].AsBytes)*2);
              //BinToHex(buffer,bufOfset,text,textofset,count);
              TMPString := TMPString + '0x' + blobtoHex(MSQuery1.Fields.Fields[i]);//String(TMPHex);
              //FreeMemory(@TMPHex[0]);//,High(MSQuery1.Fields.Fields[i].AsBytes)*2);
              //FreeMem(TMPHex);
              //TMPHex:=nil;
            end;
        else
          raise Exception.Create('Error type Field![' + MSQuery1.Fields.Fields[i].FieldName + ']');
        end;
      end else begin
        TMPString := TMPString + 'NULL';
      end;
    end;
    MSQuery1.Next;
    if not MSQuery1.Eof then begin
      if gg >= 1000 then begin
        TMPString:=TMPString+');'+sLineBreak;
        gg:=0;
      end else TMPString:=TMPString+'),'+sLineBreak;
    end else TMPString:=TMPString+')';
    Buffer:=UTF8.GetBytes(TMPString);
    MEM.WriteData(Buffer,High(Buffer)+1);
    //SetLength(Buffer,0);
    //MEM.WriteData(TMPString.ToCharArray,TMPString.Length);
    //Memo1.Lines.Add(TMPString);
  end;
  FreeAndNil(UTF8);
  //UTF8.FreeEncodings;
end;

procedure TfGACT.MSConnection1AfterConnect(Sender: TObject);
begin
  msTables.Open;
end;

procedure TfGACT.bSaveToFileClick(Sender: TObject);
begin
  SaveDialog1.FileName := 'noname.sql';
  if SaveDialog1.Execute then begin
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
    Memo1.Clear;
  end;
end;

procedure TfGACT.Button2Click(Sender: TObject);
var MEM:TFileStream;
begin
  if not SaveDialog1.Execute then exit;
  if FileExists(SaveDialog1.FileName) then mem:=TFileStream.Create(SaveDialog1.FileName,fmOpenReadWrite)
  else mem:=TFileStream.Create(SaveDialog1.FileName,fmCreate);
  try
   GetInsertScript(MEM);
   MEM.Position:=0;
  finally
   FreeAndNil(MEM);
  end;
end;

procedure TfGACT.Button3Click(Sender: TObject);
var i: Integer;
begin
  if MessageDlg('Do you really want to clear the table?', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
    exit;
  MSQuery1.First;
  for i := 0 to MSQuery1.RecordCount - 1 do begin
    MSQuery1.Delete;
  end;
end;

procedure TfGACT.ADOConnection1AfterConnect(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'DB Connected';
  msTables.Open;
end;

procedure TfGACT.ADOConnection1AfterDisconnect(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'DB DISConnected';
end;

procedure TfGACT.bCreateClick(Sender: TObject);
var MEM:TMemoryStream;
begin
  mem:=TMemoryStream.Create;
  try
   GetInsertScript(MEM);
   MEM.Position:=0;
   Memo1.Lines.LoadFromStream(MEM);
   MEM.Clear;
  finally
   FreeAndNil(MEM);
  end;
end;

procedure TfGACT.EnDisBootom(CP: TComponent; b: Boolean = True);
var i: Integer;
begin
  for i := 0 to CP.ComponentCount - 1 do begin
    if (CP.Components[i] is TButton) then (CP.Components[i] as TButton).Enabled := b;
  end;
end;

procedure TfGACT.CheckListBox_FieldDblClick(Sender: TObject);
var Clipboard: TClipboard;
begin
  Clipboard := TClipboard.Create;
  try
    // Clipboard.SetTextBuf(Pchar('['+CheckListBox_Field.Items.Strings[CheckListBox_Field.ItemIndex]+']'));
  finally
    mSQL.PasteFromClipboard;
    FreeAndNil(Clipboard);
  end;
end;

procedure TfGACT.cxGridTablesDBTableView1DblClick(Sender: TObject);
var
  TTabName: string;
  filter: string;
begin
  TTabName := Format(TableName, [msTablesTableSchema.Value, msTablesTableName.Value]);
  if msTablesRowCounts.Value > 5000 then filter := Select_Top + ' * '
  else filter := ' * ';
  mSQL.Text := Format(Select, [filter, TTabName]);

  msFields.Close;
  MSScript1.Params.AddParameter.Name := 'TableName';
  MSScript1.Params.ParamByName('TableName').Value := msTablesTableName.Value;
  MSScript1.Execute;

  msFields.Params.ParamByName('TableName').Value := msTablesTableName.Value;

  Application.ProcessMessages;
  bRunSQL.Click;
  msFields.Open;
end;

end.
