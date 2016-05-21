% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;


X = load('data/faces.txt'); % load face dataset
n = size(X, 1); % number of faces
mean_d_3 = mean(X, 1); % mean over examples
Xo = X - repmat(mean_d_3, [n,1]); % subtract mean 

[U_d_3,S_d_3,V_d_3] = svds(Xo,3);
W_d_3=U_d_3*S_d_3;

for i=1:3
     alpha = 2*median(abs(W_d_3(:,i)));
     img = reshape((mean_d_3+ alpha*V_d_3(:,i)'),[24 24]);
     figure(i)
     imagesc(img); axis square; colormap gray;
     i=i+1;
end