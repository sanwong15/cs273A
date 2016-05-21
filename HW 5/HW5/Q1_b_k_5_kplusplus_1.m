% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part B (k = 5; k++: choose cluster 1 uniformly, then points randomly
% proportional to distance from current clusters; nIter = 1)

iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

k=5;
[idx,c,sumd] = kmeans(X,k,'k++',1); 