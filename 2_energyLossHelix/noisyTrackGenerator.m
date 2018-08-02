%Make Noise From DATA
%This program will add a random noise for Helix track

parameter = load('./data/helixParameter.csv');

num_Track = rows(parameter);
lvl=2;
tune=0.1;

for j=1:num_Track
  filename=sprintf('./data/%d_Track.csv',j);
  data = load(filename);
  lvl=2;
  mMse(j,1) = j;
  for level=2:2:10;
    for jj=1:rows(data)
      nX(jj) = data(jj,1)+tune*level*randn;
      nY(jj) = data(jj,2)+tune*level*randn;
      nZ(jj) = data(jj,3)+tune*level*randn;
      noisyData = [nX' nY' nZ'];
      filenameN=sprintf('./data/%d_Track_noiseLevel_%d.csv',j,level);
      csvwrite(filenameN, noisyData);
      
      %MSE calculator
      mseQ(jj) = (((data(jj,1)-nX(jj))^2)+((data(jj,2)-nY(jj))^2)+((data(jj,3)-nZ(jj))^2))/3;
    endfor
    mMse(j,lvl) = mean(mseQ);
    lvl++;
  endfor
endfor

filenameM=sprintf('./data/meanMSE_Value.csv');
csvwrite(filenameM, mMse);