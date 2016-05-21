% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;


X = load('data/faces.txt'); % load face dataset
n = size(X, 1); % number of faces
mean_e = mean(X, 1); % mean over examples
Xo = X - repmat(mean_e, [n,1]); % subtract mean 

[U_d_3,S_d_3,V_d_3] = svds(Xo,3);
W=U_d_3*S_d_3;

idx = randperm(size(Xo, 1)); % randomize indexes
idx = idx(1:20); % take the first 20
figure; hold on; axis ij; colormap(gray);
range = max(W(idx,1:2)) - min(W(idx,1:2)); % find range of coordinates to be plotted
scale = [200 200]./range; % want 24x24 to be visible but not large on new scale
for i=idx, imagesc(W(i,1)*scale(1),W(i,2)*scale(2),reshape(X(i,:),24,24)); end;