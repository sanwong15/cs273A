% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part B (k = 20; random  : K random data points (uniformly) as clusters; nIter = 10000)

iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

k=20;
[idx,c,sumd] = kmeans(X,k,'random',10000); 