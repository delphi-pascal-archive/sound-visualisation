unit Shape;

interface

 uses windows,Graphics,classes,Unit1;
 type
Txyz=record
 x,y,z:double;
end;
 TShape=array[0..700] of Txyz;
  var
  Shapes:array[0..10] of TShape;
  morf,morf1,morf2:Tshape;
  k,dl,sm:integer;
  l,l2,dl2,dl3:double;
  Shaper:TShape;
  tt,t2,t1,tm,fsm,m:integer;
  fl:boolean;
  cosx,siny,cosx1,siny1:double;
  max,rr:integer;
  par1,par2:integer;
  procedure DrawShape;
  procedure InitShape;
  procedure DrawLine;
  procedure DrawLines;
implementation
Procedure Point3d(Width2,Height2:integer;Canvas:TCanvas;x,y,z:double;r:integer;Color:longint);
var
x2d,y2d:integer;
begin
if 400+z<>0 then
begin
Canvas.Brush.Color:=Color;
X2D:=round(0.5+(Width2+400*(x) /(400+z)));
Y2D:=round(0.5+(Height2-400*(y) /(400+z)));
Canvas.FillRect(rect(x2d,y2d,x2d+r,y2d+r));
end;
end;
//---------------------------------------------------------------------------------
procedure InitShape;
var i,j,ii,ll:integer;
begin
randomize;
  dl:=-100000;
 l:=1/dl;
  dl2:=-5500;
 l2:=1/dl2;
 dl3:=-1/TIME_MORPHING;
  for j:=0 to  30 do
 for i:=0 to 15 do
    begin
      Shapes[0,k].X:=1500*sin(pi*2*i/30)*cos(pi*2*j/30);
      Shapes[0,k].Y:=1500*cos(pi*2*i/30);
      Shapes[0,k].Z:=1500*sin(pi*2*i/30)*sin(pi*2*j/30);
       k:=k+1;
      end;
  k:=0;
 for j:=0 to  33 do
 for i:=0 to 15 do
    begin
            Shapes[1,k].X:=(1300+650*sin(pi*2*i/15))*cos(pi*2*j/33);
            Shapes[1,k].Y:=650*cos(pi*2*i/15);
            Shapes[1,k].Z:=(1300+650*sin(pi*2*i/15))*sin(pi*2*j/33);
             k:=k+1;
            end;

   k:=0;
 for j:=0 to  49 do
 for i:=0 to 10 do
    begin
            Shapes[2,k].X:=(700+330*sin(pi*2*i/10))*cos(pi*2*j/20);
            Shapes[2,k].Y:=330*cos(pi*2*i/10)+(24.5-j)*60;
            Shapes[2,k].Z:=(700+330*sin(pi*2*i/10))*sin(pi*2*j/20);
             k:=k+1;
            end;

             k:=0;
for j:=0 to  30 do
 for i:=0 to 15 do
    begin

            Shapes[3,k].X:=-(1500)+random(3000);
            Shapes[3,k].Y:=-(1500)+random(3000);
            Shapes[3,k].Z:=-(1500)+random(3000);
             k:=k+1;
            end;
       k:=0;
 for j:=1 to  15 do
 for i:=1 to 15 do
    begin
            
            Shapes[4,k].X:=(7.5-i)*200;
            Shapes[4,k].Y:=600*cos(sqrt((7.5-i)*(7.5-i)+(7.5-j)*(7.5-j))/2);
            Shapes[4,k].Z:=(7.5-j)*200;
            k:=k+1;
            end;
  for j:=0 to  24 do
 for i:=0 to 12 do
 
    begin

            Shapes[4,k].X:=550*sin(pi*2*i/24)*cos(pi*2*j/24);
            Shapes[4,k].Y:=550*cos(pi*2*i/24)-600;
            Shapes[4,k].Z:=550*sin(pi*2*i/24)*sin(pi*2*j/24);
             k:=k+1;
            end;

                 k:=0;
 for j:=0 to  30 do
 for i:=0 to 15 do
    begin
            Shapes[5,k].X:=(7-i)*200;
            Shapes[5,k].Y:=1000*cos(pi*2*j/30);
            Shapes[5,k].Z:=1000*sin(pi*2*j/30);
             k:=k+1;
            end;
            k:=0;
for j:=0 to  20 do
 for i:=0 to 10 do
    begin
            Shapes[6,k].X:=1000*sin(pi*2*i/20)*cos(pi*2*j/20);
            Shapes[6,k].Y:=1000*cos(pi*2*i/20);
            Shapes[6,k].Z:=1000*sin(pi*2*i/20)*sin(pi*2*j/20);
             k:=k+1;
            end;

 
 for i:=0 to 20 do
  for j:=0 to 10  do
    begin
            Shapes[6,k].X:=(1200+j*50)*sin(j*2+pi*2*(i)/20);
            Shapes[6,k].Y:=0;
            Shapes[6,k].Z:=(1200+j*50)*cos(j*2+pi*2*(i)/20);
             k:=k+1;
            end;

      k:=0;
 for i:=0 to 7 do
    for j:=0 to 7 do
        for ii:=0 to 7 do
        begin
        if ((i=0) xor (j=0) xor (ii=0)) xor ((i=7) xor (j=7) xor (ii=7)) then
        begin
            Shapes[7,k].X:=(3.5-ii)*350;
            Shapes[7,k].Y:=(3.5-j)*350;
            Shapes[7,k].Z:=(3.5-i)*350;
         k:=k+1;
        end;
        end;
 for j:=1 to  20 do
 for i:=1 to 10 do
    begin
            Shapes[7,k].X:=600*sin(pi*2*i/20)*cos(pi*2*j/20);
            Shapes[7,k].Y:=600*cos(pi*2*i/20);
            Shapes[7,k].Z:=600*sin(pi*2*i/20)*sin(pi*2*j/20);
             k:=k+1;
            end;
k:=0;
for i:=-10 to 10 do
for j:=-4 to 4 do
begin
            k:=k+1;
            Shapes[8,k].X:=(j*180)*cos(pi*2*i/20);
            Shapes[8,k].Z:=(i*170);
            Shapes[8,k].Y:=(j*180)*sin(pi*2*i/20);
            
end;

 for ll:=-8 to 8 do
for j:=0 to  4 do
 for i:=0 to 2 do
    begin
     k:=k+1;
            Shapes[8,k].X:=(550+130*sin(pi*2*i/4)*cos(pi*2*j/4))*cos(pi*2*ll/15);
            Shapes[8,k].Z:=ll*200+130*sin(pi*2*i/4)*sin(pi*2*j/4);
            Shapes[8,k].Y:=(350+130*cos(pi*2*i/4))*sin(pi*2*ll/15);

             
            end;
 for ll:=-8 to 8 do
for j:=0 to  4 do
 for i:=0 to 2 do
    begin
            k:=k+1;
            Shapes[8,k].X:=(-550+130*sin(pi*2*i/4)*cos(pi*2*j/4))*cos(pi*2*ll/15);
            Shapes[8,k].Z:=ll*200+130*sin(pi*2*i/4)*sin(pi*2*j/4);
            Shapes[8,k].Y:=(-550+130*cos(pi*2*i/4))*sin(pi*2*ll/15);

             
            end;
sm:=random(9);
morf:=Shapes[sm];
morf1:=morf;
morf2:=shapes[sm];
end;
//-------------------------------------------------------------------------------
procedure DrawShape;

label A;
var

i:integer;
l:integer  ;
j:integer;
YVal : Single;

begin

 YVal :=((FFTFata[(0)]+FFTFata[(1)]+FFTFata[(2)]) /3);
  max:=Trunc((YVal*360));
 if max>rr then
 begin
  par1:=-5+random(10);
  par2:=-5+random(10);
  rr:=max;
end;
if rr>=11 then  rr :=rr-11;
  tt:=tt+1;
  t2:=t2+par2;
  t1:=t1+par1;
  randomize;
 tm:=tm+1;
 if tm=300 then
 begin
  tm:=0;
  fl:=true;
  fsm:=sm;
  A:
  sm:=random(9);
  if sm=fsm then goto  A;
  morf1:=morf;
   morf2:=shapes[sm];
end;
 if fl=true then
 begin
  m:=m+1;
  for i:=0 to 700 do
  begin
    morf[i].z:=morf2[i].z+(morf1[i].z-morf2[i].z)*(m-Time_morphing)*dl3;
    morf[i].x:=morf2[i].x+(morf1[i].x-morf2[i].x)*(m-Time_morphing)*dl3;
    morf[i].y:=morf2[i].y+(morf1[i].y-morf2[i].y)*(m-Time_morphing)*dl3;
end;
end;
 if m>=Time_morphing then
 begin
  m:=0;
  fl:=false;
 end;
 cosx:=cos(pi*2*(t1)/360);
 siny:=sin(pi*2*(t1)/360);
 cosx1:=cos(pi*2*(t2)/360);
 siny1:=sin(pi*2*(t2)/360);
 for i:=0 to 700 do
 begin
  shaper[i].x:=morf[i].x*cosx-morf[i].y*siny ;
  shaper[i].y:=(morf[i].x*siny+morf[i].y*cosx)*siny1-morf[i].z*cosx1 ;
  shaper[i].z:=3000+(morf[i].x*siny+morf[i].y*cosx)*cosx1+morf[i].z*siny1  ;
  point3d(250,250,buffBit.canvas,shaper[i].x,shaper[i].y,100+shaper[i].z,4,rgb(100,100,255));
 end;
end;
procedure DrawLine;
var
i:integer;
begin
buffBit.Canvas.Pen.Color:=rgb(100,255,100);

 for i:=1 to 100 do
 begin
      buffBit.Canvas.MoveTo((i)*5,250-round(FFTFata[i]*300));
    buffBit.Canvas.lineTo((i+1)*5,250-round(FFTFata[i+1]*300));

 end;
end;
procedure DrawLines;
var
i:integer;
begin
buffBit.Canvas.Pen.Color:=rgb(255,100,100);

 for i:=1 to 100 do
 begin
      buffBit.Canvas.MoveTo((i)*5,250);
    buffBit.Canvas.lineTo((i)*5,250-round(FFTFata[i]*300));

 end;
end;

end.
