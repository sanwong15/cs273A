% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;


X = load('data/faces.txt'); % load face dataset
n = size(X, 1); % number of faces
mean_e = mean(X, 1); % mean over examples
Xo = X - repmat(mean_e, [n,1]); % subtract mean 


idx = randperm(size(Xo, 1)); % randomize indexes
idx = idx(1:2);
k = [5, 10, 50];
f = 0;
for i=1:length(k)
 [U, S, V] = svds(Xo, k(i));
 W = U * S;
 X_hat = W(:, 1:k(i)) * V(:, 1:k(i))';

 % Face 1
 img = reshape(X_hat(idx(1), :), [24 24]);
 f = f + 1;
 figure(f);
 imagesc(img); axis square; colormap gray;
 title(sprintf('Face %g; K = %g', idx(1), k(i)));

 % Face 2
 img = reshape(X_hat(idx(2), :), [24 24]); 
f = f + 1;
 figure(f);
 imagesc(img); axis square; colormap gray;
 title(sprintf('Face %g; K = %g', idx(2), k(i)));
end;