%Draw Track
filenameP=sprintf('./data/helixParameter.csv');
params = load(filenameP);
pauseTime = 0.5;

j=8; %Track ID
i=10; %Noise Level


  filenameKN = sprintf('./data/%d_Track.csv',j);
  trackS = load(filenameKN);
  xC = trackS(:,1);
  yC = trackS(:,2);
  zC = trackS(:,3);
  R  = params(j,5);
  plot3(zC,xC,yC,'.');
  judul = sprintf('Track ID = %d',j);
  title(judul);
  xlabel('Z Axis');
  ylabel('X Axis');
  zlabel('Y Axis');
  pause;
  clear xC yC zC;

 
    filenameK = sprintf('./data/%d_Track_noiseLevel_%d.csv',j,i);
    trackSS = load(filenameK);
    xC = trackSS(:,1);
    yC = trackSS(:,2);
    zC= trackSS(:,3);
    plot3(zC,xC,yC,'.');
    judul = sprintf('Track ID= %d; Noise Level= %d',j,i);
    title(judul);
      xlabel('Z Axis');
  ylabel('X Axis');
  zlabel('Y Axis');
    clear xC yC zC;
