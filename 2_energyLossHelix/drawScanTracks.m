%Draw Track
filenameP=sprintf('./data/helixParameter.csv');
params = load(filenameP);
pauseTime = 0.5;

for j = 1:20
  filenameKN = sprintf('./data/%d_Track.csv',j);
  trackS = load(filenameKN);
  xC = trackS(:,1);
  yC = trackS(:,2);
  zC = trackS(:,3);
  R  = params(j,5);
  plot3(zC,xC,yC,'.');
  judul = sprintf('Track ID = %d',j);
  title(judul);
  pause (pauseTime);
  clear xC yC zC;
  
  
  for i = 2:2:10
    filenameK = sprintf('./data/%d_Track_noiseLevel_%d.csv',j,i);
    trackSS = load(filenameK);
    xC = trackSS(:,1);
    yC = trackSS(:,2);
    zC= trackSS(:,3);
    plot3(zC,xC,yC,'.');
    judul = sprintf('Track ID= %d; Noise Level= %d',j,i);
    title(judul);
    pause (pauseTime);
    clear xC yC zC;
    
  endfor
endfor

