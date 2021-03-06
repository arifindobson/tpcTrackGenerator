%Particle Multiplicity Generator
%Generate particle multiplicity from the Particle data
%input param chrgMult, p1,p2,a1,a2

clear all
close all

chrgMult  = 20; %The number of charged particles 
p1        = 30; %minimum momentum
p2        = 80; %maximum momentum
a1        = 30; %minimum angle
a2        = 80; %maximum angle
eL1       = 0;  %energyLoss minimum
eL2       = 0.9;%energyLoss maximum
d1        = 0;  %deviation minimum centimeter
d2        = 15;  %deviation maximum centimeter

tpcX    = 200; %centimeter
tpcY    = 200; %centimeter
driftT  = 20;  %micro-seconds

[id,mass,name] = textread('particleData.csv','%d,%f,%s'); %Load the Particle Data (pD)

momentum  = linspace(p1,p2,chrgMult);
incAngle  = linspace(a1,a2,chrgMult);
energyLoss= linspace(eL1,eL2,chrgMult);
trackDev  = linspace(d1,d2,chrgMult);

for i = 1:chrgMult
  m   = mass'(randi(size(mass',2),1)); %pick mass randomly from pD
  pt  = momentum(randi(size(momentum,2),1));
  iA  = incAngle(randi(size(incAngle,2),1));
  eL  = energyLoss(randi(size(energyLoss,2),1));
  dev = trackDev(randi(size(trackDev,2),1));
  x0=tpcX*randn*0.4;
  y0=tpcY*randn*0.4;
  z0=0;
  param(i,:)=[i x0 y0 z0 m pt iA eL dev];
endfor

filenameP=sprintf('./data/helixParameter.csv');
csvwrite(filenameP,param);

%Generate The .csv Data
for j=1:rows(param)
    x=param(j,2);
    y=param(j,3);
    z=param(j,4);
    m=param(j,5);
    p=param(j,6);
    pan=param(j,7);
    eLs=param(j,8);
    deV=param(j,9);
    filename=sprintf('./data/%d_Track.csv',j);
    generateHelixTrackCSV(x,y,z,p,pan,eLs,deV,driftT,filename)
endfor

  