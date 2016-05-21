% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part A
    % Load Iris Data restricted to the first two features
    % Plot the data and see how clustered it is
iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

figure (1)
scatter(X1,X2)
title('Feature 1 and Feature 2 Data Scatter Plot')
xlabel('Feature 1')
ylabel('Feature 2')