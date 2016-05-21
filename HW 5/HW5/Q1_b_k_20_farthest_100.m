% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part B (k = 20; farthest: choose cluster 1 uniformly, then the point farthest from all clusters so far, etc.; nIter = 100)

iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

k=20;
[idx,c,sumd] = kmeans(X,k,'farthest',100); 