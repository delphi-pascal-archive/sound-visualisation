unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Bass, StdCtrls, ComCtrls, ExtCtrls, Menus, XPMan;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    XPManifest1: TXPManifest;
    ListBox1: TListBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const TIME_MORPHING=100;
  Type TFFTData  = array [0..1024] of Single;
  Type TWaveData = array [ 0..2048] of DWORD;
 type

  BRGB = record
    B:byte;
    G:byte;
    R:byte;
  end;
  TRgb=array[0..1000] of BRGB;
  PRGB=array[0..1000] of ^TRgb;
var
  Form1: TForm1;
  stream: Hstream;
  buffBit,buffBit2:TBitMap;
  ArrBit,ArrBit2:PRGB;

  FFTFata : TFFTData;
WaveData:TWaveData;
   cons:single;
 //------------------------------------------------------------------------------

implementation

{$R *.dfm}
  uses Shape;

 //------------------------------------------------------------------------------
 procedure BitMapToPointer(var PointerBitMap:PRgb; Bitmap:TBitMAp);
var i:integer;
H:integer;
begin
 h:=bitmap.height-1 ;
 for i:=0 to h do
    PointerBitMap[i]:=Bitmap.ScanLine[i];
end;
 //------------------------------------------------------------------------------
procedure TForm1.FormDestroy(Sender: TObject);
begin
bass_free();
end;
 //------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
 buffBit:=tbitmap.Create;
 buffBit.Width:=502;
 buffBit.Height:=502;
 buffBit.PixelFormat:=pf24bit;
   buffBit.Canvas.Pen.Width:=2;

 bitmaptopointer(ArrBit,buffBit);
  buffBit2:=tbitmap.Create;
 buffBit2.Width:=502;
 buffBit2.Height:=502;
 buffBit2.PixelFormat:=pf24bit;
 bitmaptopointer(ArrBit2,buffBit2);
 buffBit.Canvas.Brush.Color:=0;
 buffBit.Canvas.FillRect(rect(0,0,502,502));
buffBit2.Canvas.Brush.Color:=0;
 buffBit2.Canvas.FillRect(rect(0,0,502,502));
 image1.Canvas.FillRect(RECT(0,0,502,502));
  cons:=0.106;
  listbox1.ItemIndex:=2;
 InitShape;
 if bass_init(-1, 44100,0, handle,nil)=false then showmessage('Ошибка инициализации');
end;
 //------------------------------------------------------------------------------
procedure TForm1.Timer1Timer(Sender: TObject);
 var
i,j:integer;
rr,gg,bb:integer;
kef:integer;
begin
BASS_ChannelGetData(stream,@FFTFata,BASS_DATA_FFT1024);
 case ListBox1.ItemIndex of
 0:drawshape;
 1:drawline;
 2:drawlines;
end;
for i:=1 to 500 do
  for j:=1 to 500 do
  begin
  if ((i>0) or (i<500)) and ((j>0) or (j<500)) then
  begin
    ArrBit[i,j].R:=round(((ArrBit[i-1,j-1].R+ArrBit[i-1,j].R+ArrBit[i-1,j+1].R+ArrBit[i,j-1].R+ArrBit[i,j].R+ArrBit[i,j+1].R+ArrBit[i+1,j-1].R+ArrBit[i+1,j].R+ArrBit[i+1,j+1].R) * cons));
   ArrBit[i,j].g:=round(((ArrBit[i-1,j-1].g+ArrBit[i-1,j].g+ArrBit[i-1,j+1].g+ArrBit[i,j-1].g+ArrBit[i,j].g+ArrBit[i,j+1].g+ArrBit[i+1,j-1].g+ArrBit[i+1,j].g+ArrBit[i+1,j+1].g) * cons));
   ArrBit[i,j].b:=round(((ArrBit[i-1,j-1].b+ArrBit[i-1,j].b+ArrBit[i-1,j+1].b+ArrBit[i,j-1].b+ArrBit[i,j].b+ArrBit[i,j+1].b+ArrBit[i+1,j-1].b+ArrBit[i+1,j].b+ArrBit[i+1,j+1].b) * cons));
   if ArrBit[i,j].R>2 then  ArrBit[i,j].R:=ArrBit[i,j].R-2 else ArrBit[i,j].R:=0;
   if ArrBit[i,j].g>2 then  ArrBit[i,j].g:=ArrBit[i,j].g-2 else ArrBit[i,j].g:=0;
   if ArrBit[i,j].b>2 then  ArrBit[i,j].b:=ArrBit[i,j].b-2 else ArrBit[i,j].b:=0;

  end;
  end;


 for i:=0 to 501 do
    for j:=0 to 501 do
    begin
      rr:= round((ArrBit[i,j].R  +  ArrBit2[i,j].R)*3);
      gg:= round((ArrBit[i,j].g  +  ArrBit2[i,j].g)*3);
      bb:= round((ArrBit[i,j].b  +  ArrBit2[i,j].b)*3);
      if rr>255 then rr:=255;
      if gg>255 then gg:=255;
      if bb>255 then bb:=255;
      ArrBit2[i,j].R:=rr;
      ArrBit2[i,j].g:=gg;
      ArrBit2[i,j].b:=bb;

  end;
  buffBit.Canvas.Brush.Style:=bsclear;
   buffBit.Canvas.Pen.Color:=0;
 buffBit.Canvas.Rectangle(0,0,500,500);
 image1.Canvas.Draw(0,0,buffBit2);
 for i:=0 to 501 do
    for j:=0 to 501 do
    begin

     ArrBit2[i,j].R:=0;
     ArrBit2[i,j].g:=0;
     ArrBit2[i,j].b:=0;
  end;
end;
 //------------------------------------------------------------------------------
procedure TForm1.N3Click(Sender: TObject);
begin
application.Terminate;
end;
 //------------------------------------------------------------------------------
procedure TForm1.N2Click(Sender: TObject);
begin
 timer1.Enabled:=false;
if opendialog1.Execute=true then
begin
if stream<>0 then
bass_StreamFree(stream);
stream:= bass_streamCreateFile(false, pChar(opendialog1.filename), 0, 0, 0);
bass_channelplay(stream, false);
end;
timer1.Enabled:=true;
end;

end.
